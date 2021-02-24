#tag Class
Protected Class SystemInfo
	#tag Method, Flags = &h0
		Sub Constructor()
		  cpuinfo = New Dictionary
		  
		  // On Raspberry Pi OS this will return the Model String
		  // Put the method inside a Try..Catch e As IOException
		  
		  #If TargetLinux And TargetARM Then
		    
		    Var cpuinfo_file As New FolderItem("/proc/cpuinfo", FolderItem.PathModes.Native)
		    Var stream As TextInputStream = TextInputStream.Open(cpuinfo_file)
		    Var data As String = stream.ReadAll(Encodings.UTF8)
		    stream.Close
		    
		    Var lines() As String = data.Split(EndOfLine)
		    
		    If lines.Count > 0 Then
		      Var lastLineIndex As Integer = lines.LastIndex
		      Var lineIndex As Integer = 0 
		      Var keyValue(), key, value, CurrentLine As String
		      Var CurrentCore As Integer = -1
		      
		      Var CoreInfoProcessed As Boolean = False
		      
		      Var core_dict As Dictionary
		      
		      For lineIndex To lastLineIndex
		        CurrentLine = Lines(lineIndex)
		        
		        If CurrentLine = "" Or CurrentLine.Trim = "" Then
		          Continue // Skip empty lines
		        End If
		        
		        If CoreInfoProcessed And core_dict <> Nil Then
		          core_dicts.Add core_dict
		          core_dict = Nil
		        End If
		        
		        keyValue = CurrentLine.Split(":")
		        
		        If keyValue.Count >= 2 Then
		          key = keyValue(0).Trim
		          value = keyValue(1).Trim
		          
		          Select Case key
		          Case "processor"
		            core_dict = New Dictionary
		            core_dict.Value(key) = value
		          Case "model name", "BogoMIPS", "CPU implementer", "CPU architecture", "CPU variant", "CPU part", "CPU revision"
		            core_dict.Value(key) = value
		          Case "Features" 
		            core_dict.Value(Key) = value.Split(" ")
		          Case "Hardware", "Revision", "Serial", "Model"
		            CoreInfoProcessed = True
		            cpuinfo.Value(key) = value
		          End Select
		          
		        End If
		        
		      Next
		      
		    End If
		    
		  #EndIf
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return core_dicts.Count
			End Get
		#tag EndGetter
		CoreCount As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private core_dicts() As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private cpuinfo As Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return cpuinfo.Lookup("Hardware", "").StringValue
			End Get
		#tag EndGetter
		Hardware As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Var rev As String = Self.Revision
			  
			  If rev = "" Then
			    Return ""
			  End If
			  
			  Select Case rev
			  Case "900021" // A+     Rev 1.1 512MB Sony UK
			  Case "900032" // B+     Rev 1.2 512MB Sony UK
			  Case "900092" // Zero   Rev 1.2 512MB Sony UK
			  Case "900093" // Zero   Rev 1.3 512MB Sony UK
			  Case "9000c1" // Zero W Rev 1.2 512MB Sony UK
			  Case "9020e0" // 3A+    Rev 1.0 512MB Sony UK
			  Case "920092" // Zero   Rev 1.2 512MB Embest
			  Case "920093" // Zero   Rev 1.3 512MB Embest
			  Case "900061" // CM     Rev 1.1 512MB Sony UK
			  Case "a01040" // 2B     Rev 1.0 1GB   Sony UK
			  Case "a01041" // 2B     Rev 1.1 1GB   Sony UK
			  Case "a02082" // 3B     Rev 1.2 1GB   Sony UK
			  Case "a020a0" // CM3    Rev 1.0 1GB   Sony UK
			  Case "a020d3" // 3B+    Rev 1.3 1GB   Sony UK
			  Case "a02042" // 2B     Rev 1.2 1Gb   Sony UK    - With BCM2837
			  Case "a21041" // 2B     Rev 1.1 1GB   Embest
			  Case "a22042" // 2B     Rev 1.2 1GB   Embest     - with BCM2837
			  Case "a22082" // 3B     Rev 1.2 1GB   Embest
			  Case "a220a0" // CM3    Rev 1.0 1GB   Embest
			  Case "a32082" // 3B     Rev 1.2 1GB   Sony Japan
			  Case "a52082" // 3B     Rev 1.2 1GB   Stadium
			  Case "a22083" // 3B     Rev 1.3 1GB   Embest
			  Case "a02100" // CM3    Rev 1.0 1GB   Sony UK
			  Case "a03111" // 4B     Rev 1.1 1GB   Sony UK
			  Case "b03111" // 4B     Rev 1.1 2GB   Sony UK
			  Case "b03112" // 4B     Rev 1.2 2GB   Sony UK
			  Case "b03114" // 4B     Rev 1.4 2GB   Sony UK
			  Case "c03111" // 4B     Rev 1.1 4GB   Sony UK
			  Case "c03112" // 4B     Rev 1.2 4GB   Sony UK
			  Case "c03114" // 4B     Rev 1.4 4GB   Sony UK
			  Case "d03114" // 4B     Rev 1.4 8GB   Sony UK
			  Case "c03130" // PI 400 Rev 1.0 4GB   Sony UK
			    
			  Else
			    // Unkown revision
			  End Select
			  
			  // /sys/firmware/devicetree/base/serial-number
			End Get
		#tag EndGetter
		Manufacturer As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return cpuinfo.Lookup("Model", "").StringValue
			End Get
		#tag EndGetter
		Model As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return cpuinfo.Lookup("Revision", "").StringValue
			End Get
		#tag EndGetter
		Revision As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return cpuinfo.Lookup("Serial", "").StringValue
			End Get
		#tag EndGetter
		Serial As String
	#tag EndComputedProperty


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
End Class
#tag EndClass
