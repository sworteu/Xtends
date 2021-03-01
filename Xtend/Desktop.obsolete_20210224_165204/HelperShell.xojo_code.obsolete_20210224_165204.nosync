#tag Class
Protected Class HelperShell
Inherits Shell
	#tag Event
		Sub Completed()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DataAvailable()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor()
		  Self.zIPC = New IPCSocket
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub IPCSocket_Connected(obj As IPCSocket)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub IPCSocket_DataAvailable(obj As IPCSocket)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub IPCSocket_Error(obj As IPCSocket, err As RuntimeException)
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Closing()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Opening()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Running()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Untitled()
	#tag EndHook


	#tag Property, Flags = &h21
		Private zIPC As IPCSocket
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
			InitialValue=""
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TimeOut"
			Visible=true
			Group=""
			InitialValue=""
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ExecuteMode"
			Visible=true
			Group=""
			InitialValue=""
			Type="ExecuteModes"
			EditorType="Enum"
			#tag EnumValues
				"0 - Synchronous"
				"1 - Asynchronous"
				"2 - Interactive"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Arguments"
			Visible=true
			Group=""
			InitialValue=""
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backend"
			Visible=true
			Group=""
			InitialValue=""
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Canonical"
			Visible=true
			Group=""
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ExitCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Result"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsRunning"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
