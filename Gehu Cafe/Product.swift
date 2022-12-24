//
//  Product.swift
//  Cafe
//
//  Created by Anurag Bhatt on 23/12/22.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}

var productList = [Product(name: "Aaloo Paratha", image: "aaloo_paratha", price: 30),
                   Product(name: "Fried Rice ", image: "fried_rice", price: 30),
                   Product(name: "Boiled Eggs", image: "boiled_egg", price: 10),
                   Product(name: "Chowmien", image: "chowmien", price: 30),
                   Product(name: "Plain Maggi", image: "maggi", price: 30),
                   Product(name: "Masala Maggi", image: "mmaggi", price: 40),
                   Product(name: "Pav Bhaji", image: "pav", price: 30),
                   Product(name: "Egg Fried Rice", image: "eggfr", price: 50),
                   Product(name: "Paneer Paratha", image: "paneer_paratha", price: 40),
                   Product(name: "Egg Chowmien", image: "eggChowmien", price: 30),
                   Product(name: "Omelette", image: "omelette", price: 30),
                   Product(name: "Rajma Rice", image: "rajma", price: 30),
                   Product(name: "Veg Thali", image: "veg_thali", price: 70),
                   Product(name: "Plain Partha", image: "plain_paratha", price: 30),
                   Product(name: "Bread Roll", image: "br", price: 10),
                   Product(name: "Momos", image: "momo", price: 30),
                   Product(name: "Macaroni", image: "macaroni", price: 30),]
