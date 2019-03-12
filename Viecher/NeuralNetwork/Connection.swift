//
//  Connection.swift
//  Viecher
//
//  Created by Benny Peckruhn on 11.03.19.
//  Copyright © 2019 Benny Peckruhn. All rights reserved.
//

import Foundation

class Connection {
    private var from : Neuron
    private var activationFunction : String?
    private var weight : Float = 1.0
    
    init(from : Neuron) {
        self.from = from
    }
    
    init(from : Neuron, activationFunction : String = "tanh") {
        self.from = from
        self.activationFunction = activationFunction
    }
    
    func getValue() -> Float {
        let value = self.from.getValue() * self.weight
        return value
    }
    
    func setWeight(weight: Float) {
        self.weight = weight
    }
    
    func getWeight() -> Float {
        return self.weight
    }
}
