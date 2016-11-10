//
//  TypeOfStep.swift
//  Adventura.framework
//
//  Created by Martin Matějka on 07.04.16.
//  Copyright © 2016 Martin Matějka. All rights reserved.
//

import Foundation



open class TypeOfStep {
        
    
    
    enum Subtype {
        /** Correctly entered mandatory command from HAPPY. 0 */ case stCORRECT,
        /** Correctly entered HELP or STOP.                 1 */  stHELPSTOP,
        /** Compulsorily tested wrong command.               2 */  stMISTAKE,
        /** Facultative action.                              3 */  stNONSTANDARD,
        /** Part of the dialogue.                            4 */  stDIALOG,
        /** Demo-step without accompanying information
         * which must not be used in testing scenarios.      5 */  stDEMO,
        /** Step created for auxiliary activities.           6 */  stUNDEFINED
    }
    
    enum TypeOfSteps{
        case tsNOT_SET, ts_START, tsMOVE, tsTAKE, tsPUT_DOWN, tsEND , tsHELP, tsNOT_START, tsEMPTY, tsUNKNOWN, tsMOVE_WA, tsTAKE_WA, tsPUT_DOWN_WA, tsBAD_NEIGHBOR, tsBAD_ITEM, tsUNMOVABLE, tsBAG_FULL, tsNOT_IN_BAG, tsNON_STANDARD0, tsNON_STANDARD1, tsNON_STANDARD2, tsNON_STANDARD3, tsDIALOG, tsDEMO
        func aktivujStep() -> TypeOfStep {
            switch self {
            case .tsNOT_SET:
                let tsNOT_SET: TypeOfStep = TypeOfStep(subtype: 6, paramCount: -1, group: nil)
                return tsNOT_SET
            case .ts_START:
                let ts_START: TypeOfStep = TypeOfStep(subtype: 0, paramCount: -1, group: nil)
                return ts_START
            case .tsMOVE:
                let tsMOVE: TypeOfStep = TypeOfStep(subtype: 0, paramCount: 1, group: nil)
                return tsMOVE
            case .tsTAKE:
                let tsTAKE: TypeOfStep = TypeOfStep(subtype: 0, paramCount: 1, group: nil)
                return tsTAKE
            case .tsPUT_DOWN:
                let tsPUT_DOWN: TypeOfStep = TypeOfStep(subtype: 0, paramCount: 1, group: nil)
                return tsPUT_DOWN
            case .tsEND:
                let tsEND: TypeOfStep = TypeOfStep(subtype: 1, paramCount: 0, group: nil)
                return tsEND
            case .tsHELP:
                let tsHELP: TypeOfStep = TypeOfStep(subtype: 1, paramCount: 0, group: nil)
                return tsHELP
            case .tsNOT_START:
                let tsNOT_START: TypeOfStep = TypeOfStep(subtype: 2, paramCount: -1, group: nil)
                return tsNOT_START
            case .tsEMPTY:
                let tsEMPTY: TypeOfStep = TypeOfStep(subtype: 2, paramCount: -1, group: TypeOfStep(name: TypeOfSteps.ts_START))
                return tsEMPTY
            case .tsUNKNOWN:
                let tsUNKNOWN: TypeOfStep = TypeOfStep(subtype: 2, paramCount: -1, group: nil)
                return tsUNKNOWN
            case .tsMOVE_WA:
                let tsMOVE_WA: TypeOfStep = TypeOfStep(subtype: 2, paramCount: 0, group: TypeOfStep(name: TypeOfSteps.tsMOVE))
                return tsMOVE_WA
            case .tsTAKE_WA:
                let tsTAKE_WA: TypeOfStep = TypeOfStep(subtype: 2, paramCount: 0, group: TypeOfStep(name: TypeOfSteps.tsTAKE))
                return tsTAKE_WA
            case .tsPUT_DOWN_WA:
                let tsPUT_DOWN_WA: TypeOfStep = TypeOfStep(subtype: 2, paramCount: 0, group: TypeOfStep(name: TypeOfSteps.tsPUT_DOWN))
                return tsPUT_DOWN_WA
            case .tsBAD_NEIGHBOR:
                let tsBAD_NEIGHBOR: TypeOfStep = TypeOfStep(subtype: 2, paramCount: 1, group: TypeOfStep(name: TypeOfSteps.tsMOVE))
                return tsBAD_NEIGHBOR
            case .tsBAD_ITEM:
                let tsBAD_ITEM: TypeOfStep = TypeOfStep(subtype: 2, paramCount: 1, group: TypeOfStep(name: TypeOfSteps.tsTAKE))
                return tsBAD_ITEM
            case .tsUNMOVABLE:
                let tsUNMOVABLE: TypeOfStep = TypeOfStep(subtype: 2, paramCount: 1, group: TypeOfStep(name: TypeOfSteps.tsTAKE))
                return tsUNMOVABLE
            case .tsBAG_FULL:
                let tsBAG_FULL: TypeOfStep = TypeOfStep(subtype: 2, paramCount: 1, group: TypeOfStep(name: TypeOfSteps.tsTAKE))
                return tsBAG_FULL
            case .tsNOT_IN_BAG:
                let tsNOT_IN_BAG: TypeOfStep = TypeOfStep(subtype: 2, paramCount: 1, group: TypeOfStep(name: TypeOfSteps.tsPUT_DOWN))
                return tsNOT_IN_BAG
            case .tsNON_STANDARD0:
                let tsNON_STANDARD0: TypeOfStep = TypeOfStep(subtype: 1, paramCount: 0, group: nil)
                return tsNON_STANDARD0
            case .tsNON_STANDARD1:
                let tsNON_STANDARD1: TypeOfStep = TypeOfStep(subtype: 1, paramCount: 0, group: nil)
                return tsNON_STANDARD1
            case .tsNON_STANDARD2:
                let tsNON_STANDARD2: TypeOfStep = TypeOfStep(subtype: 1, paramCount: 0, group: nil)
                return tsNON_STANDARD2
            case .tsNON_STANDARD3:
                let tsNON_STANDARD3: TypeOfStep = TypeOfStep(subtype: 1, paramCount: 0, group: nil)
                return tsNON_STANDARD3
            case .tsDIALOG:
                let tsDIALOG: TypeOfStep = TypeOfStep(subtype: 1, paramCount: 0, group: nil)
                return tsDIALOG
            case .tsDEMO:
                let tsDEMO: TypeOfStep = TypeOfStep(subtype: 1, paramCount: 0, group: nil)
                return tsDEMO
            }
        }
    
    }
    
