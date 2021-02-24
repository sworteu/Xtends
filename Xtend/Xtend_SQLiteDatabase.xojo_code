#tag Module
Protected Module Xtend_SQLiteDatabase
	#tag CompatibilityFlags = ( TargetConsole and ( Target32Bit or Target64Bit ) ) or ( TargetWeb and ( Target32Bit or Target64Bit ) ) or ( TargetDesktop and ( Target32Bit or Target64Bit ) )
	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub DeleteAllRows(Extends db As SQLiteDatabase, FromTable As String)
		  // Deletes all the rows from the given table name
		  
		  Var query As String
		  
		  query = "DELETE FROM "+FromTable.Trim+";"
		  
		  db.ExecuteSQL(query)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub DeleteRow(Extends db As SQLiteDatabase, FromTable As String, WithFields As JSONItem)
		  // Deletes a Single row from the table.
		  // Fields.Value("column") = "value" 
		  // "column" must be a string value, with the exact name of the column.
		  // "value" may be a string, integer, double, date, Nil etc. MUST be a valid SQLiteDatabase row type
		  // WithFields; Keys with Values like Dictionary, JSONItem will be stored as JSON Strings if possible.
		  // Otherwise nothing will be stored/deleted from these (invalid) key/values
		  
		  
		  If WithFields.IsArray Then 
		    // WithFields must be an object.
		    Var e As New DatabaseException
		    e.Message = "Bad database fields type given."
		    Raise e
		  End If
		  
		  Var query As String
		  
		  If WithFields.Count > 0 Then
		    // Delete specific rows
		    Var values() As Variant
		    Var fields As String
		    
		    For Each key As String In WithFields.Names
		      fields = fields + " " + key.Trim + " = ?"
		      values.AddRow( WithFields.Value(key) )
		    Next 
		    
		    query = "DELETE FROM "+FromTable.Trim+" WHERE"+fields+";"
		    
		    db.ExecuteSQL(query, values)
		    
		  Else
		    // Delete all rows
		    query = "DELETE FROM "+FromTable+";"
		    
		    db.ExecuteSQL(query)
		    
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub InsertInto(Extends db As SQLiteDatabase, Table As String, Fields As JSONItem)
		  // Inserts a row into the table
		  // Fields.Value("column") = "value" 
		  // "column" must be a string value, with the exact name of the column.
		  // "value" may be a string, integer, double, date, Nil etc. MUST be a valid SQLiteDatabase row type
		  // WithFields; Keys with Values like Dictionary, JSONItem will be stored as JSON Strings if possible.
		  // Otherwise nothing will be stored/deleted from these (invalid) key/values
		  
		  Var query, columns(), placeholders() As String
		  Var values(), value As Variant
		  
		  If columns.Count <= 0 Then Return // Nothing to add.
		  
		  Columns = Fields.Names // The Fields object keys
		  
		  For index As Integer = columns.FirstRowIndex To Columns.LastRowIndex
		    
		    value = Fields.Value( columns(index) )
		    
		    If value.Type = Variant.TypeObject And value IsA JSONItem Then
		      value = JSONItem(value).ToString
		    End If
		    
		    
		    
		  Next
		  
		  query = "INSERT INTO "+Table.Trim+" (" + String.FromArray(columns, ", ") + ") values("+ String.FromArray(placeholders, ", ") +");"
		  
		  db.ExecuteSQL(query, values)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub Replace(Extends db As SQLiteDatabase, Table As String, Fields As JSONItem)
		  // Inserts if not existing or overwrites a row in the table
		  // Fields.Value("column") = "value" 
		  // "column" must be a string value, with the exact name of the column.
		  // "value" may be a string, integer, double, date, Nil etc. MUST be a valid SQLiteDatabase row type
		  // WithFields; Keys with Values like Dictionary, JSONItem will be stored as JSON Strings if possible.
		  // Otherwise nothing will be stored/deleted from these (invalid) key/values
		  
		  'Var query As String
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub Update(Extends db As SQLiteDatabase, Table As String, Fields As JSONItem)
		  // Updates a table with the given keyValue dictionary
		  // Fields.Value("column") = "value" 
		  // "column" must be a string value, with the exact name of the column.
		  // "value" may be a string, integer, double, date, Nil etc. MUST be a valid SQLiteDatabase row type
		  // WithFields; Keys with Values like Dictionary, JSONItem will be stored as JSON Strings if possible.
		  // Otherwise nothing will be stored/deleted from these (invalid) key/values
		  
		  'Var query As String
		  
		End Sub
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
