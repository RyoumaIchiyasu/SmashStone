//==================================================================================================================
//
// カメラ[camera.cpp]
// Author : Seiya Takahashi
//
//==================================================================================================================
#include "camera.h"
#include "scene.h"
#include "renderer.h"
#include "inputKeyboard.h"
#include "debugProc.h"
#include "player.h"
#include "game.h"
#include "tutorial.h"
#include "title.h"
#include "mouse.h"
#include "ImGui/imgui.h"				// Imguiの実装に必要
#include "ImGui/imgui_impl_dx9.h"		// Imguiの実装に必要
#include "ImGui/imgui_impl_win32.h"		// Imguiの実装に必要

//==================================================================================================================
// マクロ定義
//==================================================================================================================
#define camera_move 3.1f							// カメラの移動スピード
#define CAMERA_ROT_SPEED_Y 0.05f					// カメラの回転スピード
#define CAMERA_ROT_SPEED_X 0.025f					// カメラの回転スピード
#define cameraLength 100.0f							// カメラからの距離
#define posR_Length 3.0f							// モデルと注視点の位置
#define posR_distance 80.0f							// モデルと注視点の距離
#define coefficient 0.05f							// 係数
#define posV_distance 100.0f						// モデルと視点の距離
#define posV_Height 70.0f							// 視点の高さ
#define SHRINK_SPEED_Y 0.2f							// posVのYの縮める速度
#define ROT_SHRINK 0.1f								// 回転の縮める速度
#define TITLE_FADE_COUNT 60							// タイトルフェードカウント
#define TITLE_POSV_X 0.0f							// タイトルでのカメラ視点位置X
#define TITLE_POSV_Y 20.0f							// タイトルでのカメラ視点位置Y
#define TITLE_POSV_Z 50.0f							// タイトルでのカメラ視点位置Z
#define TITLE_POSR_X 0.0f							// タイトルでのカメラ注視点位置X
#define TITLE_POSR_Y 1.0f							// タイトルでのカメラ注視点位置Y
#define TITLE_POSR_Z 50.0f							// タイトルでのカメラ注視点位置Z
#define DISTANCE 100.0f								// 視点と注視点の距離
#define ROT_COUNT 5									// 回転を始めるカウント

#define POSV_Y_DOWN_LIMIT (5.0f)					// 視点の下降制限

#define CAMERA_RADIAN	(45.0f)						// カメラの視野角
#define CAMERA_NEAR_Z	(10.0f)						// カメラのNearZ値
#define CAMERA_FAR_Z	(6000.0f)					// カメラのFarZ値

#define SPEED_INERTIA	(5)							// カメラの慣性

#define MOUSE_SPEED		(0.20f)						// マウスカーソルが早すぎるので調整

#define ROT_X_LIMIT_LOW	(-1.51f)						// カメラX軸の下限
#define ROT_X_LIMIT_UP	(1.51f)						// カメラX軸の上限

//==================================================================================================================
// 静的メンバ変数の初期化
//==================================================================================================================
CCamera *CCamera::m_pCamera = NULL;					// カメラ情報

//==================================================================================================================
// コンストラクタ
//==================================================================================================================
CCamera::CCamera()
{

}

//==================================================================================================================
// デストラクタ
//==================================================================================================================
CCamera::~CCamera()
{

}

//==================================================================================================================
// 初期化処理
//==================================================================================================================
void CCamera::Init(void)
{
	// 変数の初期化
	m_posV		= ZeroVector3;
	m_posDebug	= ZeroVector3;
	m_posR		= ZeroVector3;
	m_posVDest	= ZeroVector3;
	m_posRDest	= ZeroVector3;
	m_posU		= ZeroVector3;
	m_rot		= ZeroVector3;
	m_rotDest	= ZeroVector3;
	m_mousePos	= ZeroVector3;
	m_fDistance = 0.0f;
	m_fDisScale = 1.0f;
	nCntRot = 0;										// 回転を始めるカウンタ
	m_nCntTitleFade = 0;								// タイトルフェードカウンタ
	m_bCameraMode = false;								// カメラモードかどうか
	m_mode = CAMERA_GAME;

#ifdef _DEBUG
	m_mode = CAMERA_DEBUG;
#endif
}

