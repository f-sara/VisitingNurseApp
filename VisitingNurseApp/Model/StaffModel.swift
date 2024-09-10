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
