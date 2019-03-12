//
//  Neuron.swift
//  Viecher
//
//  Created by Benny Peckruhn on 11.03.19.
//  Copyright © 2019 Benny Peckruhn. All rights reserved.
//

import Foundation

class Neuron {
    private var name : String?
    private var value : Float? = nil
    private var connections : Array<Connection?> = []
    
    init() {}
    
    init(name : String) {
        self.name = name
    }
    
    func addConnection(connection : Connection) {
        self.connections.append(connection)
    }
    
    func activate() {
        var value : Float = 0
        
        for connection in self.connections {
            value += (connection?.getValue())!
        }
        
        value = tanh(value)
        
        self.value = value
    }
    
    func getValue() -> Float {
        if(self.value == nil) {
            self.activate()
        }
        
        return self.value!
    }
    
    func setValue(value: Float) {
        self.value = value
    }
}
