//
//  BasicActions.swift
//  Adventura.framework
//
//  Created by Martin Matějka on 04.04.16.
//  Copyright © 2016 Martin Matějka. All rights reserved.
//

import Foundation


open class BasicActions {
    /** Name of the action for moving into neighboring space. */
    let MOVE_CMD_NAME: String

/** Name of the action for taking item from the bag
 *  and putting it down into the current space. */
    let PUT_DOWN_CMD_NAME: String

/** Name of the action for taking item from the current
 *  space and putting it into bag. */
    let TAKE_CMD_NAME: String

/** Name of the action for asking for help. */
   let HELP_CMD_NAME: String

 /** Name of the action for immediate game termination. */
  let END_CMD_NAME: String
    
    var toString: String?
    
    var type2name: [String: TypeOfStep]

   public init(move: String, take: String, putDown: String, help: String, end: String){
        type2name = [String: TypeOfStep]()
        MOVE_CMD_NAME = move
        TAKE_CMD_NAME = take
        PUT_DOWN_CMD_NAME = putDown
        HELP_CMD_NAME = help
        END_CMD_NAME = end
        do {
            try verifyArguments(move, take, putDown, help, end)
        } catch {
        print(error)
        }
        var map = [String: TypeOfStep]()
        map[move] = TypeOfStep.TypeOfSteps.tsMOVE.aktivujStep()
        map[putDown] = TypeOfStep.TypeOfSteps.tsPUT_DOWN.aktivujStep()
        map[take] = TypeOfStep.TypeOfSteps.tsTAKE.aktivujStep()
        map[help] = TypeOfStep.TypeOfSteps.tsHELP.aktivujStep()
        map[end] = TypeOfStep.TypeOfSteps.tsEND.aktivujStep()
        type2name = map
    }
    
    func verifyArguments(_ names: String?...) throws{
        for name in names {
            if name == nil || name!.isEmpty {
                throw ScenarioErrors.illegalArgumentException("Certain argument is nil or empty")
            }
        }
        
    }
    func toStringString() -> String {
        if toString == nil {
            toString = "BasicActions [MOVE= \(MOVE_CMD_NAME), PUT = \(PUT_DOWN_CMD_NAME), PICK= \(TAKE_CMD_NAME), HELP= \(HELP_CMD_NAME), END= \(END_CMD_NAME)"
        }
        return toString!
    }
    

}
