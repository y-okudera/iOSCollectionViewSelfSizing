//
//  String+ToDate.swift
//  iOSCollectionViewSelfSizing
//
//  Created by YukiOkudera on 2019/03/12.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import Foundation

extension String {
    
    func toDate(dateFormat: String) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale?
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .short
        dateFormatter.dateFormat = dateFormat
        
        guard let date = dateFormatter.date(from: self) else {
            fatalError("Failed to convert String to Date.")
        }
        return date
    }
}
