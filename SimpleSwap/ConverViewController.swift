//
//  ConverViewController.swift
//  SimpleSwap
//
//  Created by KHUMOYUNMIRZO TURSUNPULATOV on 04/04/23.
//

import UIKit

class ConverViewController: UIViewController {

    @IBOutlet weak var fromPopUpButton: UIButton!
    
    @IBOutlet weak var toPopUpBotton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Converting"
        
        setPopUpButton()
        
    }
    
    func setPopUpButton(){

        let optionClosure = {(action : UIAction) in
            print(action.title)}

        // from button func
        fromPopUpButton.menu = UIMenu(children : [
                UIAction(title : "USD", state: .on, handler: optionClosure),
                UIAction(title : "UZS", handler: optionClosure),
                UIAction(title : "EUR", handler: optionClosure),
                UIAction(title : "RUB", handler: optionClosure)])


        fromPopUpButton.showsMenuAsPrimaryAction = true
        fromPopUpButton.changesSelectionAsPrimaryAction = true
        
        // to button func
        toPopUpBotton.menu = UIMenu(children : [
                UIAction(title : "UZS", state: .on, handler: optionClosure),
                UIAction(title : "USD", handler: optionClosure),
                UIAction(title : "EUR", handler: optionClosure),
                UIAction(title : "RUB", handler: optionClosure)])


        toPopUpBotton.showsMenuAsPrimaryAction = true
        toPopUpBotton.changesSelectionAsPrimaryAction = true
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
