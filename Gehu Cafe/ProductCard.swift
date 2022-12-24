//
//  ProductCard.swift
//  Cafe
//
//  Created by Anurag Bhatt on 23/12/22.
//

import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                Image(product.image)
                    .resizable()
                    .padding(.all)
                    .cornerRadius(20)
                    .frame(width: 280, height: 200, alignment: .center)
                    .scaledToFit()
                

                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("₹\(product.price)")
                        .font(.caption)
                        .bold()
                }
                .padding(-10)
                .frame(width: 180,height: 50 , alignment: .center)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            }
            .padding(.horizontal)
            .frame(width: 180, height: 250)
            .shadow(radius: 5)
            
            Button {
                cartManager.addToCart(product: product)
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding()
            }
        }
        .padding(.horizontal)
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: productList[0])
            .environmentObject(CartManager())
    }
}
