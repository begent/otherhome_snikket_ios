//
// CustomTabBarController.swift
//
// Siskin IM
// Copyright (C) 2016 "Tigase, Inc." <office@tigase.com>
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. Look for COPYING file in the top folder.
// If not, see https://www.gnu.org/licenses/.
//


import UIKit

class CustomTabBarController: UITabBarController {
 
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return Appearance.current.isDark ? .lightContent : .default;
    }
    
    override func viewDidLoad() {
        for childController in self.children {
            if childController is UINavigationController {
                childController.view.backgroundColor = Appearance.current.tableViewBackgroundColor();
            }
        }
        NotificationCenter.default.addObserver(self, selector: #selector(appearanceChanged), name: Appearance.CHANGED, object: nil);
    }
    
    @objc func appearanceChanged(_ notification: Notification) {
        self.tabBar.barTintColor = Appearance.current.bottomBarBackgroundColor();
        self.tabBar.tintColor = Appearance.current.bottomBarTintColor();
        self.setNeedsStatusBarAppearanceUpdate();
//        for childController in self.children {
//            if let navController = childController as? UINavigationController {
//                navController.navigationBar.barStyle = Appearance.current.navigationBarStyle();
//                navController.navigationBar.tintColor = Appearance.current.navigationBarTintColor();
//                navController.navigationBar.barTintColor = Appearance.current.controlBackgroundColor();
//            }
//        }
    }
    
}