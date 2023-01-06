//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Andres Bolivar on 1/6/23.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack{
            List{
//                MARK: Transactions Group
                ForEach(Array(transactionListVM.groupTransactionbyMonth()), id: \.key){
                    month, transactions in
                    Section{
                        //                    MARK: Transaction List
                        ForEach(transactions) { transaction in
                            TransactionRow(transaction: transaction)
                        }
                    } header: {
//                   MARK: Transaction Month
                        Text(month)
                        }
                    
                    }
                    
                }
            .listStyle(.plain)
            }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
        }
        
    }

struct TransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        NavigationView {
            TransactionList()
        }
        .environmentObject(transactionListVM)
        NavigationView {
            TransactionList()
                .preferredColorScheme(.dark)
        }
        
        .environmentObject(transactionListVM)
    }
}
