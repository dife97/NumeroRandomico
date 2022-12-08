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
    
    private var resultText: ResultLabelText = .rightAnswer {
        didSet {
            resultLabel.text = resultText.rawValue
        }
    }
    
    private lazy var userNumberTextField: UITextField = {
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.darkGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.placeholder = "Digite o número"
        
        return textField
    }()
    
    private lazy var compareButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Gerar Número Aleatório", for: .normal)
        button.addTarget(self, action: #selector(didTapCompareButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 0
        label.textColor = resultTextColor
        label.textAlignment = .center
        label.text = resultText.rawValue
        
        return label
    }()
    
    private let presenter: RandomNumberPresenterProtocol
    
    init(presenter: RandomNumberPresenterProtocol) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
        configurePresenter()
    }
    
    private func configureView() {
        view.backgroundColor = .white
        
        view.addSubview(userNumberTextField)
        view.addSubview(compareButton)
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
            
            resultLabel.leadingAnchor.constraint(equalTo: userNumberTextField.leadingAnchor),
            resultLabel.trailingAnchor.constraint(equalTo: userNumberTextField.trailingAnchor),
            resultLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func configurePresenter() {
        
//        presenter.delegate = self
    }
    
    @objc private func didTapCompareButton() {
        
        guard let userNumberText = userNumberTextField.text,
              let userNumber = Int(userNumberText) else { return }
        
        presenter.getGameResult(for: userNumber)
    }
}

//extension RandomNumberViewController: RandomNumberPresenterDelegate {
//
//}


/*
 factory que retorne uma Presenter,
 onde dentro dela terá um interactor,
 onde dentro da interactor tenha uma RandomNumber
 que conforme com RandomNumberProtocol
 
 
 */
