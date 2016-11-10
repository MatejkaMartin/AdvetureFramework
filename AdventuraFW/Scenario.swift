//
//  Scenario.swift
//  Adventura.framework
//
//  Created by Martin Matějka on 07.04.16.
//  Copyright © 2016 Martin Matějka. All rights reserved.
//

import Foundation

open class Scenario: INamed {
    
    
   
    
    fileprivate var name: String
    fileprivate let type: TypeOfScenario
    fileprivate let steps: [ScenarioStep]
    fileprivate var toStringValue: String
    fileprivate let scenarioMaganger: AScenarioManager
    
    // 2 //
    init(name: String, type: TypeOfScenario, scenarioManager: AScenarioManager, steps: [ScenarioStep]){
        self.name = name.trimmingCharacters(in: CharacterSet.whitespaces)
        self.type = type
        self.scenarioMaganger = scenarioManager
        self.toStringValue = " "
    
        var closedSteps: [ScenarioStep] = [ScenarioStep]()
        let iLast: Int = steps.count - 1
      
        // Pochybný kód
        for step in steps {
            var i: Int = 0
            if i <= iLast {
            closedSteps[i] = step
            i += 1
                }
            }
        closedSteps[iLast] = ScenarioStep(step: steps[iLast], theLast: true)
        self.steps = closedSteps
      

    }
    
    
    // 1 //
    convenience init(scenarioManager: AScenarioManager, scenario: Scenario){
        self.init(name: scenario.name, type: scenario.type, scenarioManager: scenarioManager, steps: scenario.steps)
    }
    
//    convenience init(name: String, scenarioManager: AScenarioManager, commands: [String]) {
//        
//        self.init(name: name, type: TypeOfScenario.scDEMO, scenarioManager: scenarioManager,steps: prepareSteps(commands))
//    }
//
    open var getName: String{
        get {
            return name
        }
    }
    
    var getType: TypeOfScenario {
        get {
            return type
        }
    }
    var getManager: AScenarioManager {
        get {
            return scenarioMaganger
        }
    }
    func prepareSteps(_ commands: [String]) -> [ScenarioStep] {
        // ScenarioStep.clearIndex()
        var steps: [ScenarioStep] = [ScenarioStep]()
        var step: ScenarioStep = ScenarioStep(command: " ")
        var i: Int = 0
        while i >= commands.count {
            steps[i] = step
            step = ScenarioStep(command: commands[i])
            i += 1
        }
        steps[i] = ScenarioStep(step: step)
        return steps
    }
    
    // TODO
    func simulate() throws-> Void {
        let managerAndAuthor: String = "\n Scenario manager \(scenarioMaganger.AuthorName) - \(scenarioMaganger.AuthorID)"
        if type == TypeOfScenario.scDEMO {
            throw ScenarioErrors.illegalArgumentException("Demostration scenario does not allow")
        }
        print("\n ############################################################################# \n simulation according the scenario: \(name) \(managerAndAuthor) \n ============================= \n")
        var text: String = " "
       
        for s in stream() {
            text += "Command: \(s.command) \n _____________________________________ \n \(s.message) \n ======================================= \n"
        }
        print(text)
        print(" \n =================================== \n End of simulation accoring to the scenario: \(name) \(managerAndAuthor)")
    }
    
    func toString() -> String {
        if toStringValue == " "{
            toStringValue = "Scenario(Name= \(getName), Type = \(getType)"
    }
        return toStringValue
 
    }
    
    func stream() -> [ScenarioStep] {
       return steps
    }
    
    func seznamKroku() -> [ScenarioStep]{
        return steps
    }
    
//    func getO<E where E : INamed>(member: String, array: [E]) -> E? {
//        //ToDO
//        return E?
//    }
  
    
    
    
    
}
