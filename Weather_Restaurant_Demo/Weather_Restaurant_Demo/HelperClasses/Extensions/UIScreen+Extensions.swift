//
//  UIScreen+Extensions.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 23/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import UIKit

extension UIScreen {
    
    var isPhone4: Bool {
        
        return self.nativeBounds.size.height == 960;
    }
    
    var isPhone5: Bool {
        return self.nativeBounds.size.height == 1136;
    }
    
    var isPhone6: Bool {
        return self.nativeBounds.size.height == 1334;
    }
    
    var isPhone6Plus: Bool {
        return self.nativeBounds.size.height == 2208;
    }
    
}
