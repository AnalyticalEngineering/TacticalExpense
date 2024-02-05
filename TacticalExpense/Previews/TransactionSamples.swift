//
//  TransactionSamples.swift
//  TacticalExpense
//
//  Created by J. DeWeese on 2/4/24.
//

import SwiftUI


extension Transaction{
    static let lastWeek = Calendar.current.date(byAdding: .day, value: -7, to: Date.now)!
    static let lastMonth = Calendar.current.date(byAdding: .month, value: -1, to: Date.now)!
    
    static var sampleTransactions: [Transaction]{
        [
            Transaction(title: "Apple", remarks: "iPhone 16 Pro Max", amount: 1699.43, dateAdded: .now,  transactionType: .expense),
            Transaction(title: "Apple", remarks: "iPhone 16 Pro Max", amount: 1699.43, dateAdded: .now,  transactionType: .savings),
            Transaction(title: "Apple", remarks: "iPhone 16 Pro Max", amount: 1699.43, dateAdded: .now,  transactionType: .expense),
            Transaction(title: "Apple", remarks: "iPhone 16 Pro Max", amount: 1699.43, dateAdded: .now,  transactionType: .income),
            Transaction(title: "Apple", remarks: "iPhone 16 Pro Max", amount: 1699.43, dateAdded: .now,  transactionType: .expense)
           
        ]
    }
}
