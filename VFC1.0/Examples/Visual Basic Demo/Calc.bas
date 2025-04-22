'  Exported By Insecta Version 2.0 - April 1996 Beta ;
'  Insecta File: calc.ins;
'  Export  File: Calc.bas;
'  Export  Date: 03:57:22 PM - 23:Apr:2002;

 ' event:1:--------------------------------------------------------------- ;
 ' set:2:  VB Event when CE button is pressed ;
 ' set:3:--------------------------------------------------------------- ;

'-------------------------------------------------;

Sub InsectaCancelEntry_Click (TheForm As Form, LastInput, DecimalFlag)  ' input:4: ;
	TheForm.Readout = "INSECTA" ' generic:5:;
	DecimalFlag = False  ' generic:6: ;
	LastInput = "CE" ' generic:7:;
End Sub  ' end:8:;
 ' set:9:--------------------------------------------------------------- ;
 ' set:10:Custom Event when Custom  button is pressed ;
 ' set:11:--------------------------------------------------------------- ;
Sub InsectaCustom_Click (TheForm As Form, LastInput, DecimalFlag)  ' event:12: ;
TheForm.Visible = TRUE  ' generic:13: ;
End Sub  ' end:14:;

'-------------------------------------------------;

Sub Main ()  ' input:15:      ;
	Load Calculator  ' generic:16:      ;
	Calculator.Show  ' generic:17:      ;
End Sub  ' end:18:end    Sub Main   ;

'-------------------------------------------------;

