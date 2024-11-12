//
//  StaffListPresenter.swift
//  VisitingNurseApp
//
//  Created by 藤井紗良 on 2024/11/12.
//

import Foundation

protocol StaffListPresenterInput: AnyObject {
}

protocol StaffListPresenterOutput: AnyObject {
    func didFetchStaffList(_ staffList: [StaffModel])
    func failFetchStaffList()
}

final class StaffListPresenter: StaffListPresenterInput {
    private weak var output: StaffListPresenterOutput!
    private var model: APIClient!
    var staffList: [StaffModel] = []

    init(output: StaffListPresenterOutput, model: APIClient) {
        self.output = output
        self.model = model
    }

    func fetchStaffList() async {
        let baseURL = URL(string: "http://localhost:8080/v1/facilities/01J6SMYDSKKKNJCR2Y3242T7YX/users")!
        model.fetchData(url: baseURL,dataType: StaffModel.self) { result in
            switch result {
            case .success(let data):
                self.output.didFetchStaffList(data)
            case .failure(let error):
                self.output.failFetchStaffList()
                print("エラー: \(error)")
            }
        }
    }

    func searchStaffName(keyword: String) async {
        let baseURL = URL(string: "http://localhost:8080/v1/facilities/01J6SMYDSKKKNJCR2Y3242T7YX/users?username=\(keyword)")!
        model.fetchData(url: baseURL,dataType: StaffModel.self) { result in
            switch result {
            case .success(let data):
                self.output.didFetchStaffList(data)
            case .failure(let error):
                self.output.failFetchStaffList()
                print("エラー: \(error)")
            }
        }
    }

}
