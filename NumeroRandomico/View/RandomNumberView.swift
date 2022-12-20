import UIKit

protocol RandomNumberViewDelegate: AnyObject {
    
    func userNumberTextFieldChecker(_ textField: UITextField)
    
    func compareButtonAction(userNumber: Int)
}

class RandomNumberView: UIView {
    
    var userNumberTextFieldPlaceholder: String = "" {
        didSet {
            userNumberTextField.placeholder = userNumberTextFieldPlaceholder
        }
    }
    
    var outsideRangeAlertText: String = "" {
        didSet {
            outsideRangeAlertLabel.text = outsideRangeAlertText
        }
    }
    
    var numberOfTriesText: String = "" {
        didSet {
            numberOfTriesLabel.text = numberOfTriesText
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
    
    weak var delegate: RandomNumberViewDelegate?
    
    init(delegate: RandomNumberViewDelegate) {
        self.delegate = delegate
        
        super.init(frame: .zero)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RandomNumberView {
    
    private func configureView() {
        
        configureUserNumberTextField()
        
        configureCompareButton()
        
        configureLabels()
        
        additionalConfiguration()
    }
    
    private func configureUserNumberTextField() {
        
        addSubview(userNumberTextField)
        
        NSLayoutConstraint.activate([
            userNumberTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            userNumberTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            userNumberTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            userNumberTextField.heightAnchor.constraint(equalToConstant: 56),
        ])
    }
    
    private func configureCompareButton() {
        
        addSubview(compareButton)
        
        NSLayoutConstraint.activate([
            compareButton.topAnchor.constraint(equalTo: userNumberTextField.bottomAnchor, constant: 24),
            compareButton.leadingAnchor.constraint(equalTo: userNumberTextField.leadingAnchor),
            compareButton.trailingAnchor.constraint(equalTo: userNumberTextField.trailingAnchor),
            compareButton.heightAnchor.constraint(equalTo: userNumberTextField.heightAnchor),
        ])
    }
    
    private func configureLabels() {
        
        addSubview(outsideRangeAlertLabel)
        addSubview(numberOfTriesLabel)
        
        NSLayoutConstraint.activate([
            outsideRangeAlertLabel.topAnchor.constraint(equalTo: compareButton.bottomAnchor, constant: 8),
            outsideRangeAlertLabel.leadingAnchor.constraint(equalTo: userNumberTextField.leadingAnchor),
            outsideRangeAlertLabel.trailingAnchor.constraint(equalTo: userNumberTextField.trailingAnchor),
            
            numberOfTriesLabel.topAnchor.constraint(equalTo: outsideRangeAlertLabel.bottomAnchor, constant: 40),
            numberOfTriesLabel.leadingAnchor.constraint(equalTo: userNumberTextField.leadingAnchor),
            numberOfTriesLabel.trailingAnchor.constraint(equalTo: userNumberTextField.trailingAnchor)
        ])
    }
    
    private func additionalConfiguration() {
        
        backgroundColor = .white
    }
}

extension RandomNumberView {
    
    @objc private func didTapCompareButton() {
        
        guard let userNumberText = userNumberTextField.text,
              let userNumber = Int(userNumberText) else { return }
        
        delegate?.compareButtonAction(userNumber: userNumber)
    }
    
    func clearUserNumberTextField() {
        
        userNumberTextField.text = ""
    }
    
    func updateCompareButton(enabled: Bool, backgroundColor: UIColor) {
        
        compareButton.isEnabled = enabled
        compareButton.backgroundColor = backgroundColor
    }
    
    func addOutsideRangeLabel() {
        
        outsideRangeAlertLabel.isHidden = false
    }
    
    func removeOutsideRangeLabel() {
        
        outsideRangeAlertLabel.isHidden = true
    }
}

extension RandomNumberView: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        delegate?.userNumberTextFieldChecker(textField)
    }
}
