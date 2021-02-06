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
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    public func start() {
        let mainControllerCoordinator = MainControllerCoordinator(window: window)
        mainControllerCoordinator.start()
    }
}
