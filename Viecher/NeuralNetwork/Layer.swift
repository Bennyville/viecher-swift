//
//  Layer.swift
//  Viecher
//
//  Created by Benny Peckruhn on 11.03.19.
//  Copyright © 2019 Benny Peckruhn. All rights reserved.
//

import Foundation

class Layer {
    private var neurons : Array<Neuron?> = []
    
    init() {}
    
//    Hidden Layer
    init(neuronAmount : Int) {
        for i in 0..<neuronAmount {
            let hiddenNeuron = Neuron(name: "hidden_\(i)")
            addNeuron(neuron: hiddenNeuron)
        }
    }
    
    func addNeuron(neuron : Neuron) {
        self.neurons.append(neuron)
    }
    
    func getNeurons() -> Array<Neuron?> {
        return self.neurons
    }
}
