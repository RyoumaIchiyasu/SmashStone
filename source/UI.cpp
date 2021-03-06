//==================================================================================================================
//
// UI処理[UI.cpp]
// Author : Seiya Takahashi
//
//==================================================================================================================
#include "UI.h"
#include "renderer.h"
#include "inputKeyboard.h"
#include "fade.h"
#include "player.h"
#include "scene2D.h"
#include "debugProc.h"
#include "game.h"
#include "title.h"
#include "tutorial.h"

//==================================================================================================================
// マクロ定義
//==================================================================================================================
#define ENTER_SIZEX 300.0f							// エンターロゴX
#define ENTER_SIZEY 150.0f							// エンターロゴY
#define TITLE_ENTER_POSY 600.0f						// タイトルエンターロゴ位置Y
#define NORMAL_COLOR D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f)// 画像のままの色
#define TITLEUI_BEGIN_X 2000						// タイトルUI最初の横の大きさ
#define TITLEUI_BEGIN_Y 1200						// タイトルUI最初の縦の大きさ
#define TITLEUI_SMALL_SPEED 15						// タイトルUIの小さくする速度
#define TITLEUI_VALUE_Y	350							// 減少サイズの値Y
#define TITLEUI_BOUND_SPEED 5						// タイトルUIのバウンド速度
#define TITLEUI_MAXSIZE_VALUE_Y 370					// タイトルUI最大サイズ縦
#define TITLEUI_MINSIZE_VALUE_Y 330					// タイトルUI最大サイズ縦
#define TITLEUI_BOUND_COUNT 60						// タイトルUIバウンドカウンタ

//==================================================================================================================
// 静的メンバー変数の初期化
//==================================================================================================================
LPDIRECT3DTEXTURE9 CUI::m_pTexture[LOGOTYPE_MAX] = {};		// テクスチャ情報
char *CUI::m_apFileName[LOGOTYPE_MAX] =						// 読み込むモデルのソース先
{
	{ "data/TEXTURE/title.png" },			// タイトル
	{ "data/TEXTURE/PressStart.png" },		// エンター
	{ "data/TEXTURE/arrow.png" },			// コンパス矢印
};

//==================================================================================================================
//
// コンストラクタ
//
//==================================================================================================================
CUI::CUI(PRIORITY type = CScene::PRIORITY_UI) : CScene(type)
{

}

//==================================================================================================================
//
// デストラクタ
//
//==================================================================================================================
CUI::~CUI()
{

}

//==================================================================================================================
// 初期化処理
//==================================================================================================================
void CUI::Init(void)
{
	TitlePos = D3DXVECTOR3(0.0f, 0.0f, 0.0f);	// タイトルの位置
	m_nCntBound = 0;			// タイトルUIバウンドカウンタ
	m_nCntUITitle0 = 0;			// タイトルUI用カウンタ0
	m_nCntUITitle0 = 1;			// タイトルUI用カウンタ1
	m_bUITitle0 = false;		// タイトルを動かすかどうか
	m_bUITitle1 = false;		// タイトルを動かすかどうか

	// ロゴの最大枚数カウント
	for (int nCnt = 0; nCnt < LOGOTYPE_MAX; nCnt++)
	{
		// タイトルのとき
		if (CRenderer::GetMode() == CRenderer::MODE_TITLE)
		{
			// タイトルで使うロゴのとき
			if (nCnt <= LOGOTYPE_ARROW)
			{
				// 生成処理
				m_pScene2D[nCnt] = CScene2D::Create();

				// テクスチャを貼る
				m_pScene2D[nCnt]->BindTex(m_pTexture[nCnt]);
			}

			// ロゴによって切り替える
			switch (nCnt)
			{
				// タイトルロゴ
			case LOGOTYPE_TITLE:
				break;
				// エンター
			case LOGOTYPE_ENTER:
				break;
			}
		}

		// チュートリアルのとき
		if (CRenderer::GetMode() == CRenderer::MODE_TUTORIAL)
		{

		}

		// ゲームのとき
		if (CRenderer::GetMode() == CRenderer::MODE_GAME)
		{

		}
	}
}

//==================================================================================================================
// 終了処理
//==================================================================================================================
void CUI::Uninit(void)
{

}

