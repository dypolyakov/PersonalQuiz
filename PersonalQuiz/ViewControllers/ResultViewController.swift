//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Дмитрий Поляков on 24.11.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var resultTitle: UILabel!
    @IBOutlet var resultDefinition: UILabel!
    
    // MARK: - Public Properties
    var answers: [Answer] = []
    
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        let animal = identifyAnimal(from: answers)
        showResult(for: animal)
    }
    
    
    // MARK: - IB Actions
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    private func identifyAnimal(from answers: [Answer]) -> Animal {
        let animals = answers.map { $0.animal }
        
        return animals[0]
    }
    
    private func showResult(for animal: Animal) {
        resultTitle.text = "Вы - \(animal.rawValue)"
        resultDefinition.text = animal.definition
    }
}
