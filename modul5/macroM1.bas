REM  *****  BASIC  *****
Dim oDialog1 as Object
Dim oFullFactures as Object

Sub StartDialog1()
    BasicLibraries.LoadLibrary("Tools")
    oDialog1 = LoadDialog("Standard", "Dialog1")
    oDialog1.Execute()
End Sub

REM Definim un procediment
Sub InsertaText(fila as Integer, columna as Integer, texto as String)
	
    oFullFactures.getCellByPosition(fila,columna).setString(texto)

End Sub

Sub InsertaValor(fila as Integer, columna as Integer, valor as Integer)
	
    oFullFactures.getCellByPosition(fila,columna).setValue(valor)

End Sub

Sub readDialog1()
    Dim cell_val
    oT1 = oDialog1.GetControl("TextField1").Text
    oT2 = oDialog1.GetControl("TextField2").Text
    oT3 = oDialog1.GetControl("TextField3").Text
    oT4 = oDialog1.GetControl("NumericField1").getValue()
    
    oFulles = ThisComponent.getSheets()    
    oFullFactures = oFulles.getByName("Factures")
    oFullFactures.getRows().insertByIndex(4,1)
    InsertaText(1,4, oT1)
    InsertaText(2,4,oT2)
    InsertaText(3,4,oT3)
    InsertaValor(4,4,oT4)
    
    MsgBox("Dades Introduïdes")
    
    REM MsgBox("Dades introduïdes")
    REM Introdueix baix de la línia 4, 1 fila.
REM    oFullFactures.getRows().insertByIndex(4,1)
REM    oFullFactures.getCellByPosition(0,0).setString("Hola que tal")
    
REM    cell_val = ThisComponent.Sheets(0).getCellByPosition(0,0)
REM    msgbox cell_val.String & chr(13) & "Value from controls: "  & oT1.Text
End Sub



Sub Main


End Sub

Sub Macro1

End Sub
