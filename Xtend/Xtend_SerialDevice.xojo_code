#tag Module
Protected Module Xtend_SerialDevice
	#tag CompatibilityFlags = ( TargetConsole and ( Target32Bit or Target64Bit ) ) or ( TargetWeb and ( Target32Bit or Target64Bit ) ) or ( TargetDesktop and ( Target32Bit or Target64Bit ) )
	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function ToSerialDevice(Extends Name As String) As SerialDevice
		  // Returns the SerialDevice if a device with that name has been found.
		  If name = "" Then Return Nil
		  
		  Var deviceCount As Integer = SerialDevice.Count
		  Var currentDevice As SerialDevice
		  
		  If deviceCount > 0 Then
		    
		    For deviceIndex As Integer = 0 To (deviceCount - 1)
		      
		      currentDevice = SerialDevice.At(deviceIndex)
		      If currentDevice.Name = Name Then
		        
		        'device = currentDevice
		        Return currentDevice
		        
		      End If
		      
		    Next
		    
		  End If
		  
		  Return Nil
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
