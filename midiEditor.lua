function activeMidiEditor()
  return reaper.MIDIEditor_GetActive()
end

function activeTake()
  return reaper.MIDIEditor_GetTake(activeMidiEditor())
end

function activeMediaItem()
  return reaper.GetMediaItemTake_Item(activeTake())
end

function mediaItemStartPosition()
  return reaper.GetMediaItemInfo_Value(activeMediaItem(), "D_POSITION")
end

function mediaItemStartPositionPPQ()
  return reaper.MIDI_GetPPQPosFromProjTime(activeTake(), mediaItemStartPosition())
end

local function mediaItemLength()
  return reaper.GetMediaItemInfo_Value(activeMediaItem(), "D_LENGTH")
end

function gridUnitLength()

  local gridLengthQN = reaper.MIDI_GetGrid(activeTake())
  local gridLengthPPQ = reaper.MIDI_GetPPQPosFromProjQN(activeTake(), gridLengthQN)
  return reaper.MIDI_GetProjTimeFromPPQPos(activeTake(), gridLengthPPQ)
end




function getNumberOfNotes()

  local _, numberOfNotes = reaper.MIDI_CountEvts(activeTake())
  return numberOfNotes
end

function deleteNote(noteIndex)
  reaper.MIDI_DeleteNote(activeTake(), noteIndex)
end

function clearMidiEditor()

  local numberOfNotes = getNumberOfNotes()

	for noteIndex = numberOfNotes-1, 0, -1 do
		deleteNote(noteIndex)
	end
end

function goToStartOfBar()

	local commandId = 40036
  reaper.MIDIEditor_OnCommand(activeMidiEditor(), commandId)
end



function getCurrentGridSize()
  return reaper.MIDI_GetGrid(activeTake())/4
end

function setGridSize(arg)

  local activeProjectIndex = 0
  reaper.SetMIDIEditorGrid(activeProjectIndex, arg)
end

function setGridSizeToSixteenthNotes()
  setGridSize(0.0625)
end


function getNumberOfGridPositions()
  return math.ceil(mediaItemLength()/gridUnitLength())
end

function insertMidiNote(startPosition, note, isSnareBeat)

  local keepNotesSelected = false
  local noteIsMuted = false
  local startPositionPPQ = reaper.MIDI_GetPPQPosFromProjTime(activeTake(), startPosition)
  local endPositionPpq = reaper.MIDI_GetPPQPosFromProjTime(activeTake(), startPosition+gridUnitLength())

  local channel = 0
  local velocity = 96

  if isSnareBeat then
    velocity = 127
  end

  local noSort = false

  reaper.MIDI_InsertNote(activeTake(), keepNotesSelected, noteIsMuted, startPositionPPQ, endPositionPpq, channel, note, velocity, noSort)
end