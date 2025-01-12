#tag Module
Protected Module Xtend_RowSet
	#tag Method, Flags = &h0
		Function xToDictionaryArray(Extends rows As RowSet) As Dictionary()
		  // Converts the rowset's rows to dictionary key/values
		  
		  Var dicts() As Dictionary
		  Var d As Dictionary
		  
		  If rows.RowCount > 0 Then
		    
		    rows.MoveToFirstRow
		    While Not rows.AfterLastRow
		      
		      d = New Dictionary
		      
		      For i As Integer = 0 To rows.LastColumnIndex
		        
		        d.Value(rows.ColumnAt(i).Name) = rows.ColumnAt(i).Value
		        
		      Next
		      
		      Dicts.Add(d)
		      
		      rows.MoveToNextRow
		    Wend
		    
		  End If
		  
		  Return dicts
		End Function
	#tag EndMethod


End Module
#tag EndModule
