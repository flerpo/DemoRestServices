
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
{includes/intrOrg.i}.


/* **********************  Internal Procedures  *********************** */

PROCEDURE get_intr_on_orgnr:
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    DEFINE INPUT PARAMETER pcorgnr AS CHARACTER.
    DEFINE OUTPUT PARAMETER intrObject AS JsonObject.
    
    MESSAGE 'letar efter inne i tj�nsten org: ' pcorgnr
        VIEW-AS ALERT-BOX.
    
    DATASET dsIntrOrg:HANDLE:ADD-RELATION(BUFFER ttIntrOrg:HANDLE,BUFFER ttIntr:HANDLE, 'intrId,IntrId', FALSE,TRUE).
    DATA-SOURCE srcIntrOrg:QUERY:QUERY-PREPARE(DATA-SOURCE srcIntrOrg:QUERY:PREPARE-STRING + SUBSTITUTE(" WHERE introrg.orgNr = '&1' ", pcorgnr)).
    

    ETIME(YES).
    DATASET dsIntrOrg:FILL().
    intrObject = NEW JsonObject().
    
    DEFINE VARIABLE lok AS LOGICAL NO-UNDO.
    DATASET dsIntrOrg:WRITE-JSON ("JsonObject",intrObject, TRUE).
    intrObject:Add('anropstid', STRING(ETIME) + 'ms').
    
END PROCEDURE.
