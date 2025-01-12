#tag Module
Protected Module Xtend_Debugging
	#tag Method, Flags = &h0
		Function LastMethodName(Extends Error As RuntimeException) As String
		  // Adds the lastMethodName (if set) to the last exception.
		  // Could prove really useful on registering/loggin exceptions and errors.
		  #Pragma Unused Error
		  
		  // We return the last set method name
		  Return zLastMethodName
		End Function
	#tag EndMethod


	#tag Note, Name = Notes Xtend_Debugging
		
		To make debugging actual builds easier:
		In every method (and computed property) place the following: 
		
		// -- Begin method
		// Set global last method name
		LastMethodName = CurrentMethodName
		
		// If an exception occours in this method, it will be attached to any exception as RuntimeException.LastMethodName As String.
		// -- End method
		
		
		In App.UnhandledException you could use this to add an exception handler that's missing:
		// -- Begin event
		// App.unhandledException(error As RuntimeException) As Boolean event:
		
		// If the method had the LastMethodName set to CurrentMethodName you'l see the message:
		// App.UnhandledException: Got Exception from AMethoName with message: some error happened!
		
		// Log to some loggin mechanism or system logger:
		System.Log System.LogLevelCritical, CurrentMethodName + ": Got Exception from " + Error.LastMethodName + " with message: " + error.message
		// -- End Event
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return zLastMethodName
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  zLastMethodName = Value
			  
			  
			End Set
		#tag EndSetter
		LastMethodName As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private zLastMethodName As String
	#tag EndProperty


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
