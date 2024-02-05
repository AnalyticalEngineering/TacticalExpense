//
//  Transaction.swift
//  TacticalExpense
//
//  Created by J. DeWeese on 2/4/24.
//
import SwiftUI
import SwiftData


@Model
class Transaction {
    /// Properties
    var title: String = ""
    var remarks: String = ""
    var amount: Double
    var dateAdded: Date = Date.now
    @Attribute(originalName: "status")
    var transactionType: TransactionType.RawValue = TransactionType.expense.rawValue /// status denotes {expense, income, savings}
    
    @Relationship(inverse: \Budget.transactions)
    var budgets: [Budget]?
    
    init(
        title: String,
        remarks: String,
        amount: Double,
        dateAdded: Date,
        transactionType: TransactionType = .expense,
        budgets: [Budget]? = nil
    ) {
        self.title = title
        self.remarks = remarks
        self.amount = amount
        self.dateAdded = dateAdded
        self.transactionType = transactionType.rawValue
        self.budgets = budgets
    }

    var icon: Image {
        switch TransactionType(rawValue: transactionType)! {
        case .expense:
            Image(systemName: "arrowshape.down.circle")
        case .income:
            Image(systemName: "arrowshape.down.circle")
        case .savings:
            Image(systemName: "building.columns.circle")
        }
    }
}
 
enum TransactionType: Int, Codable, Identifiable, CaseIterable {
    case expense, income, savings
    var id: Self {
        self
    }
    var descr: LocalizedStringResource {
        switch self {
        case .expense:
            "Expense"
        case .income:
            "Income"
        case .savings:
            "Savings"
        }
    }
}

