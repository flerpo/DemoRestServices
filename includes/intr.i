
 /*------------------------------------------------------------------------
    File        : Intr
    Purpose		:
    Syntax      : 
    Description :
    Author(s)   : eara02
    Created     : Wed Oct 10 19:29:44 CEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/
  
  /* ***************************  Definitions  ************************** */
  
  /* ********************  Preprocessor Definitions  ******************** */
  
  /* ***************************  Main Block  *************************** */
  
  /** Dynamically generated schema file **/
   
    
DEFINE TEMP-TABLE ttintr 
FIELD IntrId AS DECIMAL INITIAL "0"
FIELD IntrTypAvk AS CHARACTER
FIELD KopplId AS DECIMAL INITIAL "0"
FIELD Inaktiv AS LOGICAL INITIAL "no"
FIELD InaktivAvIntrId AS DECIMAL INITIAL "0"
INDEX Intr IS  PRIMARY  UNIQUE  IntrId  ASCENDING 
INDEX KopplId IS  UNIQUE  KopplId  ASCENDING . 

DEFINE TEMP-TABLE ttintrPers
FIELD IntrId AS DECIMAL INITIAL "0"
FIELD Sekel AS CHARACTER
FIELD PersNr AS CHARACTER
FIELD ENamn AS CHARACTER
FIELD FNamn AS CHARACTER
FIELD DoedDat AS CHARACTER
FIELD SkyddUppg AS LOGICAL INITIAL "no"
FIELD HaenvSekel AS CHARACTER
FIELD HaenvPersNr AS CHARACTER
FIELD AnvId AS DECIMAL INITIAL "0"
FIELD ManSkyddUppg AS CHARACTER
FIELD IntrPersGuid AS CHARACTER
FIELD SancListAvk AS CHARACTER
INDEX ENamn  ENamn  ASCENDING 
INDEX FNamn  FNamn  ASCENDING 
INDEX HaenvPersNr  HaenvPersNr  ASCENDING 
INDEX HaenvSekel  HaenvSekel  ASCENDING 
INDEX IntrPers IS  PRIMARY  UNIQUE  IntrId  ASCENDING 
INDEX IntrPersGuid  IntrPersGuid  ASCENDING 
INDEX ManSkyddUppg  ManSkyddUppg  ASCENDING 
INDEX PersNr  PersNr  ASCENDING 
INDEX SancListAvk  SancListAvk  ASCENDING 
INDEX Sekel  Sekel  ASCENDING . 


DEFINE DATASET dsintr FOR ttintr, ttintrPers
 DATA-RELATION dr FOR ttintr, ttintrPers
  RELATION-FIELDS(intrId, intrId).