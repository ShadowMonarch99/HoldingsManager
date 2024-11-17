//
//  HoldingsManagerViewModel.swift
//  HoldingsManager
//
//  Created by Apoorv Joshi on 16/11/24.
//

import Foundation

class UserHoldingsViewModel {
    private(set) var userHoldings: [UserHolding] = []
    let mockUserHoldings: [UserHolding] = [
        UserHolding(symbol: "MAHABANK", quantity: 990, ltp: 38.05, avgPrice: 35.0, close: 40.0),
        UserHolding(symbol: "ICICI", quantity: 100, ltp: 118.25, avgPrice: 110.0, close: 105.0),
        UserHolding(symbol: "SBI", quantity: 150, ltp: 550.05, avgPrice: 501.0, close: 590.0),
        UserHolding(symbol: "TATA STEEL", quantity: 200, ltp: 137.0, avgPrice: 110.65, close: 100.05),
        UserHolding(symbol: "INFOSYS", quantity: 121, ltp: 1305.0, avgPrice: 1245.45, close: 1103.85),
        UserHolding(symbol: "AIRTEL", quantity: 415, ltp: 340.75, avgPrice: 370.1, close: 290.0),
        UserHolding(symbol: "UCO BANK", quantity: 2000, ltp: 18.05, avgPrice: 28.15, close: 22.25),
        UserHolding(symbol: "NHPC", quantity: 900, ltp: 88.05, avgPrice: 80.75, close: 70.65),
        UserHolding(symbol: "SJVN", quantity: 400, ltp: 113.05, avgPrice: 105.0, close: 110.0),
        UserHolding(symbol: "PNB BANK", quantity: 100, ltp: 132.05, avgPrice: 100.0, close: 145.55),
        UserHolding(symbol: "AIRTELI", quantity: 415, ltp: 340.75, avgPrice: 370.1, close: 290.0),
        UserHolding(symbol: "UCO BANKI", quantity: 2000, ltp: 18.05, avgPrice: 28.15, close: 22.25),
        UserHolding(symbol: "NHPCI", quantity: 900, ltp: 88.05, avgPrice: 80.75, close: 70.65),
        UserHolding(symbol: "SJVNI", quantity: 400, ltp: 113.05, avgPrice: 105.0, close: 110.0),
        UserHolding(symbol: "PNB BANKI", quantity: 100, ltp: 132.05, avgPrice: 100.0, close: 145.55)
    ]

    
    func fetchUserHoldings(completion: @escaping (Bool) -> Void) {
        NetworksManager.shared.fetchUserHoldings { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let holdings):
                    self?.userHoldings = holdings
                    completion(true)
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(false)
                }
            }
        }
    }
    
    func calculateCurrentValue() -> Double {
        return mockUserHoldings.reduce(0.0) { result, holding in
            result + (holding.ltp * Double(holding.quantity))
        }
    }
    
    func calculateTotalInvestment() -> Double {
        return mockUserHoldings.reduce(0.0) { result, holding in
            result + (holding.avgPrice * Double(holding.quantity))
        }
    }
    
    func calculateTotalPNL() -> Double {
        let currentValue = calculateCurrentValue()
        let totalInvestment = calculateTotalInvestment()
        return currentValue - totalInvestment
    }
    
    func calculateTodaysPNL() -> Double {
        return mockUserHoldings.reduce(0.0) { result, holding in
            result + ((holding.close - holding.ltp) * Double(holding.quantity))
        }
    }

    
}

