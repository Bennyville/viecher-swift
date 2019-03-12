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
    private var brain : Network?
    
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
    
    func initBrain() {
        let inputPositionFoodValue : Neuron = Neuron(name: "inPositionFoodValue")
        let inputFeelerFoodValue   : Neuron = Neuron(name: "inFeelerFoodValue")
        let inputPositionOnWater   : Neuron = Neuron(name: "inPositionOnWater")
        let inputFeelerOnWater     : Neuron = Neuron(name: "inFeelerOnWater")
        let inputAge               : Neuron = Neuron(name: "inAge")
        let inputEnergy            : Neuron = Neuron(name: "inEnergy")
        
        let inputLayer : Layer = Layer()
        inputLayer.addNeuron(neuron: inputPositionFoodValue)
        inputLayer.addNeuron(neuron: inputFeelerFoodValue)
        inputLayer.addNeuron(neuron: inputPositionOnWater)
        inputLayer.addNeuron(neuron: inputFeelerOnWater)
        inputLayer.addNeuron(neuron: inputAge)
        inputLayer.addNeuron(neuron: inputEnergy)
        
        
        let hiddenLayer = Layer(neuronAmount: 10)
        
        
        let outMove         : Neuron = Neuron(name: "outMove")
        let outRotate       : Neuron = Neuron(name: "outRotate")
        let outEat          : Neuron = Neuron(name: "outEat")
        let outBirth        : Neuron = Neuron(name: "outBirth")
        let outRotateFeeler : Neuron = Neuron(name: "outRotateFeeler")
        
        let outputLayer : Layer = Layer()
        outputLayer.addNeuron(neuron: outMove)
        outputLayer.addNeuron(neuron: outRotate)
        outputLayer.addNeuron(neuron: outEat)
        outputLayer.addNeuron(neuron: outBirth)
        outputLayer.addNeuron(neuron: outRotateFeeler)
        
        
        self.brain = Network()
        self.brain!.addLayer(layer: inputLayer)
        self.brain!.addLayer(layer: hiddenLayer)
        self.brain!.addLayer(layer: outputLayer)
        
        self.brain!.generateFullMesh()
        
        inputPositionFoodValue.setValue(value: -1)
        inputFeelerFoodValue.setValue(value: -1)
        inputPositionOnWater.setValue(value: -1)
        inputFeelerOnWater.setValue(value: -1)
        inputAge.setValue(value: -1)
        inputEnergy.setValue(value: -1)
        
        print(outMove.getValue())
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
