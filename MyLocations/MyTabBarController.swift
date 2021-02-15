//
//  MyTabBarController.swift
//  MyLocations
//
//  Created by Melanie Kramer on 2/14/21.
//  Copyright © 2021 Melanie Kramer. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override var childForStatusBarStyle: UIViewController? {
        return nil
    }
}
