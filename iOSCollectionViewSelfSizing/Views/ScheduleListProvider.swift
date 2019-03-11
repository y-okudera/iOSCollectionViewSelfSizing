//
//  ScheduleListProvider.swift
//  iOSCollectionViewSelfSizing
//
//  Created by YukiOkudera on 2019/03/12.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import UIKit

final class ScheduleListProvider: NSObject {
    
    // MARK: - Property
    private var schedules = [Schedule]()
    
    func setSchedules(schedules: [Schedule]) {
        self.schedules = schedules
    }
    
    func selectedScheduleAt(indexPath: IndexPath) -> Schedule {
        return schedules[indexPath.row]
    }
}

// MARK: - UICollectionViewDataSource
extension ScheduleListProvider: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return schedules.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ScheduleCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.schedule = schedules[indexPath.row]
        return cell
    }
}
