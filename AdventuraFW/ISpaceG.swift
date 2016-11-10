//
//  ISpaceG.swift
//  AdventuraFW
//
//  Created by Martin Matějka on 17.04.16.
//  Copyright © 2016 Martin Matějka. All rights reserved.
//

import Foundation

public protocol ISpaceG: ISpace, IItemContainerG {
/* Chybí doplnit*/
//    func getPosition() -> Point
    
    func getNeighbors() -> [ISpaceG]
}