//==================================================================================================================
// 終了処理
//==================================================================================================================
void CCamera::Uninit(void)
{

}

//==================================================================================================================
// 更新処理
//==================================================================================================================
void CCamera::Update(void)
{
	// ゲームモードがタイトルのとき
	if (CRenderer::GetMode() == CRenderer::MODE_TITLE)
	{

	}

	// ゲームモードがゲームのとき 又は チュートリアルのとき
	if (CRenderer::GetMode() == CRenderer::MODE_GAME || CRenderer::GetMode() == CRenderer::MODE_TUTORIAL)
	{
		// ゲームモードがチュートリアルのとき
		if (CRenderer::GetMode() == CRenderer::MODE_TUTORIAL)
		{

		}

		// ゲームモードがゲームのとき
		if (CRenderer::GetMode() == CRenderer::MODE_GAME){}
			GameCamera();
	}

#ifdef _DEBUG
	if (CAMERA_DEBUG == m_mode)
		// デバッグ時の操作
		DebugControl();

	// ImGuiの更新
	ShowDebugInfo();
#endif // _DEBUG

	// ベクトルを算出して正規化
	m_vec = m_posR - m_posV;
	D3DXVec3Normalize(&m_vec, &m_vec);
}

//==================================================================================================================
// 描画処理
//==================================================================================================================
void CCamera::Draw(void)
{
#ifdef _DEBUG
	// デバッグ表示
#endif // _DEBUG
}

//==================================================================================================================
// カメラの設定
//==================================================================================================================
void CCamera::SetCamera(void)
{
	LPDIRECT3DDEVICE9 pDevice = CManager::GetRenderer()->GetDevice(); // デバイスの取得

	// プロジェクションマトリックスの初期化
	D3DXMatrixIdentity(&m_mtxProjection);

	// プロジェクションマトリックスを作成
	D3DXMatrixPerspectiveFovLH(
		&m_mtxProjection,
		D3DXToRadian(CAMERA_RADIAN),				// 視野角
		(float)SCREEN_WIDTH / (float)SCREEN_HEIGHT,	// アスペクト比
		CAMERA_NEAR_Z,								// NearZ値
		CAMERA_FAR_Z);								// FarZ値

	// プロジェクションマトリックスの設定
	pDevice->SetTransform(D3DTS_PROJECTION, &m_mtxProjection);

	// ビューマトリックスの初期化
	D3DXMatrixIdentity(&m_mtxView);

	// ビューマトリックスを作成
	D3DXMatrixLookAtLH(
		&m_mtxView,
		&m_posV,	// カメラの視点
		&m_posR,	// カメラの注視点
		&m_posU);	// カメラの上方向ベクトル

	// ビューマトリックスの設定
	pDevice->SetTransform(D3DTS_VIEW, &m_mtxView);
}

//==================================================================================================================
// カメラの位置設定
//==================================================================================================================
void CCamera::SetCameraPos(const D3DXVECTOR3 posV, const D3DXVECTOR3 posR)
{
	// 情報の初期化
	m_posV = posV;
	m_posR = posR;
	m_posVDest = posV;
	m_posRDest = posR;
	m_posDebug = ZeroVector3;
	m_posU = AboveNormal;
	m_rot = D3DXVECTOR3(0.6f, -0.8f, 0.0f);
	m_fDistance = 0.0f;

	// 位置の差を求め、距離を測る
	D3DXVECTOR3 difpos = m_posR - m_posV;
	m_fDistance = (float)sqrt(difpos.y * difpos.y + difpos.z * difpos.z);
}

