//
//  FourViewController.swift
//  transform
//
//  Created by GrigorevaE on 10.08.2021.
//

import UIKit

class FourViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var rectangle = UIView()
    var array: [UIView] = []
    
    func draw() {
        rectangle.backgroundColor = .blue
        view.addSubview(rectangle)
        self.array.append(rectangle)
        
        let red = UIView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        red.backgroundColor = .red
        rectangle.addSubview(red)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let position = touch.location(in: self.view)
        let target = rectangle.center
        let angle = atan2(target.y-position.y, target.x-position.x)
        rectangle.transform = CGAffineTransform(rotationAngle: angle)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if array.isEmpty {
            if let touch = touches.first {
                let x = touch.location(in: self.view).x
                let y = touch.location(in: self.view).y
                rectangle = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
                rectangle.center = CGPoint(x: x, y: y)
                draw()
            }
        }
    }
    
}
