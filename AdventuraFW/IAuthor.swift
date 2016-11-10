//
//  IAuthor.swift
//  Adventura.framework
//
//  Created by Martin Matějka on 04.04.16.
//  Copyright © 2016 Martin Matějka. All rights reserved.
//

import Foundation
public protocol IAuthor {
    
    
    var AuthorName: String {get}
    var AuthorID: String {get}
    
    
}
extension IAuthor {
    var getAUthorString: String {
        get {
            return AuthorName + AuthorID
        }
    }
}

/***************************************************************************
 * Returns the program author identification string
 * written in CAPITAL LETTERS.
 * It is mostly the login into the school information system.
 */