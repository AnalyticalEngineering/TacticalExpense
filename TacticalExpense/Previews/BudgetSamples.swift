//
//  BudgetSamples.swift
//  TacticalExpense
//
//  Created by J. DeWeese on 2/4/24.
//

import SwiftUI

extension Budget {
    static var sampleBudgets: [Budget] {
        [
            Budget(name: "Rent", amount: 900.00, color: "00FF00"),
            Budget(name: "Groceries", amount: 600.00, color: "00FF00"),
            Budget(name: "Fuel", amount: 400, color: "00FF00"),
            Budget(name: "Savings", amount: 200.00, color: "00FF00"),
            Budget(name: "Cell Phones", amount: 400.00, color: "00FF00")
        ]
    }
}
