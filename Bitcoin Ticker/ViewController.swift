//
//  ViewController.swift
//  Bitcoin Ticker
//
//  Created by murad on 30/04/2019.
//  Copyright © 2019 murad. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

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
        getBitcoinData(url: finalURL)
    }


    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(currencyArray[row])
        
        finalURL = baseURL + currencyArray[row]
        print(finalURL)
    }
    
    //MARK: - Networking
    /***************************************************************/
    
    func getBitcoinData(url: String) {
        
        Alamofire.request(url, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {
                    
                    print("Sucess! Got the Bitcoin data")
                    let bitcoinJSON: JSON = JSON(response.result.value!)
                    
                    self.updateBitcoinData(json: bitcoinJSON)
                    
                } else {
                    print("Error: \(String(describing: response.result.error))")
                    self.bitcoinPriceLabel.text = "Connection Issues"
                }
        }
        
    }
    
    //MARK: - JSON Parsing
    /***************************************************************/
    
    func updateBitcoinData(json: JSON) {
        
        if let bitcoinpPriceResult = json["ask"].double {
            bitcoinPriceLabel.text = String(bitcoinpPriceResult)
            print(bitcoinpPriceResult)
        } else {
            bitcoinPriceLabel.text = "Bitcoin price Unavailable"
        }
        
    }

    
}

