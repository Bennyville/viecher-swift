//
//  Tile.swift
//  Viecher
//
//  Created by Benny Peckruhn on 08.03.19.
//  Copyright © 2019 Benny Peckruhn. All rights reserved.
//

import Foundation
import SpriteKit

class Tile : SKNode {
    var x : Int
    var y : Int
    var color : SKColor;
    var isWater : Bool
    var foodValue : Float
    
    init(x: Int, y: Int, color: SKColor, isWater: Bool, foodValue : Float) {
        self.x = x
        self.y = y
        self.color = color
        self.isWater = isWater
        self.foodValue = foodValue
        
        super.init()
    }
    
    func draw(tileSize : Int) -> SKShapeNode {
        let tile = SKShapeNode.init(rectOf: CGSize(width: tileSize, height: tileSize))
        tile.name = "tile"
        tile.position = CGPoint(x: self.x * tileSize, y: self.y * tileSize)
        tile.fillColor = self.color
        tile.lineWidth = 0
    
        return tile
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
