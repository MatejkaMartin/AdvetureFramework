//
//  IBag.swift
//  Adventura.framework
//
//  Created by Martin Matějka on 04.04.16.
//  Copyright © 2016 Martin Matějka. All rights reserved.
//

import Foundation

public protocol IBag: IItemContainer
{
    /***************************************************************************
     * Returns the bag capacity, i.e. the maximal permitted sum
     * of weights of items, that can be put into the bag at the same time.
     *
     * @return Capacity of the bag
     */
    func getCapacity() -> Int
    
    
    /***************************************************************************
     * Returns the collection of items saved in the bag.
     *
     * @return Collection of items in the bag
     */
    func getItems() -> [String: IItem]
    
    
}