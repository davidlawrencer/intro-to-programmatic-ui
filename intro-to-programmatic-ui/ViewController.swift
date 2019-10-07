//
//  ViewController.swift
//  intro-to-programmatic-ui
//
//  Created by David Rifkin on 10/7/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var greenModeStatus = false {
        didSet {
            refreshGreenMode()
        }
    }
    
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greenModeStatus = true
    }

    @IBAction func modeSwitchPressed(_ sender: UISwitch) {
        self.greenModeStatus = sender.isOn        
    }
    
    private func refreshGreenMode() {
        if greenModeStatus {
            self.view.backgroundColor = .green
            self.statusLabel.textColor = .white
            self.statusLabel.text = "Green Mode is on!"
        } else {
            self.view.backgroundColor = .white
            self.statusLabel.textColor = .green
            self.statusLabel.text = "Green Mode is off!"
        }
    }
}

