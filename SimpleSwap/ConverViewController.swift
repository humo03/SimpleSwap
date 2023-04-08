//
//  ConverViewController.swift
//  SimpleSwap
//
//  Created by KHUMOYUNMIRZO TURSUNPULATOV on 04/04/23.
//

import UIKit
import SwiftyJSON
import Alamofire

class ConverViewController: UIViewController {

    @IBOutlet weak var fromPopUpButton: UIButton!
    
    @IBOutlet weak var toPopUpBotton: UIButton!
    

    @IBOutlet weak var getResultTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    let CONVERT_URL = "https://api.currencybeacon.com/v1/convert"
    let API_ID = "f940d721fa8d92eb93441a357713ff35"
    
    var param : [String : String] = [
        "api_key" : "f940d721fa8d92eb93441a357713ff35"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Converting"
        
        setFromPopUpButton()
        setToPopUpButton()
        
        resultLabel.layer.cornerRadius = 5
        resultLabel.layer.masksToBounds = true
        
    }
    
    //MARK: Parsing JSON
    func getResult(json: JSON) {
        print(json)
        let result = json["response"]["value"].doubleValue
        resultLabel.text = String(format: "%.2f", result)
    }
    
        //MARK: Networking
    
    func getResultData(url: String, parameters: [String : String]) {
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            if response .result.isSuccess {
                let amountResult : JSON = JSON(response.value!)
                self.getResult(json: amountResult)
            } else {
                print("ERROR \(response.error)")
                self.resultLabel.text = "Connection issues"
            }
            
        }
    }
    
    
    //MARK: convert FROM func
    func setFromPopUpButton(){

        let optionClosure = {(action : UIAction) in
            let fromButton: String = action.title
            self.param["from"] = fromButton
        }
        

        fromPopUpButton.menu = UIMenu(children : [
                UIAction(title : "From", state: .on, handler: optionClosure),
                UIAction(title : "USD", handler: optionClosure),
                UIAction(title : "UZS", handler: optionClosure),
                UIAction(title : "EUR", handler: optionClosure),
                UIAction(title : "RUB", handler: optionClosure)])


        fromPopUpButton.showsMenuAsPrimaryAction = true
        fromPopUpButton.changesSelectionAsPrimaryAction = true
    }
    
    
    //MARK: convert TO func
    func setToPopUpButton(){

        let optionClosure = {(action : UIAction) in
            let toButton: String = action.title
            self.param["to"] = toButton
        }

        // to button func
        toPopUpBotton.menu = UIMenu(children : [
                UIAction(title : "To", state: .on, handler: optionClosure),
                UIAction(title : "UZS", handler: optionClosure),
                UIAction(title : "USD", handler: optionClosure),
                UIAction(title : "EUR", handler: optionClosure),
                UIAction(title : "RUB", handler: optionClosure)])


        toPopUpBotton.showsMenuAsPrimaryAction = true
        toPopUpBotton.changesSelectionAsPrimaryAction = true
    }
    
    
    @IBAction func finishButtonPressed(_ sender: UIButton) {
        let amount = getResultTextField.text!
        param["amount"] = amount
        
        
        getResultData(url: CONVERT_URL, parameters: param)
        
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
