//==================================================================================================================
//
// tutorial�̕`�� [tutorial.cpp]
// Author : Seiya Takahashi
//
//==================================================================================================================
#define _CRT_SECURE_NO_WARNINGS											// �x�����

//==================================================================================================================
//	�C���N���[�h�t�@�C��
//==================================================================================================================
#include "tutorial.h"
#include "renderer.h"
#include "inputKeyboard.h"
#include "fade.h"
#include "sound.h"
#include "scene2D.h"
#include "scene3D.h"
#include "camera.h"
#include "light.h"
#include "meshField.h"
#include "player.h"
#include "motionModel.h"
#include "inputGamepad.h"
#include "meshSphere.h"

//==================================================================================================================
//	�ÓI�����o�ϐ��錾
//==================================================================================================================
LPDIRECT3DTEXTURE9 CTutorial::m_pTexture = NULL;			// �e�N�X�`�����
CCamera *CTutorial::m_pCamera = NULL;						// �J�������
CLight *CTutorial::m_pLight = NULL;							// ���C�g���
CPolygon *CTutorial::m_pPolygon = NULL;						// �|���S�����
CMeshField *CTutorial::m_pMeshField = NULL;					// ���b�V���t�B�[���h���
CPlayer *CTutorial::m_pPlayer = NULL;						// �v���C���[���
CLogo *CTutorial::m_pLogo = NULL;							// ���S���
CMeshSphere *CTutorial::m_pMeshSphere = NULL;				// ���b�V�������
CModel *CTutorial::m_pModel[TUTORIAL_MAX_MODEL] = {};		// ���f�����

//==================================================================================================================
//	�R���X�g���N�^
//==================================================================================================================
CTutorial::CTutorial()
{

}

//==================================================================================================================
//	�f�X�g���N�^
//==================================================================================================================
CTutorial::~CTutorial()
{

}

//==================================================================================================================
//	����������
//==================================================================================================================
void CTutorial::Init(void)
{
	CMeshField::Load();				// ���b�V���t�B�[���h�e�N�X�`�����[�h
	CMotionModel::Load();			// ���f�����[�h
	CMeshSphere::Load();			// ���b�V�����̃e�N�X�`�����[�h

	// �J�����̐�������
	m_pCamera = CCamera::Create();

	// ���C�g�̐�������
	m_pLight = CLight::Create();

	// ���b�V�����̐�������
	m_pMeshSphere = CMeshSphere::Create();

	// �v���C���[����
	m_pPlayer = CPlayer::Create();
	// �v���C���ʒu�ݒ�
	m_pPlayer->SetPos(D3DXVECTOR3(0, 10, 0));

	// ���b�V���t�B�[���h����
	m_pMeshField = CMeshField::Create();
}

//==================================================================================================================
//	�I������
//==================================================================================================================
void CTutorial::Uninit(void)
{
	// scene2D�̔j������
	CScene2D::ReleaseAll();

	// scene3D�̔j������
	CScene3D::ReleaseAll();

	CMeshField::Unload();			// ���b�V���t�B�[���h�e�N�X�`���A�����[�h
	CMotionModel::Unload();			// �v���C���[�e�N�X�`�����f���A�����[�h

	delete m_pLight;				// �������폜
	m_pLight = nullptr;				// �|�C���^NULL

	delete m_pCamera;				// �������폜
	m_pCamera = nullptr;			// �|�C���^NULL
}

//==================================================================================================================
//	�X�V����
//==================================================================================================================
void CTutorial::Update(void)
{
	// �L�[�{�[�h�擾
	CInputKeyboard *pInputKeyboard = CManager::GetInputKeyboard();

	// �Q�[���p�b�h�̎擾
	CInputGamepad *pInputGamepad = CManager::GetInputGamepad();

	// �t�F�[�h�擾
	CFade::FADE fade = CFade::GetFade();

	// �J�����̍X�V����
	m_pCamera->Update();

	// ���C�g�̍X�V����
	m_pLight->Update();

	// �L�[�{�[�h��[Enter] ���� �R���g���[���[��[START]���������Ƃ�
	if (pInputKeyboard->GetKeyboardTrigger(DIK_RETURN) || pInputGamepad->GetPress(0, CInputGamepad::JOYPADKEY_START))
	{
		// �t�F�[�h�������Ȃ���
		if (fade == CFade::FADE_NONE)
		{
			// �t�F�[�h�̐ݒ�
			CFade::SetFade(CRenderer::MODE_GAME);
		}
	}
}

//==================================================================================================================
//	�`�揈��
//==================================================================================================================
void CTutorial::Draw(void)
{
	// �J�����̐ݒ�
	m_pCamera->SetCamera();

	// �J�����̕`�揈��
	m_pCamera->Draw();
}

//==================================================================================================================
// �I�u�W�F�N�g�̐���
//==================================================================================================================
CTutorial * CTutorial::Create(void)
{
	CTutorial *pTutorial = NULL;		// �`���[�g���A������NULL�ɂ���

	pTutorial = new CTutorial;			// ���I�Ɋm��
	pTutorial->Init();					// ����������

	return pTutorial;					// �l��Ԃ�
}

//==================================================================================================================
// �v���C���[���擾����
//==================================================================================================================
CPlayer * CTutorial::GetPlayer(void)
{
	return m_pPlayer;
}