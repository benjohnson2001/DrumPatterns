local workingDirectory = reaper.GetResourcePath() .. "/Scripts/DrumPatterns"
require(workingDirectory .. "/util")

local activeProjectIndex = 0
local sectionName = "com.pandabot.DrumPatterns"

local drumPatternIndexKey = "drumPatternIndex"

--

local function getValue(key)
  local valueExists, value = reaper.GetProjExtState(activeProjectIndex, sectionName, key)

  if valueExists == 0 then
  	return 0
  end

  return value
end

local function setValue(key, value)
  reaper.SetProjExtState(activeProjectIndex, sectionName, key, value)
end

--


function getDrumPatternIndex()
  return tonumber(getValue(drumPatternIndexKey))
end

function setDrumPatternIndex(arg)
  setValue(drumPatternIndexKey, arg)
end