//
//  QuestionsViewController.swift
//  PersonalQuiz
//
//  Created by Дмитрий Поляков on 23.11.2022.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var rangedSlider: UISlider!
    
    // MARK: - Private Properties
    private let questions = Question.getQuestions()

    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - IB Actions
    @IBAction func singleButtonAnswerAction(_ sender: UIButton) {
    }
    
    @IBAction func multipleButtonAnswerAction() {
    }
    
    @IBAction func rangedButtonAnswerAction() {
    }
}

