//  UIViewController.swift
//  UIViewController
//
//  Created by 최지수 on 2021/01/05.
//

import UIKit

extension UIViewController {
    /// get the current displaying UIViewController
    static func getCurrentViewController(_ vc: UIViewController) -> UIViewController? {
        if let pvc = vc.presentedViewController {
            return getCurrentViewController(pvc)
        } else if let svc = vc as? UISplitViewController, svc.viewControllers.count > 0 {
            return getCurrentViewController(svc.viewControllers.last ?? vc)
        } else if let nvc = vc as? UINavigationController, nvc.viewControllers.count > 0 {
            return getCurrentViewController(nvc.topViewController ?? vc)
        } else if let tbc = vc as? UITabBarController {
            if let svc = tbc.selectedViewController {
                return getCurrentViewController(svc)
            }
        }
        return vc
    }
}
