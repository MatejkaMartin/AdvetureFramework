//
//  Icon.swift
//  AdventuraFW
//
//  Created by Martin Matějka on 17.04.16.
//  Copyright © 2016 Martin Matějka. All rights reserved.
//

import Foundation
import UIKit

open class Icon: UIImageView {
    
    fileprivate let icon: UIImage
    
    init(image: String, img: UIImage) {
        self.icon = img
        let image: UIImage = UIImage(named: image)!
        super.init(image: image)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getIconWidth() -> Int {
        return Int(icon.size.width)
    }
    
    func getIconHeight() -> Int {
        return Int(icon.size.height)
    }
    
}
