
/*------------------------------------------------------------------------
    File        : aerendetab.i
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : eara02
    Created     : Sat Nov 10 21:36:45 CET 2018
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */


/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
DEFINE TEMP-TABLE ttAerende SERIALIZE-NAME 'Claim'
    FIELD aerendeid         LIKE aerende.AerendeId SERIALIZE-NAME 'ClaimId'
    FIELD aerendedat        LIKE aerende.AerendeDat SERIALIZE-NAME 'ClaimDate'
    FIELD aerendestatavk    LIKE aerende.AerendeStatAvk SERIALIZE-NAME 'ClaimStatusCode'
    FIELD aerendestat       AS CHARACTER SERIALIZE-NAME 'ClaimStatusText'
    FIELD anmavk            LIKE aerende.AnmAvk SERIALIZE-NAME 'ClaimReportedCode'
    FIELD anm               LIKE aerende.AnmAvk SERIALIZE-NAME 'ClaimReportedText'
    FIELD produktgrpavk     LIKE aerende.ProduktGrpAvk SERIALIZE-NAME 'ProductGroupCode'
    FIELD produktgrp        AS CHARACTER SERIALIZE-NAME 'ProductGroupText'
    FIELD anvid             LIKE aerende.AnvId SERIALIZE-NAME 'UserId'
    FIELD kopplid           LIKE aerende.KopplId SERIALIZE-NAME 'ClaimKey'
    FIELD skapdat           LIKE aerende.SkapDat SERIALIZE-NAME 'CreatedDate'
    FIELD aerendenr         LIKE aerende.AerendeNr SERIALIZE-NAME 'ClaimNumber'
    FIELD anmfullmavk       LIKE aerende.AnmFullmAvk SERIALIZE-NAME 'HealthWarrantCode'
    FIELD tolkaerendedat    LIKE aerende.TolkAerendeDat SERIALIZE-NAME 'InterperedClaimDate'
    FIELD aerendestatupddat LIKE aerende.AerendeStatUpdDat SERIALIZE-NAME 'ClaimStatusUpdateDate'
    FIELD utanordanvid      LIKE aerende.UtanordAnvId SERIALIZE-NAME 'AuthorizationUserId'
    FIELD grunddataaendr    LIKE aerende.GrundDataAendr SERIALIZE-NAME 'ClaimDataChangedAfterAttestation'
    FIELD anmhaelsofullmavk LIKE aerende.AnmHaelsofullmAvk SERIALIZE-NAME 'HealthWarrantCode'
    FIELD dokid             LIKE aerende.DokId SERIALIZE-NAME 'DocumentId'
    FIELD ankdat            LIKE aerende.AnkDat SERIALIZE-NAME 'RecievedDate'
    FIELD flerarbgigavk     LIKE aerende.FlerArbGivAvk SERIALIZE-NAME 'MultipleEmployerCode'
 
 
 