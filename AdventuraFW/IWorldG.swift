//
//  IWorldG.swift
//  AdventuraFW
//
//  Created by Martin Matějka on 17.04.16.
//  Copyright © 2016 Martin Matějka. All rights reserved.
//

import Foundation

public protocol IWorldG: IWorld {
    func getAllSpaces() -> [ISpaceG]
    func getCurrentSpace() -> ISpaceG
}