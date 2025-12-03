//
//  MyHappyInterfaceFramework.swift
//  MyHappyInterfaceFramework
//
//  Created by SinhLH.AVI on 21/10/25.
//

import Foundation

@objc
public protocol MyHappyInterfaceExporter {
    
    func export() -> Any
}

public protocol MyHappyInterface {
    
    func sayMyName() -> String
}
