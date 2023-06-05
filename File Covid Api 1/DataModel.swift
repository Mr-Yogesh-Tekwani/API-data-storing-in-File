//
//  DataModel.swift
//  File Covid Api 1
//
//  Created by Yogesh on 6/5/23.
//

import Foundation

struct Details: Codable {
    let date: Int?
    let state: String?
    let positive: Int?
    let death: Int?
}
