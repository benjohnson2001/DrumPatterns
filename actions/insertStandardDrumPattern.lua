local workingDirectory = reaper.GetResourcePath() .. "/Scripts/DrumPatterns"
require(workingDirectory .. "/insertDrumPattern")


startUndoBlock()

	insertDrumPattern(1)

endUndoBlock("inserted standard drum pattern")