local workingDirectory = reaper.GetResourcePath() .. "/Scripts/DrumPatterns"
require(workingDirectory .. "/drumPatterns")
require(workingDirectory .. "/drumPatternFunctions")
require(workingDirectory .. "/midiEditor")
require(workingDirectory .. "/util")

local function insertDrumPart(drumPatternIndex, drumPartName, drumPartNoteValue)

	local startPosition = mediaItemStartPosition()	

	local drumPattern = getDrumPattern(drumPatternIndex, drumPartName)
	local numberOfGridPositions = getNumberOfGridPositions()

	for i = 0, numberOfGridPositions-1 do

		local drumPatternIndex = i % 16 + 1
		local noteExists = drumPattern[drumPatternIndex]

		if noteExists then
			insertMidiNote(startPosition, drumPartNoteValue)
		end

		startPosition = startPosition + gridUnitLength()
	end
end

local function insertKicks(drumPatternIndex)
	insertDrumPart(drumPatternIndex, 'kick', 0)
end

local function insertSnares(drumPatternIndex)
	insertDrumPart(drumPatternIndex, 'snare', 2)
end

local function insertHihats(drumPatternIndex)
	insertDrumPart(drumPatternIndex, 'hihat', 3)
end

function insertDrumPattern(drumPatternIndex)

	clearMidiEditor()

	if drumPatternIndex == 0 then
		return
	end

	local currentGridSize = getCurrentGridSize()
	setGridSizeToSixteenthNotes()

	insertKicks(drumPatternIndex)
	insertSnares(drumPatternIndex)
	insertHihats(drumPatternIndex)

	setGridSize(currentGridSize)
end