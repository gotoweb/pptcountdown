Declare Function SetTimer Lib "user32" (ByVal hwnd As Long, ByVal nIDEvent As Long, ByVal uElapse As Long, ByVal lpTimerFunc As Long) As Long
Declare Function KillTimer Lib "user32" (ByVal hwnd As Long, ByVal nIDEvent As Long) As Long

Dim pptObj As New App
Dim isEnableMacro As Boolean

Dim timerID As Long
Dim isInTimer As Boolean

Public Sub Initialize()
	If isEnableMacro = True Then
		Exit Sub
	End If

	Set pptObj.PPTEvent = Application
	StartOnTime
	isEnableMacro = True
End Sub

Public Sub Finalize()
	If isEnableMacro = True Then
		Set pptObj.PPTEvent = Nothing
		Set pptObj = Nothing
		isEnableMacro = False
	End If
End Sub

Private Sub RunCountdown()
	pptObj.DisplayCountdown
End Sub

Private Sub StartOnTime()
	If isInTimer Then
		timerID = KillTimer(0, timerID)
		If timerID = 0 Then
			MsgBox "Error : Timer Not Stopped"
			Exit Sub
		End If
		isInTimer = False

	Else
		RunCountdown
		timerID = SetTimer(0, 0, 1000, AddressOf RunCountdown)
		If timerID = 0 Then
			MsgBox "Error : Timer Not Generated "
			Exit Sub
		End If
		isInTimer = True

	End If
End Sub

Public Sub KillOnTime()
	timerID = KillTimer(0, timerID)
	isInTimer = False
	'MsgBox "KillOnTime"
End Sub
