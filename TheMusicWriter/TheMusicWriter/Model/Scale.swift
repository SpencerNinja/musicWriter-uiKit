//
//  Scale.swift
//  TheMusicWriter
//
//  Created by Spencer Hurd on 3/25/21.
//

import Foundation

let scalesDictionary = [
    "C Major": [C, D, E, F, G, A, B, C],
    "Pentatonic": [C, D, E, G, A],
    "Pentatonic2": [A, C, D, E, G],
    "A Minor": [A, B, C, D, E, F, G, A],
    "C Major Pentatonic": [C, D, E, G, A],
    "A Minor Pentatonic": [A, C, D, E, G],
    "Blues": [A, C, D, Eb, E, G, A],
    "Harmonic Minor": [C, D, Eb, F, G, Ab, B, C],
    "Altered Dominant": [C, Db, Eb, Fb, Gb, Ab, Bb],
    "Flamenco": [C, Db, E, F, G, Ab, B, C],
    "Hungarian Minor": [B, Db, D, Fb, Gb, G, Bb, B],
    "Persian": [C, Db, E, F, Gb, Ab, B, C],
    "Spanish": [C, Db, E, F, G, Ab, Bb, C],
    "Japanese": [C, Db, F, G, Bb, C]
]

/*
 Scales
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

 To match the emotions this is the list starting from C major.
    - MOOD            NAME            ROOT        SCALE
    - serious         Ionian          I            C-D-E-F-G-A-B-C
    - sad             Dorian          II          D-E-F-G-A-B-C-D
    - mystic          Phrygian        III            E-F-G-A-B-C-D-E
    - harmonius       Lydian          IV            F-G-A-B-C-D-E-F
    - happy           Mixolydian      V            G-A-B-C-D-E-F-G
    - devout          Aeolian         VI            A-B-C-D-E-F-G-A
    - angelical       Locrian         VII            B-C-D-E-F-G-A-B

# Function with all the scales
def scales():
    scaleDictionary = {"C Major": [C, D, E, F, G, A, B, C], "Pentatonic": [C, D, E, G, A], "Pentatonic2": [A, C, D, E, G], "A Minor": [A, B, C, D, E, F, G, A], "C Major Pentatonic": [C, D, E, G, A], "A Minor Pentatonic": [A, C, D, E, G], "Blues": [A, C, D, Eb, E, G, A], "Harmonic Minor": [C, D, Eb, F, G, Ab, B, C], "Altered Dominant": [C, Db, Eb, Fb, Gb, Ab, Bb], "Flamenco": [C, Db, E, F, G, Ab, B, C], "Hungarian Minor": [B, Db, D, Fb, Gb, G, Bb, B], "Persian": [C, Db, E, F, Gb, Ab, B, C], "Spanish": [C, Db, E, F, G, Ab, Bb, C], "Japanese": [C, Db, F, G, Bb, C]}
    return scaleDictionary
 
 */
