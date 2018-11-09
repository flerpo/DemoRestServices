/* Används i hsPubLaesAGSAerendeKomplDetaljLista002 */
/* hs/pub/hsPubLaesAGSAerendeKomplDetaljLista002ttTmpDelaegare.i */
/* 2016-08-23 EARA02 - A2016-08506 Digital komplettering - Läs detaljlista 002
                                    Uppdaterad med fler signaler */
   
DEFINE TEMP-TABLE ttTmp{&prefix}Delaegare NO-UNDO XML-NODE-NAME 'KompletteringDelaegare':U 
  {&REFERENCE-ONLY}
  FIELD NyckelId                AS   CHARACTER INIT '1'
  FIELD SignalId                LIKE signal.signalid
  FIELD KomplTyp                AS   CHARACTER INIT 'DELAEGARE'
  FIELD GaellerAnstNamn         AS   CHARACTER
  FIELD GaellerAnstOrgNr        AS CHARACTER
  

  
  



