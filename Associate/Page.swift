//
//  Page.swift
//  Associate
//
//  Created by 90304566 on 4/30/20.
//  Copyright © 2020 Eden Prairie Schools. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

// Event containing information
class Page: Identifiable, ObservableObject {
    @Published var identifier: String
    @Published var description: String?
    @Published var time: DateRange?
    @Published var images: [Image]?
    @Published var verification: Verification?
    
    var anyCancellable: AnyCancellable? = nil
    
    var id: String { identifier }
    
    struct DateRange {
        var startDate: Date?
        var endDate: Date?
    }
    
    init(identifier: String, description: String? = nil, startDate: Date? = nil, endDate: Date? = nil, images: [Image]? = nil, verification: Verification? = nil) {
        self.identifier = identifier
        self.description = description
        self.time = DateRange(startDate: startDate, endDate: endDate)
        self.images = images
        
        setUpAnyCancellable()
    }
    
    private func setUpAnyCancellable() {
        anyCancellable = self.verification?.objectWillChange.sink(receiveValue: { (_) in
            self.objectWillChange.send()
        })
    }
}

extension Date {
    func getYear() -> Int {
        guard let year = (Calendar.current.dateComponents([.year], from: self).year) else { return -1 }
        return year
    }
    func getMonth() -> Int {
        guard let month = (Calendar.current.dateComponents([.month], from: self).month) else { return -1 }
        return month
    }
    func getDay() -> Int {
        guard let day = (Calendar.current.dateComponents([.day], from: self).day) else { return -1 }
        return day
    }
    func getWeekday() -> Int {
        guard let weekday = (Calendar.current.dateComponents([.weekday], from: self).weekday) else { return -1 }
        return weekday
    }
    func getHour() -> Int {
        guard let hour = (Calendar.current.dateComponents([.hour], from: self).hour) else { return -1 }
        return hour
    }
    func getMinute() -> Int {
        guard let minute = (Calendar.current.dateComponents([.minute], from: self).minute) else { return -1 }
        return minute
    }
    func getSecond() -> Int {
        guard let second = (Calendar.current.dateComponents([.second], from: self).second) else { return -1 }
        return second
    }
    func getNanosecond() -> Int {
        guard let nanosecond = (Calendar.current.dateComponents([.nanosecond], from: self).nanosecond) else { return -1 }
        return nanosecond
    }
}


