//
//  ScenarioErrors.swift
//  AdventuraFW
//
//  Created by Martin Matějka on 15.04.16.
//  Copyright © 2016 Martin Matějka. All rights reserved.
//

import Foundation


public enum ScenarioErrors: Error {
    
    case emptyException(String)
    case illegalArgumentException(String)
    case instationExceprtion
    
}
//extension ScenarioErrors: CustomStringConvertible {
//    var description: String {
//        switch self {
//        case .EmptyException: return "Not me error"
//        case .IllegalArgumentException: return "Try sudo"
//        }
//    }
//}
