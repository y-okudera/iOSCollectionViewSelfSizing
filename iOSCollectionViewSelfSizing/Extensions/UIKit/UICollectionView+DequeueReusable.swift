//
//  UICollectionView+DequeueReusable.swift
//  iOSCollectionViewSelfSizing
//
//  Created by YukiOkudera on 2019/03/12.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("UICollectionView reusable cell dequeue failed.")
        }
        return cell
    }
}
