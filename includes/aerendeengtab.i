
/*------------------------------------------------------------------------
    File        : aerendeengtab.i
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : eara02
    Created     : Mon Nov 12 09:36:09 CET 2018
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */


/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
DEFINE TEMP-TABLE ttAerendeEng SERIALIZE-NAME 'ClaimEngagements'
    FIELD EngId     LIKE aerendeEng.EngId SERIALIZE-NAME 'EngagementId'
    FIELD AerendeId LIKE aerendeEng.AerendeId SERIALIZE-NAME 'ClaimId'
    FIELD IntrId    LIKE aerendeEng.IntrId SERIALIZE-NAME 'StakeholderId' 
    FIELD Engtypavk LIKE aerendeEng.EngTypAvk SERIALIZE-NAME 'EngagementTypeCode'
    FIELD Engtyp    LIKE aerendeEng.EngTypAvk SERIALIZE-NAME 'EngagementTypeText'
    FIELD KopplId   LIKE aerendeEng.KopplId SERIALIZE-NAME 'ConnectionId'
    FIELD EngNamnId LIKE aerendeEng.EngNamnId SERIALIZE-NAME 'EngagementNameId'