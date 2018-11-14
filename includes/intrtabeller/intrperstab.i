
/*------------------------------------------------------------------------
    File        : intrperstab.i
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : eara02
    Created     : Tue Nov 13 21:32:26 CET 2018
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */


/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
DEFINE TEMP-TABLE ttintrPers
    FIELD IntrId       AS DECIMAL   INITIAL "0"
    FIELD Sekel        AS CHARACTER
    FIELD PersNr       AS CHARACTER
    FIELD ENamn        AS CHARACTER
    FIELD FNamn        AS CHARACTER
    FIELD DoedDat      AS CHARACTER
    FIELD SkyddUppg    AS LOGICAL   INITIAL "no"
    FIELD HaenvSekel   AS CHARACTER
    FIELD HaenvPersNr  AS CHARACTER
    FIELD AnvId        AS DECIMAL   INITIAL "0"
    FIELD ManSkyddUppg AS CHARACTER
    FIELD IntrPersGuid AS CHARACTER
    FIELD SancListAvk  AS CHARACTER

