USE [遊戲資料庫]
GO

/****** Object:  Table [dbo].[DEVICE_LabelList]    Script Date: 2021/1/13 下午 04:08:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DEVICE_LabelList](
	[INDEX_NO] [int] IDENTITY(1,1) NOT NULL,
	[DEVICE_NO] [bigint] NOT NULL,
	[LABEL_NO] [int] NOT NULL,
	[C_DATETIME] [datetime] NOT NULL,
	[E_DATETIME] [datetime] NULL,
	[INVALID_FLAG] [bit] NOT NULL,
 CONSTRAINT [PK_DEVICE_LabelList] PRIMARY KEY CLUSTERED 
(
	[INDEX_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Index [C_DATETIME]    Script Date: 2021/1/13 下午 04:08:38 ******/
CREATE NONCLUSTERED INDEX [C_DATETIME] ON [dbo].[DEVICE_LabelList]
(
	[C_DATETIME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [DEVICE_NO]    Script Date: 2021/1/13 下午 04:08:38 ******/
CREATE NONCLUSTERED INDEX [DEVICE_NO] ON [dbo].[DEVICE_LabelList]
(
	[DEVICE_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [E_DATETIME]    Script Date: 2021/1/13 下午 04:08:38 ******/
CREATE NONCLUSTERED INDEX [E_DATETIME] ON [dbo].[DEVICE_LabelList]
(
	[E_DATETIME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [LABEL_NO]    Script Date: 2021/1/13 下午 04:08:38 ******/
CREATE NONCLUSTERED INDEX [LABEL_NO] ON [dbo].[DEVICE_LabelList]
(
	[LABEL_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DEVICE_LabelList] ADD  CONSTRAINT [DF_DEVICE_LabelList_INVALID_FLAG]  DEFAULT ((0)) FOR [INVALID_FLAG]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'[流水號]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEVICE_LabelList', @level2type=N'COLUMN',@level2name=N'INDEX_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'[機碼]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEVICE_LabelList', @level2type=N'COLUMN',@level2name=N'DEVICE_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'[標籤編號] 對應 MEMBER_CODE_Label.INDEX_NO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEVICE_LabelList', @level2type=N'COLUMN',@level2name=N'LABEL_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'[建立時間]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEVICE_LabelList', @level2type=N'COLUMN',@level2name=N'C_DATETIME'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'[異動時間]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEVICE_LabelList', @level2type=N'COLUMN',@level2name=N'E_DATETIME'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'[無效旗標]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DEVICE_LabelList', @level2type=N'COLUMN',@level2name=N'INVALID_FLAG'
GO


