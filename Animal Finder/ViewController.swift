//
//  ViewController.swift
//  Animal Finder
//
//  Created by Jake on 14/10/19.
//  Copyright © 2019 Jake. All rights reserved.
//

import ARKit




class ViewController: UIViewController, UIGestureRecognizerDelegate, ARSKViewDelegate, ARSessionDelegate {
    
    @IBOutlet weak var sceneView: ARSKView!
    
    // The view controller that displays the status and "restart experience" UI.
    private lazy var statusViewController: StatusViewController = {
        return children.lazy.compactMap({ $0 as? StatusViewController }).first!
    }()
    
    
    
    //MARK: - View controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //configure and show the sprite that overlays on screen / camera view
        let overlayScene = SKScene()
        overlayScene.scaleMode = .aspectFill
        sceneView.delegate = self
        sceneView.presentScene(overlayScene) //sets the overlay to the scene coming from camera
        
        // Hook up status view controller callback.
        statusViewController.restartExperienceHandler = { [unowned self] in
            self.restartSession()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) { //used to override attributes of view
        super.viewWillAppear(animated)
        
        //create a session configuration
        // - the configuration settings make a scene look real with fitting overlay
        let configuration = ARWorldTrackingConfiguration()
        
        //run the view's session with given attirubtes
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //pause the camera's scene tracking
        sceneView.session.pause()
    }
    
    
    
    
    


}

