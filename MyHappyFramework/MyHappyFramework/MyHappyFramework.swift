//
//  MyHappyFramework.swift
//  MyHappyFramework
//
//  Created by SinhLH.AVI on 21/10/25.
//

import Foundation
import MyHappyInterfaceFramework


@_cdecl("exportMyHappyInterface")
public func exportMyHappyInterface() -> MyHappyInterfaceExporter { InterfaceExporter() }

open class InterfaceExporter: MyHappyInterfaceExporter {
    
    open func export() -> Any { SayMyName.shared }
}

open class SayMyName: MyHappyInterface {
    
    public static let shared = SayMyName()
    
    open func sayMyName() -> String { "Heisenberg" }
}
