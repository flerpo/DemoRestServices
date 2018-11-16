/* hs/pub/hsPubLaesAGSAerendeKomplDetaljLista002DsUt.i */
/* 2016-08-23 EARA02 - A2016-08506 Digital komplettering - Läs detaljlista 002
                                    Uppdaterad med fler signaler */
   
   
DEFINE TEMP-TABLE ttLista NO-UNDO SERIALIZE-NAME 'CaseAdditions':U 
    FIELD NyckelId  AS CHARACTER INIT '1' 
    FIELD AerendeId AS DECIMAL 
    INDEX NyckelId IS PRIMARY UNIQUE NyckelId
    .

{includes/kompl.i }.
{includes/komplDiagnosKod.i  }.
{includes/komplYrke.i  }.
{includes/komplFullmakt.i  }.
{includes/komplSexMaanader.i }.
{includes/komplDelaegare.i  }.
{includes/komplFlerArbGiv.i }.
{includes/komplArbSkada.i }.
{includes/komplAarsInkomst.i }.
 
 

DEFINE DATASET dsUt  SERIALIZE-NAME 'CaseAdditionList':U
    {&REFERENCE-ONLY}
    FOR ttLista,ttTmpKompl,ttTmpDiagnosKod,ttTmpYrke,ttTmpFullmakt
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

