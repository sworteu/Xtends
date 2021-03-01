#tag Module
Protected Module Xtend_RPI
	#tag Method, Flags = &h1, CompatibilityFlags = API2Only and ( (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) )
		Protected Function Hardware() As String
		  // On Raspberry Pi OS this will return the Model String
		  // Put the method inside a Try..Catch e As IOException
		  
		  #If TargetLinux And TargetARM Then
		    
		    Var cpuinfo_file As New FolderItem("/proc/cpuinfo", FolderItem.PathModes.Native)
		    Var stream As TextInputStream = TextInputStream.Open(cpuinfo_file)
		    Var data As String = stream.ReadAll(Encodings.UTF8)
		    stream.Close
		    
		    If data = "" Then 
		      Return ""
		    End If
		    
		    Var lines() As String = data.Split(EndOfLine)
		    
		    If lines.Count > 0 Then
		      Var lastLineIndex As Integer = lines.LastIndex
		      Var lineIndex As Integer = 0 
		      
		      Var HardwareValue As String
		      
		      For lineIndex To lastLineIndex
		        
		        If lines(lineIndex).BeginsWith("Hardware") Then
		          
		          HardwareValue = lines(lineIndex).NthField(":",2).Trim
		          
		          Return HardwareValue
		          
		        End If
		        
		      Next
		      
		    End If
		    
		    Return ""
		    
		  #Else
		    // Nothing to return
		    
		    Return ""
		    
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = API2Only and ( (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) )
		Protected Function Model() As String
		  // On Raspberry Pi OS this will return the Model String
		  // Put the method inside a Try..Catch e As IOException
		  
		  #If TargetLinux And TargetARM Then
		    
		    Var cpuinfo_file As New FolderItem("/proc/cpuinfo", FolderItem.PathModes.Native)
		    Var stream As TextInputStream = TextInputStream.Open(cpuinfo_file)
		    Var data As String = stream.ReadAll(Encodings.UTF8)
		    stream.Close
		    
		    If data = "" Then 
		      Return ""
		    End If
		    
		    Var lines() As String = data.Split(EndOfLine)
		    
		    If lines.Count > 0 Then
		      Var lastLineIndex As Integer = lines.LastIndex
		      Var lineIndex As Integer = 0 
		      
		      Var modelValue As String
		      
		      For lineIndex To lastLineIndex
		        
		        If lines(lineIndex).BeginsWith("Model") Then
		          
		          modelValue = lines(lineIndex).NthField(":",2).Trim
		          
		          Return modelValue
		          
		        End If
		        
		      Next
		      
		    End If
		    
		    Return ""
		    
		  #Else
		    // Nothing to return
		    
		    Return ""
		    
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = API2Only and ( (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) )
		Protected Function Revision() As String
		  // On Raspberry Pi OS this will return the Model String
		  // Put the method inside a Try..Catch e As IOException
		  
		  #If TargetLinux And TargetARM Then
		    
		    Var cpuinfo_file As New FolderItem("/proc/cpuinfo", FolderItem.PathModes.Native)
		    Var stream As TextInputStream = TextInputStream.Open(cpuinfo_file)
		    Var data As String = stream.ReadAll(Encodings.UTF8)
		    stream.Close
		    
		    If data = "" Then 
		      Return ""
		    End If
		    
		    Var lines() As String = data.Split(EndOfLine)
		    
		    If lines.Count > 0 Then
		      Var lastLineIndex As Integer = lines.LastIndex
		      Var lineIndex As Integer = 0 
		      
		      Var RevisionValue As String
		      
		      For lineIndex To lastLineIndex
		        
		        If lines(lineIndex).BeginsWith("Revision") Then
		          
		          RevisionValue = lines(lineIndex).NthField(":",2).Trim
		          
		          Return RevisionValue
		          
		        End If
		        
		      Next
		      
		    End If
		    
		    Return ""
		    
		  #Else
		    // Nothing to return
		    
		    Return ""
		    
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = API2Only and ( (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) )
		Sub Untitled()
		  
		End Sub
	#tag EndMethod


End Module
#tag EndModule
