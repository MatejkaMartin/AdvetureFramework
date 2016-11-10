//
//  IScenarioManager.swift
//  Adventura.framework
//
//  Created by Martin Matějka on 04.04.16.
//  Copyright © 2016 Martin Matějka. All rights reserved.
//

import Foundation

public protocol IScenarioManager: IAuthor, IGSMFactoryProduct {
    var HAPPY_SCENARIO_NAME: String {get}
    var MISTAKE_SCENARIO_NAME: String {get}
    
    func getAllScenarioNames() -> Array<String>
    func getScenario(_ name: String) -> Scenario
    func autoTest()
    func testGame()
    func testGameByScenarios()
 
    
    
}
public extension IScenarioManager {
    func getHappyScenario() -> Scenario {
        return getScenario(HAPPY_SCENARIO_NAME)
    }
    func getMistakeScenario() -> Scenario{
        return getScenario(MISTAKE_SCENARIO_NAME)
    }
    
}
