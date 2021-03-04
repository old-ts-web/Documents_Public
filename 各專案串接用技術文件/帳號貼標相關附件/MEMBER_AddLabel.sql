USE [遊戲資料庫]
GO

/****** Object:  StoredProcedure [dbo].[MEMBER_AddLabel]    Script Date: 2021/1/13 下午 05:28:24 ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER ON
GO

/* -----------------------------------------------------------------------------------------------------------------------------
函　　式：MEMBER_AddLabel
功能說明：對特定對象貼標籤(會員編號、機碼至少要傳一個，不貼的傳 0)

傳入參數：	@nMemberNo		會員編號 (不貼傳 0)
			@nLabelNo		標籤編號
			@lDeviceNo		機碼編號 (不貼傳 0)

傳回結果：	
Return Value
			0 :成功
	      	-1:會員不存在
	      	-2:標籤編號不存在或已無效
	      	-3:該會員已被貼上同類別標籤 (同類別標籤只能被貼一個)
			-4:未傳入有效會員編號或機碼
	      	-5:該機碼已被貼上同類別標籤 (同類別標籤只能被貼一個)
	      	-99:發生非預期錯誤
			
建　　立：	子傑（2019/12/27）

備　　註：	
			20210112 子傑 w82866 後端工具-帳號貼標紀錄工具優化
			20200713 子傑 w74630 建立「帳號標籤移除」預存
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

	-- 會員編號貼標
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

	-- 機碼貼標 (若會員貼標有異常則終止)
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


