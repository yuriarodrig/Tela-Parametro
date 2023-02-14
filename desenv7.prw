#include "rwmake.ch"

//////////////////////////////////////////////////
// Empresa: Afort                               //
// Desenv.: Yuri                                //
// Data:    14/10/2022                          //
// Objetiv: Tela de alteracao parametros        //
//////////////////////////////////////////////////

*/
User Function desenv7

	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³Captura os parametros.   ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	&& Lancamento Padrao de Receita 620                                      

	ICMPAD		:= GETMV("MV_ICMPAD")  
	ESTICM		:= GETMV("MV_ESTICM")  
	NFEDEST		:= GETMV("MV_NFEDEST")
	BASDUPL		:= GETMV("MV_BASDUPL")
	UFBASDP		:= GETMV("MV_UFBASDP")
	BASDENT		:= GETMV("MV_BASDENT")
	BASDPUF		:= GETMV("MV_BASDPUF")
	RPCBIZF		:= GETMV("MV_RPCBIZF")
	RPCBIUF		:= GETMV("MV_RPCBIUF")
	DESCZF		:= GETMV("MV_DESCZF")
	DESZFPC		:= GETMV("MV_DESZFPC")
	DSZFSOL		:= GETMV("MV_DSZFSOL")
	UFSTZF		:= GETMV("MV_UFSTZF")
	

	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³Monta a janela.³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	@ 010,020 TO 700,1000 DIALOG oDlg TITLE "Tela de Parametros"


	@ 010,010 SAY "MV_ICMPAD"
	@ 019,010 SAY "Valor da Al�quota "
	@ 017,130 GET ICMPAD  Picture "@!"     Size 65,5
	@ 027,010 SAY "Este par�metro deve receber o valor da al�quota da Filial em que est�o sendo feitas as movimenta��es, sejam elas de entrada ou sa�da. "


	@ 045,010 SAY "MV_ESTICM"
	@ 054,010 SAY "Valor  "
	@ 052,130 GET ESTICM  Picture "@!"     Size 100,5
	@ 062,010 SAY "Este par�metro recebe o valor de todas as UFs com suas respectivas al�quotas de ICMS Internas. "


	@ 080,010 SAY "MV_NFEDEST"
	@ 089,010 SAY "Habilitar para .T.  E  Desabilitar para .F."
	@ 087,130 BUTTON "Habilitado" SIZE 30,10 ACTION Habilitar()
	@ 087,170 BUTTON "Desabilitar" SIZE 30,10 ACTION Desabilitar()
	//@ 087,130 BMPBUTTON TYPE 1 ACTION Habilitar()
	@ 097,010 SAY "Quando habilitado considera o Cliente, Cli. Ent.e.  Cli. Ret. utilizados, para compor respectivamente"


	@ 115,010 SAY "MV_BASDUPL"
	@ 124,010 SAY "(Habilitado =.T. Diferente      Desabilitar =.F. Unica)"
	@ 122,130 BUTTON "Habilitado" SIZE 30,10 ACTION Habilitar()
	@ 122,170 BUTTON "Desabilitar" SIZE 30,10 ACTION Desabilitar()
	@ 132,010 SAY "Define no Calculo do Diferencial de Al�quota Base de Calculo Unica ou Utiliza Base do Destinat�rio diferente."
	



	


	@ 250,055 BMPBUTTON TYPE 2 ACTION Close(oDlg)
	@ 250,010 BMPBUTTON TYPE 1 ACTION fFecha()

	ACTIVATE DIALOG oDlg CENTERED

RETURN( NIL )

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Funcao para fechar a Janela. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Static Function fFecha

	PutMv("MV_ICMPAD", ICMPAD) 
	PutMv("MV_ESTICM", ESTICM)
	//PutMv("MV_NFEDEST", NFEDEST)

	Close(oDlg)


Return ( Nil )



//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Fun��o para os button. ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Static Function Habilitar
	PutMv("MV_NFEDEST", .T.)
	PutMv("MV_BASDUPL", .T.)
	Close(oDlg)
Return ( Nil )

Static Function Desabilitar
	PutMv("MV_NFEDEST", .F.)
	PutMv("MV_BASDUPL", .F.)

	Close(oDlg)
Return ( Nil )


