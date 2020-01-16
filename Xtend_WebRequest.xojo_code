#tag Module
Protected Module Xtend_WebRequest
	#tag CompatibilityFlags = ( TargetWeb and ( Target32Bit or Target64Bit ) )
	#tag Method, Flags = &h0, CompatibilityFlags = (TargetWeb and (Target32Bit or Target64Bit))
		Function AcceptsJSON(Extends request As WebRequest) As Boolean
		  // Returns true if there is an "Accept" header that contains "application/json"
		  
		  Var AcceptHeader As String = request.GetRequestHeader("Accept")
		  
		  If AcceptHeader.BeginsWith("application/json") Then
		    Return True
		  End If
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FromFile(Extends Request As WebRequest, File As FolderItem)
		  If file = Nil Then Return
		  
		  Var inputStream As TextInputStream = TextInputStream.Open(File)
		  Var buffer As String = inputStream.ReadAll(encodings.UTF8)
		  inputStream.Close
		  
		  If Request.Response <> "" Then
		    Request.Reset
		  End If
		  
		  Request.Print(buffer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetWeb and (Target32Bit or Target64Bit))
		Function IsContentTypeJSON(Extends request As WebRequest) As Boolean
		  // Checks the body REQUEST
		  // Returns true if the "Content-Type" header is set to "application/json" (begins with)
		  // To get the Request.Entity as a JSONItem:
		  // Var json As JSONItem = Request.JSONBody
		  // json cannot be nil, as it will always return a JSONItem instance.
		  
		  Var ContentType As String = request.GetRequestHeader("Content-Type")
		  
		  If ContentType.BeginsWith("application/json") Then
		    Return True
		  End If
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetWeb and (Target32Bit or Target64Bit))
		Function JSONBody(Extends Request As WebRequest) As JSONItem
		  // WORKS ONLY ON XOJO WEB EDITON
		  // Parses the (Body) Entity of the WebRequest as a Dictionary (from JSON)
		  
		  Try
		    
		    Var json As New JSONItem(Request.Entity)
		    
		    Return json // Returns the jsonItem, it can be an object or an array.
		    
		  Catch e As JSONException
		    
		    #If DebugBuild Then
		      System.DebugLog(CurrentMethodName + " - JSONException: "+e.Message)
		      System.DebugLog(CurrentMethodName + " - Returning an empty JSONItem instance.")
		    #EndIf
		    
		    Return New JSONItem // Returns an empty jsonitem
		    
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PathInfo(Extends request As WebRequest) As Dictionary
		  // Converts the WebRequest.Path property into a dictionary
		  // This allows URL paths to contain /id:12345/product:shoe
		  // The left side of the ":" contains the KEY and the right side contains the VALUE
		  // If the value is numeric then it is stored as an integer, otherwise as a string
		  // URL Encoding is removed, so spaces are preserved -not recommended to use spaces-
		  
		  Var info As New Dictionary
		  Var pathItems(), keyVal, key, value As String
		  Var valInt As Integer
		  
		  #If Not DebugBuild Then
		    #Pragma BackgroundTasks False // Speed up, stop thread switching temporary
		    #Pragma NilObjectChecking False
		    #Pragma BoundsChecking False
		  #EndIf
		  
		  If request.path <> "" Then
		    
		    pathItems = request.Path.Split("/")
		    
		    If pathItems.Count > 0 Then
		      
		      For itemIndex As Integer = pathItems.FirstRowIndex To pathItems.LastRowIndex
		        
		        keyVal = DecodeURLComponent( pathItems(itemIndex), Encodings.UTF8 )
		        
		        If keyVal <> "" Then
		          
		          key = keyVal.NthField(":", 1)
		          value = keyVal.NthField(":", 2)
		          
		          If IsNumeric(value) Then
		            valInt = value.ToInteger
		            info.Value(key) = valInt
		          Else
		            info.Value(key) = value
		          End If
		          
		        End If
		        
		      Next
		      
		    End If
		    
		  End If
		  
		  Return info
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
