USE [遊戲資料庫]
GO

/****** Object:  Table [dbo].[MEMBER_CODE_Label]    Script Date: 2020/7/16 下午 12:12:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MEMBER_CODE_Label](
	[INDEX_NO] [int] NOT NULL,
	[GROUP_CODE] [varchar](10) NOT NULL,
	[NAME] [nvarchar](50) NOT NULL,
	[INVALID_FLAG] [bit] NOT NULL,
	[C_DATETIME] [datetime] NOT NULL,
	[E_DATETIME] [datetime] NULL,
	[GAME_NO] [int] NOT NULL,
 CONSTRAINT [PK_MEMBER_CODE_Label] PRIMARY KEY CLUSTERED 
(
	[INDEX_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Index [GAME_NO]    Script Date: 2020/7/16 下午 12:12:51 ******/
CREATE NONCLUSTERED INDEX [GAME_NO] ON [dbo].[MEMBER_CODE_Label]
(
	[GAME_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

SET ANSI_PADDING ON
GO

/****** Object:  Index [GROUP_CODE]    Script Date: 2020/7/16 下午 12:12:51 ******/
CREATE NONCLUSTERED INDEX [GROUP_CODE] ON [dbo].[MEMBER_CODE_Label]
(
	[GROUP_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE [dbo].[MEMBER_CODE_Label] ADD  CONSTRAINT [DF_MEMBER_CODE_Label_INVALID_FLAG]  DEFAULT ((0)) FOR [INVALID_FLAG]
GO

ALTER TABLE [dbo].[MEMBER_CODE_Label] ADD  DEFAULT ((0)) FOR [GAME_NO]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'[流水號]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEMBER_CODE_Label', @level2type=N'COLUMN',@level2name=N'INDEX_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'[群組代碼]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEMBER_CODE_Label', @level2type=N'COLUMN',@level2name=N'GROUP_CODE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'[標籤名稱]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEMBER_CODE_Label', @level2type=N'COLUMN',@level2name=N'NAME'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'[無效旗標]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEMBER_CODE_Label', @level2type=N'COLUMN',@level2name=N'INVALID_FLAG'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'[建立時間]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEMBER_CODE_Label', @level2type=N'COLUMN',@level2name=N'C_DATETIME'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'[異動時間]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEMBER_CODE_Label', @level2type=N'COLUMN',@level2name=N'E_DATETIME'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'[遊戲編號]0為共用(不區分)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEMBER_CODE_Label', @level2type=N'COLUMN',@level2name=N'GAME_NO'
GO


