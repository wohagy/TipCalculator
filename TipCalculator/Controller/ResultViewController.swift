//
//  ResultViewController.swift
//  TipCalculator
//
//  Created by wohagy on 29.01.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    var result: Double = 0
    var calculatingInfo: String = ""
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var calculatingInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = String(result)
        calculatingInfoLabel.text = calculatingInfo
    }
    
    deinit {
        print("secondVC was deinited")
    }
}
