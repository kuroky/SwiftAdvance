//
//  ItemModel.swift
//  SwiftAdvance
//
//  Created by kuroky on 2018/8/17.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import Foundation
import UIKit

let width = UIScreen.main.bounds.size.width - 30

/// list Model
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

/// detail Model
struct DetailItem: Codable {
    var title: String?
    var desc: String?
    var descHeight: Double?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.desc = try container.decode(String.self, forKey: .desc)
        self.descHeight = self.desc?.height(width: width)
    }
}

