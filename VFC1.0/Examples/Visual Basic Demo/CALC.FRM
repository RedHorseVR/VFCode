VERSION 2.00
Begin Form Calculator 
   BorderStyle     =   3  'Fixed Double
   Caption         =   "Calculator"
   ClientHeight    =   3960
   ClientLeft      =   1830
   ClientTop       =   2025
   ClientWidth     =   3255
   ClipControls    =   0   'False
   FontBold        =   -1  'True
   FontItalic      =   0   'False
   FontName        =   "System"
   FontSize        =   9.75
   FontStrikethru  =   0   'False
   FontUnderline   =   0   'False
   Height          =   4365
   Left            =   1770
   LinkMode        =   1  'Source
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   3960
   ScaleWidth      =   3255
   Top             =   1680
   Width           =   3375
   Begin PictureBox Gadget 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      FillStyle       =   3  'Vertical Line
      Height          =   3975
      Left            =   0
      ScaleHeight     =   3975
      ScaleWidth      =   3255
      TabIndex        =   1
      Top             =   0
      Width           =   3255
      Begin CommandButton Number 
         Caption         =   "7"
         FontBold        =   -1  'True
         FontItalic      =   0   'False
         FontName        =   "System"
         FontSize        =   9.75
         FontStrikethru  =   0   'False
         FontUnderline   =   0   'False
         Height          =   480
         Index           =   7
         Left            =   120
         TabIndex        =   24
         Top             =   960
         Width           =   480
      End
      Begin CommandButton Number 
         Caption         =   "8"
         FontBold        =   -1  'True
         FontItalic      =   0   'False
         FontName        =   "System"
         FontSize        =   9.75
         FontStrikethru  =   0   'False
         FontUnderline   =   0   'False
         Height          =   480
         Index           =   8
         Left            =   720
         TabIndex        =   23
         Top             =   960
         Width           =   480
      End
      Begin CommandButton Number 
         Caption         =   "9"
         FontBold        =   -1  'True
         FontItalic      =   0   'False
         FontName        =   "System"
         FontSize        =   9.75
         FontStrikethru  =   0   'False
         FontUnderline   =   0   'False
         Height          =   480
         Index           =   9
         Left            =   1320
         TabIndex        =   22
         Top             =   960
         Width           =   480
      End
      Begin CommandButton Cancel 
         Caption         =   "C"
         FontBold        =   -1  'True
         FontItalic      =   0   'False
         FontName        =   "System"
         FontSize        =   9.75
         FontStrikethru  =   0   'False
         FontUnderline   =   0   'False
         Height          =   480
         Left            =   2040
         TabIndex        =   21
         Top             =   960
         Width           =   480
      End
      Begin CommandButton CancelEntry 
         Caption         =   "CE"
         FontBold        =   -1  'True
         FontItalic      =   0   'False
         FontName        =   "System"
         FontSize        =   9.75
         FontStrikethru  =   0   'False
         FontUnderline   =   0   'False
         Height          =   480
         Left            =   2640
         TabIndex        =   20
         Top             =   960
         Width           =   480
      End
      Begin CommandButton Number 
         Caption         =   "4"
         FontBold        =   -1  'True
         FontItalic      =   0   'False
         FontName        =   "System"
         FontSize        =   9.75
         FontStrikethru  =   0   'False
         FontUnderline   =   0   'False
         Height          =   480
         Index           =   4
         Left            =   120
         TabIndex        =   19
         Top             =   1560
         Width           =   480
      End
      Begin CommandButton Number 
         Caption         =   "5"
         FontBold        =   -1  'True
         FontItalic      =   0   'False
         FontName        =   "System"
         FontSize        =   9.75
         FontStrikethru  =   0   'False
         FontUnderline   =   0   'False
         Height          =   480
         Index           =   5
         Left            =   720
         TabIndex        =   18
         Top             =   1560
         Width           =   480
      End
      Begin CommandButton Number 
         Caption         =   "6"
         FontBold        =   -1  'True
         FontItalic      =   0   'False
         FontName        =   "System"
         FontSize        =   9.75
         FontStrikethru  =   0   'False
         FontUnderline   =   0   'False
         Height          =   480
         Index           =   6
         Left            =   1320
         TabIndex        =   17
         Top             =   1560
         Width           =   480
      End
      Begin CommandButton Operator 
         Caption         =   "+"
         FontBold        =   -1  'True
         FontItalic      =   0   'False
         FontName        =   "System"
         FontSize        =   9.75
         FontStrikethru  =   0   'False
         FontUnderline   =   0   'False
         Height          =   480
         Index           =   1
         Left            =   2040
         TabIndex        =   16
         Top             =   1560
         Width           =   480
      End
      Begin CommandButton Operator 
         Caption         =   "-"
         FontBold        =   -1  'True
         FontItalic      =   0   'False
         FontName        =   "System"
         FontSize        =   9.75
         FontStrikethru  =   0   'False
         FontUnderline   =   0   'False
         Height          =   480
         Index           =   3
         Left            =   2640
         TabIndex        =   15
         Top             =   1560
         Width           =   480
      End
      Begin CommandButton Number 
         Caption         =   "1"
         FontBold        =   -1  'True
         FontItalic      =   0   'False
         FontName        =   "System"
         FontSize        =   9.75
         FontStrikethru  =   0   'False
         FontUnderline   =   0   'False
         Height          =   480
         Index           =   1
         Left            =   120
         TabIndex        =   14
         Top             =   2160
         Width           =   480
      End
      Begin CommandButton Number 
         Caption         =   "2"
         FontBold        =   -1  'True
         FontItalic      =   0   'False
         FontName        =   "System"
         FontSize        =   9.75
         FontStrikethru  =   0   'False
         FontUnderline   =   0   'False
         Height          =   480
         Index           =   2
         Left            =   720
         TabIndex        =   13
         Top             =   2160
         Width           =   480
      End
      Begin CommandButton Number 
         Caption         =   "3"
         FontBold        =   -1  'True
         FontItalic      =   0   'False
         FontName        =   "System"
         FontSize        =   9.75
         FontStrikethru  =   0   'False
         FontUnderline   =   0   'False
         Height          =   480
         Index           =   3
         Left            =   1320
         TabIndex        =   12
         Top             =   2160
         Width           =   480
      End
      Begin CommandButton Operator 
         Caption         =   "X"
         FontBold        =   -1  'True
         FontItalic      =   0   'False
         FontName        =   "System"
         FontSize        =   9.75
         FontStrikethru  =   0   'False
         FontUnderline   =   0   'False
         Height          =   480
         Index           =   2
         Left            =   2040
         TabIndex        =   11
         Top             =   2160
         Width           =   480
      End
      Begin CommandButton Operator 
         Caption         =   "/"
         FontBold        =   -1  'True
         FontItalic      =   0   'False
         FontName        =   "System"
         FontSize        =   9.75
         FontStrikethru  =   0   'False
         FontUnderline   =   0   'False
         Height          =   480
         Index           =   0
         Left            =   2640
         TabIndex        =   10
         Top             =   2160
         Width           =   480
      End
      Begin CommandButton Number 
         Caption         =   "0"
         FontBold        =   -1  'True
         FontItalic      =   0   'False
         FontName        =   "System"
         FontSize        =   9.75
         FontStrikethru  =   0   'False
         FontUnderline   =   0   'False
         Height          =   480
         Index           =   0
         Left            =   120
         TabIndex        =   9
         Top             =   2760
         Width           =   1080
      End
      Begin CommandButton Decimal 
         Caption         =   "."
         FontBold        =   -1  'True
         FontItalic      =   0   'False
         FontName        =   "System"
         FontSize        =   9.75
         FontStrikethru  =   0   'False
         FontUnderline   =   0   'False
         Height          =   480
         Left            =   1320
         TabIndex        =   8
         Top             =   2760
         Width           =   480
      End
      Begin CommandButton Operator 
         Caption         =   "="
         FontBold        =   -1  'True
         FontItalic      =   0   'False
         FontName        =   "System"
         FontSize        =   9.75
         FontStrikethru  =   0   'False
         FontUnderline   =   0   'False
         Height          =   480
         Index           =   4
         Left            =   2040
         TabIndex        =   7
         Top             =   2760
         Width           =   480
      End
      Begin CommandButton Percent 
         Caption         =   "%"
         FontBold        =   -1  'True
         FontItalic      =   0   'False
         FontName        =   "System"
         FontSize        =   9.75
         FontStrikethru  =   0   'False
         FontUnderline   =   0   'False
         Height          =   480
         Left            =   2640
         TabIndex        =   6
         Top             =   2760
         Width           =   480
      End
      Begin PictureBox Command3D1 
         BackColor       =   &H00404040&
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         ScaleHeight     =   345
         ScaleWidth      =   465
         TabIndex        =   5
         Top             =   480
         Width           =   495
      End
      Begin PictureBox Panel3D1 
         BackColor       =   &H00C0C0C0&
         Height          =   285
         Left            =   120
         ScaleHeight     =   255
         ScaleWidth      =   3000
         TabIndex        =   3
         Top             =   90
         Width           =   3030
         Begin PictureBox Picture1 
            BackColor       =   &H00C0C0C0&
            BorderStyle     =   0  'None
            Height          =   255
            Left            =   0
            ScaleHeight     =   255
            ScaleWidth      =   3000
            TabIndex        =   4
            Top             =   15
            Width           =   3000
         End
      End
      Begin CommandButton Command1 
         Caption         =   "Insecta Calc"
         Height          =   375
         Left            =   840
         TabIndex        =   2
         Top             =   3480
         Width           =   1455
      End
      Begin Label Readout 
         Alignment       =   1  'Right Justify
         BackColor       =   &H0000FFFF&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "0."
         FontBold        =   -1  'True
         FontItalic      =   0   'False
         FontName        =   "MS Sans Serif"
         FontSize        =   12
         FontStrikethru  =   0   'False
         FontUnderline   =   0   'False
         ForeColor       =   &H00000000&
         Height          =   375
         Left            =   840
         TabIndex        =   0
         Top             =   480
         Width           =   2280
      End
   End
