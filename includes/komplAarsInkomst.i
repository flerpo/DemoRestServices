/* Används i hsPubLaesAGSAerendeKomplDetaljLista002 */
/* hs/pub/hsPubLaesAGSAerendeKomplDetaljLista002ttTmpAarsInkomst.i */
/* 2016-08-23 EARA02 - A2016-08506 Digital komplettering - Läs detaljlista 002
                                    Uppdaterad med fler signaler */
   
DEFINE TEMP-TABLE ttTmp{&prefix}Aarsinkomst NO-UNDO XML-NODE-NAME 'KompletteringAarsinkomst':U 
  {&REFERENCE-ONLY}
  FIELD NyckelId                AS   CHARACTER INIT '1'
  FIELD SignalId                LIKE signal.signalid
  FIELD KomplTyp                AS   CHARACTER INIT 'AARSINKOMST'
  FIELD GaellerAnstNamn         AS   CHARACTER
  FIELD GaellerAnstOrgNr        AS CHARACTER
  

  
  



