//
//  Date+ToString.swift
//  iOSCollectionViewSelfSizing
//
//  Created by YukiOkudera on 2019/03/12.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import Foundation

extension Date {
    
    func toString(dateFormat: String) -> String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        let jpLocale = Locale(identifier: "ja_JP")
        formatter.locale = jpLocale
        formatter.dateFormat = dateFormat
        return formatter.string(from: self)
    }
}
