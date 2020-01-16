#tag Module
Protected Module Xtend_Shell
	#tag CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function KillProcess(Extends sh As Shell) As Boolean
		  // Closes or Kills the shell process
		  // @Return True on success, False on error
		  
		  #If TargetWindows Then
		    // On windows shell.close doesn't do anything, below will kill the process
		    
		    Declare Function TerminateProcess Lib "Kernel32" (ProcessHandle As Integer, ExitCode As Integer) As Boolean
		    Declare Function GetLastError Lib "Kernel32" () As Integer
		    
		    If TerminateProcess(sh.PID, 0) Then
		      #If DebugBuild Then
		        System.DebugLog(CurrentMethodName + " Catched error with code "+GetLastError.ToString)
		      #EndIf
		      'Return GetLastError
		      Return False
		    End If
		    
		  #ElseIf TargetLinux Or TargetMacOS Then
		    
		    sh.Close // Just close is enough to stop the shell process
		    
		  #EndIf
		  
		  Return True
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
