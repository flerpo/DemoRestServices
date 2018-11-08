
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
{intr.i}


/* **********************  Internal Procedures  *********************** */

PROCEDURE get_Intr:
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    DEFINE INPUT PARAMETER persnr AS CHARACTER.
    DEFINE OUTPUT PARAMETER mupp AS JsonObject.
    
    

    ETIME(YES).
    FIND FIRST intrPers NO-LOCK WHERE intrPers.PersNr = persNr NO-ERROR.
    IF NOT AVAILABLE intrpers THEN 
    DO:
        mupp = NEW JsonObject().
        mupp:Add('antal', 0).
        RETURN.
    END.
    
    FIND FIRST intr NO-LOCK WHERE intr.IntrId = intrPers.IntrId NO-ERROR.

    BUFFER-COPY intr TO ttIntr.
    BUFFER-COPY intrPers TO ttintrPers.

    mupp = NEW JsonObject().
    
    DEFINE VARIABLE lok AS LOGICAL NO-UNDO.
    DATASET dsIntr:WRITE-JSON ("JsonObject",mupp, TRUE).
    mupp:Add('anropstid', STRING(ETIME) + 'ms').
    
END PROCEDURE.

