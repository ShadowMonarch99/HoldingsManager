//
//  HoldingsModel.swift
//  HoldingsManager
//
//  Created by Apoorv Joshi on 17/11/24.
//

struct APIResponse: Codable {
    let data: UserData
}

struct UserData: Codable {
    let userHolding: [UserHolding]
}

struct UserHolding: Codable, Hashable {
    let symbol: String
    let quantity: Int
    let ltp: Double
    let avgPrice: Double
    let close: Double
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(symbol)
    }
    
    static func == (lhs: UserHolding, rhs: UserHolding) -> Bool {
        return lhs.symbol == rhs.symbol
    }
}

