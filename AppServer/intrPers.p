
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
{includes/intrPers.i}.


/* **********************  Internal Procedures  *********************** */

PROCEDURE get_intr_on_persnr:
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    DEFINE INPUT PARAMETER pcpersnr AS CHARACTER.
    DEFINE OUTPUT PARAMETER intrObject AS JsonObject.
    
    MESSAGE 'letar efter inne i tjänsten: ' pcPersNr
        VIEW-AS ALERT-BOX.     
   
    
    
    DATASET dsIntrPers:HANDLE:ADD-RELATION(BUFFER ttIntrPers:HANDLE,BUFFER ttIntr:HANDLE, 'IntrId,IntrId', FALSE,TRUE).
    DATASET dsIntrPers:HANDLE:ADD-RELATION(BUFFER ttIntrPers:HANDLE,BUFFER ttIntrAdop:HANDLE, 'IntrId,IntrId', FALSE,TRUE).
    DATASET dsIntrPers:HANDLE:ADD-RELATION(BUFFER ttIntrPers:HANDLE,BUFFER ttIntrAktiv:HANDLE, 'IntrId,IntrId', FALSE,TRUE).
    DATASET dsIntrPers:HANDLE:ADD-RELATION(BUFFER ttIntrPers:HANDLE,BUFFER ttIntrPersHist:HANDLE, 'IntrId,IntrId', FALSE,TRUE).
    DATASET dsIntrPers:HANDLE:ADD-RELATION(BUFFER ttIntrPers:HANDLE,BUFFER ttIntrSkatt:HANDLE, 'IntrId,IntrId', FALSE,TRUE).
    DATASET dsIntrPers:HANDLE:ADD-RELATION(BUFFER ttIntrPers:HANDLE,BUFFER ttIntrTillh:HANDLE, 'IntrId,IntrId', FALSE,TRUE).
    DATA-SOURCE srcIntrPers:QUERY:QUERY-PREPARE(DATA-SOURCE srcIntrPers:QUERY:PREPARE-STRING + SUBSTITUTE(" WHERE intrpers.persNr = '&1' ", pcpersnr)).
    

    ETIME(YES).
    DATASET dsIntrPers:FILL().
    intrObject = NEW JsonObject().
    
    DEFINE VARIABLE lok AS LOGICAL NO-UNDO.
    DATASET dsIntrPers:WRITE-JSON ("JsonObject",intrObject, TRUE).
    intrObject:Add('anropstid', STRING(ETIME) + 'ms').
    
END PROCEDURE.



