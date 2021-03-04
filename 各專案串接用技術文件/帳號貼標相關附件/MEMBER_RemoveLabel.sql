USE [�C����Ʈw]
GO

/****** Object:  StoredProcedure [dbo].[MEMBER_RemoveLabel]    Script Date: 2021/1/13 �U�� 05:28:50 ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER ON
GO

/* -----------------------------------------------------------------------------------------------------------------------------
��@�@���GMEMBER_RemoveLabel
�\�໡���G�����S�w��H����(�|���s���B���X�ܤ֭n�Ǥ@�ӡA���������� 0)

�ǤJ�ѼơG	@nMemberNo		�|���s�� (�������� 0)
			@nLabelNo		���ҽs��
			@lDeviceNo		���X�s�� (�������� 0)

�Ǧ^���G�G	
Return Value
			0 :���\
	      	-1:�|�����s�b
	      	-99:�o�ͫD�w�����~
			
�ء@�@�ߡG	�l�ǡ]2020/07/10�^

�ơ@�@���G	
			20210112 �l�� w82866 ��ݤu��-�b���K�Ь����u���u��
			20200713 �l�� w74630 �إߡu�b�����Ҳ����v�w�s
----------------------------------------------------------------------------------------------------------------------------- */

CREATE PROCEDURE [dbo].[MEMBER_RemoveLabel]
@nMemberNo 		INT = 0,
@nLabelNo		INT,
@lDeviceNo		BIGINT = 0
AS

SET	NOCOUNT	ON

DECLARE	@nMemberNoCheck		INT,
		@_nErrorCode		INT

SET 	@_nErrorCode		= -99

IF @nMemberNo <= 0 AND @lDeviceNo <= 0
BEGIN
	SET @_nErrorCode = -4
END
ELSE
BEGIN
	-- �|���s��
	IF @nMemberNo > 0
	BEGIN
		SELECT TOP 1 @nMemberNoCheck=[INDEX_NO]
		FROM		[MEMBER_AccountData] WITH(NOLOCK)
		WHERE		[INDEX_NO] = @nMemberNo

		IF @@rowcount > 0
		BEGIN
			UPDATE		[MEMBER_LabelList]
			SET			[INVALID_FLAG] = 1
						, [E_DATETIME] = GETDATE()
			WHERE		[MEMBER_NO] = @nMemberNo
					AND	[LABEL_NO] = @nLabelNo

			SET @_nErrorCode = 0
		END
		ELSE
		BEGIN	
			SET @_nErrorCode = -1
		END
	END

	-- ���X (�Y�|���B�z�����`�h�פ�)
	IF @lDeviceNo > 0 AND (@nMemberNo <= 0 OR @_nErrorCode = 0)
	BEGIN
		UPDATE		[DEVICE_LabelList]
		SET			[INVALID_FLAG] = 1
					, [E_DATETIME] = GETDATE()
		WHERE		[DEVICE_NO] = @lDeviceNo
				AND	[LABEL_NO] = @nLabelNo

		SET @_nErrorCode = 0
	END
END

SET NOCOUNT OFF

RETURN @_nErrorCode
GO


