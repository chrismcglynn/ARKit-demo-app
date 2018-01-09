//
//  ViewController.swift
//  ARKitGame
//
//  Created by Chris McGlynn on 1/8/18.
//  Copyright © 2018 Chris McGlynn. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var sceneView: ARSCNView!
    
    var counter:Int = 0 {
        didSet {
            counterLabel.text = "\(counter)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = SCNScene()
        
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        
        sceneView.session.run(configuration)
        
        addObject()
    }
    
    func addObject() {
        
        let ship = SpaceShip()
        ship.loadModal()
        
        let xPos = randomPosition(lowerBound: 25.5, upperBound: 1.5)
        let yPos = randomPosition(lowerBound: -25.5, upperBound: 1.5)
        
        ship.position = SCNVector3(xPos, yPos, -3)
        
        sceneView.scene.rootNode.addChildNode(ship)
        
    }
    
    func randomPosition (lowerBound lower:Float, upperBound upper:Float) -> Float {
        return Float(arc4random()) / Float(UInt32.max) * (lower - upper) + upper
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: sceneView)
            
            let hitList = sceneView.hitTest(location, options: nil)
            
            if let hitObject = hitList.first {
                let node = hitObject.node
                if node.name == "Falcon" {
                    counter += 1
                    node.removeFromParentNode()
                    addObject()
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