End

' ------------------------------------------------------------------------
' You have a royalty-free right to use, modify, reproduce and distribute
' the Sample Application Files (and/or any modified version) in any way
' you find useful, provided that you agree that US&R has no warranty,
' obligations or liability for any Sample Application Files.
' ------------------------------------------------------------------------
Option Explicit
Dim Op1, Op2                ' Previously input operand.
Dim DecimalFlag As Integer  ' Decimal point present yet?
Dim NumOps As Integer       ' Number of operands.
Dim LastInput               ' Indicate type of last keypress.
Dim OpFlag                  ' Indicate pending operation.
Dim TempReadout

' Click event procedure for CE (cancel entry) key.
'

' Click event procedure for C (cancel) key.
' Reset the display and initializes variables.
'
Sub Cancel_Click ()
    ReadOut = "0."
    Op1 = 0
    Op2 = 0
    Form_Load
End Sub

Sub CancelEntry_Click ()
    Call InsectaCancelEntry_Click(Calculator, LastInput, DecimalFlag)
End Sub

Sub Command1_Click ()

    Call InsectaCustom_Click(Form1, LastInput, DecimalFlag)

End Sub

Sub Command3D1_Click ()
    Unload Calculator
End Sub

' Click event procedure for decimal point (.) key.
' If last keypress was an operator, initialize
' readout to "0." Otherwise, append a decimal
' point to the display.
'
Sub Decimal_Click ()
    If LastInput = "NEG" Then
	ReadOut = "-0."
    ElseIf LastInput <> "NUMS" Then
	ReadOut = "0."
    End If
    DecimalFlag = True
    LastInput = "NUMS"
