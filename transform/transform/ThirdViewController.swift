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
    
    var touchFirstX: CGFloat = 0
    var touchFirstY: CGFloat = 0
    
    var touchLastX: CGFloat = 0
    var touchLastY: CGFloat = 0
    
    var index = 0
    
    func draw() {
        
        rectangle.backgroundColor = .blue
        view.addSubview(rectangle)
        self.array.append(rectangle)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if array.isEmpty {
            if let touch = touches.first {
                let x = touch.location(in: self.view).x - 50
                let y = touch.location(in: self.view).y - 50
                rectangle = UIView(frame: CGRect(x: x, y: y, width: 100, height: 100))
                
                draw()
            }
        } else {
            if let x = touches.first?.location(in: self.view).x, let y = touches.first?.location(in: self.view).y {
                self.touchFirstX = x
                self.touchFirstY = y
                
                self.index += 1
            }
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if index != 0 {
            
            if let x = touches.first?.location(in: self.view).x, let y = touches.first?.location(in: self.view).y {
                self.touchLastX = x
                self.touchLastY = y
             
            scale()
            }
        }
        
    }
    
    func scale() {
        let x2 = Double(touchLastX)
        let x1 = Double(touchFirstX)
        
        let x = pow((x2 - x1), 2)
        
        let y2 = Double(touchLastY)
        let y1 = Double(touchFirstY)
        
        let y = pow((y2 - y1), 2)
        
        let res = sqrt(x+y)
            
        print("res \(res)")
        
        let rectX_x1 = rectangle.frame.midX - touchFirstX
        let rectX_x2 = rectangle.frame.midX - touchLastX

        let rectY_y1 = rectangle.frame.midY - touchFirstY
        let rectY_y2 = rectangle.frame.midY - touchLastY
        
        let absX = abs(rectX_x2) - abs(rectX_x1)
        
        let absY = abs(rectY_y2) - abs(rectY_y1)
  
        print("absY \(absY)")
        print("absx \(absX)")
        
        if absX < 0 && absY < 0 {
            let koef = rectangle.frame.height/100 - CGFloat(res) / 100
            if koef > 0 {
                rectangle.transform = CGAffineTransform(scaleX: CGFloat(koef), y: CGFloat(koef))
            } else {
                rectangle.transform = CGAffineTransform(scaleX: 0, y: 0)
            }
        } else if absX > 0 && absY > 0 {
            let koef = CGFloat(res) / 100 + rectangle.frame.height/100
            rectangle.transform = CGAffineTransform(scaleX: CGFloat(koef), y: CGFloat(koef))
        } else {
      
            if absY > 0 && y > x || absX > 0 && y < x {
                let koef = CGFloat(res) / 100 + rectangle.frame.height/100
                rectangle.transform = CGAffineTransform(scaleX: CGFloat(koef), y: CGFloat(koef))
            } else {
                let koef = rectangle.frame.height/100 - CGFloat(res) / 100
                if koef > 0 {
                    rectangle.transform = CGAffineTransform(scaleX: CGFloat(koef), y: CGFloat(koef))
                } else {
                    rectangle.transform = CGAffineTransform(scaleX: 0, y: 0)
                }
            }
        }
    }
    
}
