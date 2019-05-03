//
//  ViewController.swift
//  Bitcoin Ticker
//
//  Created by murad on 30/04/2019.
//  Copyright © 2019 murad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    var finalURL = ""
    
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerView(currencyPicker, didSelectRow: 0, inComponent: 1)
    }


    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(currencyArray[row])
        
        finalURL = baseURL + currencyArray[row]
        print(finalURL)
    }
    
}

