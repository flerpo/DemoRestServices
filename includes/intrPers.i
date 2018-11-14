
 /*------------------------------------------------------------------------
    File        : Intr
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
  

{includes\intrtabeller\intrtab.i}.
{includes\intrtabeller\intrperstab.i}.
{includes\intrtabeller\intradoptab.i}.
{includes\intrtabeller\intraktivtab.i}.
{includes\intrtabeller\intrpershisttab.i}.
{includes\intrtabeller\intrskatttab.i}.
{includes\intrtabeller\intrtillhtab.i}.


DEFINE DATASET dsIntrPers SERIALIZE-NAME 'StakeholderDetails'
    FOR ttIntr, ttIntrPers,  ttIntrAdop, ttIntrAktiv,  ttIntrPersHist, ttIntrSkatt, ttIntrTillh.

    
DEFINE DATA-SOURCE srcIntr                      FOR intr.
    DEFINE DATA-SOURCE srcIntrPers                  FOR intrPers.
    
    DEFINE DATA-SOURCE srcIntrAdop                  FOR intrAdop .
    DEFINE DATA-SOURCE srcIntrAktiv                 FOR intrAktiv .
    DEFINE DATA-SOURCE srcIntrPersHist              FOR intrPersHist  .
    DEFINE DATA-SOURCE srcIntrSkatt                 FOR intrSkatt  .
    DEFINE DATA-SOURCE srcIntrTillh                 FOR intrTillh  .

    BUFFER ttIntr:ATTACH-DATA-SOURCE(DATA-SOURCE srcIntr:HANDLE,?,?).
    BUFFER ttIntrPers:ATTACH-DATA-SOURCE(DATA-SOURCE srcIntrPers:HANDLE,?,?).
    BUFFER ttIntrAdop:ATTACH-DATA-SOURCE(DATA-SOURCE srcIntrAdop:HANDLE,?,?).
    BUFFER ttIntrAktiv:ATTACH-DATA-SOURCE(DATA-SOURCE srcIntrAktiv:HANDLE,?,?).
    BUFFER ttIntrPersHist:ATTACH-DATA-SOURCE(DATA-SOURCE srcIntrPersHist:HANDLE,?,?).
    BUFFER ttIntrSkatt:ATTACH-DATA-SOURCE(DATA-SOURCE srcIntrSkatt:HANDLE,?,?).
    BUFFER ttIntrTillh:ATTACH-DATA-SOURCE(DATA-SOURCE srcIntrTillh:HANDLE,?,?).