        let PARAM_COUNT: Int
        let GROUP: TypeOfStep?
        let SUBTYPE: Subtype
        let seznamSteps = [TypeOfSteps]()
        var basic = Set<TypeOfSteps>()
        var regular = Set<TypeOfSteps>()
        var mistake = Set<TypeOfSteps>()
   
    
    init(name: TypeOfSteps){
        let step: TypeOfStep = name.aktivujStep()
        self.PARAM_COUNT = step.PARAM_COUNT
        self.GROUP = step.GROUP
        self.SUBTYPE = step.SUBTYPE
        organizeSteps()
        
   
        
        
    }
        init(subtype: Int, paramCount: Int, group: TypeOfStep?){
                    self.PARAM_COUNT = paramCount
                    self.GROUP = group
                    switch subtype {
                    case 0:
                        self.SUBTYPE = Subtype.stCORRECT
                    case 1:
                        self.SUBTYPE = Subtype.stHELPSTOP
                    case 2:
                        self.SUBTYPE = Subtype.stMISTAKE
                    case 3:
                        self.SUBTYPE = Subtype.stNONSTANDARD
                    case 4:
                        self.SUBTYPE = Subtype.stDIALOG
                    case 5:
                        self.SUBTYPE = Subtype.stDEMO
                    case 6:
                        self.SUBTYPE = Subtype.stUNDEFINED
                    default:
                        self.SUBTYPE = Subtype.stUNDEFINED
                    }
            organizeSteps()
    }
    
    func getSubtype() -> Subtype {
        return SUBTYPE
    }
    
    func organizeSteps(){
        for step in seznamSteps {
            switch step.aktivujStep().SUBTYPE {
            case Subtype.stCORRECT:
                basic.insert(step)
                regular.insert(step)
                break
            case Subtype.stHELPSTOP:
                basic.insert(step)
                mistake.insert(step)
                break
            case Subtype.stMISTAKE:
                mistake.insert(step)
                break
            default:
                break
            }
            
        }
    }
   
}

