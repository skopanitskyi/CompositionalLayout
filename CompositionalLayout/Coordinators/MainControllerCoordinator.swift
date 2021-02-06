//
//  MainControllerCoordinator.swift
//  CompositionalLayout
//
//  Created by Сергей Копаницкий on 06.02.2021.
//

import UIKit

class MainControllerCoordinator: Coordinator {
    
    private let window: UIWindow
    private let navigationController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
        setupWindow()
    }
    
    public func start() {
        let mainController = MainController()
        mainController.output = self
        navigationController.pushViewController(mainController, animated: false)
    }
    
    private func setupWindow() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

// MARK: - MainControllerOutput

extension MainControllerCoordinator: MainControllerOutput {
    
}
