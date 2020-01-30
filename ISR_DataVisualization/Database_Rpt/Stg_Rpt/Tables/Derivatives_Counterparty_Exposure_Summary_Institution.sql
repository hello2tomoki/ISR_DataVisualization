CREATE TABLE [Stg_Rpt].[Derivatives_Counterparty_Exposure_Summary_Institution] (
    [Counterparty_Exposure_Summary_Institution_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                                       NVARCHAR (50)  NULL,
    [Type]                                          NVARCHAR (100) NULL,
    [INS_Code]                                      NVARCHAR (50)  NULL,
    [INS_Name]                                      NVARCHAR (150) NULL,
    [SP_CP_Credit_Rating]                           NVARCHAR (50)  NULL,
    [5y_CD_CDS_BB_Model]                            NVARCHAR (50)  NULL,
    [1Yr_BB_Deft_Prob]                              NVARCHAR (50)  NULL,
    [Netting_Agreement]                             NVARCHAR (50)  NULL,
    [Current_Exposure]                              NVARCHAR (50)  NULL,
    [99_Per_Tail_Closeout_Risk]                     NVARCHAR (50)  NULL,
    [Potential_Loss]                                NVARCHAR (50)  NULL,
    [Potential_Loss_in_bp]                          NVARCHAR (50)  NULL,
    [Collateral_Held_Posted]                        NVARCHAR (50)  NULL,
    [Source]                                        NVARCHAR (150) NULL,
    [ETL_Load_Date]                                 DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Counterparty_Exposure_Summary_Institution_Key] ASC)
);

