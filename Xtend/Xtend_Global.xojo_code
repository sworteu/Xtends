#tag Module
Protected Module Xtend_Global
	#tag Method, Flags = &h0
		Function GenerateGUID() As String
		  // Generates a GUID using SQLiteDatabase (Desktop, Console, Web) or iOSSQLiteDatabase (on iOS targets)
		  
		  Var query, guid As String
		  
		  #If TargetIOS Then
		    // iOS Applications
		    
		    Var gdb As New iOSSQLiteDatabase
		    Var rows As iOSSQLiteRecordSet 
		    
		    Query = "select hex( randomblob(4)) || '-' || hex( randomblob(2)) || '-' || '4' || substr( hex( randomblob(2)), 2) || '-' || substr('AB89', 1 + (abs(random()) % 4) , 1) || substr(hex(randomblob(2)), 2) || '-' || hex(randomblob(6)) AS GUID ;"
		    
		    gdb.Connect
		    rows = gdb.SQLSelect(query)
		    
		    If rows <> Nil And rows.ColumnCount > 0 Then
		      rows.MoveToFirstRow
		      guid = rows.Column("GUID").StringValue
		    End If
		    
		  #Else
		    // Desktop, Console and Web Applications
		    
		    Var gdb As New SQLiteDatabase
		    Var rows As RowSet 
		    
		    Query = "select hex( randomblob(4)) || '-' || hex( randomblob(2)) || '-' || '4' || substr( hex( randomblob(2)), 2) || '-' || substr('AB89', 1 + (abs(random()) % 4) , 1) || substr(hex(randomblob(2)), 2) || '-' || hex(randomblob(6)) AS GUID ;"
		    
		    gdb.Connect
		    rows = gdb.SelectSQL(query)
		    
		    If rows <> Nil And rows.ColumnCount > 0 Then
		      rows.MoveToFirstRow
		      guid = rows.Column("GUID").StringValue
		    End If
		    
		  #EndIf
		  
		  Return guid
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RSAMaxEncryptBytesLength(ForBitsLength As Integer = 1024) As Integer
		  ' Calculates the maximum lenght in bytes RSA can encrypt using the given ForBitsLength (512, 1024, 2048 etc)
		  ' The modulus size is the key size in bits / 8. 
		  ' Thus a 1024-bit RSA key using OAEP padding can encrypt up to (1024/8) – 42 = 128 – 42 = 86 bytes.
		  ' A 2048-bit key can encrypt up To (2048/8) – 42 = 256 – 42 = 214 bytes.
		  
		  Const BitsInByte = 8
		  Const OAEPPadding = 42
		  
		  Var MaxBytes As Integer = ( (ForBitsLength / BitsInByte) - OAEPPadding)
		  
		  Return MaxBytes
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Test()
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Xtends
		
		Xtend_* or otherwise referred to Xtends is a project developed by 3DiY VOF.
		
	#tag EndNote

	#tag Note, Name = Xtend_Global
		
		Contains global (extention) Methods/Functions, Enumerations, Constants, Properties etc.s
		Should always be added to any project other modules may depend on this.
	#tag EndNote


	#tag Enum, Name = SearchTypes, Type = Integer, Flags = &h0
		Exact
		  BeginsWith
		  EndsWith
		Contains
	#tag EndEnum


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
