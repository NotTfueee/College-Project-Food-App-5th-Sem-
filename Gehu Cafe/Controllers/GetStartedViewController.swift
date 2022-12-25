//
//  GetStartedViewController.swift
//
//
//  Created by Anurag on 24/12/2022.
//
//


import UIKit
import SwiftUI

class GetStartedViewController: UIViewController {

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
         navigationItem.hidesBackButton = true

    }
    
   
    @IBSegueAction func getStartedButtonPressed(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: ContentView())
    }
    
}