//==================================================================================================================
// ImGuiの更新
//==================================================================================================================
void CCamera::ShowDebugInfo(void)
{
	if (ImGui::CollapsingHeader("Camera"))
	{
		// 情報の表示
		ImGui::Text("posR : %.4f, %.4f, %.4f", m_posR.x, m_posR.y, m_posR.z);
		ImGui::Text("posV : %.4f, %.4f, %.4f", m_posV.x, m_posV.y, m_posV.z);
		ImGui::Text("rot  : %.4f, %.4f, %.4f", m_rot.x, m_rot.y, m_rot.z);
		ImGui::Text("Distance : %.4f", m_fDistance);
		// 距離をいじれる
		ImGui::DragFloat("Distance", &m_fDisScale, 0.05f, 0.0f, 100.0f);
	}
}

//==================================================================================================================
// ゲームのカメラ
//==================================================================================================================
void CCamera::GameCamera(void)
{
	D3DXVECTOR3 difposR, difposV;	// posとposDestの差分格納用

	// 目的の注視点の計算
	m_posRDest.x = sinf(m_rot.y);
	m_posRDest.y = tanf(m_rot.x);
	m_posRDest.z = cosf(m_rot.y);

	// 現在の注視点と目的の注視点の差分の計算
	difposR = m_posRDest - m_posR;

	// 注視点を追いかける速度
	m_posR += difposR / SPEED_INERTIA;

	// 目的の視点の計算
	m_posVDest.x = -cosf(m_rot.x) * sinf(m_rot.y) * m_fDistance * m_fDisScale;
	m_posVDest.y = sinf(m_rot.x) * m_fDistance * m_fDisScale;
	m_posVDest.z = -cosf(m_rot.x) * cosf(m_rot.y) * m_fDistance * m_fDisScale;

	if (m_mode == CAMERA_GAME)
	{
		// posVの高さ制限
		if (m_posVDest.y <= POSV_Y_DOWN_LIMIT)
			m_posVDest.y = POSV_Y_DOWN_LIMIT;
	}

	// 現在の視点と目的の視点の差分の計算
	difposV = m_posVDest - m_posV;

	// 視点が注視点に追いつく速度
	m_posV += difposV / SPEED_INERTIA;


	if (m_mode == CAMERA_GAME)
	{
		// posVの高さ制限
		if (m_posV.y <= POSV_Y_DOWN_LIMIT)
			m_posV.y = POSV_Y_DOWN_LIMIT;
	}

	if (m_rot.x >= ROT_X_LIMIT_UP)
		m_rot.x = ROT_X_LIMIT_UP;
	if (m_rot.x <= ROT_X_LIMIT_LOW)
		m_rot.x = ROT_X_LIMIT_LOW;
}

#ifdef _DEBUG
//==================================================================================================================
// デバッグ時の操作
//==================================================================================================================
void CCamera::DebugControl(void)
{
	// キーボード取得
	CInputKeyboard *pInputKeyboard = CManager::GetInputKeyboard();

	// F1キーでモード切替
	if (pInputKeyboard->GetKeyboardTrigger(DIK_F1))
		m_mode ?
		m_mode = CAMERA_DEBUG :
		m_mode = CAMERA_GAME;

	CDebugProc::Print("%d\n", m_mode);

	if (m_mode == CAMERA_DEBUG)
	{
		// マウスでの操作
		ControlMouse();
		// キーボードでの操作
		ControlKeyboard(pInputKeyboard);
	}

	CKananLibrary::InterpolationRot(&m_rot);
}
#endif

