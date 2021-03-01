#tag Module
Protected Module Xtend_ConsoleApplication
	#tag Method, Flags = &h0
		Sub YieldNoSleep(Extends consoleApp As ConsoleApplication)
		  consoleApp.DoEvents(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub YieldToNextThread(Extends consoleApp As ConsoleApplication)
		  consoleApp.DoEvents(0)
		  
		End Sub
	#tag EndMethod


End Module
#tag EndModule
