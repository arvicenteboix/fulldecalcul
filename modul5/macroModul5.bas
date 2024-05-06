REM  *****  BASIC  *****

Sub Main

oFull = ThisComponent.CurrentController.ActiveSheet
oCell = oFull.getCellByPosition(0,0)

MsgBox("Hola "+oCell.getString())

End Sub
