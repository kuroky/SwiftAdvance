//
//  UILabel+Add.swift
//  SwiftAdvance
//
//  Created by kuroky on 2018/8/22.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func height(width: CGFloat) -> Double {
        let size = CGSize(width: width, height: .greatestFiniteMagnitude)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 2.0
        let attribute = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16),
                         NSAttributedStringKey.paragraphStyle: style]
        let boundingBox = self.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attribute, context: nil)
        return Double(ceil(boundingBox.height))
    }
}
