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
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.backgroundColor = .black
        label.textAlignment = .center
        return label
    }()
    
    lazy var greenModeSwitch: UISwitch = {
        let theSwitch = UISwitch()
        theSwitch.isOn = true
        //adds action to control
        theSwitch.addTarget(self, action: #selector(switchPressedAgain(sender:)), for: .valueChanged)
        return theSwitch
    }()
    
    @objc func switchPressedAgain (sender: UISwitch){
        self.greenModeStatus = sender.isOn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        addConstraintsToSubviews()
        greenModeStatus = true
    }

    private func setUpSubviews() {
        self.view.addSubview(label)
        self.view.addSubview(greenModeSwitch)
    }
    
    private func addConstraintsToSubviews() {
        label.translatesAutoresizingMaskIntoConstraints = false
        greenModeSwitch.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            greenModeSwitch.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),        greenModeSwitch.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        label.centerXAnchor.constraint(equalTo: greenModeSwitch.centerXAnchor),
        label.topAnchor.constraint(equalTo: greenModeSwitch.bottomAnchor, constant: 30)
        ])
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

