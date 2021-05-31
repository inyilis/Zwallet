//
//  SceneDelegate.swift
//  App
//
//  Created by MacBook on 24/05/21.
//

import UIKit
import AmountInput
import CreatePin
import Core
import History
import Home
import Login
import Otp
import Receiver
import SignUp

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        self.setupAppRouter()
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = scene
        
        self.reloadRootView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadRootView), name: Notification.Name("reloadRootView"), object: nil)
    }
    
    @objc func reloadRootView() {
        let token: String? = UserDefaultHelper.shared.get(key: .userToken)
        if token != nil {
            AppRouter.shared.navigateToHome()
        } else {
            AppRouter.shared.navigateToLogin()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

@available(iOS 13.0, *)
extension SceneDelegate {
    func setupAppRouter() {
        AppRouter.shared.loginScene = {
            LoginRouterImpl.navigateToModule()
        }
        
        AppRouter.shared.homeScene = {
            HomeRouterImpl.navigateToModule()
        }
        
        AppRouter.shared.transferScene = { viewController in
            ReceiverRouterImpl.navigateToModule(viewController: viewController)
        }
        
        AppRouter.shared.amountScene = { viewController, contact in
            AmountInputRouterImpl.navigateToModule(viewController: viewController, contact: contact)
        }
        
        AppRouter.shared.createPinScene = { viewController in
            CreatePinRouterImpl.navigateToModule(viewController: viewController)
        }
        
        AppRouter.shared.signUpScene = { viewController in
            SignUpRouterImpl.navigateToModule(viewController: viewController)
        }
        
        AppRouter.shared.confirmOtpScene = { viewController, email in
            OtpRouterImpl.navigateToModule(viewController: viewController, email: email)
        }
        
        AppRouter.shared.historyScene = { viewController in
            HistoryRouterImpl.navigateToModule(viewController: viewController)
        }
    }
}
