import UIKit

class RandomNumberViewController: UIViewController {
    
    private lazy var randomNumberView = RandomNumberView(delegate: self)
    
    private let presenter: RandomNumberPresenterInput
    
    init(presenter: RandomNumberPresenterInput) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        
        view = randomNumberView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    private func updateNumberOfTriesLabel(with attemptModel: AttemptModel) {
        
        randomNumberView.numberOfTriesText = "Tentativa \(attemptModel.currentTryNumber) de \(attemptModel.maxNumberOfTries)"
    }
    
    private func showResult(with message: String) {
        
        let alert = AlertConfiguration(
            title: "Resultado",
            message: message,
            actionTittle: "Ok",
            actionStyle: .default) { action in
                
                self.randomNumberView.clearUserNumberTextField()
                
                self.dismiss(animated: true)
            }
        
        showAlert(with: alert)
    }
}

extension RandomNumberViewController: RandomNumberViewDelegate {
    
    func userNumberTextFieldChecker(_ textField: UITextField) {
        
        presenter.didChangeValue(for: textField.text)
    }
    
    func compareButtonAction(userNumber: Int) {
        
        randomNumberView.updateCompareButton(enabled: false, backgroundColor: .lightGray)
        
        presenter.didTapRandomNumberButton(userNumber: userNumber)
    }
}

extension RandomNumberViewController: AttemptInformationDelegate {
    
    func configure(with attemptModel: AttemptModel) {
        
        updateNumberOfTriesLabel(with: attemptModel)
    }
}

extension RandomNumberViewController: RangeInformationDelegate {
    
    func configureRangeInformation(startNumber: Int, lastNumber: Int) {
        
        randomNumberView.userNumberTextFieldPlaceholder = "Digite um número de \(startNumber) à \(lastNumber)"
        randomNumberView.outsideRangeAlertText = "Apenas números de \(startNumber) à \(lastNumber)"
    }
}

extension RandomNumberViewController: RandomNumberPresenterDelegate {
    
    func didTypeEmptyValue() {
        
        randomNumberView.updateCompareButton(enabled: false, backgroundColor: .lightGray)
    }
    
    func didTypeGreaterValue() {
        
        randomNumberView.updateCompareButton(enabled: false, backgroundColor: .lightGray)
        
        randomNumberView.addOutsideRangeLabel()
    }
    
    func didTypeAcceptableValue() {
        
        randomNumberView.updateCompareButton(enabled: true, backgroundColor: .blue)
        
        randomNumberView.removeOutsideRangeLabel()
    }
    
    func gameOver(message: GameResultTexts) {
        
        showResult(with: message.rawValue)
    }
    
    func rightAnswer(message: GameResultTexts) {
        
        showResult(with: message.rawValue)
    }
    
    func greaterNumber(message: GameResultTexts) {
        
        showResult(with: message.rawValue)
    }
    
    func smallerNumber(message: GameResultTexts) {
        
        showResult(with: message.rawValue)
    }
}
