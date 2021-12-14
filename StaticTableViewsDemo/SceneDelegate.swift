//  Created by Dominik Hauser on 10.12.21.
//  
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let scene = (scene as? UIWindowScene) else { return }

    window = UIWindow(windowScene: scene)
    let tabBarController = UITabBarController()
    let old = ViewControllerOld()
    old.tabBarItem = UITabBarItem(title: "Old", image: UIImage(systemName: "tortoise"), tag: 0)
    let new = ViewControllerNew()
    new.tabBarItem = UITabBarItem(title: "New", image: UIImage(systemName: "hare"), tag: 1)
    tabBarController.viewControllers = [UINavigationController(rootViewController: old), UINavigationController(rootViewController: new)]
    window?.rootViewController = tabBarController
    window?.makeKeyAndVisible()
  }
}

