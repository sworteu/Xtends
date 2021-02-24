#tag Module
Protected Module Xtend_Graphics
	#tag CompatibilityFlags = ( TargetConsole and ( Target32Bit or Target64Bit ) ) or ( TargetWeb and ( Target32Bit or Target64Bit ) ) or ( TargetDesktop and ( Target32Bit or Target64Bit ) )
	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function BitmapForCaching(Extends g as Graphics, Width as Integer,  Height as Integer) As Picture
		  // Creates a BitmapForCaching (picture with scale of the screen) using a graphics object.
		  
		  // Create a new picture at scale size
		  Dim p As New Picture(Width * g.ScaleX, Height * g.ScaleY)
		  
		  // Set the appropriate resolution
		  p.HorizontalResolution = 72 * g.ScaleX
		  p.VerticalResolution = 72 * g.ScaleY
		  
		  // Set the scale factor so drawing to it will be correct
		  p.Graphics.ScaleX = g.ScaleX
		  p.Graphics.ScaleY = g.ScaleY
		  
		  // Very important to remember the mask!
		  // p.Mask.Graphics.ScaleX = g.ScaleX
		  // p.Mask.Graphics.ScaleY = g.ScaleY
		  
		  // Return the new picture
		  Return p
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
