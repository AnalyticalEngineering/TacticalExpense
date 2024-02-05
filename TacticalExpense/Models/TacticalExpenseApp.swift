//
//  TacticalExpenseApp.swift
//  TacticalExpense
//
//  Created by J. DeWeese on 2/3/24.
//

import SwiftUI
import SwiftData

@main
struct TacticalExpenseApp: App {
    let container: ModelContainer
    
    
    var body: some Scene {
        WindowGroup {
            TransactionScreen()
        }
        .modelContainer(container)
    }
    init() {
     
        let schema = Schema([Transaction.self, Budget.self])
        let config = ModelConfiguration("TacticalExpenseApp", schema: schema)
        do{
            container = try ModelContainer(for: schema, configurations: config)
        }catch{
            fatalError("Could not configure container")
        }
        
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
               
        }
    }

