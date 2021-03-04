USE [遊戲資料庫]
GO

/****** Object:  UserDefinedFunction [dbo].[MEMBER_GetLabelList]    Script Date: 2021/1/13 下午 05:29:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/* -----------------------------------------------------------------------------------------------------------------------------
函　　式：	MEMBER_GetLabelList

功能說明：	標籤查詢 (會員編號、機碼都傳 <= 0 則回傳所有標籤定義)

傳入參數：	@nMemberNo		會員編號(有傳的話以此為準)
			@lDeviceNo		機碼編號(會員編號 <= 0 才會撈機碼的標籤)

傳回結果：	傳回虛擬表，欄位為[標籤編號][標籤名稱][遊戲編號]

建　　立：	子傑（2019/12/27）

備　　註：	
			20210112 子傑 w82866 後端工具-帳號貼標紀錄工具優化
			20200713 子傑 w74630 建立「帳號標籤移除」預存
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


