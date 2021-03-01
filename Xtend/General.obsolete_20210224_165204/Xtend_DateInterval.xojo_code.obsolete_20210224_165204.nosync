#tag Module
Protected Module Xtend_DateInterval
	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function CentiSeconds(Extends interval As DateInterval) As Integer
		  // Converts the NanoSeconds to CentiSeconds
		  // 0.01 of a second
		  Var ns As Integer = interval.Nanoseconds
		  Var cs As Integer = (ns / 10000000)
		  
		  Return cs
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function DeciSeconds(Extends interval As DateInterval) As Integer
		  // Converts the NanoSeconds to DeciSeconds
		  // 0.1 of a second
		  Var ns As Integer = interval.Nanoseconds
		  Var cs As Integer = (ns / 100000000)
		  
		  Return cs
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function MicroSeconds(Extends interval As DateInterval) As Integer
		  // Converts the NanoSeconds to MicroSecond
		  // 0.000001 of a second
		  Var ns As Integer = interval.Nanoseconds
		  Var cs As Integer = (ns / 1000)
		  
		  Return cs
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function MilliSeconds(Extends interval As DateInterval) As Integer
		  // Converts the NanoSeconds to MicroSeconds
		  // 0.001 of a second 
		  Var ns As Integer = interval.Nanoseconds
		  Var cs As Integer = (ns / 1000000)
		  
		  Return cs
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
