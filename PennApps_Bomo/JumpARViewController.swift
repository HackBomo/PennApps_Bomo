//
//  ViewController.swift
//  PennApps_Bomo
//
//  Created by Antonio on 9/8/17.
//  Copyright © 2017 Antonio. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class JumpARViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    let didPop = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
        
        
        let jumpPop = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "jumpPop") as! JumpPop
        
        self.addChildViewController(jumpPop)
        jumpPop.view.frame = self.view.frame
        self.view.addSubview(jumpPop.view)
        jumpPop.didMove(toParentViewController: self)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    
}


