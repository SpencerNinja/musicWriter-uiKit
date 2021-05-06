//
//  ViewController.swift
//  TheMusicWriter
//
//  Created by Spencer Hurd on 3/25/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickableScales.count
    }
    
    
    @IBOutlet weak var scaleLength: UITextField!
    
    @IBOutlet weak var scalePicker: UIPickerView!
    
    var pickableScales: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Connect data:
        self.scalePicker.delegate = self
        self.scalePicker.dataSource = self
        
        // Input the data into the array
        pickableScales = ["C Major", "Pentatonic", "Pentatonic2", "A Minor", "C Major Pentatonic", "A Minor Pentatonic", "Blues", "Harmonic Minor", "Altered Dominant", "Flamenco", "Hungarian Minor", "Persian", "Spanish", "Japanese", "Random"]
        
    }

}

