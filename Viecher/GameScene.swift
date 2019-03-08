//
//  GameScene.swift
//  Viecher
//
//  Created by Benny Peckruhn on 07.03.19.
//  Copyright © 2019 Benny Peckruhn. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    private var creature : CreatureNode?
    
    override func didMove(to view: SKView) {
        var i = 0;
        
        while i < 800 {
            let randomX = Int.random(in: -500 ..< -300)
            let randomY = Int.random(in: -100 ..< 100)
            
            creature = CreatureNode(x: randomX, y: randomY)
            
            creature?.draw()
            
            addChild(creature!)
            
            i += 1
        }
        
        // Get label node from scene and store it for use later
//        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
//        if let label = self.label {
//            label.alpha = 0.0
//            label.run(SKAction.fadeIn(withDuration: 2.0))
//        }
//
//        // Create shape node to use during mouse interaction
//        let w = (self.size.width + self.size.height) * 0.05
//        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
//
//        if let spinnyNode = self.spinnyNode {
//            spinnyNode.lineWidth = 2.5
//
//            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
//            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
//                                              SKAction.fadeOut(withDuration: 0.5),
//                                              SKAction.removeFromParent()]))
//        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        enumerateChildNodes(withName: "creature") {
            node, _ in
            let creature = node as! CreatureNode
            creature.move()
        }
    }
}
