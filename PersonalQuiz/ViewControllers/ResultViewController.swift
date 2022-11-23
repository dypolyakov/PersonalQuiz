//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Дмитрий Поляков on 24.11.2022.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}
