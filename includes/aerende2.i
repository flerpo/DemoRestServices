
/*------------------------------------------------------------------------
    File        : aerende2
    Purpose     : 

    Syntax      :

    Description : allt som har med ärende att göra

    Author(s)   : eara02
    Created     : Wed Oct 24 15:00:15 CEST 2018
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */


/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
DEFINE TEMP-TABLE ttAerende LIKE aerende.
DEFINE TEMP-TABLE ttAerendeEng LIKE aerendeEng.
DEFINE TEMP-TABLE ttAerendeAgs LIKE aerendeAgs.
DEFINE TEMP-TABLE ttAerendeTFA LIKE aerendeTfa.
DEFINE TEMP-TABLE ttAerendeEngAktiv LIKE aerendeEngAktiv.

DEFINE DATASET dsAerende FOR ttAerende, ttAerendeEng, ttAerendeAgs, ttAerendeTFA, ttAerendeEngAktiv
    DATA-RELATION dr FOR ttAerende, ttAerendeEng
    RELATION-FIELDS(aerendeId, AerendeId)
    DATA-RELATION dr2 FOR ttAerende, ttAerendeAgs
    RELATION-FIELDS(aerendeId, AerendeId)
    DATA-RELATION dr3 FOR ttAerende, ttAerendeTfa
    RELATION-FIELDS(aerendeId, AerendeId)   
    DATA-RELATION dr4 FOR ttAerendeEng, ttAerendeEngAktiv
    RELATION-FIELDS(engid, engid)
 
 
    .
