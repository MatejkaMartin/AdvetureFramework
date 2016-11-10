//
//  AScenarioManager.swift
//  Adventura.framework
//
//  Created by Martin Matějka on 07.04.16.
//  Copyright © 2016 Martin Matějka. All rights reserved.
//

import Foundation

public protocol AScenarioManager: IScenarioManager {
    
   var LIMITS: Limits { get}
    var factory: IGSMFactory {get set}
    var name2scenario: [String: Scenario] {get set}
    var sealed: Bool {get set}
    var factoryClass: AnyObject {get set}
    var START_STEP: ScenarioStep? {get set}
    var START_NAME: String {get set}
    var game: IGame {get}
    init()
    

    
}

extension AScenarioManager {
    init<T: AnyObject>(factoryClass: T) where T: IGSMFactory{
        self.init()
        
        self.factoryClass = factoryClass
        self.name2scenario = [String: Scenario]()
//        var START_STEP: ScenarioStep {get{return ScenarioStep.init(typeOfStep: ty, command: <#T##String#>, message: <#T##String#>, space: <#T##String#>, neighbors: <#T##[String]#>, items: <#T##[String]#>, bag: <#T##[String]#>)} }
    }
    
    func getAllScenarioNames() -> Array<String> {
        var array = [String]()
        for obj in name2scenario.keys {
            array.append(obj)
        }
        return array
    }
    
    
    func getScenario(_ name: String) throws -> Scenario? {
        do {
            try verifySealed()
        } catch {
          print(error)
        }
        
        let result: Scenario? = name2scenario[name]!
        if result == nil {
           throw ScenarioErrors.illegalArgumentException("Scenár s názvem \(name) nemám ve správě")
        }
        return result
    }

    
    func verifySealed() throws{
        if !sealed {
            throw ScenarioErrors.illegalArgumentException("The scenario manager cannot be used yet")
        }
    }
    var getStartStep: ScenarioStep? {
        get {
            return START_STEP
        }
    }
    
    func addScenario(_ name: String, type: TypeOfScenario, steps: [ScenarioStep]) {
//        var scenario: Scenario = Scenario(name: name, type: type, scenarioManager: self, steps: steps)
//        do {
//         try addScenario(scenario)
//        } catch {
//            print(error)
//        }
    }
   mutating func addScenario(_ scenario: Scenario) throws{
        if sealed {
            throw ScenarioErrors.illegalArgumentException("Passing of new scenarios to management has been closed")
        }
        let name: String? = scenario.getName
        if name == nil || name == " " {
            throw ScenarioErrors.illegalArgumentException("Scenario name has to be not empty")
        }
        for item in name2scenario {
            if item.0 == name {
                throw ScenarioErrors.illegalArgumentException("Scenario with the entered name already exits \(name)")
            }
        }
        var listOfStart = [ScenarioStep]()
        for each in scenario.stream() {
            if each.typeOfStep === TypeOfStep.TypeOfSteps.ts_START.aktivujStep() {
                listOfStart += [each]
            }
        }
        let startStep: ScenarioStep? = listOfStart.first!
        if START_STEP == nil {
//            setStartStep(startStep!)
            START_STEP = startStep
            START_NAME = scenario.getName
        } else if START_STEP !== startStep {
            throw ScenarioErrors.illegalArgumentException("Initial scenario steps")
        }
        
    }
    mutating func seal() throws -> Void {
        if nil == name2scenario[HAPPY_SCENARIO_NAME] ||  nil == name2scenario[MISTAKE_SCENARIO_NAME] {
            throw ScenarioErrors.illegalArgumentException("Mandatory scenarios")
        }
        sealed = true
    }
   
    
    mutating func setStartStep(_ step: ScenarioStep){
        START_STEP = step
    }
    
    func autoTest() {
        // prepareSummary()
    }
    
    func toString() -> String {
        return "Scenario manager author: \(AuthorID) - \(AuthorName) \n Factory class: \(factoryClass) \n Managed scenarios: \(getAllScenarioNames())"
    }
   
}