//==================================================================================================================
// マウスの操作
//==================================================================================================================
void CCamera::ControlMouse(void)
{
	// マウスの取得
	CMouse *pMouse = CManager::GetMouse();

	// 左クリック時
	if (pMouse->GetPressTrigger(1))
	{
		// マウスの座標取得
		m_mousePos.x = (float)pMouse->GetposX();
		m_mousePos.y = (float)pMouse->GetposY();
	}
	// 左クリック長押し時
	if (pMouse->GetPress(1))
	{
		// マウス座標の差分を格納
		D3DXVECTOR2 difPos;

		// 長押し中のマウスの座標取得
		difPos.x = (float)pMouse->GetposX();
		difPos.y = (float)pMouse->GetposY();

		// 座標の差を確認
		if (m_mousePos != difPos)
		{
			// 差分の回転
			if (m_mousePos.x > difPos.x)
				m_rot.y -= (m_mousePos.x - difPos.x) / SCREEN_HEIGHT / D3DX_PI * MOUSE_SPEED;
			else if (m_mousePos.x < difPos.x)
				m_rot.y -= (m_mousePos.x - difPos.x) / SCREEN_HEIGHT / D3DX_PI * MOUSE_SPEED;
			m_rot.x += (m_mousePos.y - difPos.y) / SCREEN_HEIGHT / D3DX_PI * MOUSE_SPEED;

			// 回転の補間
			CKananLibrary::InterpolationRot(&m_rot);
		}
	}
}

