local workingDirectory = reaper.GetResourcePath() .. "/Scripts/DrumPatterns"
require(workingDirectory .. "/preferences")
require(workingDirectory .. "/insertDrumPattern")
require(workingDirectory .. "/drumPatterns")
require(workingDirectory .. "/util")

function incrementDrumPattern()

	local oldDrumPatternIndex = getDrumPatternIndex()
	local drumPatternIndex = oldDrumPatternIndex + 1

	if drumPatternIndex > #drumPatterns then
		return
	end

	insertDrumPattern(drumPatternIndex)
	setDrumPatternIndex(drumPatternIndex)
end

incrementDrumPattern()