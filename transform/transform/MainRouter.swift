//
//  MainRouter.swift
//  transform
//
//  Created by GrigorevaE on 09.08.2021.
//

import UIKit

class MainRouter {
    private let tabbar: UITabBarController
    
    private let firstNavController: UINavigationController
    private let firstViewController: ViewController
    
    private let secondNavController: UINavigationController
    private let secondViewController: SecondViewController

    private let thirdNavController: UINavigationController
    private let thirdViewController: ThirdViewController

    private let fourthNavController: UINavigationController
    private let fourthViewController: FourViewController
    
    internal init() {
        self.tabbar = UITabBarController()

        self.firstViewController = ViewController()
        self.firstNavController = UINavigationController(rootViewController: self.firstViewController)
        
        self.secondViewController = SecondViewController()
        self.secondNavController = UINavigationController(rootViewController: self.secondViewController)

        self.thirdViewController = ThirdViewController()
        self.thirdNavController = UINavigationController(rootViewController: self.thirdViewController)

        self.fourthViewController = FourViewController()
        self.fourthNavController = UINavigationController(rootViewController: self.fourthViewController)
        
        self.configFirstViewController()
        self.configSecondViewController()
        self.configThirdViewController()
        self.configFourthViewController()
        
        self.tabbar.setViewControllers([self.firstNavController,
                                        self.secondNavController,
                                        self.thirdNavController,
                                        self.fourthNavController],
                                       animated: true)
        
    }
    
    internal func tabBar() -> UITabBarController {
        return self.tabbar
    }
    
    private func configFirstViewController() {
        self.firstViewController.view.backgroundColor = .white
        
        self.firstNavController.tabBarItem.title = "first task"
        self.firstNavController.navigationBar.isHidden = true
    }
    
    private func configSecondViewController() {
        self.secondViewController.view.backgroundColor = .white

        self.secondNavController.tabBarItem.title = "second task"
        self.secondNavController.navigationBar.isHidden = true

    }

    private func configThirdViewController() {
        self.thirdViewController.view.backgroundColor = .white

        self.thirdNavController.tabBarItem.title = "third task" 
        self.thirdNavController.navigationBar.isHidden = true
    }

    private func configFourthViewController() {
        self.fourthViewController.view.backgroundColor = .white

        self.fourthNavController.tabBarItem.title = "four task"
        self.fourthNavController.navigationBar.isHidden = true
    }
    
}
