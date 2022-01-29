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
        if let tip = tipControl.titleForSegment(at: controlIndex){
            let tipMinusPercentSign =  String(tip.dropLast())
            let tipAsANumber = Double(tipMinusPercentSign)
            return tipAsANumber! / 100
        } else {
            return 0
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
    @IBAction func splitsCountControl(_ sender: UIStepper) {
        splitCount = Int(sender.value)
    }
    
    @IBOutlet weak var splitsCountOutlet: UIStepper!
    
    @IBAction func calculateButtonAction(_ sender: UIButton) {
        calculator.calculateSplitedBill(tip: tipValue, totalBill: billTotal, splitFor: splitCount)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    @IBAction func unwindSegueToMainView(segue: UIStoryboardSegue){
        reloadCalculatorView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultVC = segue.destination as! ResultViewController
            resultVC.calculatingInfo = calculator.giveInfoAboutCalculating()
            resultVC.result = calculator.giveRoundedSplitedBill()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    private func reloadCalculatorView() {
        billTextField.text = ""
        tipControl.selectedSegmentIndex = 0
        splitsCountOutlet.value = splitsCountOutlet.minimumValue
        splitCount = Int(splitsCountOutlet.minimumValue)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
