//
//  ScenarioStep.swift
//  Adventura.framework
//
//  Created by Martin Matějka on 07.04.16.
//  Copyright © 2016 Martin Matějka. All rights reserved.
//

import Foundation

open class ScenarioStep {
    
    let IGNORED_MESSAGE = "TEST"
    let EMPTY_STRING_ARRAY = [String]()
//    let NOT_START_STEP: ScenarioStep = ScenarioStep.init(index: -1, typeOfStep: TypeOfStep.TypeOfSteps.tsNOT_START.aktivujStep(), command: "NOT_START_STEP", message: "NOT_START_STEP", space: "NOT_START_STEP", neighbors: EMPTY_STRING_ARRAY, items: EMPTY_STRING_ARRAY, bag: EMPTY_STRING_ARRAY)
    
    var index: Int = -1
    var typeOfStep: TypeOfStep = TypeOfStep.TypeOfSteps.ts_START.aktivujStep()
    var command: String = "NOT_START_STEP"
    var message: String? = "NOT_START_STEP"
    var space: String? = "NOT_START_STEP"
    var neghbors: [String]? = [String]()
    var items: [String]? = [String]()
    var bag: [String]? = [String]()
    var theLast: Bool
    internal var errorMsg: String?
  
    
    
    struct MyGlobalVariables
    {
        static var lastIndex: Int = 0
    }
    
    init(index: Int, command: String?){
        if command == nil {
//        throw ScenarioErrors.EmptyException("Action has to be the valid non-empty string")
        }
        MyGlobalVariables.lastIndex = index
        self.index = MyGlobalVariables.lastIndex
        self.command = command!
        self.typeOfStep = TypeOfStep.TypeOfSteps.tsDEMO.aktivujStep()
        self.message = nil
        self.space = nil
        self.neghbors = nil
        self.items = nil
        self.bag = nil
        self.theLast = false
    }
 
    
    
    init(index: Int, typeOfStep: TypeOfStep, command: String, message: String, space: String,neighbors: [String], items: [String], bag: [String], theLast: Bool)  {
        MyGlobalVariables.lastIndex = index
        self.index = MyGlobalVariables.lastIndex
        self.command = command
        self.message = message
        self.typeOfStep = typeOfStep
        self.theLast = theLast
        
 
        if typeOfStep === TypeOfStep.TypeOfSteps.tsNOT_START.aktivujStep() {
            self.space = ""
            self.neghbors = [String]()
            self.items = [String]()
            self.bag = [String]()
        } else {
            self.space = space
            self.neghbors = neighbors.sorted(by: { $0 > $1})
            self.bag = bag.sorted(by: { $0 < $1})
        }
        
        
        if invalidCommand() || invalidMessage() || typeOfStep !== TypeOfStep.TypeOfSteps.tsNOT_START.aktivujStep() && invalidName(space) || invalidNames(neighbors, items , bag)  {
            let error: String = " In scenario step construction the exception was thrown caused by: \n \(errorMsg) \n Entered:"
            let notification: String = toString(index, typeOfStep: typeOfStep, prologue: error, command: command, message: message, space: space, neighbors: neighbors, items: items, bag: bag)
            print(notification)
            //            throw ScenarioErrors.IllegalArgumentException(notification)
            
        }
    }
    
     convenience init(index: Int, typeOfStep: TypeOfStep, command: String, message: String, space: String,neighbors: [String], items: [String], bag: [String]){
        self.init(index: index, typeOfStep: typeOfStep, command: command, message: message, space: space, neighbors: neighbors,items: items, bag: bag, theLast: false)
        
    }
    
        
     convenience init(typeOfStep: TypeOfStep, command: String, message: String, space: String, neighbors: [String], items: [String], bag: [String]) {
        MyGlobalVariables.lastIndex += 1
        self.init( index: MyGlobalVariables.lastIndex, typeOfStep: typeOfStep, command: command, message: message, space: space, neighbors: neighbors, items: items, bag: bag)
        
        
    }
    convenience init(typeOfStep: TypeOfStep, command: String, message: String, space: String, neighbors: [String], items: [String], bag: [String], theLast: Bool){
        MyGlobalVariables.lastIndex += 1
        self.init(index: MyGlobalVariables.lastIndex, typeOfStep: typeOfStep, command: command, message: message, space: space, neighbors: neighbors, items: items, bag: bag, theLast: theLast)
        
    }
    
    convenience init(command: String){
        MyGlobalVariables.lastIndex += 1
        self.init(index: MyGlobalVariables.lastIndex, command: command)
    }
        
  
    convenience init(step: ScenarioStep){
        self.init(index: step.index, step: step)
    }
    
    convenience init(index: Int, step: ScenarioStep) {
        self.init(index: index,step: step ,theLast: step.theLast)
    }
    
    convenience init(step: ScenarioStep, theLast: Bool) {
        self.init(index: step.index, step: step, theLast: theLast)
    }
    
        convenience init(index: Int, step: ScenarioStep, theLast: Bool) {
            self.init(index: index, typeOfStep: step.typeOfStep, command: step.command,message: step.message!, space: step.space!,neighbors: step.neghbors!,items: step.items!,bag: step.bag!,theLast: theLast)
    
    }
    
    
    
    //
    //    convenience init(index: Int, game: IGame, command: String, message: String){
    //        self.init(index, TypeOfStep.TypeOfSteps.tsUNKNOWN.aktivujStep(), message, game.getWorld().getCurrentSpace().getName(),colINamed2StringArr(game.getWorld().getCurrentSpace().getNeighbors()), colINamed2StringArr(game.getWorld().getCurrentSpace()))
    //
    //
    //    }
    
    
    
   

  

    
    
