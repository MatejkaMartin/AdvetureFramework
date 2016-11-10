//
//  IItemG.swift
//  AdventuraFW
//
//  Created by Martin Matějka on 17.04.16.
//  Copyright © 2016 Martin Matějka. All rights reserved.
//

import Foundation

public protocol IItemG: IItem {
    
    func getPicture() -> Icon?
}