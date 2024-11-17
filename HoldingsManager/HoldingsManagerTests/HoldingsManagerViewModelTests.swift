//
//  HoldingsManagerViewModelTests.swift
//  HoldingsManagerTests
//
//  Created by Apoorv Joshi on 17/11/24.
//

import Foundation
import XCTest
@testable import HoldingsManager

class UserHoldingsViewModelTests: XCTestCase {
    
    var viewModel: UserHoldingsViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = UserHoldingsViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
        
    func testCalculateCurrentValue() {
        let expectedValue = viewModel.mockUserHoldings.reduce(0.0) { result, holding in
            result + (holding.ltp * Double(holding.quantity))
        }
        
        let currentValue = viewModel.calculateCurrentValue()
        
        XCTAssertEqual(currentValue, expectedValue, accuracy: 0.01)
    }
    
    func testCalculateTotalInvestment() {
        let expectedValue = viewModel.mockUserHoldings.reduce(0.0) { result, holding in
            result + (holding.avgPrice * Double(holding.quantity))
        }
        
        let totalInvestment = viewModel.calculateTotalInvestment()
        
        XCTAssertEqual(totalInvestment, expectedValue, accuracy: 0.01)
    }
    
    
    func testCalculateTotalPNL() {
        let currentValue = viewModel.calculateCurrentValue()
        let totalInvestment = viewModel.calculateTotalInvestment()
        let expectedPNL = currentValue - totalInvestment
        
        let totalPNL = viewModel.calculateTotalPNL()
        
        XCTAssertEqual(totalPNL, expectedPNL, accuracy: 0.01)
    }
        
    func testCalculateTodaysPNL() {
        let expectedPNL = viewModel.mockUserHoldings.reduce(0.0) { result, holding in
            result + ((holding.close - holding.ltp) * Double(holding.quantity))
        }
        
        let todaysPNL = viewModel.calculateTodaysPNL()
        
        XCTAssertEqual(todaysPNL, expectedPNL, accuracy: 0.01)
    }
}
