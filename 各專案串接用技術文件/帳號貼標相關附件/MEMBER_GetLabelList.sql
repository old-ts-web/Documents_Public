USE [�C����Ʈw]
GO

/****** Object:  UserDefinedFunction [dbo].[MEMBER_GetLabelList]    Script Date: 2021/1/13 �U�� 05:29:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/* -----------------------------------------------------------------------------------------------------------------------------
��@�@���G	MEMBER_GetLabelList

�\�໡���G	���Ҭd�� (�|���s���B���X���� <= 0 �h�^�ǩҦ����ҩw�q)

�ǤJ�ѼơG	@nMemberNo		�|���s��(���Ǫ��ܥH������)
			@lDeviceNo		���X�s��(�|���s�� <= 0 �~�|�����X������)

�Ǧ^���G�G	�Ǧ^������A��쬰[���ҽs��][���ҦW��][�C���s��]

�ء@�@�ߡG	�l�ǡ]2019/12/27�^

�ơ@�@���G	
			20210112 �l�� w82866 ��ݤu��-�b���K�Ь����u���u��
			20200713 �l�� w74630 �إߡu�b�����Ҳ����v�w�s
----------------------------------------------------------------------------------------------------------------------------- */
CREATE FUNCTION [dbo].[MEMBER_GetLabelList] 
(
	@_nMemberNo INT = 0,
	@lDeviceNo BIGINT = 0
)
RETURNS @tblTemp TABLE 
(
	[LABEL_NO]		INT,
	[LABEL_NAME]	NVARCHAR(50),
	[GAME_NO]		INT
)
AS
BEGIN

	IF @_nMemberNo <= 0 AND @lDeviceNo <= 0
	BEGIN
		INSERT INTO @tblTemp
		SELECT		[INDEX_NO]
					, [NAME]
					, [GAME_NO]
		FROM		[MEMBER_CODE_Label] WITH(NOLOCK)
		WHERE		[INVALID_FLAG] = 0
	END
	ELSE
	BEGIN
		IF @_nMemberNo > 0
		BEGIN
			INSERT INTO @tblTemp
			SELECT		[INDEX_NO]
						, [NAME]
						, [GAME_NO]
			FROM		[MEMBER_CODE_Label] WITH(NOLOCK)
			WHERE		[INDEX_NO] IN (
									SELECT		[LABEL_NO]
									FROM		[MEMBER_LabelList] WITH(NOLOCK)
									WHERE		[MEMBER_NO] = @_nMemberNo
											AND	[INVALID_FLAG] = 0
									)
					AND	[INVALID_FLAG] = 0
		END
		ELSE
		BEGIN
			INSERT INTO @tblTemp
			SELECT		[INDEX_NO]
						, [NAME]
						, [GAME_NO]
			FROM		[MEMBER_CODE_Label] WITH(NOLOCK)
			WHERE		[INDEX_NO] IN (
									SELECT		[LABEL_NO]
									FROM		[DEVICE_LabelList] WITH(NOLOCK)
									WHERE		[DEVICE_NO] = @lDeviceNo
											AND	[INVALID_FLAG] = 0
									)
					AND	[INVALID_FLAG] = 0
		END
	END

	RETURN
END
GO