//==================================================================================================================
// 更新処理
//==================================================================================================================
void CUI::Update(void)
{
	// タイトルのとき
	if (CRenderer::GetMode() == CRenderer::MODE_TITLE)
	{
		// タイトルロゴ
		SetUI(D3DXVECTOR3(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 + TitlePos.y, 0.0f), TITLEUI_BEGIN_X + m_nCntUITitle0 - m_nCntUITitle1, 
			TITLEUI_BEGIN_Y + m_nCntUITitle0 + m_nCntUITitle1, LOGOTYPE_TITLE, NORMAL_COLOR);

		if (m_nCntBound < TITLEUI_BOUND_COUNT)
		{
			// タイトルを動かしていなとき
			if (!m_bUITitle0)
			{
				// タイトルUIの縦の長さが規定値以下のとき
				if (TITLEUI_BEGIN_Y + m_nCntUITitle0 <= TITLEUI_VALUE_Y)
				{
					// タイトルを動かす状態にする
					m_bUITitle0 = true;
				}
				else
				{
					// タイトルカウンタ減算
					m_nCntUITitle0 -= TITLEUI_SMALL_SPEED;
				}
			}
			else
			{// タイトルを動かしていいとき
				// タイトルUIの縦の長さが[360]以上のとき
				if (TITLEUI_BEGIN_Y + m_nCntUITitle0 + m_nCntUITitle1 >= TITLEUI_MAXSIZE_VALUE_Y)
				{
					// タイトルを最大まで拡大させた
					m_bUITitle1 = true;

				}
				else if (TITLEUI_BEGIN_Y + m_nCntUITitle0 + m_nCntUITitle1 <= TITLEUI_MINSIZE_VALUE_Y)
				{// タイトルUIの縦の長さが[330]以下のとき
					// タイトルを最小まで拡小させた
					m_bUITitle1 = false;
				}

				// タイトルを最大まで拡大させたとき
				if (m_bUITitle1)
				{
					// タイトルカウンタ加算
					m_nCntUITitle1 -= TITLEUI_BOUND_SPEED;
				}
				else
				{// タイトルを最小まで拡小させたとき
					// タイトルカウンタ減算
					m_nCntUITitle1 += TITLEUI_BOUND_SPEED;
				}

				// タイトルUIバウンドカウンタ加算
				m_nCntBound++;
			}
		}
		else
		{
			// 初期値に戻す
			m_nCntUITitle1 = 0;
		}
	}
}

//==================================================================================================================
// 描画処理
//==================================================================================================================
void CUI::Draw(void)
{

}

//==================================================================================================================
// 生成処理
//==================================================================================================================
CUI *CUI::Create(void)
{
	// シーン動的に確保
	CUI *pUI = new CUI(CScene::PRIORITY_UI);

	// シーン初期化
	pUI->Init();

	// 値を返す
	return pUI;
}

//==================================================================================================================
// テクスチャロード
//==================================================================================================================
HRESULT CUI::Load(void)
{
	CRenderer *pRenderer = CManager::GetRenderer();			// レンダラー情報取得
	LPDIRECT3DDEVICE9 pDevice = pRenderer->GetDevice();		// デバイスの取得

	//==============================テクスチャの読み込み==============================//
	// テクスチャの最大数までカウント
	for (int nCnt = 0; nCnt < LOGOTYPE_MAX; nCnt++)
	{
		// モードがタイトルのとき
		if (CRenderer::GetMode() == CRenderer::MODE_TITLE)
		{
			// タイトルで使うロゴのとき
			if (nCnt <= LOGOTYPE_ARROW)
			{
				// テクスチャの読み込み
				D3DXCreateTextureFromFile(pDevice, m_apFileName[nCnt], &m_pTexture[nCnt]);
			}
		}
	}

	// 値を返す
	return S_OK;
}

//==================================================================================================================
// 破棄
//==================================================================================================================
void CUI::Unload(void)
{
	// ロゴの最大種類までカウント
	for (int nCnt = 0; nCnt < LOGOTYPE_MAX; nCnt++)
	{
		// モードがタイトルのとき
		if (CRenderer::GetMode() == CRenderer::MODE_TITLE)
		{
			// タイトルで使うロゴのとき
			if (nCnt <= LOGOTYPE_ARROW)
			{
				m_pTexture[nCnt]->Release();		// 開放
				m_pTexture[nCnt] = NULL;			// NULLにする
			}
		}
	}
}

//==================================================================================================================
// 種類取得
//==================================================================================================================
CUI::UITYPE CUI::GetType(void)
{
	return m_type;
}

//==================================================================================================================
// ロゴ作成
//==================================================================================================================
void CUI::SetUI(D3DXVECTOR3 pos, float fSizeX, float fSizeY, int nCnt, D3DXCOLOR col)
{
	m_pScene2D[nCnt]->SetPos(pos);									// 位置設定
	m_pScene2D[nCnt]->SetSize(D3DXVECTOR3(fSizeX, fSizeY, 0.0f));	// 大きさ設定
	m_pScene2D[nCnt]->SetCol(col);									// 色設定
}
