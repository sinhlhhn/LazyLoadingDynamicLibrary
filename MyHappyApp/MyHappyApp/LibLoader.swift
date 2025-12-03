//
//  LibLoader.swift
//  MyHappyApp
//
//  Created by SinhLH.AVI on 21/10/25.
//

import Foundation

func loadFramework(at path: String) throws -> UnsafeMutableRawPointer? {
    guard let handle = dlopen(path, RTLD_NOW) else {
        if let error = dlerror() {
            throw NSError(domain: "dlopen", code: 1, userInfo: [NSLocalizedDescriptionKey: String(cString: error)])
        }
        throw NSError(domain: "dlopen", code: 2, userInfo: [NSLocalizedDescriptionKey: "Unknown error"])
    }
    return handle
}
