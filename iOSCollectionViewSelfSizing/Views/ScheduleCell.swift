//
//  ScheduleCell.swift
//  iOSCollectionViewSelfSizing
//
//  Created by YukiOkudera on 2019/03/12.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import UIKit

final class ScheduleCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var colorBandView: UIView!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var tagColorView: UIView! {
        didSet {
            tagColorView.layer.cornerRadius = tagColorView.frame.width / 2
            tagColorView.clipsToBounds = true
        }
    }
    @IBOutlet private weak var tagLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var memoLabel: UILabel!
    
    // MARK: - Properties
    private var isHeightCalculated: Bool = false
    private var scheduleTag = ScheduleTag.work {
        didSet {
            tagColorView.backgroundColor = scheduleTag.color()
            tagLabel.text = scheduleTag.text()
        }
    }
    
    private var scheduleImportance = ScheduleImportance.normal {
        didSet {
            colorBandView.backgroundColor = scheduleImportance.color()
        }
    }
    
    var schedule: Schedule? {
        didSet {
            guard let schedule = schedule else {
                return
            }
            dateLabel.text = schedule.date.formattedDateString()
            titleLabel.text = schedule.title
            memoLabel.text = schedule.memo
            scheduleTag = schedule.tag
            scheduleImportance = schedule.importance
        }
    }
    
    override func preferredLayoutAttributesFitting(
        _ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        if !isHeightCalculated {
            setNeedsLayout()
            layoutIfNeeded()
            let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
            var newFrame = layoutAttributes.frame
            newFrame.size.width = CGFloat(ceilf(Float(size.width)))
            layoutAttributes.frame = newFrame
            isHeightCalculated = true
        }
        return layoutAttributes
    }
}
