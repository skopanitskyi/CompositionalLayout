//
//  AppCoordinator.swift
//  CompositionalLayout
//
//  Created by Сергей Копаницкий on 06.02.2021.
//

import UIKit

protocol Coordinator {
    func start()
}

class AppCoordinator: Coordinator {
    
    // MARK: - Private constants
    
    private let window: UIWindow
    
    // MARK: - Constructors
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Public methods
    
    public func start() {
        let mainControllerCoordinator = MainControllerCoordinator(window: window)
        mainControllerCoordinator.start()
    }
}
