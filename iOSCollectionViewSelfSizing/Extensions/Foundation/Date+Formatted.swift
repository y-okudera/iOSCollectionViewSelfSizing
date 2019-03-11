//
//  Date+Formatted.swift
//  iOSCollectionViewSelfSizing
//
//  Created by YukiOkudera on 2019/03/12.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import Foundation

extension Date {
    func formattedDateString() -> String {
        // 当日日付
        let today = Date()
        let calendar = Calendar.current
        
        // 日付(年月日)が一致するか
        if calendar.isDate(self, inSameDayAs: today) {
            // HH:mmフォーマットで返却
            return self.toString(dateFormat: "HH:mm")
        }
        
        // 年が一致するか
        if calendar.compare(self, to: today, toGranularity: .year) == .orderedSame {
            // MM月dd日フォーマットで返却
            return self.toString(dateFormat: "MMMd日 (E)")
        }
        
        // yyyy年MM月dd日フォーマットで返却
        return self.toString(dateFormat: "yyyy年MM月dd日")
    }
}
