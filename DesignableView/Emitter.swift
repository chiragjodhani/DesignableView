//
//  Emitter.swift
//  DesignableView
//
//  Created by Eryus Developer on 31/07/17.
//  Copyright © 2017 Eryushion Techsol. All rights reserved.
//

import Foundation
import UIKit
class Emitter {
    static func get(with image: UIImage,color: UIColor) -> CAEmitterLayer {
        let emitter  = CAEmitterLayer()
        emitter.emitterShape = kCAEmitterLayerLine
        emitter.emitterCells = generateEmitterCells(with: image)
        return emitter
    }
    static func generateEmitterCells(with image: UIImage) -> [CAEmitterCell]{
        var cells = [CAEmitterCell]()
        let cell = CAEmitterCell()
        
        cell.contents = image.cgImage
        cell.birthRate = 1
        cell.lifetime = 50
        cell.velocity = CGFloat(25)
        cell.emissionLongitude = (180 * (.pi/180))
        cell.emissionRange = (45 * (.pi/180))
        cell.scale = 0.4
        cell.scaleRange = 0.3
        cells.append(cell)
        
        return cells
    }
}
