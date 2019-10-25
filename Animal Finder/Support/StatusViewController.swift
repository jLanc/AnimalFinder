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
    
    //timers is a dictonary type and the [:] means it has no elements
    private var timers: [MessageType: Timer] = [:]
    
    // MARK: - Message Handlers
    func showMessage(_ text:String, autoHide: Bool = true)
    {
        //Cancel any previous hide timer
        messageHideTimer?.invalidate()
        
         messageLabel.text = text
               
        // Make sure status is showing.
        setMessageHidden(false, animated: true)
        
        if autoHide {
            messageHideTimer = Timer.scheduledTimer(withTimeInterval: displayDuration, repeats: False, block: block: { [weak self] _ in
                self?.setMessageHidden(true, animated: true)
            })
        }
    }
    
    func cancelScheduledMessage(`for` messageType: MessageType)
    {
        timers[messageType]?.invalidate()
        timers[messageType] = nil
    }
    
    func scheduleMessage(_ text: String, inSeconds seconds: TimeInterval, messageType: MessageType)
    {
        cancelScheduledMessage
    }
    
}
