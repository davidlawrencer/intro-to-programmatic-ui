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
    
    var label: UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 300, width: 300, height: 40))
        label.textColor = .blue
        label.backgroundColor = .black
        label.textAlignment = .center
        label.text = "hello WORLD"
        return label
    }()
    
    var greenModeSwitch: UISwitch = {
        let theSwitch = UISwitch (frame: CGRect(x: 45, y: 350, width: 40, height: 40))
        //adds action to control
        theSwitch.isOn = true
        theSwitch.addTarget(self, action: #selector(switchPressedAgain(sender:)), for: .valueChanged)
        return theSwitch
    }()
    
    @objc func switchPressedAgain (sender: UISwitch){
        self.greenModeStatus = sender.isOn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        greenModeStatus = true
    }

    private func setUpSubviews() {
        self.view.addSubview(label)
    self.view.addSubview(greenModeSwitch)
    }
    
    private func refreshGreenMode() {
        if greenModeStatus {
            self.view.backgroundColor = .green
            self.label.textColor = .white
            self.label.text = "Green Mode is on!"
        } else {
            self.view.backgroundColor = .white
            self.label.textColor = .green
            self.label.text = "Green Mode is off!"
        }
    }
}

