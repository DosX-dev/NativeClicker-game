VERSION 5.00
Begin VB.Form Main 
   Appearance      =   0  'Плоска
   BackColor       =   &H80000005&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Native Clicker"
   ClientHeight    =   2190
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   3690
   BeginProperty Font 
      Name            =   "Calibri"
      Size            =   9.75
      Charset         =   204
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "main.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   2190
   ScaleWidth      =   3690
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton Command3 
      BackColor       =   &H00C0FFFF&
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   120
      MaskColor       =   &H00FFFFFF&
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   1320
      Width           =   2055
   End
   Begin VB.CommandButton Command2 
      BackColor       =   &H00C0E0FF&
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   120
      MaskColor       =   &H00FFFFFF&
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   720
      Width           =   2055
   End
   Begin VB.Timer Timer1 
      Interval        =   10
      Left            =   0
      Top             =   0
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Плоска
      BackColor       =   &H00FFFFFF&
      Default         =   -1  'True
      DownPicture     =   "main.frx":10CA
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   20.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   2280
      MaskColor       =   &H00FFFFFF&
      Picture         =   "main.frx":190E
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   720
      UseMaskColor    =   -1  'True
      Width           =   1335
   End
   Begin VB.Line Line1 
      BorderColor     =   &H8000000B&
      BorderWidth     =   2
      X1              =   15
      X2              =   3840
      Y1              =   375
      Y2              =   375
   End
   Begin VB.Label GitHubLnk 
      Alignment       =   2  'Центровка
      Appearance      =   0  'Плоска
      BackColor       =   &H80000005&
      BackStyle       =   0  'Прозрачно
      Caption         =   "https://github.com/DosX-dev/NativeClicker-game"
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   210
      Left            =   135
      MousePointer    =   1  'Указатель
      TabIndex        =   6
      Top             =   1965
      Width           =   3495
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Центровка
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Прозрачно
      Caption         =   "HACKER MODE"
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   9.75
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   2280
      MousePointer    =   12  'Запрет
      TabIndex        =   5
      Top             =   480
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Центровка
      Appearance      =   0  'Плоска
      BackColor       =   &H80000005&
      BackStyle       =   0  'Прозрачно
      Caption         =   "Upgrade menu:"
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   12
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404040&
      Height          =   300
      Left            =   120
      TabIndex        =   0
      Top             =   420
      Width           =   2010
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Центровка
      Appearance      =   0  'Плоска
      BackColor       =   &H80000005&
      BackStyle       =   0  'Прозрачно
      Caption         =   "Score: 0"
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   15.75
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   345
      Left            =   105
      TabIndex        =   2
      Top             =   -45
      Width           =   3555
   End
End
Attribute VB_Name = "Main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim balance, upgrade_lvl, upgrade_costs, upgrade_click_costs, addnum, tmp

Private Sub Command1_Click()
    balance = balance + addnum
    UpdateClicks
End Sub

Private Sub Command2_Click()
    balance = balance - upgrade_costs
    upgrade_lvl = upgrade_lvl + 1
    upgrade_costs = Int(upgrade_costs * 1.1)
    Command2.Caption = "AFK Farm (x" & upgrade_lvl & ")" & vbCrLf & "(Costs: " & upgrade_costs & ", +1/sec)"
    UpdateClicks
End Sub

Private Sub Command3_Click()
    balance = balance - upgrade_click_costs
    addnum = addnum + 1
    upgrade_click_costs = Int(upgrade_click_costs * 1.5)
    Command3.Caption = "Clicks+ (x" & (addnum - 1) & ")" & vbCrLf & "(Costs: " & upgrade_click_costs & ", +1/clck)"
    UpdateClicks
End Sub

Private Sub Form_Load()
    addnum = 1
    balance = 0
    upgrade_costs = 250
    upgrade_click_costs = 500
    Command2.Caption = "AFK Farm (Not purchased)" & vbCrLf & "(Costs: 250, +1/sec)"
    Command3.Caption = "Clicks+ (Not purchased)" & vbCrLf & "(Costs: " & upgrade_click_costs & ", +1/clck)"
End Sub

Private Sub GitHubLnk_Click()
    CreateObject("Wscript.Shell").Run GitHubLnk.Caption
End Sub

Private Sub Label1_Click()
    Label3.Visible = True
End Sub

Private Sub Label3_Click()
    Dim Confirm
    Confirm = MsgBox("Do YoU wANt tO HaCK ThIS GaME?? X_X", 20, "&!@$^*%#*&^$@!!@(*%&#^@$&*#(*$&*!^*#(*@!@")
    If Confirm = 6 Then
        addnum = 999999
        balance = 999999999999#
        upgrade_lvl = 999
        upgrade_click_lvl = 999
        Label3.Caption = "Hacked >:D"
        Label3.Visible = True
    End If
End Sub

Private Sub Timer1_Timer()
    tmp = tmp + 1
    If tmp = 100 Then
        balance = balance + upgrade_lvl
        If Label3.Caption = "HACKER MODE" Then
            Label3.Visible = False
        Else
            upgrade_costs = 0
            upgrade_click_costs = 0
        End If
        tmp = 0
    End If
    If balance < upgrade_costs Then
        Command2.Enabled = False
    Else
        Command2.Enabled = True
    End If
    If balance < upgrade_click_costs Then
        Command3.Enabled = False
    Else
        Command3.Enabled = True
    End If
    UpdateClicks
End Sub

Sub UpdateClicks()
    Label1.Caption = "Score: " & balance
End Sub
