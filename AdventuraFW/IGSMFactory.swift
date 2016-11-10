//
//  IGSMFactory.swift
//  Adventura.framework
//
//  Created by Martin Matějka on 04.04.16.
//  Copyright © 2016 Martin Matějka. All rights reserved.
//

import Foundation

public protocol IGSMFactory: IAuthor {
    func getScenarioManager() -> AScenarioManager
    func getGame() -> IGame
    func getUI() -> IUI
    
}

//public extension IGSMFactory {
//    func getInstanceOfFactory<T: IGSMFactory>(factoryClass: NSObject) -> T {
//        var result: T
//
//        result = factoryClass.
//    }
//}




 