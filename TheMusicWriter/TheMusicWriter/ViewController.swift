//
//  ViewController.swift
//  TheMusicWriter
//
//  Created by Spencer Hurd on 5/6/21.
//

import UIKit
//import PlaygroundSupport
import AudioToolbox

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    // The label where the user inputs length of melody (integer)
    @IBOutlet weak var scaleLength: UITextField!
    
    // Picker View where the user selects the scale
    @IBOutlet weak var scalePicker: UIPickerView!
    
    // list of scale names (Array of strings)
    var scaleNames: [String] = ["C Major", "Pentatonic", "Pentatonic2", "A Minor", "C Major Pentatonic", "A Minor Pentatonic", "Blues", "Harmonic Minor", "Altered Dominant", "Flamenco", "Hungarian Minor", "Persian", "Spanish", "Japanese", "Random"]
    
    // flag to signal if melody has already been generated
    var generatedFlag = false
    
    // Not sure why I need this, but I do
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        scaleNames.count
    }
    // The data to return for the row and component that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return scaleNames[row]
    }
    // Variable to store scale id
    var scaleID: Int = 0
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameters named row and component represent what was selected.
        scaleID = row
        // reset output melody
        outputMelody.text = "Melody appears here"
        randomizedScale = ""
        lengthOfProgression = Int(scaleLength.text ?? "")!
        generatedFlag = false
    }

    // Assign scale IDs to scale names
    var selectedScaleName: String {
        return scaleNames[scaleID]
    }
    
    // Notes inside of each scale
    let scalesDictionary = [
        "C Major": ["C4", "D4", "E4", "F4", "G4", "A4", "B4", "C5"],
        "Pentatonic": ["C4", "D4", "E4", "G4", "A4"],
        "Pentatonic2": ["A3", "C4", "D4", "E4", "G4"],
        "A Minor": ["A3", "B3", "C4", "D4", "E4", "F4", "G4", "A4"],
        "C Major Pentatonic": ["C4", "D4", "E4", "G4", "A4"],
        "A Minor Pentatonic": ["A3", "C4", "D4", "E4", "G4"],
        "Blues": ["A3", "C4", "D4", "Eb4", "E4", "G4", "A4"],
        "Harmonic Minor": ["C4", "D4", "Eb4", "F4", "G4", "Ab4", "B4", "C5"],
        "Altered Dominant": ["C4", "Db4", "Eb4", "Fb4", "Gb4", "Ab4", "Bb4"],
        "Flamenco": ["C4", "Db4", "E4", "F4", "G4", "Ab4", "B4", "C5"],
        "Hungarian Minor": ["B4", "Db4", "D4", "Fb4", "Gb4", "G4", "Bb4", "B4"],
        "Persian": ["C4", "Db4", "E4", "F4", "Gb4", "Ab4", "B4", "C5"],
        "Spanish": ["C4", "Db4", "E4", "F4", "G4", "Ab4", "Bb4", "C5"],
        "Japanese": ["C4", "Db4", "F4", "G4", "Bb4", "C5"],
        "Random": ["Ab3", "A3", "Bb3", "B3", "C4", "Db4", "D4", "Eb4", "E4", "F4", "Fb4", "Gb4", "G4"]
    ]
    
    // User selection: how many notes in progression?
    lazy var lengthOfProgression: Int = Int(scaleLength.text ?? "")!
    // User selection: name of scale selected
    lazy var userSelectedScale = scalesDictionary[selectedScaleName]
    // initialize empty array to store randomized scale
    var randomizedScale = ""
    
    // Generate the random Scale
    func randomizeProgression() -> String {
        let selectedScaleNotes = userSelectedScale
        for _ in 1...lengthOfProgression {
            let randomNote = selectedScaleNotes!.randomElement()
            randomizedScale.append(randomNote!)
            randomizedScale.append(", ")
        }
        return randomizedScale
    }
    
    // The button to generate the melody based on scale and length selected
    @IBAction func generateMelody(_ sender: UIButton) {
        let melodyArray = randomizeProgression()
        if generatedFlag == false {
            outputMelody.text = String(melodyArray)
            generatedFlag = true
        }
    }
    
    // The output of the generated melody
    @IBOutlet weak var outputMelody: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Connect data:
        self.scalePicker.delegate = self
        self.scalePicker.dataSource = self
        outputMelody.text = "Melody appears here"
    }
    
    
    
    // -------------------------------------------------------------------------
    
    @IBOutlet weak var playOutlet: UIButton!
    @IBAction func playMelodyClicked(_ sender: UIButton) {
    }
    
    
