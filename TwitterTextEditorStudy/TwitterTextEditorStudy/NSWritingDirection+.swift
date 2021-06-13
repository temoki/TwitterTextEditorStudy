//
//  NSWritingDirection+.swift
//  TwitterTextEditorStudy
//
//  Created by Tomoki Kobayashi on 2021/01/29.
//

import UIKit

extension NSWritingDirection: CustomStringConvertible {
    public var description: String {
        switch self {
        case .natural: return "natural"
        case .leftToRight: return "leftToRight"
        case .rightToLeft: return "rightToLeft"
        @unknown default: return "(unknown)"
        }
    }
}
