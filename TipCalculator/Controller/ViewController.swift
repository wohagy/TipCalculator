//
//  ViewController.swift
//  TipCalculator
//
//  Created by Macbook on 28.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var calculator = Calculator()
    
    private var splitCount: Int = 2 {
        didSet {
            splitsCountLabel.text = String(splitCount)
        }
    }
    
    private var tipValue: Double {
        let controlIndex = tipControl.selectedSegmentIndex
        let tip = tipControl.titleForSegment(at: controlIndex)
        switch tip {
        case "0%":
            return 1 
        case "10%":
            return 0.1
        case "20%":
            return 0.2
        default:
            return 0.5
        }
    }
    
    private var billTotal: Double {
        guard let bill = billTextField.text else {return 0}
        if bill != "" {
            return Double(bill)!
        } else {
            return 0
        }
    }
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var splitsCountLabel: UILabel!
    @IBAction func splitsCounControl(_ sender: UIStepper) {
        splitCount = Int(sender.value)
    }
    
    @IBAction func calculateButtonAction(_ sender: UIButton) {
        calculator.calculateSplitedBill(tip: tipValue, totalBill: billTotal, splitFor: splitCount)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    @IBAction func unwindSegueToMainView(segue: UIStoryboardSegue){
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultVC = segue.destination as! ResultViewController
            resultVC.calculatingInfo = calculator.giveInfoAboutCalculating()
            resultVC.result = calculator.giveRoundedSplitedBill()
        }
    }

}

