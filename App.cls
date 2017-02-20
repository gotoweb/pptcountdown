Public WithEvents PPTEvent As Application

Dim nowTime As Date
Dim serviceTime As Date
Const secInDay As Long = 86400

Private Sub Class_Initialize()
	serviceTime = TimeValue("6:00 PM")
End Sub

Public Sub DisplayCountdown()
	nowTime = now()

	Dim remainSec As Long
	remainSec = DateDiff("s", Format(nowTime, "h:mm:ss"), serviceTime)

	Dim remainTime As Date
	remainTime = remainSec / secInDay

	ActivePresentation.Slides(1).Shapes(2).TextFrame.TextRange.Text = Format(remainTime, "hh:mm:ss")
	ActivePresentation.Slides(1).Shapes(3).TextFrame.TextRange.Text = serviceTime
End Sub

Private Sub PPTEvent_SlideShowEnd(ByVal Pres As Presentation)
	ActivePresentation.Slides(1).Shapes(2).TextFrame.TextRange.Text = "Timer Here"
	ActivePresentation.Slides(1).Shapes(3).TextFrame.TextRange.Text = "Service Time Here"

	Module.KillOnTime
	Module.Finalize
	MsgBox "SlideShow Ended"
End Sub
