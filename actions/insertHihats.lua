local workingDirectory = reaper.GetResourcePath() .. "/Scripts/DrumPatterns"
require(workingDirectory .. "/insertDrumPattern")


local currentGridSize = getCurrentGridSize()
setGridSizeToSixteenthNotes()

local drumPatternIndex = 1
insertHihats(drumPatternIndex)

setGridSize(currentGridSize)