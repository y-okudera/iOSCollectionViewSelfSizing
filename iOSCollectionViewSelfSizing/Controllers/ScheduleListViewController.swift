//
//  ScheduleListViewController.swift
//  iOSCollectionViewSelfSizing
//
//  Created by YukiOkudera on 2019/03/12.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import UIKit

/// スケジュール一覧画面
final class ScheduleListViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    private let provider = ScheduleListProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        #if DEBUG
        dummySchedules()
        #endif
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
}

// MARK: - Setup
extension ScheduleListViewController {
    
    private func setupCollectionView() {
        // UICollectionViewのSelf-Sizingを有効化
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let width = UIScreen.main.bounds.width * 0.9
            flowLayout.estimatedItemSize = .init(width: width, height: 88)
        }
        collectionView.dataSource = provider
    }
}

// MARK: - Dummy
extension ScheduleListViewController {
    
    // swiftlint:disable:next function_body_length
    private func dummySchedules() {
        
        var schedules = [Schedule]()
        
        var schedule0 = Schedule()
        schedule0.title = "クリスマス"
        schedule0.date = "2018-12-25 19:00".toDate(dateFormat: "yyyy-MM-dd HH:mm")
        schedule0.memo = ""
        schedule0.tag = .private
        schedule0.importance = .mostImportant
        
        var schedule1 = Schedule()
        schedule1.title = "新年会"
        schedule1.date = "2019-01-04 19:00".toDate(dateFormat: "yyyy-MM-dd HH:mm")
        schedule1.memo = "会社の新年会。"
        schedule1.tag = .work
        schedule1.importance = .mostImportant
        
        var schedule2 = Schedule()
        schedule2.title = "ランチの予定"
        schedule2.date = "2019-02-22 13:00".toDate(dateFormat: "yyyy-MM-dd HH:mm")
        schedule2.memo = "○○先輩とランチ"
        schedule2.tag = .lunch
        schedule2.importance = .important
        
        var schedule3 = Schedule()
        schedule3.title = "ダミーの予定"
        schedule3.date = "2019-02-25 13:00".toDate(dateFormat: "yyyy-MM-dd HH:mm")
        schedule3.memo = "長いメモ。1234567890あいうえおかきくけこさしすせそたちつてと"
        schedule3.tag = .private
        schedule3.importance = .normal
        
        var schedule4 = Schedule()
        schedule4.title = "ディナーの予定"
        schedule4.date = "2019-02-26 21:00".toDate(dateFormat: "yyyy-MM-dd HH:mm")
        schedule4.memo = "メモメモ。"
        schedule4.tag = .dinner
        schedule4.importance = .mostImportant
        
        var schedule5 = Schedule()
        schedule5.title = "xxxxxの予定"
        schedule5.date = "2019-03-01 19:30".toDate(dateFormat: "yyyy-MM-dd HH:mm")
        schedule5.memo = "メモ。"
        schedule5.tag = .work
        schedule5.importance = .important
        
        var schedule6 = Schedule()
        schedule6.title = "aaaの予定"
        schedule6.date = "2019-03-01 19:30".toDate(dateFormat: "yyyy-MM-dd HH:mm")
        schedule6.memo = ""
        schedule6.tag = .private
        schedule6.importance = .important
        
        var schedule7 = Schedule()
        schedule7.title = "bbbの予定"
        schedule7.date = "2019-03-01 19:30".toDate(dateFormat: "yyyy-MM-dd HH:mm")
        schedule7.memo = "メモメモ。"
        schedule7.tag = .work
        schedule7.importance = .normal
        
        var schedule8 = Schedule()
        schedule8.title = "cccの予定"
        schedule8.date = "2019-03-01 19:30".toDate(dateFormat: "yyyy-MM-dd HH:mm")
        schedule8.memo = "メモ。"
        schedule8.tag = .work
        schedule8.importance = .mostImportant
        
        schedules.append(schedule0)
        schedules.append(schedule1)
        schedules.append(schedule2)
        schedules.append(schedule3)
        schedules.append(schedule4)
        schedules.append(schedule5)
        schedules.append(schedule6)
        schedules.append(schedule7)
        schedules.append(schedule8)
        
        schedules.sort(by: { $0.date > $1.date })
        
        provider.setSchedules(schedules: schedules)
        collectionView.reloadData()
    }
}
