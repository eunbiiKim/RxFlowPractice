//
//  SceneDelegate.swift
//  RxFlowPractice
//
//  Created by pineone on 2022/10/04.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    let appCoordinator = AppCoordinator.shared
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: scene)
        
        appCoordinator.start(inWindow: self.window!)
    }
}

