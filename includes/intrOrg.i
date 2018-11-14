
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
  

{includes\intrtab.i}.
{includes\intrabfarbgivintrhisttab.i}.
{includes\introrgtab.i}.


DEFINE DATASET dsIntrOrg SERIALIZE-NAME 'StakeholderDetails'
    FOR ttIntr,  ttIntrAbfArbGivIntrHist,   ttIntrOrg.

    
DEFINE DATA-SOURCE srcIntr                      FOR intr.

    DEFINE DATA-SOURCE srcIntrAbfArbGivIntrHist     FOR intrAbfArbGivIntrHist.
    DEFINE DATA-SOURCE srcIntrOrg                   FOR intrOrg .

    BUFFER ttIntr:ATTACH-DATA-SOURCE(DATA-SOURCE srcIntr:HANDLE,?,?).
    BUFFER ttIntrAbfArbGivIntrHist:ATTACH-DATA-SOURCE(DATA-SOURCE srcIntrAbfArbGivIntrHist:HANDLE,?,?).
    BUFFER ttIntrOrg:ATTACH-DATA-SOURCE(DATA-SOURCE srcIntrOrg:HANDLE,?,?).

