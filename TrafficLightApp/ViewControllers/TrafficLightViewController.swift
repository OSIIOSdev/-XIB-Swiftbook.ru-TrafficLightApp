//
//  ViewController.swift
//  TrafficLightApp
//
//  Created by OSIIOSdev on 07.03.2025.
//

import UIKit

enum Lights {
    case redLight, yellowLight, greenLight
}

final class TrafficLightViewController: UIViewController {

    // MARK: @IBOutlets
    
    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    
    @IBOutlet var switchButton: UIButton!
    
    
    // MARK: Private properties
    private lazy var lightIsOn = 1.0
    private lazy var lightIsOff = 0.2
    
    private lazy var currentLight: Lights = .redLight
    
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [redLightView, yellowLightView, greenLightView].forEach {
            $0.alpha = lightIsOff
        }
        
        setupButton()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        [redLightView, yellowLightView, greenLightView].forEach {
            $0.layer.cornerRadius = $0.frame.width / 2
        }
    }

    // MARK: @IBActions
    
    @IBAction func switchButtonPressed(_ sender: UIButton) {
        if sender.currentTitle == "START" {
            sender.setTitle( "NEXT", for: .normal)
        }
        
        switch currentLight {
        case .redLight:
            redLightView.alpha = lightIsOn
            greenLightView.alpha = lightIsOff
            currentLight = .yellowLight
        case .yellowLight:
            yellowLightView.alpha = lightIsOn
            redLightView.alpha = lightIsOff
            currentLight = .greenLight
        case .greenLight:
            greenLightView.alpha = lightIsOn
            yellowLightView.alpha = lightIsOff
            currentLight = .redLight
        }
    }
    
    
    // MARK: Private methods
    private func setupButton() {
        switchButton.setTitle( "START", for: .normal)
        switchButton.layer.borderColor = UIColor.white.cgColor
        switchButton.layer.borderWidth = 2.5
        switchButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        switchButton.layer.cornerRadius = 15
    }
    
}

