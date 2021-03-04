USE [遊戲資料庫]
GO

/****** Object:  StoredProcedure [dbo].[MEMBER_RemoveLabel]    Script Date: 2021/1/13 下午 05:28:50 ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER ON
GO

/* -----------------------------------------------------------------------------------------------------------------------------
函　　式：MEMBER_RemoveLabel
功能說明：移除特定對象標籤(會員編號、機碼至少要傳一個，不移除的傳 0)

傳入參數：	@nMemberNo		會員編號 (不移除傳 0)
			@nLabelNo		標籤編號
			@lDeviceNo		機碼編號 (不移除傳 0)

傳回結果：	
Return Value
			0 :成功
	      	-1:會員不存在
	      	-99:發生非預期錯誤
			
建　　立：	子傑（2020/07/10）

備　　註：	
			20210112 子傑 w82866 後端工具-帳號貼標紀錄工具優化
			20200713 子傑 w74630 建立「帳號標籤移除」預存
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
	-- 會員編號
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

	-- 機碼 (若會員處理有異常則終止)
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