    var getLastIndex: Int {
        get {
            return MyGlobalVariables.lastIndex
        }
    }
    
    
    func setIndex(_ next: Int) -> Int{
        let ret: Int = MyGlobalVariables.lastIndex
        MyGlobalVariables.lastIndex = next - 1
        return ret
    }
    
    open func clearIndex(){
       MyGlobalVariables.lastIndex = 0
    }
    
    func toString(_ index: Int, typeOfStep: TypeOfStep,prologue: String, command: String?, message: String?, space: String?,neighbors: [String]?, items: [String]?, bag: [String]?) -> String {
        var text: String = " "
        text += " \n _________________________________\n" + prologue
        text += "\nStep No.:          " + "\(index)"
        text += "\nType of the step:  " + "\(typeOfStep)"
        text += "\nCommand:           " + "\(command)"
        text += "\nCurrent space:  \(space) \n   Exits (neighbors):   \(vypisArray(neighbors)) "
        text += "\nItems:                   \(vypisArray(items))"
        text += "\nBag:               " + "\(vypisArray(bag))"
        text += " \n _________________________________\n"
        return text

    }
    
    
    
    
    
   // ------------------------------------------INVALID METHODS--------------------------//
    fileprivate func invalidCommand() -> Bool {
        if invalidNull("Command", text: command) {
        } else if typeOfStep === TypeOfStep.TypeOfSteps.ts_START.aktivujStep() || typeOfStep === TypeOfStep.TypeOfSteps.tsEMPTY.aktivujStep() && !command.isEmpty {
            errorMsg = "In the step of the type the command should be an empty string"
        } else if typeOfStep !== TypeOfStep.TypeOfSteps.ts_START.aktivujStep() && typeOfStep !== TypeOfStep.TypeOfSteps.tsEMPTY.aktivujStep() &&
            typeOfStep !== TypeOfStep.TypeOfSteps.tsNOT_SET.aktivujStep() && command.isEmpty {
            errorMsg = "Non starting statement was entered as empty"
        } else if command.characters.count > 80 {
            errorMsg = "Command is too long, it has more than 80 characters"
        } else {
            let argument = command.components(separatedBy: "\\s+")
            if typeOfStep.PARAM_COUNT >= 0 && argument.count != typeOfStep.PARAM_COUNT {
                errorMsg = " The command has wrong number of arguments"
            } else {
                // No error detected
                return false
            }
            
        }
        return true
    }
  
    fileprivate func invalidNull(_ textTypeDecription: String, text: String?) -> Bool {
        if text != nil {
            errorMsg = textTypeDecription + " was entered as nil"
            return true
        } else {
            return false
        }
    }
    
    fileprivate func invalidEmpty(_ textTypeDecription: String, text: String?) -> Bool {
        var trimmedString: String
        if let value = text?.trimmingCharacters(in: CharacterSet.whitespaces) {
            trimmedString = value
        } else {
            trimmedString = ""
        }
        if "" == trimmedString {
            errorMsg = "\(textTypeDecription) was entered as the empty string"
            return true
        }
        return false
    }
    
    fileprivate func invalidMessage() -> Bool {
        let type: String = "Text of the answer to command:"
        if !invalidNull(type, text: message) && !invalidEmpty(type, text: message) {
            let lines: [String] = (message?.components(separatedBy: "\\\n"))!
            var shortLines: Bool = true
            lines.forEach{if $0.characters.count < 80 {
                shortLines = true
            }else {
                shortLines = false
                }
            }
                
                if shortLines {
                    return false
                }
            }
            errorMsg = "\(type) contains a line longer than 80 characters"
        return true
        }
    
    
    
    func invalidName(_ text: String) -> Bool {
        let type: String = " Name of the named item(space or item"
        if invalidNull(type, text: text) || invalidEmpty(type, text: text) {
            return true
        }
        let lines: [String] = text.trimmingCharacters(in: CharacterSet.whitespaces).components(separatedBy: "\\s")
        if lines.count != 1 {
            errorMsg = "\(type) is not created by one word: « \(text) »"
            return true
        }
        return false
    }
    
    func invalidNames(_ texts: String...) -> Bool {
        
        for text in texts {
            if invalidName(text) {
                return true
            }
        }
        return false
    }
    
    func invalidNames(_ sets: [String]?...) -> Bool {
        for set in sets {
            if set == nil {
               errorMsg = "Name array is entered as nil"
                for text in set! {
                    if invalidName(text){
                        return true
                    }
                }
            }
        }
        return false
    }
//------------------------------END-OF-INVALID-METHODS-----------------------------//
    
    func getIndex() -> Int {
        return index
    }
    func getCommand() -> String {
        return command
    }
    func commandAndMessage() -> String {
        return "\n \(command) \n \(message) \n"
    }
    
    func toString() -> String {
        let ret: String = " \nStep No. \(index) : « \(command) » \(toString(index, typeOfStep: typeOfStep, prologue: "Expected state after executed action:", command: command, message: message, space: space, neighbors: neghbors, items: items, bag: bag)) \n"
        return ret
        
    }

    func vypisArray(_ array: [String]?) -> String {
        var text1: String = " "
        for obj in array! {
            text1 += obj
        }
        return text1
    }
    
    func colINamed2StringArr<T>(_ collection: [T]?) -> [String] where T: INamed {
        if collection == nil {
            let empty = [String]()
            return empty
        }else {
        var result = [String]()
        var text: String = " "
        for obj in collection! {
            
            text += "\(obj.getName) "
            }
            result.append(text)
            return result
        }
        
    }
    
}


    
    
