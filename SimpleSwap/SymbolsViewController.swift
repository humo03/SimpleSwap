//
//  SymbolsViewController.swift
//  SimpleSwap
//
//  Created by KHUMOYUNMIRZO TURSUNPULATOV on 04/04/23.
//

import UIKit
import SwiftyJSON
import Alamofire

class SymbolsViewController: UIViewController {
    
    
    let currencies_url = "https://api.currencybeacon.com/v1/currencies"
    let api_key = "f940d721fa8d92eb93441a357713ff35"

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Symbols"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
