#tag Module
Protected Module Xtend_WebListbox
	#tag CompatibilityFlags = (TargetWeb and (Target32Bit or Target64Bit))
	#tag Method, Flags = &h0, CompatibilityFlags = API2Only and ( (TargetWeb and (Target32Bit or Target64Bit)) )
		Function Find(Extends control As WebListBox, SearchFor As String, InColumn As Integer, SearchType As SearchTypes = SearchTypes.Exact) As Integer
		  // Searches and selects the listbox row with given column that contains the SearchFor String
		  // Returns the row number with the first match.
		  Var currentString As String
		  
		  For rowIndex As Integer = 0 To control.LastIndex
		    
		    currentString = control.Cell(rowIndex, InColumn)
		    
		    Select Case SearchType
		    Case SearchTypes.BeginsWith
		      // The cell's string begins with SeachFor
		      
		      If currentString.BeginsWith(SearchFor) Then
		        control.ListIndex = rowIndex
		        Exit For
		      End If
		      
		    Case SearchTypes.EndsWith
		      // The cell's string ends with SearchFor
		      
		      If currentString.BeginsWith(SearchFor) Then
		        control.ListIndex = rowIndex
		        Exit For
		      End If
		      
		    Case SearchTypes.Contains
		      // The cell's string contains SearchFor
		      
		      If currentString.IndexOf(SearchFor) <> -1 Then
		        control.ListIndex = rowIndex
		        Exit For
		      End If
		      
		    Else
		      // Default is the EXACT string match
		      If currentString = SearchFor Then
		        control.ListIndex = rowIndex
		        Exit For
		      End If
		      
		    End Select
		    
		  Next
		  
		  Return -1 // Not found
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
