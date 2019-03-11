//
//  UICollectionReusableView+Identifier.swift
//  iOSCollectionViewSelfSizing
//
//  Created by YukiOkudera on 2019/03/12.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import UIKit

extension UICollectionReusableView {
    
    static var identifier: String {
        return String(describing: self)
    }
}
