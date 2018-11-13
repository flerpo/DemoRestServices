
/*------------------------------------------------------------------------
    File        : intrtab.i
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : eara02
    Created     : Tue Nov 13 21:31:00 CET 2018
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */


/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
DEFINE TEMP-TABLE ttintr 
FIELD IntrId AS DECIMAL INITIAL "0"
FIELD IntrTypAvk AS CHARACTER
FIELD KopplId AS DECIMAL INITIAL "0"
FIELD Inaktiv AS LOGICAL INITIAL "no"
FIELD InaktivAvIntrId AS DECIMAL INITIAL "0"
INDEX Intr IS  PRIMARY  UNIQUE  IntrId  ASCENDING 
INDEX KopplId IS  UNIQUE  KopplId  ASCENDING  