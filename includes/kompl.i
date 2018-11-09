/* Används i hsPubLaesAGSAerendeKomplDetaljLista001 */
/* hs/pub/hsPubLaesAGSAerendeKomplDetaljLista001ttTmpkompl.i */
/* 2016-08-23 EARA02 - A2016-08506 Digital komplettering - Läs detaljlista 002
                                    Uppdaterad med fler signaler */
   
DEFINE TEMP-TABLE ttTmp{&prefix}Kompl NO-UNDO XML-NODE-NAME 'Kompletteringar':U 
  {&REFERENCE-ONLY}
  FIELD NyckelId                AS   CHARACTER INIT '1' 
  
