//
//  SecondViewController.swift
//  transform
//
//  Created by GrigorevaE on 09.08.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    var tranform = CGAffineTransform.identity
    var angle: CGAffineTransform = CGAffineTransform(rotationAngle: 0)
    var scale: CGAffineTransform = CGAffineTransform(scaleX: 1, y: 1)
    var transition: CGAffineTransform = CGAffineTransform(translationX: 0, y: 0)
    
    var sliderAngle: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 360
        slider.addTarget(self, action: #selector(sliderValueAngle), for: .valueChanged)
        return slider
    }()
    
    var sliderScale: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0.1
        slider.maximumValue = 10
        slider.value = 1
        slider.addTarget(self, action: #selector(sliderValueScale), for: .valueChanged)
        return slider
    }()
    
    var sliderTransition: UISlider = {
        let slider = UISlider()
        slider.minimumValue = -50
        slider.maximumValue = 50
        slider.addTarget(self, action: #selector(sliderValueTransition), for: .valueChanged)
        return slider
    }()
    
    let rectangle = UIView(frame: CGRect(x: 180, y: 200, width: 30, height: 30))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        draw()
    }
    
    func draw() {

        rectangle.backgroundColor = .blue
        view.addSubview(rectangle)
        setupSlider()
        
        let red = UIView(frame: CGRect(x: 5, y: 5, width: 5, height: 5))
        red.backgroundColor = .red
        rectangle.addSubview(red)
    }
    
    func setupSlider() {
        
        [sliderAngle, sliderScale, sliderTransition].forEach { slider in
            view.addSubview(slider)
            slider.translatesAutoresizingMaskIntoConstraints = false
            
            slider.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
            slider.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
            slider.heightAnchor.constraint(equalToConstant: 20).isActive = true
        }
        
        sliderAngle.topAnchor.constraint(equalTo: rectangle.bottomAnchor, constant: 300).isActive = true
        sliderScale.topAnchor.constraint(equalTo: sliderAngle.bottomAnchor, constant: 50).isActive = true
        sliderTransition.topAnchor.constraint(equalTo: sliderScale.bottomAnchor, constant: 50).isActive = true


    }
    
    @objc func sliderValueAngle() {
        let degree = CGFloat(sliderAngle.value) * CGFloat.pi / 180
        let angleNew = CGAffineTransform(rotationAngle: degree)
        self.angle = angleNew
        perform()
    }
    
    @objc func sliderValueScale() {
        let value = CGFloat(sliderScale.value)

        let scaleNew = CGAffineTransform(scaleX: value, y: value)
        self.scale = scaleNew
        perform()

    }
    @objc func sliderValueTransition() {
        let value = CGFloat(sliderTransition.value)
        let transitionNew = CGAffineTransform(translationX: value, y: 0)
        self.transition = transitionNew
        perform()
    }

    func perform() {
    
        rectangle.transform = tranform.concatenating(self.angle).concatenating(self.scale).concatenating(self.transition)
    }
}
