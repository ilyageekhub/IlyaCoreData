//
//  SceneDelegate.swift
//  IlyaCoreData
//
//  Created by Admin on 23.12.2019.
//  Copyright © 2019 Ilya Ilushenko. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard nil != (scene as? UIWindowScene) else { return }
    }

    func sceneDidEnterBackground(_ scene: UIScene) {

        CoreDataManager.shared.saveContext()
    }
}
