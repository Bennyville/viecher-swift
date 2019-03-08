//
//  Creature.swift
//  Viecher
//
//  Created by Benny Peckruhn on 08.03.19.
//  Copyright © 2019 Benny Peckruhn. All rights reserved.
//

import Foundation
import SpriteKit

class CreatureNode : SKNode {
    var x : Int
    var y : Int
    var rotation : Int
    
    init(x : Int, y : Int, rotation : Int) {
        self.x = x
        self.y = y
        self.rotation = rotation
        
        super.init()
        
        position = CGPoint(x: self.x, y: self.y)
        name = "creature"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func draw() {
        let body = SKShapeNode(circleOfRadius: 20)
        body.position = CGPoint(x: position.x, y: position.y)
        body.strokeColor = SKColor.black
        
        
        let frontIndicator = SKShapeNode()
        
        let frontIndicatorPath = CGMutablePath()
        frontIndicatorPath.move(to: CGPoint(x: position.x, y: position.y))
        frontIndicatorPath.addLine(to: CGPoint(x: position.x + 50, y: position.y + 50))
        
        frontIndicator.path = frontIndicatorPath
        frontIndicator.strokeColor = SKColor.black
        
        
        addChild(body)
        addChild(frontIndicator)
    }
    
    func move() {
        position = CGPoint(x: position.x + 1, y: position.y)
    }
}
