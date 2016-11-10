//
//  IUIG.swift
//  AdventuraFW
//
//  Created by Martin Matějka on 17.04.16.
//  Copyright © 2016 Martin Matějka. All rights reserved.
//

import Foundation

public protocol  IUIG: IUI, IGSMFactoryProductG {
    func getGame() -> IGameG
    func executeCommand(_ command: String)
    func startGame(_ game: IGame)
}
