//
//  Budget.swift
//  TacticalExpense
//
//  Created by J. DeWeese on 2/4/24.
//

import SwiftUI
import SwiftData


@Model
class Budget {
    var name: String = ""
    var amount: Double
    var color: String = "FF0000"
    var transactions: [Transaction]?
    
    init(name: String, amount: Double, color: String) {
        self.name = name
        self.amount = amount
        self.color = color

    }
    var hexColor: Color {
        Color(hex: self.color) ?? .red
    }
}
