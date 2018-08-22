//
//  ItemModel.swift
//  SwiftAdvance
//
//  Created by kuroky on 2018/8/17.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import Foundation

class ItemModel: Codable {
    var title: String?
    var items: [SubItem]?
    var explosion: Bool?
    var isExplosion: Bool {
        set {
            explosion = newValue
        }
        
        get {
            if explosion != nil {
                return explosion!
            } else {
                return false
            }
        }
    }
}

class SubItem: Codable {
    var title: String?
}
