////
////  ViewController.swift
////  PennApps_Bomo
////
////  Created by Antonio on 9/8/17.
////  Copyright © 2017 Antonio. All rights reserved.
////
//
//import UIKit
//import SceneKit
//import ARKit
//
//class ARViewController: UIViewController, ARSCNViewDelegate {
//
//    @IBOutlet var sceneView: ARSCNView!
//
//    let didPop = UserDefaults.standard
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        var scoreLabel: SKLabelNode!
//        // Set the view's delegate
//        sceneView.delegate = self
//
//
//        let sphere = SCNSphere(radius: 0.07)
//        let node = SCNNode()
//        let knee = SCNNode()
//        let hip = SCNNode()
//
//
//        let material = SCNMaterial()
//        //material.diffuse.contents = UIImage(named: "art.scnassets/texture.png")
//        //sphere.materials = [material]
//        node.position = SCNVector3(x: 0, y: -0.5, z: -0.5)
//        node.geometry = sphere
//
//        knee.position = SCNVector3(x: 0.1, y: -0.3, z: -0.6)
//        knee.geometry = sphere
//
//        hip.position = SCNVector3(x: -0, y: 0.1, z: -0.5)
//        hip.geometry = sphere
//
//
//        print(getAngle(ankle: node.position, knee: knee.position, hip: hip.position))
//        print(getDepth(ankle: node.position, hip: hip.position))
//        print(getInwards(knee: knee.position, hip: hip.position))
//        print("hello")
//
//        sceneView.scene.rootNode.addChildNode(node)
//        sceneView.scene.rootNode.addChildNode(knee)
//        sceneView.scene.rootNode.addChildNode(hip)
//        sceneView.automaticallyUpdatesLighting = true
//
//
//        let skScene = SKScene(size: CGSize(width: 200, height: 80))
//        skScene.backgroundColor = UIColor.white
//
//        let bar = SKSpriteNode(color:.green,size:CGSize(width: 150, height : 160))
//        skScene.addChild(bar)
//
//
////
//        let plane = SCNPlane(width: 0.1, height: 0.005)
//        let sample = SCNNode(geometry: plane)
//        material.isDoubleSided = true
//        material.diffuse.contents = skScene
//        plane.materials = [material]
//        sceneView.scene.rootNode.addChildNode(sample)
//
//            let squatPop = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "squatPop") as! SquatPop
//
//            self.addChildViewController(squatPop)
//            squatPop.view.frame = self.view.frame
//            self.view.addSubview(squatPop.view)
//            squatPop.didMove(toParentViewController: self)
//
//
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        // Create a session configuration
//        let configuration = ARWorldTrackingConfiguration()
//
//        // Run the view's session
//        sceneView.session.run(configuration)
//
//
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//        // Pause the view's session
//        sceneView.session.pause()
//    }
//
//    override var prefersStatusBarHidden : Bool {
//        return true
//    }
//
//
//    func getAngle(ankle: SCNVector3, knee: SCNVector3, hip: SCNVector3) -> Float {
//        let a = pow(knee.x - ankle.x,2) + pow(knee.y-ankle.y,2),
//            b = pow(knee.x-hip.x,2) + pow(knee.y-hip.y,2),
//            c = pow(hip.x-ankle.x,2) + pow(hip.y-ankle.y,2);
//
//        var division = (360 / (2 * M_PI))
//        return (acos( (a+b-c) / sqrt(4*a*b))) * Float(division);
//
//    }
//
//    func getDepth(ankle: SCNVector3, hip: SCNVector3) -> Float {
//        let depth = (hip.y - ankle.y)
//        return depth
//    }
//
//    func getInwards(knee: SCNVector3, hip: SCNVector3) -> Float {
//        let difference = (hip.z - knee.z)
//        return difference
//    }
//
//}
//
