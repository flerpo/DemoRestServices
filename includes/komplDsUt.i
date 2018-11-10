/* hs/pub/hsPubLaesAGSAerendeKomplDetaljLista002DsUt.i */
/* 2016-08-23 EARA02 - A2016-08506 Digital komplettering - Läs detaljlista 002
                                    Uppdaterad med fler signaler */
   
   
DEFINE TEMP-TABLE ttLista NO-UNDO SERIALIZE-NAME 'CaseAdditions':U 
    FIELD NyckelId  AS CHARACTER INIT '1' 
    FIELD AerendeId AS DECIMAL 
    INDEX NyckelId IS PRIMARY UNIQUE NyckelId
    .

{kompl.i }.
{komplDiagnosKod.i  }.
{komplYrke.i  }.
{komplFullmakt.i  }.
{komplSexMaanader.i }.
{komplDelaegare.i  }.
{komplFlerArbGiv.i }.
{komplArbSkada.i }.
{komplAarsInkomst.i }.
 
 

DEFINE DATASET dsUt  SERIALIZE-NAME 'CaseAdditionList':U
    {&REFERENCE-ONLY}
    FOR ttLista,ttTmpKompl,ttTmpDiagnosKod,ttTmpYrke,ttTmpFullmakttt
    ,ttTmpDelaegare,ttTmpSexMaanader,ttTmpFlerArbGiv,ttTmpArbSkada,ttTmpAarsInkomst
    DATA-RELATION relation1 FOR ttLista,ttTmpKompl
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

