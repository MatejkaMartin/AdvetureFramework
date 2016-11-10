//
//  IGame.swift
//  Adventura.framework
//
//  Created by Martin Matějka on 04.04.16.
//  Copyright © 2016 Martin Matějka. All rights reserved.
//

import Foundation

public protocol IGame: INamed, IGSMFactoryProduct {
    
    func isAlive() -> Bool
    func getBag() -> IBag
    func getAllActions() -> [IAction]?
    func getBasicActions() -> BasicActions
    func getWorld() -> IWorld
    func executeCommand(_ paprametry: String) -> String?
    func stop()
}