//==================================================================================================================
// キーボードでの操作
//==================================================================================================================
void CCamera::ControlKeyboard(CInputKeyboard *pKeyboard)
{

	// キーボードの[←]が押されたとき
	/*if (pKeyboard->GetKeyboardPress(DIK_LEFTARROW))
	{
		// 視点を左に動かす
		m_posV.x += sinf(-D3DX_PI * 0.5f + m_rot.y) * camera_move;
		m_posV.z += cosf(-D3DX_PI * 0.5f + m_rot.y) * camera_move;

		// 視点を左に動かす
		m_posR.x += sinf(-D3DX_PI * 0.5f + m_rot.y) * camera_move;
		m_posR.z += cosf(-D3DX_PI * 0.5f + m_rot.y) * camera_move;
	}

	// キーボードの[→]が押されたとき
	if (pKeyboard->GetKeyboardPress(DIK_RIGHTARROW))
	{
		// 視点を右に動かす
		m_posV.x += sinf(D3DX_PI * 0.5f + m_rot.y) * camera_move;
		m_posV.z += cosf(D3DX_PI * 0.5f + m_rot.y) * camera_move;
		// 視点を右に動かす
		m_posR.x += sinf(D3DX_PI * 0.5f + m_rot.y) * camera_move;
		m_posR.z += cosf(D3DX_PI * 0.5f + m_rot.y) * camera_move;
	}

	// キーボードの[↑]が押されたとき
	if (pKeyboard->GetKeyboardPress(DIK_UP))
	{
		// 視点を前に動かす
		m_posV.x += sinf(D3DX_PI * 0.0f + m_rot.y) * camera_move;
		m_posV.z += cosf(D3DX_PI * 0.0f + m_rot.y) * camera_move;
		// 視点を前に動かす
		m_posR.x += sinf(D3DX_PI * 0.0f + m_rot.y) * camera_move;
		m_posR.z += cosf(D3DX_PI * 0.0f + m_rot.y) * camera_move;
	}

	// キーボードの[↓]が押されたとき
	if (pKeyboard->GetKeyboardPress(DIK_DOWN))
	{
		// 視点を後ろに動かす
		m_posV.x += sinf(-D3DX_PI * 1.0f + m_rot.y) * camera_move;
		m_posV.z += cosf(-D3DX_PI * 1.0f + m_rot.y) * camera_move;
		// 視点を後ろに動かす
		m_posR.x += sinf(-D3DX_PI * 1.0f + m_rot.y) * camera_move;
		m_posR.z += cosf(-D3DX_PI * 1.0f + m_rot.y) * camera_move;
	}*/

	if (pKeyboard->GetKeyboardPress(DIK_1))
	{// キーボードの[1]が押されたとき
	 // 視点を上に動かす
		m_posV.y += cosf(D3DX_PI * 1.0f + m_rot.y) * camera_move;
		// 視点を上に動かす
		m_posR.y += cosf(D3DX_PI * 1.0f + m_rot.y) * camera_move;
	}

	// キーボードの[2]が押されたとき
	if (pKeyboard->GetKeyboardPress(DIK_2))
	{
		// 視点を下に動かす
		m_posV.y += cosf(D3DX_PI * 0.0f + m_rot.y) * camera_move;
		// 視点を下に動かす
		m_posR.y += cosf(D3DX_PI * 0.0f + m_rot.y) * camera_move;
	}

	if (!pKeyboard->GetKeyboardPress(DIK_LSHIFT))
	{
		// キーボードの[Q]が押されたとき
		if (pKeyboard->GetKeyboardPress(DIK_Q))
		{
			// 視点を中心に回転する(左回り)
			m_rot.y -= CAMERA_ROT_SPEED_Y;

			// 回転情報が-D3DX_PIより小さくなったとき
			if (m_rot.y < -D3DX_PI)
				m_rot.y += D3DX_PI * 2;
		}

		// キーボードの[E]が押されたとき
		if (pKeyboard->GetKeyboardPress(DIK_E))
		{
			// 視点を中心に回転する(右回り)
			m_rot.y += CAMERA_ROT_SPEED_Y;

			// 回転情報がD3DX_PIより大きくなったとき
			if (m_rot.y > D3DX_PI)
				m_rot.y -= D3DX_PI * 2;
		}
	}
	else
	{
		// キーボードの[Q]が押されたとき
		if (pKeyboard->GetKeyboardPress(DIK_Q))
		{
			// 視点を中心に回転する(左回り)
			m_rot.x -= CAMERA_ROT_SPEED_X;

			// 回転情報が-D3DX_PIより小さくなったとき
			if (m_rot.x < -D3DX_PI)
				m_rot.x += D3DX_PI * 2;
		}

		// キーボードの[E]が押されたとき
		if (pKeyboard->GetKeyboardPress(DIK_E))
		{
			// 視点を中心に回転する(右回り)
			m_rot.x += CAMERA_ROT_SPEED_X;

			// 回転情報がD3DX_PIより大きくなったとき
			if (m_rot.x > D3DX_PI)
				m_rot.x -= D3DX_PI * 2;
		}
	}

	// カメラの遠近調整
	if (pKeyboard->GetKeyboardPress(DIK_C))
		m_fDisScale += 0.005f;
	if (pKeyboard->GetKeyboardPress(DIK_Z))
		m_fDisScale -= 0.005f;

	CKananLibrary::InterpolationRot(&m_rot);
}

//==================================================================================================================
// カメラの生成
//==================================================================================================================
CCamera * CCamera::Create(void)
{
	// メモリを動的に確保
	m_pCamera = new CCamera();

	// カメラの初期化
	m_pCamera->Init();

	m_pCamera->SetCameraPos(D3DXVECTOR3(280.0f, 280.0f, -280.0f),
							D3DXVECTOR3(0.0f, 10.0f, 0.0f));

	//m_posV = D3DXVECTOR3(0.0f, 150.0f, -500.0f);		// 視点
	//m_posVDest = D3DXVECTOR3(0.0f, 150.0f, -500.0f);	// 視点の目標地点
	//m_posR = D3DXVECTOR3(0.0f, 10.0f, 0.0f);			// 注視点
	//m_posRDest = D3DXVECTOR3(0.0f, 10.0f, 0.0f);		// 注視点の目標地点
	//m_posU = D3DXVECTOR3(0.0f, 1.0f, 0.0f);				// 上方向ベクトル
	//m_rotDest = D3DXVECTOR3(0.0f, 0.0f, 0.0f);			// 回転の目標地点

	// 値を返す
	return m_pCamera;
}