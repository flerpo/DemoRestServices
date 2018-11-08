/* Används i hsPubLaesAGSAerendeKomplDetaljLista002 */
/* hs/pub/hsPubLaesAGSAerendeKomplDetaljLista002ttDiagnosKod.i */
/* 2016-08-23 EARA02 - A2016-08506 Digital komplettering - Läs detaljlista 002
                                    Uppdaterad med fler signaler */
   
DEFINE TEMP-TABLE ttTmp{&prefix}DiagnosKod NO-UNDO SERIALIZE-NAME 'AdditionDiagnosis':U 
  {&REFERENCE-ONLY}
  FIELD NyckelId                AS   CHARACTER  INIT '1' SERIALIZE-HIDDEN
  FIELD SignalId                LIKE signal.SignalId SERIALIZE-NAME "Id"
  FIELD KomplTyp                AS   CHARACTER INIT 'DIAGNOSKOD' SERIALIZE-NAME "AdditionType"  
  FIELD GaellerDatum            AS   DATE   SERIALIZE-NAME "Date"
  
  



