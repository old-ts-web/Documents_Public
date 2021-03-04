USE [�C����Ʈw]
GO

/****** Object:  StoredProcedure [dbo].[MEMBER_AddLabel]    Script Date: 2021/1/13 �U�� 05:28:24 ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER ON
GO

/* -----------------------------------------------------------------------------------------------------------------------------
��@�@���GMEMBER_AddLabel
�\�໡���G��S�w��H�K����(�|���s���B���X�ܤ֭n�Ǥ@�ӡA���K���� 0)

�ǤJ�ѼơG	@nMemberNo		�|���s�� (���K�� 0)
			@nLabelNo		���ҽs��
			@lDeviceNo		���X�s�� (���K�� 0)

�Ǧ^���G�G	
Return Value
			0 :���\
	      	-1:�|�����s�b
	      	-2:���ҽs�����s�b�Τw�L��
	      	-3:�ӷ|���w�Q�K�W�P���O���� (�P���O���ҥu��Q�K�@��)
			-4:���ǤJ���ķ|���s���ξ��X
	      	-5:�Ӿ��X�w�Q�K�W�P���O���� (�P���O���ҥu��Q�K�@��)
	      	-99:�o�ͫD�w�����~
			
�ء@�@�ߡG	�l�ǡ]2019/12/27�^

�ơ@�@���G	
			20210112 �l�� w82866 ��ݤu��-�b���K�Ь����u���u��
			20200713 �l�� w74630 �إߡu�b�����Ҳ����v�w�s
----------------------------------------------------------------------------------------------------------------------------- */

CREATE PROCEDURE [dbo].[MEMBER_AddLabel]
@nMemberNo 		INT = 0,
@nLabelNo		INT,
@lDeviceNo		BIGINT = 0
AS

SET	NOCOUNT	ON

DECLARE	@nMemberNoCheck		INT,
		@strLabelGroup		VARCHAR(10),
		@nLabelIndexNo		INT,
		@_nErrorCode		INT

SET 	@_nErrorCode		= -99

IF @nMemberNo <= 0 AND @lDeviceNo <= 0
BEGIN
	SET @_nErrorCode = -4
END
ELSE
BEGIN

	-- �|���s���K��
	IF @nMemberNo > 0
	BEGIN
		SELECT TOP 1 @nMemberNoCheck=[INDEX_NO]
		FROM		[MEMBER_AccountData] WITH(NOLOCK)
		WHERE		[INDEX_NO] = @nMemberNo

		IF @@rowcount > 0
		BEGIN
			SELECT TOP 1 @strLabelGroup=[GROUP_CODE]
			FROM		[MEMBER_CODE_Label] WITH(NOLOCK)
			WHERE		[INDEX_NO] = @nLabelNo
					AND	[INVALID_FLAG] = 0
	
			IF @@rowcount > 0
			BEGIN
				SELECT TOP 1 @nLabelIndexNo=[INDEX_NO]
				FROM		[MEMBER_LabelList] WITH(NOLOCK)
				WHERE		[MEMBER_NO] = @nMemberNo
						AND	[LABEL_NO] IN (
										SELECT	[INDEX_NO]
										FROM	[MEMBER_CODE_Label] WITH(NOLOCK)
										WHERE	[GROUP_CODE] = @strLabelGroup
											AND	[INVALID_FLAG] = 0
										)
						AND	[INVALID_FLAG] = 0

				IF @@rowcount > 0
				BEGIN
					SET @_nErrorCode = -3
				END
				ELSE
				BEGIN

					SELECT TOP 1 @nLabelIndexNo=[INDEX_NO]
					FROM		[MEMBER_LabelList] WITH(NOLOCK)
					WHERE		[MEMBER_NO] = @nMemberNo
							AND	[LABEL_NO] = @nLabelNo

					IF @@rowcount > 0
					BEGIN
						UPDATE [MEMBER_LabelList]
						SET	[INVALID_FLAG] = 0
							, [E_DATETIME] = GETDATE()
						WHERE [INDEX_NO] = @nLabelIndexNo
					END
					ELSE
					BEGIN
						INSERT [MEMBER_LabelList]
						(
							[MEMBER_NO]
							, [LABEL_NO]
							, [C_DATETIME]
						)
						VALUES
						(
							@nMemberNo
							, @nLabelNo
							, GETDATE()
						)
					END

					SET @_nErrorCode = 0
				END
			END
			ELSE
			BEGIN	
				SET @_nErrorCode = -2	
			END
		END
		ELSE
		BEGIN	
			SET @_nErrorCode = -1
		END
	END

	-- ���X�K�� (�Y�|���K�Ц����`�h�פ�)
	IF @lDeviceNo > 0 AND (@nMemberNo <= 0 OR @_nErrorCode = 0)
	BEGIN		
		SELECT TOP 1 @strLabelGroup=[GROUP_CODE]
		FROM		[MEMBER_CODE_Label] WITH(NOLOCK)
		WHERE		[INDEX_NO] = @nLabelNo
				AND	[INVALID_FLAG] = 0
	
		IF @@rowcount > 0
		BEGIN
			SELECT TOP 1 @nLabelIndexNo=[INDEX_NO]
			FROM		[DEVICE_LabelList] WITH(NOLOCK)
			WHERE		[DEVICE_NO] = @lDeviceNo
					AND	[LABEL_NO] IN (
									SELECT	[INDEX_NO]
									FROM	[MEMBER_CODE_Label] WITH(NOLOCK)
									WHERE	[GROUP_CODE] = @strLabelGroup
										AND	[INVALID_FLAG] = 0
									)
					AND	[INVALID_FLAG] = 0

			IF @@rowcount > 0
			BEGIN
				SET @_nErrorCode = -5
			END
			ELSE
			BEGIN

				SELECT TOP 1 @nLabelIndexNo=[INDEX_NO]
				FROM		[DEVICE_LabelList] WITH(NOLOCK)
				WHERE		[DEVICE_NO] = @lDeviceNo
						AND	[LABEL_NO] = @nLabelNo

				IF @@rowcount > 0
				BEGIN
					UPDATE [DEVICE_LabelList]
					SET	[INVALID_FLAG] = 0
						, [E_DATETIME] = GETDATE()
					WHERE [INDEX_NO] = @nLabelIndexNo
				END
				ELSE
				BEGIN
					INSERT [DEVICE_LabelList]
					(
						[DEVICE_NO]
						, [LABEL_NO]
						, [C_DATETIME]
					)
					VALUES
					(
						@lDeviceNo
						, @nLabelNo
						, GETDATE()
					)
				END

				SET @_nErrorCode = 0
			END
		END
		ELSE
		BEGIN	
			SET @_nErrorCode = -2	
		END
	END
END

SET NOCOUNT OFF

RETURN @_nErrorCode
GO


