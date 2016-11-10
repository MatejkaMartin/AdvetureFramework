//
//  ISpace.swift
//  Adventura.framework
//
//  Created by Martin Matějka on 04.04.16.
//  Copyright © 2016 Martin Matějka. All rights reserved.
//

import Foundation

public protocol ISpace: IItemContainer, INamed {
    
    func getNeighbors() -> [ISpace]
    func getItems() -> [String : IItem]
    
}