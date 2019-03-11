//
//  ScheduleTag.swift
//  iOSCollectionViewSelfSizing
//
//  Created by YukiOkudera on 2019/03/12.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import UIKit

enum ScheduleTag {
    case work
    case `private`
    case lunch
    case dinner
    
    func text() -> String {
        switch self {
        case .work:
            return "仕事📋"
        case .private:
            return "プライベート🏡"
        case .lunch:
            return "ランチ🍔"
        case .dinner:
            return "ディナー🍽"
        }
    }
    
    func color() -> UIColor {
        switch self {
        case .work:
            return .red
        case .private:
            return .blue
        case .lunch:
            return .green
        case .dinner:
            return .orange
        }
    }
}
