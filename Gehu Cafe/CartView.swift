//
//  CartView.swift
//  Cafe
//
//  Created by Anurag Bhatt on 23/12/22.
//

import SwiftUI
import Stripe

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var paymentMethodParams : STPPaymentMethodParams?
    
    
    

    var body: some View {
        ScrollView {
            
                if cartManager.products.count > 0 {
                    ForEach(cartManager.products, id: \.id) { product in
                        ProductRow(product: product)
                    }
                    
                    HStack {
                        Text("Your cart total is")
                        Spacer()
                        Text("₹\(cartManager.total).00")
                            .bold()
                    }
                    .padding()
                    
                    StripeButton()
                        .padding()
                    
                    PaymentButton(action: {})
                        .padding()
                    
                    Section{
                        STPPaymentCardTextField.Representable.init(paymentMethodParams: $paymentMethodParams)
                    } header: {
                        Text("Payment Information")
                    }
                    
                    
                } else {
                    Text("Your cart is empty.")
                }
            
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
        .onDisappear {
            
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
