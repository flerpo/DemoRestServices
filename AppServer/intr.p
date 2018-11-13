
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
{includes/intr.i}.


/* **********************  Internal Procedures  *********************** */

PROCEDURE get_Intr:
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    DEFINE INPUT PARAMETER pcpersnr AS CHARACTER.
    DEFINE OUTPUT PARAMETER intrObject AS JsonObject.
    
    MESSAGE 'letar efter inne i tjänsten: ' pcPersNr
    VIEW-AS ALERT-BOX.
    
    DATASET dsIntr:HANDLE:ADD-RELATION(BUFFER ttIntrPers:HANDLE,BUFFER ttIntr:HANDLE, 'intrId,IntrId', FALSE,TRUE).
    DATASET dsIntr:HANDLE:ADD-RELATION(BUFFER ttIntr:HANDLE,BUFFER ttIntrOrg:HANDLE, 'intrId,IntrId', FALSE,TRUE).
    DATASET dsIntr:HANDLE:ADD-RELATION(BUFFER ttIntr:HANDLE,BUFFER ttIntrAdop:HANDLE, 'intrId,IntrId', FALSE,TRUE).
    DATASET dsIntr:HANDLE:ADD-RELATION(BUFFER ttIntr:HANDLE,BUFFER ttintrabfarbgivintrhist:HANDLE, 'intrId,IntrId', FALSE,TRUE).
    DATASET dsIntr:HANDLE:ADD-RELATION(BUFFER ttIntr:HANDLE,BUFFER ttIntrAktiv:HANDLE, 'intrId,IntrId', FALSE,TRUE).
    DATASET dsIntr:HANDLE:ADD-RELATION(BUFFER ttIntrPers:HANDLE,BUFFER ttIntrPersHist:HANDLE, 'intrId,IntrId', FALSE,TRUE).
    DATASET dsIntr:HANDLE:ADD-RELATION(BUFFER ttIntr:HANDLE,BUFFER ttIntrSkatt:HANDLE, 'intrId,IntrId', FALSE,TRUE).
    DATASET dsIntr:HANDLE:ADD-RELATION(BUFFER ttIntr:HANDLE,BUFFER ttIntrTillh:HANDLE, 'intrId,IntrId', FALSE,TRUE).
    DATA-SOURCE srcIntrPers:QUERY:QUERY-PREPARE(DATA-SOURCE srcIntrPers:QUERY:PREPARE-STRING + SUBSTITUTE(" WHERE intrpers.persNr = '&1' ", pcpersnr)).
    

    ETIME(YES).
    DATASET dsIntr:FILL().
    intrObject = NEW JsonObject().
    
    DEFINE VARIABLE lok AS LOGICAL NO-UNDO.
    DATASET dsIntr:WRITE-JSON ("JsonObject",intrObject, TRUE).
    intrObject:Add('anropstid', STRING(ETIME) + 'ms').
    
END PROCEDURE.

