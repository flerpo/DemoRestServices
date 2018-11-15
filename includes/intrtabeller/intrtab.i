
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
DEFINE TEMP-TABLE ttintr SERIALIZE-NAME 'StakeholderInfo'
    FIELD IntrId          LIKE intr.IntrId SERIALIZE-NAME 'StakeholderId'
    FIELD IntrTypAvk      LIKE intr.IntrTypAvk SERIALIZE-NAME 'StakeholderTypeCode'
    FIELD IntrTyp         AS CHARACTER SERIALIZE-NAME 'StakeholderTypeText'
    FIELD KopplId         LIKE intr.KopplId SERIALIZE-NAME 'ConnectionId'
    FIELD Inaktiv         LIKE intr.Inaktiv SERIALIZE-NAME 'Inactive'
    FIELD InaktivAvIntrId LIKE intr.InaktivAvIntrId SERIALIZE-NAME 'InactivatedBy'
