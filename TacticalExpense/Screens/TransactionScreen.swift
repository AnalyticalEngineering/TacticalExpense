//
//  ContentView.swift
//  TacticalExpense
//
//  Created by J. DeWeese on 2/3/24.
//

import SwiftUI
import SwiftData

enum SortOrder: LocalizedStringResource, Identifiable, CaseIterable {
    case expense, income, savings
    
    var id: Self {
        self
    }
}


struct TransactionScreen: View {
    @State private var selectedTransactionType: TransactionType = .expense
    @Environment(\.modelContext) private var context
    @Query(sort: \Transaction.title) private var transactions: [Transaction]
    @State private var addTransaction = false
    @State private var sortOrder = SortOrder.expense
    @State private var filter = ""
    
    var body: some View {
        NavigationStack {
            Picker("", selection: $sortOrder) {
                ForEach(SortOrder.allCases) { sortOrder in
                    Text(" \(sortOrder.rawValue)").tag(sortOrder)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            TransactionListView(sortOrder: sortOrder, filterString: filter)
            .searchable(text: $filter, prompt: Text("Transaction Name or Remarks "))
            .navigationTitle("Transactions")
            .toolbar {
                Button {
                    addTransaction = true
                }label: {
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large)
                }
            }
            .sheet(isPresented: $addTransaction) {
                AddTransactionScreen()
                    .presentationDetents([.medium])
            }
    }
}
}

#Preview {
    TransactionScreen()
}
