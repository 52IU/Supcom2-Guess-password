;A simple program aimed at bruteforcing passwords on supcom2 lobbies
;or spamming random stuff anywhere else. Whatever fits your need.
;---------------------------------------------------------------------
TryPass(p) {
	clipboard = %p%
	Send ^v
	Send, {Enter}
	return
}

countLines(filen) {
	i := 0
	Loop, read, %filen%
	{
		i += 1
	}
	return i
}

oldclipboard = %clipboard%
started := False
TrayTip,, F8 to start the timer, 3,

FileName := "test.txt"
fileLines := countLines(FileName)
F8::
	started:= True
	i := 0
	while(i < fileLines && started) {
		if (GetKeyState("F9")) {
			clipboard = %oldclipboard%
			TrayTip,, Stopped at %i% - %curline%
			started := false
			break
		}
		FileReadLine, curline, %FileName%, %i%
		TryPass(curline)
		i += 1
	}
	return
	
F10:: ExitApp
