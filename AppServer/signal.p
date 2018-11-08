
/*------------------------------------------------------------------------
    File        : intr.p
    Purpose     : 

    Syntax      :

    Description : massa saker med intressent

    Author(s)   : eara02
    Created     : Wed Oct 10 19:28:35 CEST 2018
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

USING Progress.Json.ObjectModel.JsonObject FROM PROPATH.

/* ********************  Preprocessor Definitions  ******************** */

{includes/hsPubLaesAGSAerendeKomplDetaljLista002DsUt.i } 
/* ***************************  Main Block  *************************** */
{signal.i}


/* **********************  Internal Procedures  *********************** */

PROCEDURE get_signals_on_aerendeid:
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    DEFINE INPUT PARAMETER pAerendeId AS DECIMAL.
    DEFINE OUTPUT PARAMETER oSvar AS JsonObject.
    DEFINE VARIABLE iRaeknare AS INTEGER NO-UNDO.
    
    ETIME(YES).
    
    FOR EACH signalkoppl NO-LOCK WHERE signalkoppl.AerendeId = pAerendeId,
        FIRST signal NO-LOCK WHERE signal.SignalId = signalKoppl.SignalId:
        ASSIGN 
            iRaeknare = iRaeknare + 1.
        CREATE ttSignal.
        BUFFER-COPY signal TO ttSignal.
    END. 

    oSvar = NEW JsonObject().
    
    TEMP-TABLE ttSignal:WRITE-JSON ("JsonObject",oSvar, TRUE).
    oSvar:Add('antal', STRING(iRaeknare)).
    oSvar:Add('anropstid', STRING(ETIME) + 'ms').
    
END PROCEDURE.


