//
//  PaymentConfig.swift
//  Gehu Cafe
//
//  Created by Anurag Bhatt on 26/12/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation

class PaymentConfig {
    
    var paymentIntentClientSecret: String?
    static var shared: PaymentConfig = PaymentConfig()
    
    private init() { }
}
