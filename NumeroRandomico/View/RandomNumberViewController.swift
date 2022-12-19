import UIKit

enum ResultLabelText: String {
    
    case rightAnswer = "Você acertou 😁"
    case wrongAnswer = "Você errou 😭\nTente novamente"
    case lastWrongAnswer = "Game over 😭"
}

class RandomNumberViewController: UIViewController {
    
    private var resultTextColor: UIColor = .black {
        didSet {
            resultLabel.textColor = resultTextColor
        }
    }
    
    private var randomNumberText: String = "" {
        didSet {
            randomNumberLabel.text = randomNumberText
        }
    }
    
    private var resultText: ResultLabelText = .rightAnswer {
        didSet {
            resultLabel.text = resultText.rawValue
        }
    }
    
    private lazy var userNumberTextField: UITextField = {
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.layer.borderColor = UIColor.darkGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    private lazy var compareButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Gerar Número Aleatório", for: .normal)
        button.addTarget(self, action: #selector(didTapCompareButton), for: .touchUpInside)
        
        button.isEnabled = false
        button.backgroundColor = .lightGray
        button.setTitleColor(.darkGray, for: .disabled)
        
        return button
    }()
    
    private lazy var outsideRangeAlertLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.textColor = .red
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var numberOfTriesLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var randomNumberLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        label.isHidden = true
        
        return label
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 0
        label.textColor = resultTextColor
        label.textAlignment = .center
        label.isHidden = true
        
        return label
    }()
    
    private let presenter: RandomNumberPresenterInput
    
    init(presenter: RandomNumberPresenterInput) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
        presenter.viewDidLoad()
        
        
    }
    
    private func configureView() {
        
        view.backgroundColor = .white
        
        view.addSubview(userNumberTextField)
        view.addSubview(compareButton)
        view.addSubview(numberOfTriesLabel)
        view.addSubview(randomNumberLabel)
        view.addSubview(resultLabel)
        
        NSLayoutConstraint.activate([
            userNumberTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            userNumberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userNumberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            userNumberTextField.heightAnchor.constraint(equalToConstant: 56),
            
            compareButton.topAnchor.constraint(equalTo: userNumberTextField.bottomAnchor, constant: 24),
            compareButton.leadingAnchor.constraint(equalTo: userNumberTextField.leadingAnchor),
            compareButton.trailingAnchor.constraint(equalTo: userNumberTextField.trailingAnchor),
            compareButton.heightAnchor.constraint(equalTo: userNumberTextField.heightAnchor),
            
            numberOfTriesLabel.topAnchor.constraint(equalTo: compareButton.bottomAnchor, constant: 48),
            numberOfTriesLabel.leadingAnchor.constraint(equalTo: userNumberTextField.leadingAnchor),
            numberOfTriesLabel.trailingAnchor.constraint(equalTo: userNumberTextField.trailingAnchor),
            
            randomNumberLabel.topAnchor.constraint(equalTo: numberOfTriesLabel.bottomAnchor, constant: 24),
            randomNumberLabel.leadingAnchor.constraint(equalTo: userNumberTextField.leadingAnchor),
            randomNumberLabel.trailingAnchor.constraint(equalTo: userNumberTextField.trailingAnchor),
            
            resultLabel.topAnchor.constraint(equalTo: randomNumberLabel.bottomAnchor, constant: 24),
            resultLabel.leadingAnchor.constraint(equalTo: userNumberTextField.leadingAnchor),
            resultLabel.trailingAnchor.constraint(equalTo: userNumberTextField.trailingAnchor)
        ])
    }
    
    private func addOutsideRangeAlertLabel() {
        
        view.addSubview(outsideRangeAlertLabel)
        
        NSLayoutConstraint.activate([
            outsideRangeAlertLabel.topAnchor.constraint(equalTo: compareButton.bottomAnchor, constant: 8),
            outsideRangeAlertLabel.leadingAnchor.constraint(equalTo: userNumberTextField.leadingAnchor),
            outsideRangeAlertLabel.trailingAnchor.constraint(equalTo: userNumberTextField.trailingAnchor),
        ])
    }
    
    private func removeOutsideRangeAlertLabel() {
        
        outsideRangeAlertLabel.removeFromSuperview()
    }
    
    @objc private func didTapCompareButton() {
        
        guard let userNumberText = userNumberTextField.text,
              let userNumber = Int(userNumberText) else { return }
        
        presenter.didTapRandomNumberButton(userNumber: userNumber)
    }
    
    private func updateNumberOfTriesLabel(with attemptModel: AttemptModel) {
        
        numberOfTriesLabel.text = "Tentativa \(attemptModel.currentTryNumber) de \(attemptModel.maxNumberOfTries)"
    }
    
    private func configureCompareButton(enabled: Bool, backgroundColor: UIColor) {
        
        compareButton.isEnabled = enabled
        compareButton.backgroundColor = backgroundColor
    }
}

extension RandomNumberViewController: AttemptInformationDelegate {
    
    func configure(with attemptModel: AttemptModel) {
        
        updateNumberOfTriesLabel(with: attemptModel)
    }
}

extension RandomNumberViewController: RangeInformationDelegate {
    
    func configureRangeInformation(startNumber: Int, lastNumber: Int) {
        
        userNumberTextField.placeholder = "Digite um número de \(startNumber) à \(lastNumber)"
        outsideRangeAlertLabel.text = "Apenas números entre \(startNumber) e \(lastNumber)"
    }
}

extension RandomNumberViewController: RandomNumberPresenterDelegate {
    
    func didReceiveEmptyValue() {
        
        configureCompareButton(enabled: false, backgroundColor: .lightGray)
    }
    
    func didReceiveGreaterValue() {
        
        configureCompareButton(enabled: false, backgroundColor: .lightGray)
        
        addOutsideRangeAlertLabel()
    }
    
    func didReceiveAcceptableValue() {
        
        configureCompareButton(enabled: true, backgroundColor: .blue)
        
        removeOutsideRangeAlertLabel()
    }
    
    func gameOver() {
        
    }
    
    func rightAnswer(result: ResultModel) {
        
    }
    
    func greaterNumber(result: ResultModel) {
        
    }
    
    func smallerNumber(result: ResultModel) {

    }
}

extension RandomNumberViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        presenter.didChangeValue(for: textField.text)
    }
}
