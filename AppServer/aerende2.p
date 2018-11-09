
/*------------------------------------------------------------------------
    File        : intr.p
    Purpose     : 

    Syntax      :

    Description : massa saker med intressent

    Author(s)   : eara02
    Created     : Wed Oct 10 19:28:35 CEST 2018
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

USING Progress.Json.ObjectModel.JsonObject FROM PROPATH.

/* ********************  Preprocessor Definitions  ******************** */

 
/* ***************************  Main Block  *************************** */
DEFINE TEMP-TABLE ttAerende LIKE aerende.
DEFINE TEMP-TABLE ttAerendeEng LIKE aerendeEng.
DEFINE TEMP-TABLE ttAerendeAgs LIKE aerendeAgs.
DEFINE TEMP-TABLE ttAerendeTFA LIKE aerendeTfa.
DEFINE TEMP-TABLE ttAerendeEngAktiv LIKE aerendeEngAktiv.
DEFINE TEMP-TABLE ttAerendeSags LIKE aerendeSags.



DEFINE DATASET dsAerende FOR ttAerende, ttAerendeEng, ttAerendeAgs, ttAerendeTFA, ttAerendeEngAktiv, ttAerendeSags
    .

/* **********************  Internal Procedures  *********************** */

PROCEDURE get_aerende_on_aerendeid:
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    
    
    DEFINE INPUT PARAMETER pAerendeId AS DECIMAL.
    DEFINE OUTPUT PARAMETER oSvar AS JsonObject.
    DEFINE VARIABLE iRaeknare AS INTEGER NO-UNDO.
    DEFINE DATA-SOURCE srcAerendeEng              FOR aerendeEng.
    DEFINE DATA-SOURCE srcAerende                 FOR aerende.
    DEFINE DATA-SOURCE srcAerendeAgs                 FOR aerendeAgs.
    DEFINE DATA-SOURCE srcAerendeTfa                 FOR aerendeTfa.
    DEFINE DATA-SOURCE srcAerendeSags                 FOR aerendeSags.
    DEFINE DATA-SOURCE srcAerendeEngAktiv                 FOR aerendeEngAktiv.
    
    BUFFER ttAerendeEng:ATTACH-DATA-SOURCE(DATA-SOURCE srcAerendeEng:HANDLE,?,?).
    BUFFER ttAerende:ATTACH-DATA-SOURCE(DATA-SOURCE srcAerende:HANDLE,?,?).
    BUFFER ttAerendeAgs:ATTACH-DATA-SOURCE(DATA-SOURCE srcAerendeAgs:HANDLE,?,?).
    BUFFER ttAerendeTfa:ATTACH-DATA-SOURCE(DATA-SOURCE srcAerendeTfa:HANDLE,?,?).
    BUFFER ttAerendeSags:ATTACH-DATA-SOURCE(DATA-SOURCE srcAerendeSags:HANDLE,?,?).
    BUFFER ttAerendeEngAktiv:ATTACH-DATA-SOURCE(DATA-SOURCE srcAerendeEngAktiv:HANDLE,?,?).
    


    
    DATASET dsAerende:HANDLE:ADD-RELATION(BUFFER ttAerende:HANDLE,BUFFER ttAerendeEng:HANDLE, 'aerendeId,AerendeId', FALSE,TRUE).
    DATASET dsAerende:HANDLE:ADD-RELATION(BUFFER ttAerende:HANDLE,BUFFER ttAerendeAgs:HANDLE, 'aerendeId,AerendeId', FALSE,TRUE).
    DATASET dsAerende:HANDLE:ADD-RELATION(BUFFER ttAerende:HANDLE,BUFFER ttAerendeTfa:HANDLE, 'aerendeId,AerendeId', FALSE,TRUE).
    DATASET dsAerende:HANDLE:ADD-RELATION(BUFFER ttAerende:HANDLE,BUFFER ttAerendeSags:HANDLE, 'aerendeId,AerendeId', FALSE,TRUE).
    DATASET dsAerende:HANDLE:ADD-RELATION(BUFFER ttAerendeEng:HANDLE,BUFFER ttAerendeEngAktiv:HANDLE, 'engid,engid', FALSE,TRUE).
    DATA-SOURCE srcAerende:QUERY:QUERY-PREPARE(DATA-SOURCE srcAerende:QUERY:PREPARE-STRING + SUBSTITUTE(" WHERE aerende.aerendeid = '&1' ", pAerendeId)).
    
    ETIME(YES).
    DATASET dsAerende:FILL ().
    oSvar = NEW JsonObject().
    
    DATASET  dsAerende:WRITE-JSON ("JsonObject",oSvar, TRUE).
    oSvar:Add('antal', STRING(iRaeknare)).
    oSvar:Add('anropstid', STRING(ETIME) + 'ms').
    
END PROCEDURE.

PROCEDURE get_aerenden_on_intrid:
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    DEFINE INPUT PARAMETER pdeIntrid AS DECIMAL.
    DEFINE OUTPUT PARAMETER oSvar AS JsonObject.
    DEFINE VARIABLE iRaeknare AS INTEGER NO-UNDO.
    
    MESSAGE 'kom in i procedueren'
        VIEW-AS ALERT-BOX.
    
    ETIME(YES).
    
    FOR EACH aerendeEng NO-LOCK WHERE aerendeEng.IntrId = pdeIntrId
        , FIRST aerende NO-LOCK WHERE aerende.AerendeId = aerendeEng.AerendeId:
        
        ASSIGN 
            iRaeknare = iRaeknare + 1.
        MESSAGE 'hittat ärende'
            VIEW-AS ALERT-BOX.
        CREATE ttAerende.
        BUFFER-COPY aerende TO ttAerende.
    END. 

    oSvar = NEW JsonObject().
    
    DEFINE VARIABLE lOk AS LOGICAL NO-UNDO.
    lOK = TEMP-TABLE ttAerende:WRITE-JSON ("JsonObject",oSvar, TRUE).
    
    oSvar:Add('antal', STRING(iRaeknare)).
    oSvar:Add('anropstid', STRING(ETIME) + 'ms').
    
END PROCEDURE.