PROCEDURE get_kompl_on_aerendeid:
    DEFINE INPUT PARAMETER pdeAerendeId AS DECIMAL.
    DEFINE OUTPUT PARAMETER oSvar AS JsonObject.
    DEFINE VARIABLE iRaeknare AS INTEGER NO-UNDO.
    

    
    DO :
        ETIME(YES).
   
        DEFINE VARIABLE deIntrId     AS DECIMAL NO-UNDO. /* Id på arbetsgivaren */
        DEFINE VARIABLE daAerendeDat AS DATE    NO-UNDO.
        /* Inget NO-ERROR, skall bli systemfel om vi inte hittar någon post här */
  
        haemta:
        FOR EACH signalkoppl NO-LOCK WHERE signalkoppl.aerendeid = pdeAerendeId   
            ,FIRST signal NO-LOCK WHERE signal.signalid = signalkoppl.signalid 
            .
       ASSIGN 
            iRaeknare = iRaeknare + 1.
       
   
            /*--- För att visa ett fint datum för kunden måste vi hitta ett datum att visa
                  Finns ärendedatum tar vi det annars får det bli det angivna datumet som får gälla. ---*/ 
            CASE signal.signaltypavk:
                WHEN "LiKL90SAKN":U THEN 
                    DO: /* Ange diagnoskod vid 90 dagen i KL ärende */
                        CREATE ttTmpDiagnosKod.
                        ASSIGN 
                            ttTmpDiagnosKod.GaellerDatum = daAerendeDat + 89
                            ttTmpDiagnosKod.SignalId     = signal.signalid.
                    END.
                WHEN "Li90SAKN":U THEN 
                    DO: /* Ange diagnoskod vid 90 dagen */
                        CREATE ttTmpDiagnosKod.
                        ASSIGN 
                            ttTmpDiagnosKod.GaellerDatum = daAerendeDat + 89
                            ttTmpDiagnosKod.SignalId     = signal.signalid.
                    END.
                WHEN "FORSTLISAKN":U THEN 
                    DO: /*  Ange diagnoskod vid skadedatum */
                        CREATE ttTmpDiagnosKod.
                        ASSIGN 
                            ttTmpDiagnosKod.GaellerDatum = daAerendeDat 
                            ttTmpDiagnosKod.SignalId     = signal.signalid.
                    END.        
                WHEN "ANGEYRKE":U THEN 
                    DO: /*  Ange Yrke */
          
                        /*          ASSIGN deIntrId = kontrolleraFlerArb(aerende.aerendeId).            */
                        /*                                                                              */
                        /*          FIND FIRST introrg NO-LOCK WHERE intrOrg.IntrId = deIntrId NO-ERROR.*/
          
                        CREATE ttTmpYrke.
                        ASSIGN 
                            ttTmpYrke.GaellerAnstNamn = IF (AVAIL introrg AND intrOrg.Namn <> '') THEN intrOrg.Namn ELSE ''
                 ttTmpYrke.GaellerAnstOrgNr = IF (AVAIL introrg AND intrOrg.OrgNr <> '') THEN intrOrg.OrgNr ELSE ''
                 ttTmpYrke.SignalId    = signal.signalid.
                    END.
                /*--- Fullmakt ---*/ 
                WHEN "SÖKFULLM":U THEN 
                    DO:
                        CREATE ttTmpFullmakt.
                        ASSIGN 
                            ttTmpFullmakt.SignalId = signal.signalid.
                    END.
                /*--- Anmält som Arbetsskada ---*/ 
                WHEN "ANGESJUKFK":U THEN 
                    DO:
                        CREATE ttTmpArbSkada.
                        ASSIGN 
                            ttTmpArbSkada.SignalId = signal.signalid.
                    END.
                /*--- Fler arbetsgivare ---*/ 
                WHEN "ANGEFLERARB":U THEN 
                    DO:
                        CREATE ttTmpFlerArbGiv.
                        ASSIGN 
                            ttTmpFlerArbGiv.SignalId = signal.signalid.
                    END.
                /*--- Delägare ---*/ 
                WHEN "ANGEDELAEGARE":U THEN 
                    DO:
                        /*                                                                              */
                        /*          ASSIGN deIntrId = kontrolleraFlerArb(aerende.aerendeId).            */
                        /*                                                                              */
                        /*          FIND FIRST introrg NO-LOCK WHERE intrOrg.IntrId = deIntrId NO-ERROR.*/
          
                        CREATE ttTmpDelaegare.
                        ASSIGN 
                            ttTmpDelaegare.GaellerAnstNamn = IF (AVAIL introrg AND intrOrg.Namn <> '') THEN intrOrg.Namn ELSE ''
                 ttTmpDelaegare.GaellerAnstOrgNr = IF (AVAIL introrg AND intrOrg.OrgNr <> '') THEN intrOrg.OrgNr ELSE ''
                 ttTmpDelaegare.SignalId    = signal.signalid.
                    END.
                /*--- 6-månader ---*/ 
                WHEN "ANGEANNANFRAANV":U THEN 
                    DO:
          
                        /*          ASSIGN deIntrId = kontrolleraFlerArb(aerende.aerendeId).            */
                        /*                                                                              */
                        /*          FIND FIRST introrg NO-LOCK WHERE intrOrg.IntrId = deIntrId NO-ERROR.*/
          
                        CREATE ttTmpSexMaanader.
                        ASSIGN 
                            ttTmpSexMaanader.GaellerAnstNamn = IF (AVAIL introrg AND intrOrg.Namn <> '') THEN intrOrg.Namn ELSE ''
                 ttTmpSexMaanader.GaellerAnstOrgNr = IF (AVAIL introrg AND intrOrg.OrgNr <> '') THEN intrOrg.OrgNr ELSE ''
                 ttTmpSexMaanader.SignalId    = signal.signalid.
                    END.
                /*--- Årsinkomst ---*/ 
                WHEN "ANGEAARSINKOMSTK":U THEN 
                    DO:
          
                        /*          ASSIGN deIntrId = kontrolleraFlerArb(aerende.aerendeId).            */
                        /*                                                                              */
                        /*          FIND FIRST introrg NO-LOCK WHERE intrOrg.IntrId = deIntrId NO-ERROR.*/
          
                        CREATE ttTmpAarsInkomst.
                        ASSIGN 
                            ttTmpAarsInkomst.GaellerAnstNamn = IF (AVAIL introrg AND intrOrg.Namn <> '') THEN intrOrg.Namn ELSE ''
                 ttTmpAarsInkomst.GaellerAnstOrgNr = IF (AVAIL introrg AND intrOrg.OrgNr <> '') THEN intrOrg.OrgNr ELSE ''
                 ttTmpAarsInkomst.SignalId    = signal.signalid.
                    END.
                OTHERWISE 
                DO: /* */
                    NEXT haemta.
                END.
            END CASE.
      
            FIND FIRST ttTmpAerendeKomplLista NO-LOCK WHERE ttTmpAerendeKomplLista.AerendeId = pdeAerendeid NO-ERROR.
            IF AVAIL ttTmpAerendeKomplLista THEN 
            DO:
                NEXT haemta.
            END.
 
            /* Spara undan de aktuella värdena i en temptabell */ 
            CREATE ttTmpAerendeKomplLista. 
            ASSIGN 
                ttTmpAerendeKomplLista.AerendeId = pdeAerendeId
             
                .
            /* Används för att få en fin xml ut */       
            CREATE ttTmpKompl.
          
        END. /* Slut FOR FIRST Aerende .... */
       
        oSvar = NEW JsonObject().
    
        DATASET dsUt:WRITE-JSON ("JsonObject",oSvar, TRUE).
        oSvar:Add('antal', STRING(iRaeknare)).
        oSvar:Add('anropstid', STRING(ETIME) + 'ms').
    
    
        
    END.

END PROCEDURE.






