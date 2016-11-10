//
//  INamed.swift
//  Adventura.framework
//
//  Created by Martin Matějka on 04.04.16.
//  Copyright © 2016 Martin Matějka. All rights reserved.
//

import Foundation

public protocol INamed {
    var getName: String {get}
    
}
//extension INamed {
//    func getO<E where E: INamed>(member: String, array: [E]) -> E? /* nebo také Optional<E> */ {
//       let result: E? = getO(member, array: array)
//        return result
//    }
//    
//  
//}
