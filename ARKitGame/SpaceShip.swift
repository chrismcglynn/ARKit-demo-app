//
//  SpaceShip.swift
//  ARKitGame
//
//  Created by Chris McGlynn on 1/8/18.
//  Copyright © 2018 Chris McGlynn. All rights reserved.
//

import ARKit

class SpaceShip: SCNNode {
    
    func loadModal() {
        guard let virtualObjectScene = SCNScene(named: "art.scnassets/Falcon.dae") else {return}
    
        let wrapperNode = SCNNode()
        
        for child in virtualObjectScene.rootNode.childNodes {
            wrapperNode.addChildNode(child)
        }
        
        self.addChildNode(wrapperNode)
        
    }
    
}
