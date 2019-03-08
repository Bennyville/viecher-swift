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
    
    init(x : Int, y : Int) {
        self.x = x
        self.y = y
        
        super.init()
        
        position = CGPoint(x: self.x, y: self.y)
        name = "creature"
    }
    
    func drawBody() {
        let body = SKShapeNode(circleOfRadius: 20)
        body.position = CGPoint(x: position.x, y: position.y)
        body.strokeColor = SKColor.black
        
        addChild(body)
    }
    
    func drawFeeler() {
        let feeler = SKShapeNode()
        
        let feelerLine = CGMutablePath()
        feelerLine.move(to: CGPoint(x: position.x, y: position.y))
        feelerLine.addLine(to: CGPoint(x: position.x + 10, y: position.y + 10))
        
        feeler.path = feelerLine
        feeler.strokeColor = SKColor.black
        
        addChild(feeler)
    }
    
    func move() {
        position = CGPoint(x: position.x + 1, y: position.y)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
