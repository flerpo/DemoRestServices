
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
{includes/aerende.i}



/* **********************  Internal Procedures  *********************** */

PROCEDURE get_aerende_on_aerendeid:
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    DEFINE INPUT PARAMETER pAerendeId AS DECIMAL.
    DEFINE OUTPUT PARAMETER oSvar AS JsonObject.
    DEFINE VARIABLE iRaeknare AS INTEGER NO-UNDO.
    
    ETIME(YES).
    
    FOR EACH aerende NO-LOCK WHERE aerende.AerendeId = pAerendeId:
        ASSIGN 
            iRaeknare = iRaeknare + 1.
        CREATE ttAerende.
        BUFFER-COPY aerende TO ttAerende.
    END. 

    oSvar = NEW JsonObject().
    
    TEMP-TABLE ttAerende:WRITE-JSON ("JsonObject",oSvar, TRUE).
    oSvar:Add('antal träffar', STRING(iRaeknare)).
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

