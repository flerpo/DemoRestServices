
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
{bet.i}


/* **********************  Internal Procedures  *********************** */

PROCEDURE get_bet_on_engid:
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    DEFINE INPUT PARAMETER pengid AS DECIMAL.
    DEFINE OUTPUT PARAMETER oSvar AS JsonObject.
    DEFINE VARIABLE iRaeknare AS INTEGER NO-UNDO.
    
    ETIME(YES).
    
    FOR EACH bet NO-LOCK WHERE bet.EngId = pengid:
        ASSIGN iRaeknare = iRaeknare + 1.
        CREATE ttBet.
        BUFFER-COPY bet TO ttBet.
    END. 


    oSvar = NEW JsonObject().
    
    DEFINE VARIABLE lok AS LOGICAL NO-UNDO.
    TEMP-TABLE ttBet:WRITE-JSON ("JsonObject",oSvar, TRUE).
    oSvar:Add('antal', STRING(iRaeknare)).
    oSvar:Add('anropstid', STRING(ETIME) + 'ms').
    
END PROCEDURE.

