//
//  ThirdViewController.swift
//  transform
//
//  Created by GrigorevaE on 09.08.2021.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var rectangle = UIView()
    var array: [UIView] = []
    let height: CGFloat = 100
    var index = 0
    
    func draw() {
        
        rectangle.backgroundColor = .blue
        view.addSubview(rectangle)
        self.array.append(rectangle)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if array.isEmpty {
            if let touch = touches.first {
                let x = touch.location(in: self.view).x - self.height / 2
                let y = touch.location(in: self.view).y - self.height / 2
                rectangle = UIView(frame: CGRect(x: x, y: y, width: self.height, height: self.height))
                
                draw()
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

        let touch = touches.first!
        let position = touch.location(in: self.view)
        let target = rectangle.center
//        print(position.x)
        let transitionX = position.x - target.x
//        let transitionY = target.y-position.y
        let trans = transitionX / 100
        print(trans)
//        let sizeOr = rectangle.transform
        let scale = CGAffineTransform(scaleX: trans, y: trans)
        rectangle.transform = scale
    }
}
