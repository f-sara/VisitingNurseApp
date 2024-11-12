//
//  StaffModel.swift
//  VisitingNurseApp
//
//  Created by 藤井紗良 on 2024/09/10.
//

import Foundation

struct StaffModel: Codable {
    let username: String
    let position: String
    let department: String
    let team: String
    let area: String
    let sort_field: String?
    let sort_order: String?

    // TODO: バックエンドで稼働時間が実装されるまで実装を待機
//    let uptime: Int
//    var formattedUptime: String {
//        let hours = uptime / 60
//        let minutes = uptime % 60
//        return String(format: "%02d:%02d", hours, minutes)
//    }
}
