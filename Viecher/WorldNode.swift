//
//  TileMap.swift
//  Viecher
//
//  Created by Benny Peckruhn on 08.03.19.
//  Copyright © 2019 Benny Peckruhn. All rights reserved.
//

import Foundation
import SpriteKit

class WorldNode : SKNode {
    var world : [[Int]]
    var tileSize : Int
    var tiles : [[Any]]
    
    init(world : [[Int]], tileSize : Int) {
        self.world = world
        self.tileSize = tileSize
        self.tiles = [[]]
        
        super.init()
        
        name = "world"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func generate() {
        var x = 0
        while x < self.world.count {
            self.tiles.append([])
            var y = 0
            while y < self.world[0].count {
                self.tiles[x].append([])
                switch(self.world[x][y]) {
                case 0:
                    // Water
                    self.tiles[x][y] = Tile(x: x, y: y, color: SKColor.blue, isWater: true, foodValue: -1);
                    break;
                case 1:
                    // Grass
                    self.tiles[x][y] = Tile(x: x, y: y, color: SKColor.green, isWater: false, foodValue: 100);
                    break;
                default:
                    // Water
                    self.tiles[x][y] = Tile(x: x, y: y, color: SKColor.blue, isWater: true, foodValue: -1);
                    break;
                }
                y += 1;
            }
            x += 1;
        }
    }
    
    func draw() {
        
        print("\n")
        var x = 0
        while x < self.tiles.count - 1 {
            var y = 0
            while y < self.tiles[0].count {
                let child = self.tiles[x][y] as! Tile
                addChild(child.draw(tileSize: self.tileSize))
                
                y += 1;
            }
            x += 1;
        }
    }
}
