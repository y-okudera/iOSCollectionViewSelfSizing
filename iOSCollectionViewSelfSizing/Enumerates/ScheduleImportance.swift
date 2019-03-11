//
//  ScheduleImportance.swift
//  iOSCollectionViewSelfSizing
//
//  Created by YukiOkudera on 2019/03/12.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import UIKit

enum ScheduleImportance {
    case normal
    case important
    case mostImportant
    
    func color() -> UIColor {
        switch self {
        case .normal:
            return .white
        case .important:
            return .blue
        case .mostImportant:
            return .red
        }
    }
}
