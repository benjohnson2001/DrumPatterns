local workingDirectory = reaper.GetResourcePath() .. "/Scripts/DrumPatterns"
require(workingDirectory .. "/preferences")
require(workingDirectory .. "/insertDrumPattern")

function decrementDrumPattern()

	local oldDrumPatternIndex = getDrumPatternIndex()

	local drumPatternIndex = oldDrumPatternIndex - 1

	if drumPatternIndex < 0 then
		return
	end

	insertDrumPattern(drumPatternIndex)
	setDrumPatternIndex(drumPatternIndex)
end

decrementDrumPattern()