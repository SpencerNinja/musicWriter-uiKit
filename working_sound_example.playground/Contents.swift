import UIKit

/* Working Musical Notes */
// https://stackoverflow.com/questions/37102685/play-musical-notes-in-swift-playground
// https://newt.phys.unsw.edu.au/jw/notes.html

import PlaygroundSupport
import AudioToolbox

var sequence : MusicSequence? = nil
var musicSequence = NewMusicSequence(&sequence)

var track : MusicTrack? = nil
var musicTrack = MusicSequenceNewTrack(sequence!, &track)

// Adding notes

var time = MusicTimeStamp(1.0)
for index:UInt8 in 60...72 { // C4 to C5
    var note = MIDINoteMessage(channel: 0,
                               note: index,
                               velocity: 64,
                               releaseVelocity: 0,
                               duration: 1.0 )
    musicTrack = MusicTrackNewMIDINoteEvent(track!, time, &note)
    time += 1
}

// Creating a player

var musicPlayer : MusicPlayer? = nil
var player = NewMusicPlayer(&musicPlayer)

player = MusicPlayerSetSequence(musicPlayer!, sequence)
player = MusicPlayerStart(musicPlayer!)

PlaygroundPage.current.needsIndefiniteExecution = true
