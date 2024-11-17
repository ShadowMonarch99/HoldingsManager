//
//  HoldingsCellViewModel.swift
//  HoldingsManager
//
//  Created by Apoorv Joshi on 17/11/24.
//

import Foundation
import UIKit

class HoldingsCellViewModel {
    
    private func stylizeText(initialText: String, value: String, valueColor: UIColor) -> NSMutableAttributedString {
        let initialString = NSMutableAttributedString(string: initialText)
        let valueString = NSMutableAttributedString(string: value)
        
        valueString.addAttribute(.font, value: UIFont.systemFont(ofSize: 12, weight: .light), range: NSRange(location: 0, length: valueString.length))
        valueString.addAttribute(.foregroundColor, value: valueColor, range: NSRange(location: 0, length: valueString.length))
        
        initialString.append(valueString)
        return initialString
    }
    
    func stylizeNetQuantityLabelText(netQuantity: Int?) -> NSMutableAttributedString {
        return stylizeText(initialText: "NET QTY: ", value: "\(netQuantity ?? 0)", valueColor: .black)
    }
    
    func stylizePNLLabelText(pnl: Double?) -> NSMutableAttributedString {
        let pnlValue = String(format: "%.2f", pnl ?? 0.00)
        let pnlColor = (pnl ?? 0.0) < 0 ? UIColor.red : UIColor.green
        return stylizeText(initialText: "P&L: ", value: "₹\(pnlValue)", valueColor: pnlColor)
    }
    
    func stylizeLTPLabelText(ltp: Double?) -> NSMutableAttributedString {
        let ltpValue = String(format: "%.2f", ltp ?? 0.00)
        return stylizeText(initialText: "LTP: ", value: "₹ \(ltpValue)", valueColor: .black)
    }
}
