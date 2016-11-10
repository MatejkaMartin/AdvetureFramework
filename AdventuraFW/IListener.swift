//
//  IListener.swift
//  AdventuraFW
//
//  Created by Martin Matějka on 17.04.16.
//  Copyright © 2016 Martin Matějka. All rights reserved.
//

import Foundation

public protocol IListener {
    func notice<T>(_ ifromant: T) where T: AnyObject
}
