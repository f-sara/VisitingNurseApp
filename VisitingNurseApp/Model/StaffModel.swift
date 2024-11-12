//
//  StaffModel.swift
//  VisitingNurseApp
//
//  Created by 藤井紗良 on 2024/09/10.
//

import Foundation

struct StaffModel {
    let id: String
    let username: String
    let department: String
    let position: String
    let team: String
    let email: String
    let phone: String
    let policies: Policies
}

struct Policies {
    let id: String
    let name: String
}

struct StaffListModel: Codable {
    let username: String
    let position: String
    let department: String
    let team: String
    let area: String
    let sort_field: String?
    let sort_order: String?

//    let uptime: Int
//    var formattedUptime: String {
//        let hours = uptime / 60
//        let minutes = uptime % 60
//        return String(format: "%02d:%02d", hours, minutes)
//    }
}
