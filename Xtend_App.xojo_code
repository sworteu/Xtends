#tag Module
Protected Module Xtend_App
	#tag Method, Flags = &h0
		Function VersionString(Extends a As App, ShowStageCode As Boolean = False) As String
		  // WORKS ON ALL XOJO PROJECT TYPES
		  // @Returns String
		  // @Example Prefix 1.0.0 Alpha(1)
		  
		  Var Output As String
		  
		  Output = a.MajorVersion.ToString + "." + a.MinorVersion.ToString + "." + a.BugVersion.ToString 
		  
		  If ShowStageCode = True Then
		    
		    Select Case a.StageCode
		    Case a.Development
		      Output = Output + " Dev(" + a.NonReleaseVersion.ToString + ")"
		    Case a.Alpha 
		      Output = Output + " Alpha(" + a.NonReleaseVersion.ToString + ")"
		    Case a.Beta
		      Output = Output + " Beta(" + a.NonReleaseVersion.ToString + ")"
		    Case a.Final
		      Output = Output + " Release(" + a.NonReleaseVersion.ToString + ")"
		    End Select
		    
		  End If
		  
		  Return Output
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