End Sub

' Initialization routine for the form.
' Set all variables to initial values.
'
Sub Form_Load ()
End Sub

Sub Form_Unload (Cancel As Integer)
    Dim res As Integer
End Sub

' Click event procedure for number keys (0-9).
' Appends new number to the number in the display.
'
Sub Number_Click (Index As Integer)
    If LastInput <> "NUMS" Then
	ReadOut = "."
	DecimalFlag = False
    End If
    If DecimalFlag Then
	ReadOut = ReadOut + Number(Index).Caption
    Else
	ReadOut = Left(ReadOut, InStr(ReadOut, ".") - 1) + Number(Index).Caption + "."
    End If
    If LastInput = "NEG" Then ReadOut = "-" & ReadOut
    LastInput = "NUMS"
End Sub

' Click event procedure for operator keys (+, -, x, /, =).
' If the immediately preceeding keypress was part of a
' number, increment NumOps. If one operand is present,
' set Op1. If two are present, set Op1 equal to the
' result of the operation on Op1 and the current
' input string, and display the result.
'
Sub Operator_Click (Index As Integer)
    TempReadout = ReadOut
    If LastInput = "NUMS" Then
	NumOps = NumOps + 1
    End If
    Select Case NumOps
	Case 0
	If Operator(Index).Caption = "-" And LastInput <> "NEG" Then
	    ReadOut = "-" & ReadOut
	    LastInput = "NEG"
	End If
	Case 1
	Op1 = ReadOut
	If Operator(Index).Caption = "-" And LastInput <> "NUMS" And OpFlag <> "=" Then
	    ReadOut = "-"
	    LastInput = "NEG"
	End If
	Case 2
	Op2 = TempReadout
	Select Case OpFlag
	    Case "+"
		Op1 = Val(Op1) + Val(Op2)
	    Case "-"
		Op1 = Op1 - Op2
	    Case "X"
		Op1 = Op1 * Op2
	    Case "/"
		If Op2 = 0 Then
		   MsgBox "Can't divide by zero", 48, "Calculator"
		Else
		   Op1 = Op1 / Op2
		End If
	    Case "="
		Op1 = Op2
	    Case "%"
		Op1 = Op1 * Op2
	    End Select
	ReadOut = Op1
	NumOps = 1
    End Select
    If LastInput <> "NEG" Then
	LastInput = "OPS"
	OpFlag = Operator(Index).Caption
    End If
End Sub

' Click event procedure for percent key (%).
' Compute and display a percentage of the first operand.
'
Sub Percent_Click ()
    ReadOut = ReadOut / 100
    LastInput = "Ops"
    OpFlag = "%"
    NumOps = NumOps + 1
    DecimalFlag = True
End Sub

