
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

{includes/dok.i}

/* **********************  Internal Procedures  *********************** */

PROCEDURE get_dok_on_aerendeId:
    
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    DEFINE INPUT PARAMETER pdeKopplid AS DECIMAL.
    DEFINE OUTPUT PARAMETER oSvar AS JsonObject.
    DEFINE VARIABLE iRaeknare AS INTEGER NO-UNDO.
    
    ETIME(YES).
    
    FOR EACH dokkoppl NO-LOCK WHERE dokKoppl.kopplid = pdeKopplid
        ,FIRST dok NO-LOCK WHERE dok.DokId = dokKoppl.DokId:
        ASSIGN 
            iRaeknare = iRaeknare + 1.
        CREATE ttDok.
        BUFFER-COPY Dok TO ttDok.
    END. 
    

    oSvar = NEW JsonObject().
    
    
    TEMP-TABLE ttDok:WRITE-JSON ("JsonObject",oSvar, TRUE).
    oSvar:Add('antal', STRING(iRaeknare)).
    oSvar:Add('anropstid', STRING(ETIME) + 'ms').
    
END PROCEDURE.

