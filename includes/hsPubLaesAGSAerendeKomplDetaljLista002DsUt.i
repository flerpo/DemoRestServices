/* hs/pub/hsPubLaesAGSAerendeKomplDetaljLista002DsUt.i */
/* 2016-08-23 EARA02 - A2016-08506 Digital komplettering - Läs detaljlista 002
                                    Uppdaterad med fler signaler */
   
   
DEFINE TEMP-TABLE ttTmpAerendeKomplLista NO-UNDO SERIALIZE-NAME 'CaseAdditions':U 

  FIELD NyckelId                AS   CHARACTER INIT '1' SERIALIZE-HIDDEN
  FIELD AerendeId               AS DECIMAL 
  INDEX NyckelId IS PRIMARY UNIQUE NyckelId
  .
  {includes/hsPubLaesAGSAerendeKomplDetaljLista002ttTmpKompl.i }.
  {includes/hsPubLaesAGSAerendeKomplDetaljLista002ttTmpDiagnosKod.i  }.
  {includes/hsPubLaesAGSAerendeKomplDetaljLista002ttTmpYrke.i  }.
  {includes/hsPubLaesAGSAerendeKomplDetaljLista002ttTmpFullmakt.i  }.
  {includes/hsPubLaesAGSAerendeKomplDetaljLista002ttTmpSexMaanader.i }.
  {includes/hsPubLaesAGSAerendeKomplDetaljLista002ttTmpDelaegare.i  }.
  {includes/hsPubLaesAGSAerendeKomplDetaljLista002ttTmpFlerArbGiv.i }.
  {includes/hsPubLaesAGSAerendeKomplDetaljLista002ttTmpArbSkada.i }.
  {includes/hsPubLaesAGSAerendeKomplDetaljLista002ttTmpAarsInkomst.i }.

DEFINE DATASET dsUt   
  SERIALIZE-NAME 'CaseAdditionList':U
  {&REFERENCE-ONLY}
  FOR ttTmpAerendeKomplLista,ttTmpKompl,ttTmpDiagnosKod,ttTmpYrke,ttTmpFullmakt
     ,ttTmpDelaegare,ttTmpSexMaanader,ttTmpFlerArbGiv,ttTmpArbSkada,ttTmpAarsInkomst
  DATA-RELATION relation1 FOR ttTmpAerendeKomplLista,ttTmpKompl
    RELATION-FIELDS (NyckelId,NyckelId) NESTED FOREIGN-KEY-HIDDEN
  DATA-RELATION relation2 FOR ttTmpKompl,ttTmpDiagnosKod
    RELATION-FIELDS (NyckelId,NyckelId) NESTED FOREIGN-KEY-HIDDEN
  DATA-RELATION relation3 FOR ttTmpKompl,ttTmpYrke
    RELATION-FIELDS (NyckelId,NyckelId) NESTED FOREIGN-KEY-HIDDEN  
  DATA-RELATION relation3 FOR ttTmpKompl,ttTmpFullmakt
    RELATION-FIELDS (NyckelId,NyckelId) NESTED FOREIGN-KEY-HIDDEN           
    DATA-RELATION relation4 FOR ttTmpKompl,ttTmpDelaegare
    RELATION-FIELDS (NyckelId,NyckelId) NESTED FOREIGN-KEY-HIDDEN
    DATA-RELATION relation5 FOR ttTmpKompl,ttTmpSexMaanader
    RELATION-FIELDS (NyckelId,NyckelId) NESTED FOREIGN-KEY-HIDDEN 
    DATA-RELATION relation6 FOR ttTmpKompl,ttTmpFlerArbGiv
    RELATION-FIELDS (NyckelId,NyckelId) NESTED FOREIGN-KEY-HIDDEN 
    DATA-RELATION relation7 FOR ttTmpKompl,ttTmpArbSkada
    RELATION-FIELDS (NyckelId,NyckelId) NESTED FOREIGN-KEY-HIDDEN 
    DATA-RELATION relation8 FOR ttTmpKompl,ttTmpAarsInkomst
    RELATION-FIELDS (NyckelId,NyckelId) NESTED FOREIGN-KEY-HIDDEN 
  .