//    var sequence : MusicSequence? = nil
//    var musicSequence = NewMusicSequence(&sequence)
//
//    var track : MusicTrack? = nil
//    var musicTrack = MusicSequenceNewTrack(sequence!, &track)
//
//    // Adding notes
//
//    var time = MusicTimeStamp(1.0)
//    for index:UInt8 in 60...72 { // C4 to C5
//        var note = MIDINoteMessage(channel: 0,
//                                   note: index,
//                                   velocity: 64,
//                                   releaseVelocity: 0,
//                                   duration: 1.0 )
//        musicTrack = MusicTrackNewMIDINoteEvent(track!, time, &note)
//        time += 1
//    }
//
//    // Creating a player
//
//    var musicPlayer : MusicPlayer? = nil
//    var player = NewMusicPlayer(&musicPlayer)
//
//    player = MusicPlayerSetSequence(musicPlayer!, sequence)
//    player = MusicPlayerStart(musicPlayer!)
//
//    PlaygroundPage.current.needsIndefiniteExecution = true
    // -----------------------------------------------------------------------------
    
    
    
    // [note Octave # : frequency]
    // middle C is C4
    let noteFreq = [
       "A0": 27.5000,
       "Bb0": 29.1352,
       "B0": 30.8677,
       "C1": 32.7032,
       "Db1": 34.6478,
       "D1": 36.7081,
       "Eb1": 38.8909,
       "E1": 41.2034,
       "F1": 43.6535,
       "Gb1": 46.2493,
       "G1": 48.9994,
       "Ab1": 51.9131,
       "A1": 55.0000,
       "Bb1": 58.2705,
       "B1": 61.7354,
       "C2": 65.4064,
       "Db2": 69.2957,
       "D2": 73.4162,
       "Eb2": 77.7817,
       "E2": 82.4069,
       "F2": 87.3071,
       "Gb2": 92.4986,
       "G2": 97.9989,
       "Ab2": 103.8262,
       "A2": 110.0000,
       "Bb2": 116.5409,
       "B2": 123.4708,
       "C3": 130.8128,
       "Db3": 138.5913,
       "D3": 146.8324,
       "Eb3": 155.5635,
       "E3": 164.8138,
       "F3": 174.6141,
       "Gb3": 184.9972,
       "G3": 195.9977,
       "Ab3": 207.6523,
       "A3": 220.0000,
       "Bb3": 233.0819,
       "B3": 246.9417,
       "C4": 261.6256,
       "Db4": 277.1826,
       "D4": 293.6648,
       "Eb4": 311.1270,
       "E4": 329.6276,
       "F4": 349.2282,
       "Gb4": 369.9944,
       "G4": 391.9954,
       "Ab4": 415.3047,
       "A4": 440.0000,
       "Bb4": 466.1638,
       "B4": 493.8833,
       "C5": 523.2511,
       "Db5": 554.3653,
       "D5": 587.3295,
       "Eb5": 622.2540,
       "E5": 659.2551,
       "F5": 698.4565,
       "Gb5": 739.9888,
       "G5": 783.9909,
       "Ab5": 830.6094,
       "A5": 880.0000,
       "Bb5": 932.3275,
       "B5": 987.7666,
       "C6": 1046.502,
       "Db6": 1108.731,
       "D6": 1174.659,
       "Eb6": 1244.508,
       "E6": 1318.510,
       "F6": 1396.913,
       "Gb6": 1479.978,
       "G6": 1567.982,
       "Ab6": 1661.219,
       "A6": 1760.000,
       "Bb6": 1864.655,
       "B6": 1975.533,
       "C7": 2093.005,
       "Db7": 2217.461,
       "D7": 2349.318,
       "Eb7": 2489.016,
       "E7": 2637.020,
       "F7": 2793.826,
       "Gb7": 2959.955,
       "G7": 3135.963,
       "Ab7": 3322.438,
       "A7": 3520.000,
       "Bb7": 3729.310,
       "B7": 3951.066,
       "C8": 4186.009,
       "Db8": 4434.922,
       "D8": 4698.636,
       "Eb8": 4978.032,
       "E8": 5274.041,
       "F8": 5587.652,
       "Gb8": 5919.911,
       "G8": 6271.927,
       "Ab8": 6644.875,
       "A8": 7040.000,
       "Bb8": 7458.620,
       "B8": 7902.133
    ]
    
}




