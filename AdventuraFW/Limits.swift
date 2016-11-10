//
//  Limits.swift
//  Adventura.framework
//
//  Created by Martin Matějka on 07.04.16.
//  Copyright © 2016 Martin Matějka. All rights reserved.
//

import Foundation

open class Limits {

    let minSteps: Int
    let minSpaces: Int
    let minVisited: Int
    let minOwnActions: Int

   public init(minSteps: Int, minSpaces: Int, minVisited: Int, minOwnActions: Int){
        self.minSteps = minSteps
        self.minSpaces = minSpaces
        self.minVisited = minVisited
        self.minOwnActions = minOwnActions
    }
    
    func toString() -> String {
        return " Minimal requirements to the happy scenario: \n Minimal number of steps = \(minSteps)" +
        "\n Minimal number of game spaces = \(minSpaces) " +
        "\n Minimal number of visited spaces = \(minVisited)" +
        "\n Minimal number of non-standart actions = \(minOwnActions)"
    }

}
