//=============================================================================
//
// モーション処理  [ motion.h ]
// Author : KANAN NAGANAWA
//
//=============================================================================
#ifndef _MOTION_H_
#define _MOTION_H_

//=============================================================================
// インクルードファイル
//=============================================================================
#include "main.h"

//=============================================================================
// クラス定義
//=============================================================================
class CModelCharacter;

class CMotion
{
public:
	// キー
	typedef struct
	{
		D3DXVECTOR3 posDest;		// 目的の位置
		D3DXVECTOR3 rotDest;		// 目的の回転
	} KEY;

	// キー情報
	typedef struct
	{
		KEY *pKey;					// キーのポインタ
		int nFrame;					// フレーム数
	} KEY_INFO;

	// モーションの情報
	typedef struct
	{
		KEY_INFO *pKeyInfo;			// キー情報のポインタ
		int nNumKey;				// キー数
		bool bLoop;					// ループするかどうか
	} MOTION_INFO;

	// モーション
	typedef enum
	{
		MOTION_NONE,
		PLAYER_NEUTRAL = 0,		// プレイヤー ニュートラル
		PLAYER_RUN,				// プレイヤー 走る
		PLAYER_JUMP,			// プレイヤー ジャンプ
		PLAYER_FALL,			// プレイヤー 落下
		PLAYER_LIFT,			// プレイヤー もの持ち上げる
		PLAYER_THROW,			// プレイヤー もの投げ
		PLAYER_ATTACK_0,		// プレイヤー 攻撃1
		PLAYER_ATTACK_1,		// プレイヤー 攻撃2
		PLAYER_ATTACK_2,		// プレイヤー 攻撃3
		PLAYER_ATTACK_3,		// プレイヤー 攻撃4
		PLAYER_SMASH_CHARGE,	// プレイヤー スマッシュチャージ
		PLAYER_SMASH,			// プレイヤー スマッシュ
		PLAYER_DAUNTED,			// プレイヤー 怯みダメージ
		PLAYER_BLOWAWAY,		// プレイヤー 吹っ飛びダメージ
		PLAYER_DOWN,			// プレイヤー ダウン
		//PLAYER_WALLDOWN,		// プレイヤー 壁は貼り付き
		MOTION_MAX				// 最大値
	} MOTION_TYPE;

	CMotion();
	~CMotion();

	static HRESULT Load();						// モーションのロード
	static void UnLoad();						// モーションのアンロード

	static D3DXVECTOR3 GetRotDest(MOTION_TYPE motiontype, int nKey, int nIndex)
		{ return m_pMotionInfo[motiontype].pKeyInfo[nKey].pKey[nIndex].rotDest; }	// モーションの回転のゴール取得
	static D3DXVECTOR3 GetPosDest(MOTION_TYPE motiontype, int nKey, int nIndex)
		{ return m_pMotionInfo[motiontype].pKeyInfo[nKey].pKey[nIndex].posDest; }	// モーションの回転のゴール取得
	static int GetFrame(MOTION_TYPE motiontype, int nKey) 
		{ return m_pMotionInfo[motiontype].pKeyInfo[nKey].nFrame; }					// モーションの総フレーム数の取得
	static int GetNumKey(MOTION_TYPE motiontype) 
		{ return m_pMotionInfo[motiontype].nNumKey; }								// モーションの総キー数の取得
	static bool GetLoop(MOTION_TYPE motiontype) 
		{ return m_pMotionInfo[motiontype].bLoop; }									// モーションがループするかどうか取得

private:
	static MOTION_INFO *m_pMotionInfo;					// モーション情報のポインタ
	static HRESULT LoadMotion(MOTION_TYPE motiontype);	// モーション読み込み	
	static int CheckCharacter(MOTION_TYPE motiontype);	// どのキャラクターか確認

	static char *m_apFileName[CMotion::MOTION_MAX];
};
#endif