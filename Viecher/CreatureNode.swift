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
    var rotation : CGFloat
    
    init(x : Int, y : Int, rotation : CGFloat) {
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
        body.lineWidth = 0
        body.fillColor = SKColor.black
        
        
        let rotationinRadians = Helper.deg2rad(self.rotation)
        
        let lineRotationX = 0 * sin(rotationinRadians) + 20 * cos(rotationinRadians) + position.x
        let lineRotationY = 0 * cos(rotationinRadians) - 20 * sin(rotationinRadians) + position.y

        
        let frontIndicator = SKShapeNode()
        
        let frontIndicatorPath = CGMutablePath()
        frontIndicatorPath.move(to: CGPoint(x: position.x, y: position.y))
        frontIndicatorPath.addLine(to: CGPoint(x: position.x + lineRotationX, y: position.y + lineRotationY))
        
        frontIndicator.path = frontIndicatorPath
        frontIndicator.strokeColor = SKColor.white
        
        
        addChild(body)
        addChild(frontIndicator)
    }
    
    func move() {
        let rotationinRadians = Helper.deg2rad(self.rotation)
        
        let velocityX = 0 * sin(rotationinRadians) + 1 * cos(rotationinRadians)
        let velocityY = 0 * cos(rotationinRadians) - 1 * sin(rotationinRadians)
        
        position = CGPoint(x: position.x + velocityX, y: position.y + velocityY)
    }
}
