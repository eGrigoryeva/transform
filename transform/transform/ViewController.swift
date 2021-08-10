//
//  ViewController.swift
//  transform
//
//  Created by GrigorevaE on 09.08.2021.
//

import UIKit

class ViewController: UIViewController {
    var redRect: UIView!
    var slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 180
        slider.addTarget(self, action: #selector(sliderValue), for: .valueChanged)
        return slider
    }()
    
    let rectangle = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        draw()
    }
    
    func draw() {
        redRect = UIView(frame: rectangle.frame)

        redRect.backgroundColor = .red
        view.addSubview(redRect)
        
        rectangle.backgroundColor = .blue
        view.addSubview(rectangle)
        setupSlider()

    }
    
    func setupSlider() {
        
        view.addSubview(slider)
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        slider.topAnchor.constraint(equalTo: rectangle.bottomAnchor, constant: 50).isActive = true
        slider.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        slider.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        slider.heightAnchor.constraint(equalToConstant: 20).isActive = true

    }
    
    @objc func sliderValue() {
        let degree = CGFloat(slider.value) * CGFloat.pi / 180
        rectangle.transform = CGAffineTransform(rotationAngle: degree)

        let originX = rectangle.bounds.maxX
        let originY = rectangle.bounds.maxY
        
        let chX = rectangle.frame.width / originX
        let chY = rectangle.frame.height / originY

        redRect.transform = CGAffineTransform(scaleX: chX, y: chY)
    }
}

