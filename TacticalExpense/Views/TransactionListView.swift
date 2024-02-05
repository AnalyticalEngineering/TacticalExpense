//
//  TransactionListView.swift
//  TacticalExpense
//
//  Created by J. DeWeese on 2/4/24.
//

import SwiftUI
import SwiftData


struct TransactionListView: View {
    @Query(sort: \Transaction.title) private var transactions: [Transaction]
    @Environment(\.modelContext) private var context

    init(sortOrder: SortOrder, filterString: String) {
        let sortDescriptors: [SortDescriptor<Transaction>] = switch sortOrder {
        case .expense:
            [SortDescriptor(\Transaction.transactionType), SortDescriptor(\Transaction.title)]
        case .income:
            [SortDescriptor(\Transaction.title)]
        case .savings:
            [SortDescriptor(\Transaction.title)]
        }
        let predicate = #Predicate<Transaction> { transaction in
            transaction.title.localizedStandardContains(filterString)  ||  transaction.remarks.localizedStandardContains(filterString)  ||  filterString.isEmpty
        }
        _transactions = Query(filter: predicate, sort: sortDescriptors)
    }

    var body: some View {
        Group {
            if transactions.isEmpty {
                ContentUnavailableView("Press '+' button to begin tracking your money", systemImage: "gear")
            } else {
                List {
                    
                    
                    ForEach(transactions) { transaction in
                        NavigationLink {
                            EditTransactionView()
                        } label: {
                            HStack(spacing: 10) {
                                transaction.icon
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text("\(String(transaction.title))")
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.white)
                                            .frame(width: 45, height: 45)
                                            .background(.colorOrange.gradient, in: .circle)
                                        Text(currencyString(transaction.amount, allowedDigits: 2))
                                            .fontWeight(.semibold)
                                    }
                                    
                                    Text(transaction.remarks).foregroundStyle(.secondary)
                                        .font(.caption)
                                        .foregroundStyle(Color.primary.secondary)
                                    
                                    Text(format(date: transaction.dateAdded, format: "dd MMM yyyy"))
                                        .font(.caption2)
                                        .foregroundStyle(.gray)
                                }
                                
                                if let budgets = transaction.budgets {
                                    ViewThatFits {
                                        BudgetsStackView()
                                        ScrollView(.horizontal, showsIndicators: false) {
                                            BudgetsStackView()
                                        }
                                    }
                                }
                            }
                        }
                    }
                        .onDelete { indexSet in
                            indexSet.forEach { index in
                                let transaction = transactions[index]
                                context.delete(transaction)
                            }
                        }
                    }
                .listStyle(.plain)
                    }
                }
            }
        }
#Preview {
    let preview = Preview(Transaction.self)
    preview.addExamples(Transaction.sampleTransactions)
    return NavigationStack {
        TransactionListView(sortOrder: .expense, filterString: "")
    }
    .modelContainer(preview.container)
}