/*
 
 ------------------------------------------------------------------------------------------
 
 
 VERSION 1.0
 
    TITLE, USER PROCESS, LAYOUT, SCALES, SOUND
 
         TITLE IDEAS
            - Melody Generator
            - The Music Writer
         
         USER PROCESS
            1. User selects scale to use (Pentatonic, Blues, random)
            2. User selects length of melody
            3. User pushes "generate" button
            4. User can listen to generated melody by hitting "Play My Tune" button
            
            (Include a note that User this app is for entertainment purposes only and user is responsible for checking that generated melody does not match any current song melodies.)

         LAYOUT
             Title: The Music Writer

             heading: What scale of notes would you like to use?
             drop-down text box containing available scales

             heading: How many notes do you want in your progression?
             drop-down text box with numbers 3-21

             button: Generate my progression

             button: Play (this button is grayed out until a progression is generated)
        
         SCALES
            - C Major = C, D, E, F, G, A, B, C
            - Pentatonic = C, D, E, G, A
            - Pentatonic2 = A, C, D, E, G
            - A Minor = A, B, C, D, E, F, G, A
            - C Major Pentatonic = C, D, E, G, A
            - A Minor Pentatonic = A, C, D, E, G
            - Blues scale = A, C, D, D#, E, G, A
            - Harmonic Minor Scale = C, D, Eb, F, G, Ab, B, C
            - Altered Dominant Scale = C, Db, Eb, Fb, Gb, Ab, Bb
            - Flamenco Scale = C, Db, E, F, G, Ab, B, C
            - Hungarian Minor Scale = B, C#, D, E#, F#, G, A#, B
            - Persian Scale = C, Db, E, F, Gb, Ab, B, C
            - Spanish Scale = C, Db, E, F, G, Ab, Bb, C
            - Japanese Scale = C, Db, F, G, Bb, C
     
 
 ------------------------------------------------------------------------------------------
 
 
 VERSION 1.1
 
    CALCULATIONS AND CONSTRAINTS ON MUSICAL PATTERNS
        
        PATTERNS
            Triangle - Ascend
                1-2-3-1-2-3
            Triangle - Descend
                3-2-1-3-2-1
            Ladder - Safe Step - Ascend
                1-1-2-2-3-3
            Ladder - Safe Step - Descend
                3-3-2-2-1-1
            Ladder - Confident Step - Ascend
                1-3-2-4-3-6-5
            Ballad
                1-1-1-2-2-2-3-3-3
 
 
 ------------------------------------------------------------------------------------------
 
 
 VERSION 1.2
 
    TIMING AND MEASURES
 
        TIMING
            4/4
            ____ ____ ____ ____   each "_" is a 16th, so in drum counting that is 1e+a 2e+a 3e+a 4e+a
            r = rest
            / = single note
            + = overlapping note
     
         MEASURES
              # Function to determine type of measure (2/2 2/4 4/4)
              def PickMeasure():
                  measure = input("Please enter the type of measure (2/2 2/4 3/4 4/4): ")
                  while measure != "2/2" or measure != "2/4" or measure != "3/4" or measure != "4/4":
                      print("Invalid input.")
                      measure = input("Please enter the type of measure (2/2 2/4 3/4 4/4): ")
                  return measure

              # Function to show how many notes in a measure get a count
              def noteInMeasure(measure):
                  note = float(measure) * 4
                  return note

              # Function to print a measure
              def printMeasure(measure, note):
                  for i in range(8):  # half notes: 8 notes if 4/4
                      print(note)
                  pass
 
 
 ------------------------------------------------------------------------------------------
 

 VERSION 1.3
 
    EMOTION SCALES AND PATTERNS
  
        SCALES
          To match the emotions this is the list starting from C major.
             - MOOD            NAME            ROOT        SCALE
             - serious         Ionian          I            C-D-E-F-G-A-B-C
             - sad             Dorian          II          D-E-F-G-A-B-C-D
             - mystic          Phrygian        III            E-F-G-A-B-C-D-E
             - harmonius       Lydian          IV            F-G-A-B-C-D-E-F
             - happy           Mixolydian      V            G-A-B-C-D-E-F-G
             - devout          Aeolian         VI            A-B-C-D-E-F-G-A
             - angelical       Locrian         VII            B-C-D-E-F-G-A-B
 
        PATTERNS

 
 ------------------------------------------------------------------------------------------
 
 
 VERSION 1.4
 
    ACCOMPANIMENTS
  
        Guitar / Piano (Lead)
 
        Guitar / Piano (Rhythm)
 
        Bass
 
        Drums

 
 ------------------------------------------------------------------------------------------
 
 
 VERSION 1.5
  
    REDESIGN
 
        NEW DESIGN
        
        SCREENS
            Welcome & Logo page
            How to Use App page(pop-up on first-use, info button after)
                examples
                demonstration
            About page: scales, notes, progressions
            FAQs page: credit to author, notice about checking against existing songs, our goal to revolutionize music writing
            Music Generator Constraints page
            Results page
        APP RELEASE
            Try to release November 2021

 
 ------------------------------------------------------------------------------------------

 */




