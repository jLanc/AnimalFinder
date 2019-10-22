//
//  StatusViewController.swift
//  Animal Finder
//
//  Created by Jake on 22/10/19.
//  Copyright © 2019 Jake. All rights reserved.
//

import Foundation
import ARKit

class StatusViewController: UIViewController {
    //MARK: - Types
    
    enum MessageType {
        case trackingStateEscalation
        case plantEstimation
        case contentPlacement
        case focusSquare
        
        static var all: [MessageType] = [
        .trackingStateEscalation,
        .plantEstimation,
        .contentPlacement,
        .focusSquare
        ]
    }
    
    // MARK: - IBOutlets
    
    //these link the back end code to the front end ui
    @IBOutlet weak private var messagePanel: UIVisualEffectView!
    @IBOutlet weak private var messageLabel: UILabel!
    @IBOutlet weak private var restartExperienceButton: UIButton!
    
    // MARK: - Properties
    //triggers when the "Eestart Experience" button is pressed
    var restartExperienceHandler: () ->Void = {}
    
    private let displayDuration: TimeInterval = 6
    
    //timer for hiding messages
    private var messageHideTimer: Timer?
    private var timers: [MessageType: Timer] = [:]
    
    
}
