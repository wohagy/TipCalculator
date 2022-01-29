//
//  ViewController.swift
//  TipCalculator
//
//  Created by Macbook on 28.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func calculateButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultVC = segue.destination as! ResultViewController
            print(resultVC.someProperty)
        }
    }

}

