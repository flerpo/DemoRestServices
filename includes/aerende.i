
/*------------------------------------------------------------------------
   File        : aerendeeng
   Purpose		:
   Syntax      : 
   Description :
   Author(s)   : eara02
   Created     : Wed Oct 10 19:29:44 CEST 2018
   Notes       : 
 ----------------------------------------------------------------------*/
  
/* ***************************  Definitions  ************************** */
  
/* ********************  Preprocessor Definitions  ******************** */
  
/* ***************************  Main Block  *************************** */
  
/** Dynamically generated schema file **/
   
	
{includes/aerendetab.i}.
{includes/aerendeengtab.i}.
{includes/aerendeagstab.i}.

DEFINE TEMP-TABLE ttAerendeTFA LIKE aerendeTfa.
DEFINE TEMP-TABLE ttAerendeEngAktiv LIKE aerendeEngAktiv.
DEFINE TEMP-TABLE ttAerendeSags LIKE aerendeSags.

DEFINE DATASET dsAerende SERIALIZE-NAME 'ClaimDetails' 
FOR ttAerende, ttAerendeEng, ttAerendeAgs, ttAerendeTFA, ttAerendeEngAktiv, ttAerendeSags.

DEFINE DATA-SOURCE srcAerendeEng              FOR aerendeEng.
DEFINE DATA-SOURCE srcAerende                 FOR aerende.
DEFINE DATA-SOURCE srcAerendeAgs                 FOR aerendeAgs.
DEFINE DATA-SOURCE srcAerendeTfa                 FOR aerendeTfa.
DEFINE DATA-SOURCE srcAerendeSags                 FOR aerendeSags.
DEFINE DATA-SOURCE srcAerendeEngAktiv                 FOR aerendeEngAktiv.
    
BUFFER ttAerendeEng:ATTACH-DATA-SOURCE(DATA-SOURCE srcAerendeEng:HANDLE,?,?).
BUFFER ttAerende:ATTACH-DATA-SOURCE(DATA-SOURCE srcAerende:HANDLE,?,?).
BUFFER ttAerendeAgs:ATTACH-DATA-SOURCE(DATA-SOURCE srcAerendeAgs:HANDLE,?,?).
BUFFER ttAerendeTfa:ATTACH-DATA-SOURCE(DATA-SOURCE srcAerendeTfa:HANDLE,?,?).
BUFFER ttAerendeSags:ATTACH-DATA-SOURCE(DATA-SOURCE srcAerendeSags:HANDLE,?,?).
BUFFER ttAerendeEngAktiv:ATTACH-DATA-SOURCE(DATA-SOURCE srcAerendeEngAktiv:HANDLE,?,?).
