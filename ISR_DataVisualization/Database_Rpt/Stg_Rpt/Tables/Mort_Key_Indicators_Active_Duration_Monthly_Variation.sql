CREATE TABLE [Stg_Rpt].[Mort_Key_Indicators_Active_Duration_Monthly_Variation] (
    [Mort_Key_Indicators_Active_Duration_Monthly_Variation_Key] INT            IDENTITY (1, 1) NOT NULL,
    [Portfolio]                                                 NVARCHAR (150) NULL,
    [As_Of_Date]                                                NVARCHAR (150) NULL,
    [Active_Duration]                                           NVARCHAR (150) NULL,
    [QY_Date]                                                   NVARCHAR (150) NULL,
    [Source]                                                    NVARCHAR (150) NULL,
    [ETL_Load_Date]                                             DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Mort_Key_Indicators_Active_Duration_Monthly_Variation_Key] ASC) ON [Data]
);

