//
//  UIApplicationExtension.swift
//  FVDebugDataBrowser
//
//  Created by Fong Zhou on 06/08/2018.
//

import Foundation
import UIKit

extension UIApplication {

    /// Recursive function to get the current top view controller displayed
    ///
    /// - Parameter controller: Current top ViewController found
    /// - Returns: Top ViewController for given ViewController
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }

}
