import UIKit

class RandomNumberViewController: UIViewController {
    
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
        label.isHidden = true
        
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
        view.addSubview(outsideRangeAlertLabel)
        view.addSubview(numberOfTriesLabel)
        
        NSLayoutConstraint.activate([
            userNumberTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            userNumberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userNumberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            userNumberTextField.heightAnchor.constraint(equalToConstant: 56),
            
            compareButton.topAnchor.constraint(equalTo: userNumberTextField.bottomAnchor, constant: 24),
            compareButton.leadingAnchor.constraint(equalTo: userNumberTextField.leadingAnchor),
            compareButton.trailingAnchor.constraint(equalTo: userNumberTextField.trailingAnchor),
            compareButton.heightAnchor.constraint(equalTo: userNumberTextField.heightAnchor),
            
            outsideRangeAlertLabel.topAnchor.constraint(equalTo: compareButton.bottomAnchor, constant: 8),
            outsideRangeAlertLabel.leadingAnchor.constraint(equalTo: userNumberTextField.leadingAnchor),
            outsideRangeAlertLabel.trailingAnchor.constraint(equalTo: userNumberTextField.trailingAnchor),
            
            numberOfTriesLabel.topAnchor.constraint(equalTo: outsideRangeAlertLabel.bottomAnchor, constant: 40),
            numberOfTriesLabel.leadingAnchor.constraint(equalTo: userNumberTextField.leadingAnchor),
            numberOfTriesLabel.trailingAnchor.constraint(equalTo: userNumberTextField.trailingAnchor)
        ])
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
        
        outsideRangeAlertLabel.isHidden = false
    }
    
    func didReceiveAcceptableValue() {
        
        configureCompareButton(enabled: true, backgroundColor: .blue)
        
        outsideRangeAlertLabel.isHidden = true
    }
    
    func gameOver(message: GameResultTexts) {
        
        let alert = AlertConfiguration(
            title: "Resultado",
            message: message.rawValue,
            actionTittle: "Ok",
            actionStyle: .default) { action in
                
                self.userNumberTextField.text = ""
                
                self.configureCompareButton(enabled: false, backgroundColor: .lightGray)
                
                self.dismiss(animated: true)
            }
        
        showAlert(with: alert)
    }
    
    func rightAnswer(message: GameResultTexts) {
        
        let alert = AlertConfiguration(
            title: "Resultado",
            message: message.rawValue,
            actionTittle: "Ok",
            actionStyle: .default) { [unowned self]  action in
                
                self.userNumberTextField.text = ""
                
                self.configureCompareButton(enabled: false, backgroundColor: .lightGray)
                
                self.dismiss(animated: true)
            }
        
        showAlert(with: alert)
    }
    
    func greaterNumber(message: GameResultTexts) {
        
        let alert = AlertConfiguration(
            title: "Resultado",
            message: message.rawValue,
            actionTittle: "Ok",
            actionStyle: .default) { [unowned self] action in
                
                self.userNumberTextField.text = ""
                
                self.configureCompareButton(enabled: false, backgroundColor: .lightGray)
                
                self.dismiss(animated: true)
            }
        
        showAlert(with: alert)
    }
    
    func smallerNumber(message: GameResultTexts) {
        
        let alert = AlertConfiguration(
            title: "Resultado",
            message: message.rawValue,
            actionTittle: "Ok",
            actionStyle: .default) { [unowned self] action in
                
                self.userNumberTextField.text = ""
                
                self.configureCompareButton(enabled: false, backgroundColor: .lightGray)
                
                self.dismiss(animated: true)
            }
        
        showAlert(with: alert)
    }
}

extension RandomNumberViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        presenter.didChangeValue(for: textField.text)
    }
}
