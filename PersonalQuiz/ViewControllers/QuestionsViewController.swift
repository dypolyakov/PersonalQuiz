//
//  QuestionsViewController.swift
//  PersonalQuiz
//
//  Created by Дмитрий Поляков on 23.11.2022.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var questionProgressView: UIProgressView!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var rangedSlider: UISlider! {
        didSet {
            let answersCount = Float(currentAnswers.count - 1)
            rangedSlider.maximumValue = answersCount
            rangedSlider.value = answersCount / 2
        }
    }
    
    // MARK: - Private Properties
    private let questions = Question.getQuestions()
    private var answersChosen: [Answer] = []
    private var questionIndex = 0
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }

    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    // MARK: - IB Actions
    @IBAction func singleButtonAnswerAction(_ sender: UIButton) {
        guard let buttonIndex = singleButtons.firstIndex(of: sender) else { return }
        let answer = currentAnswers[buttonIndex]
        answersChosen.append(answer)
        nextQuestion()
    }
    
    @IBAction func multipleButtonAnswerAction() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answersChosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedButtonAnswerAction() {
        let sliderIndex = lrintf(rangedSlider.value)
        answersChosen.append(currentAnswers[sliderIndex])
        nextQuestion()
    }
}

// MARK: - Private Methods
extension QuestionsViewController {
    private func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
            
            let currentQuestion = questions[questionIndex]
            
            questionLabel.text = currentQuestion.title
            
            let totalProgress = Float(questionIndex) / Float(questions.count)
            questionProgressView.setProgress(totalProgress, animated: true)
            
            title = "Вопрос №\(questionIndex + 1) из \(questions.count)"
            
            showCurrentAnswers(for: currentQuestion.responseType)
            
        }
    }
    
    private func showCurrentAnswers(for type: ResponseType) {
        switch type {
        case .single:
            showSingleStackView(with: currentAnswers)
        case .multiple:
            showMultipleStackView(with: currentAnswers)
        case .ranged:
            showRangedStackView(with: currentAnswers)
        }
    }
    
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.title, for: .normal)
            
        }
    }
    
    private func showMultipleStackView(with answers: [Answer]) {
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.title
        }
    }
    
    private func showRangedStackView(with answers: [Answer]) {
        rangedStackView.isHidden = false
        
        rangedLabels.first?.text = answers.first?.title
        rangedLabels.last?.text = answers.last?.title
    }
    
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
            return
        }
        
        performSegue(withIdentifier: "showResult", sender: nil)
    }
}