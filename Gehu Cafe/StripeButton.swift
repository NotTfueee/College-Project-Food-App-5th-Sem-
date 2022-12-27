//commmmmm
//  StripeButton.swift
//  Gehu Cafe
//
//  Created by Anurag Bhatt on 26/12/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import SwiftUI
import Stripe

struct StripeButton: View {
    
    @EnvironmentObject private var cart: CartManager
    @State private var isActive: Bool = false
    @State private var paymentMethodParams : STPPaymentMethodParams?
    @State private var message: String = ""
    let paymentGatewayController = PaymentGatewayController()
    
    private func startCheckout(completion: @escaping (String?) -> Void) {
        
        let url = URL(string: "https://blushing-adorable-dogsled.glitch.me/create-payment-intent")!

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONEncoder().encode(cart.products)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
                
            guard let data = data, error == nil,
                  (response as? HTTPURLResponse)?.statusCode == 200
            else {
                completion(nil)
                return
            }
            
            let checkoutIntentResponse = try? JSONDecoder().decode(CheckoutIntentResponse.self, from: data)
            completion(checkoutIntentResponse?.clientSecret)

        }.resume()
        
    }
    
    
    private func pay() {
        
        guard let clientSecret = PaymentConfig.shared.paymentIntentClientSecret else {
            return
        }
        
        let paymentIntentParams = STPPaymentIntentParams(clientSecret: clientSecret)
        paymentIntentParams.paymentMethodParams = paymentMethodParams
        
        paymentGatewayController.submitPayment(intent: paymentIntentParams) { status, intent, error in
            
            switch status {
                case .failed:
                    message = "Failed"
                case .canceled:
                    message = "Cancelled"
                case .succeeded:
                    message = "Your payment has been successfully completed!"
            }
            
        }
        
    }
    
    
    
    var body: some View {
        
        Button( action : {
            
            startCheckout { clientSecret in
                
                PaymentConfig.shared.paymentIntentClientSecret = clientSecret
                
                DispatchQueue.main.async {
                    isActive = true
                }
            }
            
            pay()
            
        } , label: {
            
            Text("Pay With STRIPE")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding()
                .background(Color.black
                    .cornerRadius(15)
                    .shadow(radius: 20)
                    .frame(width: 380))
            
        })

    }
}

struct StripeButton_Previews: PreviewProvider {
    static var previews: some View {
        StripeButton()
            .environmentObject(CartManager())
    }
}
