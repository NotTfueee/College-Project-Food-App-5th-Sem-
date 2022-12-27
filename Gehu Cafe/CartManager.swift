//
//  CartManager.swift
//  Cafe
//
//  Created by Anurag Bhatt on 23/12/22.
//

import Foundation

class CartManager: ObservableObject  {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0
    
   
    
    
    // Functions to add and remove from cart
    func addToCart(product: Product) {
        products.append(product)
        total += product.price
    }
    
    func removeFromCart(product: Product) {
        products = products.filter { $0.id != product.id }
        total -= product.price
    }
    
    
}

