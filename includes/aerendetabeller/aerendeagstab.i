
/*------------------------------------------------------------------------
    File        : aerendeagetab.i
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : eara02
    Created     : Mon Nov 12 10:01:10 CET 2018
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */


/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
DEFINE TEMP-TABLE ttAerendeAgs NO-UNDO SERIALIZE-NAME 'AGSClaim'
    FIELD AerendeId            LIKE aerendeAgs.AerendeId SERIALIZE-NAME 'ClaimId'
    FIELD KvalStatAvk          LIKE aerendeAgs.KvalStatAvk SERIALIZE-NAME 'QualififactionStatusCode'
    FIELD KvalStat             AS CHARACTER SERIALIZE-NAME 'QualififactionStatusText'
    FIELD KvalUtr              LIKE aerendeAgs.KvalUtr SERIALIZE-NAME 'Qualified'
    FIELD SistaFoersDat        LIKE aerendeAgs.SistFoersDat SERIALIZE-NAME 'LastInsuredDay'
    FIELD SkadeOrsText         LIKE aerendeAgs.SkadeOrsText SERIALIZE-NAME 'InjuryCause'
    FIELD OblSkadeOrs          LIKE aerendeAgs.OblSkadeOrs SERIALIZE-NAME 'ObligatoryInjuryCause'
    FIELD FriskDat             LIKE aerendeAgs.FriskDat SERIALIZE-NAME 'HealthyDate'
    FIELD FriskDatMask         LIKE aerendeAgs.FriskDatMask SERIALIZE-NAME 'HealthyDateMachine'
    FIELD SjukfUtrAvk          LIKE aerendeAgs.SjukfUtrAvk SERIALIZE-NAME 'SicknessInvestigationCode'
    FIELD SjukfUtr             AS CHARACTER SERIALIZE-NAME 'SicknessInvestigationText'
    FIELD ArbloesTakSjukpAvk   LIKE aerendeAgs.ArbloesTakSjukpAvk SERIALIZE-NAME 'UnemploymentSickPayRoofCode'
    FIELD ArbloesTakSjukp      AS CHARACTER SERIALIZE-NAME 'UnemploymentSickPayRoofText'
    FIELD VaerdeSaekBasDat     LIKE aerendeAgs.VaerdeSaekBasDat SERIALIZE-NAME 'IndexationBaseDate'
    FIELD VaerdeSaekBasFromDat LIKE aerendeAgs.VaerdeSaekFromDat SERIALIZE-NAME 'IndexationFromDate'
    FIELD SkatteProc           LIKE aerendeAgs.SkatteProc SERIALIZE-NAME 'TaxProcentage'
    FIELD SkatteProcAnvaend    LIKE aerendeAgs.SkatteProcAnvaend SERIALIZE-NAME 'UsedTaxProcentage'
    FIELD ErsOever75BB         LIKE aerendeAgs.ErsOever75BB SERIALIZE-NAME 'CompensationOver7.5BaseSum'
    FIELD EfterskyddTomDat     LIKE aerendeAgs.EfterskyddTomDat SERIALIZE-NAME 'AfterProtectionToDate'
    FIELD RfvAv                LIKE aerendeAgs.RfvAv SERIALIZE-NAME 'ForsakringskassaQueryTurnedOff'
    FIELD SkatteProcTomDat     LIKE aerendeAgs.SkatteProcTomDat SERIALIZE-NAME 'IndexationBaseToDate'
    FIELD SjukfUpphDat         LIKE aerendeAgs.SjukfUpphDat SERIALIZE-NAME 'SicknessCeaseDate'
    FIELD KundAnmDat           LIKE aerendeAgs.KundAnmDat SERIALIZE-NAME 'StakeholderReportDate'
    FIELD FoerdInfoTypAvk      LIKE aerendeAgs.FoerdInfoTypAvk SERIALIZE-NAME 'DistributionInfoTypeCode'
    FIELD FoerdInfoTyp         AS CHARACTER SERIALIZE-NAME 'DistributionInfoTypeText'
    FIELD AnmArbSkAvk          LIKE aerendeAgs.AnmArbSkAvk SERIALIZE-NAME 'ReportedAsWorkInjuryToForsakringskassanCode'
    FIELD AnmArbSk             AS CHARACTER SERIALIZE-NAME 'ReportedAsWorkInjuryToForsakringskassanText'
 