function getDrumPattern(drumPatternIndex, partName)

  local drumPatternString = drumPatterns[drumPatternIndex][partName]
  local drumPatternArray = {false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false}

  for i = 1, #drumPatternString do
    if drumPatternString:sub(i, i) == '1' then
      drumPatternArray[i] = true
    end
  end

  return drumPatternArray
end