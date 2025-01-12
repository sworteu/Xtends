#tag Class
Protected Class HelperApplication
Inherits ConsoleApplication
	#tag CompatibilityFlags = ( TargetConsole and ( Target32Bit or Target64Bit ) )
	#tag Event
		Function Run(args() as String) As Integer
		  RaiseEvent Opening(Self.GetArgsDictionary(args))
		  
		  // Main loop
		  While Running 
		    
		    // Run the main loop
		    RaiseEvent Run
		    
		    // Let xojo handle the events of other classes.
		    // This allows the cpu to lower it's % so it won't choke the system.
		    // -1 is lowest but 10 is probably better.
		    Self.DoEvents(Self.zYieldTimeMS)
		    
		  Wend
		  
		  
		  
		  
		  // Parse the return code from the closing event.
		  Return RaiseEvent Closing
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function GetArgsDictionary(Args() As String) As Dictionary
		  Var d As New Dictionary
		  
		  If args.Count <= 1 Then
		    // If there are no args then return
		    // We exclude the path to this process (args(0))
		    Return d
		  End If
		  
		  #If Not DebugBuild Then
		    // Speed up the process in builds
		    #Pragma BackgroundTasks False
		    #Pragma StackOverflowChecking False
		    #Pragma BoundsChecking False
		    #Pragma NilObjectChecking False
		  #EndIf
		  
		  // Pre-init variables to speed the loop
		  Var lastArgIndex As Integer = Args.LastIndex
		  Var argIndex As Integer = 1 // Start at arg index 1 (skips exectuable path)
		  Var currentArg(), argKey, argValue As String 
		  
		  // Loop trough all args values
		  For ArgIndex To lastArgIndex
		    currentArg = Args(argIndex).Split("=")
		    argKey = currentArg(0)
		    
		    If argKey = "" Then
		      Continue // Unable to parse "=avalue" without key
		    End If
		    
		    // Extract the value (if set, otherwise blank "")
		    argValue = If(currentArg.Count >= 2, currentArg(1), "")
		    
		    // Set the key/value
		    d.Value(argKey) = argValue
		    
		  Next
		  
		  // Return the dictionary
		  Return d
		  
		  
		  // /path/to/my/application -a --name="A quoted string parameter" --file=~/An\ escaped\ path
		  // Is parsed by Xojo in Args() As String like so:
		  // 0: /path/To/my/application
		  // 1: -a
		  // 2: --name=A quoted String parameter (Double-quotes are removed)
		  // 3: --file=~/An escaped path (Characters are unescaped)
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0, Description = 43616C6C6564206F6E63652061667465722052756E6E696E672069732073657420746F2066616C73652E205468697320697320746865206C617374206576656E742068617070656E696E672E
		Event Closing() As Integer
	#tag EndHook

	#tag Hook, Flags = &h0, Description = 43616C6C6564206F6E6365207768656E20746865206170706C69636174696F6E206973206F70656E696E672C206265666F7265207468652066697273742072756E6E696E67206576656E742E
		Event Opening(Args As Dictionary)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Run()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return zRunning
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  zRunning = value
			End Set
		#tag EndSetter
		Running As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return zYieldTimeMS
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value < -1 Then
			    // Values cannot be lower than -1
			    Self.zYieldTimeMS = -1 // Set to -1 (lowest)
			    Return
			  End If
			  
			  // Set the value
			  Self.zYieldTimeMS = value
			End Set
		#tag EndSetter
		YieldTimeMS As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private zRunning As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private zYieldTimeMS As Integer = -1
	#tag EndProperty


	#tag Constant, Name = YIELD_CPU_USAGE_EXTREME, Type = Double, Dynamic = False, Default = \"-1", Scope = Private, Description = 55736573206173206D7563682043505520617320706F737369626C652E20446F6E277420626C6F636B207468652072756E206576656E74206F7220746865206170702077696C6C2062652063686F6B65642E
	#tag EndConstant

	#tag Constant, Name = YIELD_CPU_USAGE_HIGH, Type = Double, Dynamic = False, Default = \"10", Scope = Private, Description = 5573657320612048494748204350552062757420776F6E27742063686F6B65207468652073797374656D2028756E6C65737320796F7520626C6F636B207468652072756E206576656E74292E2031306D73206576656E74732073796E63206166746572207468652052756E206576656E742E
	#tag EndConstant

	#tag Constant, Name = YIELD_CPU_USAGE_LOW, Type = Double, Dynamic = False, Default = \"100", Scope = Private, Description = 557365732061204C4F57204350552070657263656E746167652C20736C656570696E672074686520617070203130306D73206166746572207468652052756E206576656E7420746F20757365206C657373204350552E
	#tag EndConstant

	#tag Constant, Name = YIELD_CPU_USAGE_MEDIUM, Type = Double, Dynamic = False, Default = \"50", Scope = Private, Description = 557365732061204D454449554D204350552070657263656E746167652C20616C6C6F77696E6720666F722035306D206F66206576656E747320636865636B696E67206166746572207468652052756E206576656E742E
	#tag EndConstant

	#tag Constant, Name = YIELD_CPU_USAGE_SLEEP, Type = Double, Dynamic = False, Default = \"1000", Scope = Private, Description = 416C6C6F777320666F7220313030306D7320283173656329206576656E747320636865636B696E67206166746572207468652052756E206576656E74204C4F574552494E47207468652043505520757361676520627920414C4F542E
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Running"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="YieldTimeMS"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
