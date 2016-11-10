//
//  IWorld.swift
//  Adventura.framework
//
//  Created by Martin Matějka on 04.04.16.
//  Copyright © 2016 Martin Matějka. All rights reserved.
//

import Foundation

public protocol IWorld {
    func getAllSpaces() -> [ISpace]
    func getCurrentSpace() -> ISpace
}