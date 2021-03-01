#tag Module
Protected Module Xtend_String
	#tag Method, Flags = &h0
		Function xBeginsWithOneOf(Extends Value As String, ParamArray Comparers As String) As Boolean
		  If value = "" Then 
		    Return True
		  End If
		  
		  #Pragma BackgroundTasks False
		  
		  For Each comparer As String In Comparers
		    
		    If value.BeginsWith(comparer) Then
		      Return True
		    End If
		    
		  Next
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function xEndsWithOneOf(Extends Value As String, ParamArray Comparers As String) As Boolean
		  If value = "" Then 
		    Return True
		  End If
		  
		  #Pragma BackgroundTasks False
		  
		  For Each comparer As String In Comparers
		    
		    If value.EndsWith(comparer) Then
		      Return True
		    End If
		    
		  Next
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function xEqualsToOneOf(Extends Value As String, ParamArray CompareTo As String) As Boolean
		  // Compares value to all given CompareTo values, if any is equal it will return true
		  
		  #Pragma BackgroundTasks False
		  
		  For Each Comparer As String In CompareTo
		    
		    If value = Comparer Then
		      Return True
		    End If
		    
		  Next
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub xTrimItems(Extends  ByRef Value As String, ParamArray TrimItems As String)
		  // Trims any of the given TrimItems strings off the value string if 
		  // a value of TrimItems is at the beginning an/or at the end of the string
		  // It will only trim the first found value left and right, it won't keep trimming
		  
		  If value = "" Then
		    // Unable to trim
		    Return
		  End If
		  
		  Var isTrimmedLeft, isTrimmedRight As Boolean
		  isTrimmedLeft = False
		  isTrimmedRight = False
		  
		  #Pragma BackgroundTasks False
		  
		  For Each item As String In TrimItems
		    
		    If Not isTrimmedLeft Then
		      
		      If value.BeginsWith(item) Then
		        
		        value = value.Right(value.Length - item.Length)
		        isTrimmedLeft = True
		        
		      End If
		      
		    End If
		    
		    If Not isTrimmedRight Then
		      
		      If value.EndsWith(item) Then
		        
		        value = value.Left(value.Length - item.Length)
		        isTrimmedRight = True
		        
		      End If
		      
		    End If
		    
		    If isTrimmedLeft And isTrimmedRight Then
		      Return
		    End If
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub xTrimItemsLeft(Extends  ByRef Value As String, ParamArray TrimItems As String)
		  // Trims any of the given TrimItems strings off the value string if 
		  // a value of TrimItems is at the beginning an/or at the end of the string
		  // It will only trim the first found value left and right, it won't keep trimming
		  
		  If value = "" Then
		    // Unable to trim
		    Return
		  End If
		  
		  Var isTrimmedLeft As Boolean
		  isTrimmedLeft = False
		  
		  #Pragma BackgroundTasks False
		  
		  For Each item As String In TrimItems
		    
		    If Not isTrimmedLeft Then
		      
		      If value.BeginsWith(item) Then
		        
		        value = value.Right(value.Length - item.Length)
		        isTrimmedLeft = True
		        
		      End If
		      
		    End If
		    
		    If isTrimmedLeft Then
		      Return
		    End If
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub xTrimItemsRight(Extends  ByRef Value As String, ParamArray TrimItems As String)
		  // Trims any of the given TrimItems strings off the value string if 
		  // a value of TrimItems is at the beginning an/or at the end of the string
		  // It will only trim the first found value left and right, it won't keep trimming
		  
		  If value = "" Then
		    // Unable to trim
		    Return
		  End If
		  
		  Var isTrimmedRight As Boolean
		  isTrimmedRight = False
		  
		  #Pragma BackgroundTasks False
		  
		  For Each item As String In TrimItems
		    
		    If Not isTrimmedRight Then
		      
		      If value.EndsWith(item) Then
		        
		        value = value.Left(value.Length - item.Length)
		        isTrimmedRight = True
		        
		      End If
		      
		    End If
		    
		    If isTrimmedRight Then
		      Return
		    End If
		    
		  Next
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
