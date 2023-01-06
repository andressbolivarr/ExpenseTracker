//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Andres Bolivar on 1/5/23.
//

import Foundation
import SwiftUI

struct Transaction: Identifiable, Decodable, Hashable{
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
//    var icon: FontAwesomeCode{
//        if let category = Category.all.first(where: { $0.id == categoryId}){
//            return category.icon
//        }
//        
//        return .question
//    }
    
    var dateParsed: Date{
        date.dateParsed()
    }
    
    var signedAmount: Double{
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
    
    var month: String{
        dateParsed.formatted(.dateTime.year().month(.wide))
    }
}

enum TransactionType: String{
    case debit = "debit"
    case credit = "credit"
}
struct Category {
    let id: Int
    let name: String
    let icon: String
    var mainCategoryId: Int?
}


extension Category {
    static let autoAndTransport = Category(id: 1, name: "Auto & Transport", icon: "Cart")
    static let billsAndUtilities = Category(id: 2, name: "Bills & Utilities", icon: "Cart")
    static let entertainment = Category(id: 3, name: "Entertainment", icon: "Cart")
    static let feesAndCharges = Category(id: 4, name: "Fees & Charges", icon: "Cart")
    static let foodAndDining = Category(id: 5, name: "Food & Dining", icon: "Cart")
    static let home = Category(id: 6, name: "Home", icon: "Cart")
    static let income = Category(id: 7, name: "Income", icon: "Cart")
    static let shopping = Category(id: 8, name: "Shopping", icon: "Cart")
    static let transfer = Category(id: 9, name:"Transfer", icon: "Cart")
    
    static let publicTransportation = Category(id: 101, name: "Public Transportation", icon: "Cart", mainCategoryId: 1)
    static let taxi = Category(id: 102, name: "Taxi", icon: "Cart", mainCategoryId: 1)
    static let mobilePhone = Category(id: 201, name: "Mobile Phone", icon: "Cart", mainCategoryId: 2)
    static let moviesAndDVDs = Category(id: 301, name: "Movies & DVDs", icon: "Cart", mainCategoryId: 3)
    static let bankFee = Category(id: 401, name: "Bank Fee", icon: "Cart", mainCategoryId: 4)
    static let financeCharge = Category(id: 402, name: "Finance Charge", icon: "Cart", mainCategoryId: 4)
    static let groceries = Category(id: 501, name: "Groceries", icon: "Cart", mainCategoryId: 5)
    static let restaurants = Category(id: 502, name: "Restaurants", icon: "Cart", mainCategoryId: 5)
    static let rent = Category(id: 601, name: "Rent", icon: "Cart", mainCategoryId: 6)
    static let homeSupplies = Category(id: 602, name: "Home Supplies", icon: "Cart", mainCategoryId: 6)
    static let paycheck = Category(id: 701, name: "PayCheck", icon: "Cart", mainCategoryId: 7)
    static let software = Category(id: 801, name: "Software", icon: "Cart", mainCategoryId: 8)
    static let creditCardPayment = Category(id: 901, name: "Credit Card Payment", icon: "Cart", mainCategoryId: 9)
}

extension Category{
    static let Categories: [Category] = [
        .autoAndTransport,
        .billsAndUtilities,
        entertainment,
        feesAndCharges,
        foodAndDining,
        home,
        income,
        shopping,
        transfer
    ]
    
    static let subCategories: [Category] = [
        .publicTransportation,
        .taxi
        ,
        mobilePhone,
        .moviesAndDVDs,
        bankFee,
        financeCharge,
        groceries,
        restaurants,
        rent,
        homeSupplies,
        paycheck,
        software,
        creditCardPayment
    ]
    
    static let all : [Category] = Categories + subCategories
}
