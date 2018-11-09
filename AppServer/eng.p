
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
{includes/eng.i}


/* **********************  Internal Procedures  *********************** */

PROCEDURE get_eng_on_intr:
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    DEFINE INPUT PARAMETER pintrid AS DECIMAL.
    DEFINE OUTPUT PARAMETER oSvar AS JsonObject.
    DEFINE VARIABLE iRaeknare AS INTEGER NO-UNDO.
    
    ETIME(YES).
    
    FOR EACH aerendeEng NO-LOCK WHERE aerendeEng.IntrId = pintrid:
        ASSIGN iRaeknare = iRaeknare + 1.
        CREATE ttEng.
        BUFFER-COPY aerendeEng TO ttEng.
    END. 

    oSvar = NEW JsonObject().
    
    DEFINE VARIABLE lok AS LOGICAL NO-UNDO.
    TEMP-TABLE ttEng:WRITE-JSON ("JsonObject",oSvar, TRUE).
    oSvar:Add('antal', STRING(iRaeknare)).
    oSvar:Add('anropstid', STRING(ETIME) + 'ms').
    
END PROCEDURE.

