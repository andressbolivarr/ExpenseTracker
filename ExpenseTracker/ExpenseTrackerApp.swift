//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Andres Bolivar on 1/5/23.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
