//
//  MyHappyInterfaceLoader.swift
//  MyHappyApp
//
//  Created by SinhLH.AVI on 21/10/25.
//


import Foundation
import MyHappyInterfaceFramework

internal class MyHappyInterfaceLoader {
    
    private static var handle: UnsafeMutableRawPointer = {
        let rootPath = Bundle.main.sharedFrameworksPath!
        let frameworkPath = rootPath + "/MyHappyFramework.framework/MyHappyFramework"
        let handle = try! loadFramework(at: frameworkPath)!
        return handle
    }()
    
    static var shared: MyHappyInterface = {
        typealias ExportFunc = @convention(c) () -> MyHappyInterfaceExporter
        if let symbol = dlsym(handle, "exportMyHappyInterface") {
            let function = unsafeBitCast(symbol, to: ExportFunc.self)
            let interface = function().export() as! MyHappyInterface
            return interface
        } else {
            fatalError("Failed to load critical export symbol")
        }
    }()
}
