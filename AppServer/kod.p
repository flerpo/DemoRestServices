
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
{includes/kod.i}



/* **********************  Internal Procedures  *********************** */

PROCEDURE get_kod_on_avk:
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    DEFINE INPUT PARAMETER ptermkod AS CHARACTER.
    DEFINE INPUT PARAMETER pavk AS CHARACTER.


    DEFINE OUTPUT PARAMETER oSvar AS JsonObject.
    DEFINE VARIABLE iRaeknare AS INTEGER NO-UNDO.
    
    ETIME(YES).
    
    FIND FIRST Kod NO-LOCK WHERE Kod.TermKod = ptermkod AND Kod.Avk = pavk NO-ERROR.
    ASSIGN 
        iRaeknare = iRaeknare + 1.
    CREATE ttKod.
    BUFFER-COPY kod TO ttKod.
    

    oSvar = NEW JsonObject().
    
    TEMP-TABLE ttKod:WRITE-JSON ("JsonObject",oSvar, TRUE).
    oSvar:Add('antal träffar', STRING(iRaeknare)).
    oSvar:Add('anropstid', STRING(ETIME) + 'ms').
    
END PROCEDURE.

PROCEDURE get_kod_on_termkod:
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    DEFINE INPUT PARAMETER ptermkod AS CHARACTER.
    


    DEFINE OUTPUT PARAMETER oSvar AS JsonObject.
    DEFINE VARIABLE iRaeknare AS INTEGER NO-UNDO.
    
    ETIME(YES).
    
    FOR EACH Kod NO-LOCK WHERE Kod.TermKod = ptermkod:
        
        ASSIGN 
            iRaeknare = iRaeknare + 1.
        CREATE ttKod.
        BUFFER-COPY kod TO ttKod.
    END.

    oSvar = NEW JsonObject().
    
    TEMP-TABLE ttKod:WRITE-JSON ("JsonObject",oSvar, TRUE).
    oSvar:Add('antal träffar', STRING(iRaeknare)).
    oSvar:Add('anropstid', STRING(ETIME) + 'ms').
    
END PROCEDURE.

PROCEDURE get_all_kod:
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    DEFINE OUTPUT PARAMETER oSvar AS JsonObject.
    DEFINE VARIABLE iRaeknare AS INTEGER NO-UNDO.
    
    MESSAGE 'kom in i procedueren'
        VIEW-AS ALERT-BOX.
    
    ETIME(YES).
    
    FOR EACH Kod NO-LOCK    :
        
        ASSIGN 
            iRaeknare = iRaeknare + 1.
            
        CREATE ttKod.
        BUFFER-COPY kod TO ttKod.
    END. 

    oSvar = NEW JsonObject().
    
    
    DEFINE VARIABLE lOk AS LOGICAL NO-UNDO.
    lOK = TEMP-TABLE ttKod:WRITE-JSON ("JsonObject",oSvar, TRUE).
    
    MESSAGE 'gick att skriva till json: ' lok
    VIEW-AS ALERT-BOX.
    
    oSvar:Add('antal', STRING(iRaeknare)).
    oSvar:Add('anropstid', STRING(ETIME) + 'ms').
    
END PROCEDURE.

