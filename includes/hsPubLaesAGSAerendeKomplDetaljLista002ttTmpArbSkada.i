/* Används i hsPubLaesAGSAerendeKomplDetaljLista002 */
/* hs/pub/hsPubLaesAGSAerendeKomplDetaljLista002ttTmpArbSkada.i */
/* 2016-08-23 EARA02 - A2016-08506 Digital komplettering - Läs detaljlista 002
                                    Uppdaterad med fler signaler */
   
DEFINE TEMP-TABLE ttTmp{&prefix}ArbSkada NO-UNDO XML-NODE-NAME 'KompletteringArbSkada':U 
  {&REFERENCE-ONLY}
  FIELD NyckelId                AS   CHARACTER INIT '1'
  FIELD SignalId                LIKE signal.signalid
  FIELD KomplTyp                AS   CHARACTER INIT 'ARBSKADA'

  

  
  



