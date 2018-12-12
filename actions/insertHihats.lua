local workingDirectory = reaper.GetResourcePath() .. "/Scripts/DrumPatterns"
require(workingDirectory .. "/insertDrumPattern")


startUndoBlock()

	local currentGridSize = getCurrentGridSize()
	setGridSizeToSixteenthNotes()

	local drumPatternIndex = 1
	insertHihats(drumPatternIndex)

	setGridSize(currentGridSize)

endUndoBlock("inserted hihats")