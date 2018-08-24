//
//  Handler.swift
//  SwiftAdvance
//
//  Created by kuroky on 2018/8/23.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import Foundation

/// 本地的md资源文件
func loadResourceFile(fileName: String) -> String? {
    guard let bundlePath = Bundle.main.path(forResource: "Resource", ofType: "bundle") else {
        return nil
    }
    
    guard let bundle = Bundle(path: bundlePath) else {
        return nil
    }
    
    guard let path = bundle.path(forResource: fileName, ofType: "md") else {
        return nil
    }
    
    guard let mdString = try? String(contentsOfFile: path) else {
        return nil
    }
    return mdString
}
