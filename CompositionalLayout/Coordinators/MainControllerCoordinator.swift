//
//  MainControllerCoordinator.swift
//  CompositionalLayout
//
//  Created by Сергей Копаницкий on 06.02.2021.
//

import UIKit

class MainControllerCoordinator: Coordinator {
    
    // MARK: - Private constants
    
    private let window: UIWindow
    
    private let navigationController: UINavigationController
    
    // MARK: - Constructors
    
    init(window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
        setupWindow()
    }
        
    // MARK: - Public methods
    
    public func start() {
        let mainController = MainController()
        mainController.output = self
        navigationController.pushViewController(mainController, animated: false)
    }
    
    // MARK: - Private methods
    
    private func setupWindow() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

// MARK: - MainControllerOutput

extension MainControllerCoordinator: MainControllerOutput {
    
}
