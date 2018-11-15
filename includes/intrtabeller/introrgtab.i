
/*------------------------------------------------------------------------
    File        : introrgtab.i
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : eara02
    Created     : Tue Nov 13 21:40:08 CET 2018
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */


/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
DEFINE TEMP-TABLE ttIntrOrg SERIALIZE-NAME 'Organization'
    FIELD IntrId LIKE intrOrg.IntrId    SERIALIZE-NAME 'StakeholderId'
    FIELD OrgNr  LIKE intrOrg.OrgNr     SERIALIZE-NAME 'OrganizationNumber'
    FIELD Namn   LIKE intrOrg.Namn      SERIALIZE-NAME 'Name'