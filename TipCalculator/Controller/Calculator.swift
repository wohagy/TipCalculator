//
//  Calculator.swift
//  TipCalculator
//
//  Created by wohagy on 29.01.2022.
//

import Foundation

struct  Calculator {
    private var splitedBill: Double = 0
    private var countOfPeople: Int = 0
    private var tipValue: Double = 0
    
    mutating func calculateSplitedBill(tip: Double, totalBill: Double, splitFor: Int) {
        countOfPeople = splitFor
        tipValue = tip
        let totalBillWithTip = totalBill * (1 + tip)
        splitedBill = totalBillWithTip / Double(splitFor)
    }
    
    func giveRoundedSplitedBill() -> Double {
        let roundedBill = round(splitedBill*100) / 100
        return roundedBill
    }
    
    func giveInfoAboutCalculating() -> String {
        let tip = Int(tipValue * 100)
        return "Split between \(countOfPeople) people, with \(tip)% tip"
    }
}
