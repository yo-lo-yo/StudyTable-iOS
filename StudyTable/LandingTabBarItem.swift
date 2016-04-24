//
//  LandingTabBarItem.swift
//  StudyTable
//
//  Created by Jordan Leeper on 4/23/16.
//  Copyright © 2016 Jordan Leeper. All rights reserved.
//

import UIKit

class LandingTabBarItem: UITabBarItem {
    
    var normalState: UIImage?
    var selectedState: UIImage?
    
    init(normalState: UIImage, selectedState: UIImage) {
        super.init()
        self.normalState = normalState
        self.selectedState = selectedState
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
    }

    
}