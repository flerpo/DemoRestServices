
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
{includes/aerende.i}.


/* **********************  Internal Procedures  *********************** */

PROCEDURE get_aerende_on_aerendeid:
    /*------------------------------------------------------------------------------
     Purpose:
     Notes: /aerende/detalj/{aerendeid}
    ------------------------------------------------------------------------------*/
    
    DEFINE INPUT PARAMETER pAerendeId AS DECIMAL.
    DEFINE OUTPUT PARAMETER oSvar AS JsonObject.
    
    /* TODO Kan man lyfta ut detta? */
    DATASET dsAerende:HANDLE:ADD-RELATION(BUFFER ttAerende:HANDLE,BUFFER ttAerendeEng:HANDLE, 'aerendeId,AerendeId', FALSE,TRUE).
    DATASET dsAerende:HANDLE:ADD-RELATION(BUFFER ttAerende:HANDLE,BUFFER ttAerendeAgs:HANDLE, 'aerendeId,AerendeId', FALSE,TRUE).
    DATASET dsAerende:HANDLE:ADD-RELATION(BUFFER ttAerende:HANDLE,BUFFER ttAerendeTfa:HANDLE, 'aerendeId,AerendeId', FALSE,TRUE).
    DATASET dsAerende:HANDLE:ADD-RELATION(BUFFER ttAerende:HANDLE,BUFFER ttAerendeSags:HANDLE, 'aerendeId,AerendeId', FALSE,TRUE).
    DATASET dsAerende:HANDLE:ADD-RELATION(BUFFER ttAerendeEng:HANDLE,BUFFER ttAerendeEngAktiv:HANDLE, 'engid,engid', FALSE,TRUE).
    DATA-SOURCE srcAerende:QUERY:QUERY-PREPARE(DATA-SOURCE srcAerende:QUERY:PREPARE-STRING + SUBSTITUTE(" WHERE aerende.aerendeid = '&1' ", pAerendeId)).
    
    ETIME(YES).
    DATASET dsAerende:FILL ().
    oSvar = NEW JsonObject().
    
    FOR EACH ttAerende:
        IF ttAerende.aerendestatavk <> '' THEN 
        DO:
            FIND FIRST Kod NO-LOCK WHERE Kod.Avk = ttAerende.aerendestatavk AND Kod.TermKod = 'aerende.aerendestatavk' NO-ERROR.
            IF AVAILABLE Kod THEN ASSIGN ttAerende.aerendestat = Kod.Namn.
        
        END.
        IF ttAerende.anmavk <> '' THEN 
        DO:
            FIND FIRST Kod NO-LOCK WHERE Kod.Avk = ttAerende.anmavk AND Kod.TermKod = 'aerende.anmavk' NO-ERROR.
            IF AVAILABLE Kod THEN ASSIGN ttAerende.anm = Kod.Namn.
        
        END.
    END.
    
    DATASET  dsAerende:WRITE-JSON ("JsonObject",oSvar, TRUE).
    oSvar:Add('anropstid', STRING(ETIME) + 'ms').
    
END PROCEDURE.


PROCEDURE get_aerenden_on_intrid:
    /*------------------------------------------------------------------------------
     Purpose:
     Notes: /aeraende/lista/{intrid}
    ------------------------------------------------------------------------------*/
    DEFINE INPUT PARAMETER pdeIntrid AS DECIMAL.
    DEFINE OUTPUT PARAMETER oSvar AS JsonObject.
    DEFINE VARIABLE iRaeknare AS INTEGER NO-UNDO.
    
    ETIME(YES).
    
   
    FOR EACH aerendeEng NO-LOCK WHERE aerendeEng.IntrId = pdeIntrId
        , FIRST aerende NO-LOCK WHERE aerende.AerendeId = aerendeEng.AerendeId:
        
        ASSIGN 
            iRaeknare = iRaeknare + 1.
        CREATE ttAerende.
        BUFFER-COPY aerende TO ttAerende.
    END. 

    oSvar = NEW JsonObject().
    
    TEMP-TABLE ttAerende:WRITE-JSON ("JsonObject",oSvar, TRUE).
    
    oSvar:Add('antal', STRING(iRaeknare)).
    oSvar:Add('anropstid', STRING(ETIME) + 'ms').
    
END PROCEDURE.

