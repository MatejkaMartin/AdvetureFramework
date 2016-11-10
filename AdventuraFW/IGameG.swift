//
//  IGameG.swift
//  AdventuraFW
//
//  Created by Martin Matějka on 17.04.16.
//  Copyright © 2016 Martin Matějka. All rights reserved.
//

import Foundation
import UIKit

public protocol IGameG: IGame, IGSMFactoryProductG {
    
    func getBag() -> IBagG
    func getMap() -> UIImage?
    func getPlayer() -> UIImage?
    func getWorld() -> IWorldG
    func addBagListener(_ bagListener: IListener)
    func removeBagListener(_ bagListener: IListener)
    func addItemListener(_ objectListener: IListener)
    func removeItemListener(_ objectListener: IListener)
    func addNeighborsListener(_ neighborsListener: IListener)
    func removeNeighborsListener(_ neighborsListener: IListener)
    func addDialogListener(_ dialogListener: IListener)
    func removeDialogListener(_ dialogListener: IListener)
    
}
