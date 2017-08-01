//
//  ViewController.swift
//  DesignableView
//
//  Created by Eryus Developer on 29/07/17.
//  Copyright © 2017 Eryushion Techsol. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    var emitter = CAEmitterLayer()
    var colors:[UIColor] = [
        Colors.red,
        Colors.blue,
        Colors.green,
        Colors.yellow
    ]
    
    var images:[UIImage] = [
       Images.box,
//        Images.triangle,
        Images.circle,
        //Images.swirl
    ]
    
    var velocities:[Int] = [
        100,
        90,
        150,
        200
    ]
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emitter.emitterPosition = CGPoint(x: view.frame.size.width / 2, y: -10)
        emitter.emitterShape = kCAEmitterLayerLine
        emitter.emitterSize = CGSize(width: view.frame.size.width, height: 2.0)
        emitter.emitterCells = generateEmitterCells()
        view.layer.insertSublayer(emitter, at: 1)
        //view.layer.addSublayer(emitter)
        //view.clipsToBounds = true
    }
    
    private func generateEmitterCells() -> [CAEmitterCell] {
        var cells:[CAEmitterCell] = [CAEmitterCell]()
        for index in 0..<16 {
            let cell = CAEmitterCell()
            
            cell.birthRate = 1
            cell.lifetime = 14.0
            cell.lifetimeRange = 0
            cell.velocity = CGFloat(getRandomVelocity())
            cell.velocityRange = 0
            cell.emissionLongitude = CGFloat(Double.pi)
            cell.emissionRange = 0.5
            cell.spin = 3.5
            cell.spinRange = 0
            cell.color = getNextColor(i: index)
            cell.contents = getNextImage(i: index)
            cell.scale = 0.3
            cell.scaleRange = 0.4
            
            
            cells.append(cell)
        }
        
        return cells
    }
    
    private func getRandomVelocity() -> Int {
        return velocities[getRandomNumber()]
    }
    
    private func getRandomNumber() -> Int {
        return Int(arc4random_uniform(4))
    }
    
    private func getNextColor(i:Int) -> CGColor {
        if i <= 4 {
            return colors[0].cgColor
        } else if i <= 8 {
            return colors[1].cgColor
        } else if i <= 12 {
            return colors[2].cgColor
        } else {
            return colors[3].cgColor
        }
    }
    
    private func getNextImage(i:Int) -> CGImage {
        return images[i % 2].cgImage!
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        let emitter = Emitter.get(with: #imageLiteral(resourceName: "dribbble-logo"))
//        emitter.emitterPosition = CGPoint(x: view.frame.width / 2, y: 0)
//        emitter.emitterSize = CGSize(width: view.frame.width, height: 2)
//        view.layer.addSublayer(emitter)
        
        
//        let particleEmitter = CAEmitterLayer()
//        particleEmitter.emitterPosition = CGPoint(x: view.center.x, y: -96)
//        particleEmitter.emitterShape = kCAEmitterLayerLine
//        particleEmitter.emitterSize = CGSize(width: view.frame.size.width, height: 1)
//        let red = makeEmitterCell(color: UIColor.red)
//        let green = makeEmitterCell(color: UIColor.green)
//        let blue = makeEmitterCell(color: UIColor.blue)
//        particleEmitter.emitterCells = [red, green, blue]
//        view.layer.addSublayer(particleEmitter)
    }
   /* func makeEmitterCell(color: UIColor) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = 3
        cell.lifetime = 7.0
        cell.lifetimeRange = 0
        cell.color = color.cgColor
        cell.velocity = 200
        cell.velocityRange = 50
        cell.emissionLongitude = CGFloat.pi
        cell.emissionRange = CGFloat.pi / 4
        cell.spin = 2
        cell.spinRange = 3
        cell.scaleRange = 0.5
        cell.scaleSpeed = -0.05
        cell.contents = #imageLiteral(resourceName: "dribbble-logo").cgImage
        return cell
    }*/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

