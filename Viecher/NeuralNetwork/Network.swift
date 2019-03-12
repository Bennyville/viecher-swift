//
//  Network.swift
//  Viecher
//
//  Created by Benny Peckruhn on 11.03.19.
//  Copyright © 2019 Benny Peckruhn. All rights reserved.
//

import Foundation

class Network {
    private var layers : Array<Layer?> = []
    
    func addLayer(layer: Layer) {
        self.layers.append(layer)
    }
    
    func generateFullMesh() {
        var layerIndex = 1;
        
        while layerIndex < self.layers.count {
            var prevLayerIndex = layerIndex - 1;
            
            let currentNeurons = layers[layerIndex]!.getNeurons()
            let prevNeurons = layers[prevLayerIndex]!.getNeurons()
            
            for currentNeuron in currentNeurons {
                for prevNeuron in prevNeurons {
                    let connection = Connection(from: prevNeuron!)
                    let randomWeight = Float.random(in: -1 ..< 1)
                    connection.setWeight(weight: randomWeight)
                    currentNeuron!.addConnection(connection: connection)
                }
            }
            
            layerIndex += 1
        }
    }
}
