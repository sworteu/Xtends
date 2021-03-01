#tag Class
Protected Class ExtendTabPanelTab
	#tag Method, Flags = &h0
		Sub Constructor(Caption As String, HasCloseButton As Boolean = False)
		  Self.mCaption = Caption
		  Self.mCloseButton = HasCloseButton
		  
		  Self.mShouldInvalidate = True
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCaption
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCaption = value
			  
			  mShouldInvalidate = True
			End Set
		#tag EndSetter
		Caption As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCloseButton
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCloseButton = value
			  
			  mShouldInvalidate = True
			End Set
		#tag EndSetter
		CloseButton As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mCaption As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCloseButton As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mShouldInvalidate As Boolean = True
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mShouldInvalidate
			End Get
		#tag EndGetter
		ShouldInvalidate As Boolean
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
			Name="Caption"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
		#tag ViewProperty
			Name="CloseButton"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShouldInvalidate"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
