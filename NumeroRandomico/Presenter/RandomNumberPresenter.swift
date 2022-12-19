protocol RandomNumberPresenterProtocol {
    
    var interactor: RandomNumberInteractorProtocol { get }
    
    func viewDidLoad()
    
    func getGameResult(for userNumber: Int)
}

protocol RandomNumberPresenterDelegate: AnyObject {
    
    func gameOver()
    
    func rightAnswer(result: GameResult, randomNumber: Int)
    
    func greaterNumber(result: GameResult, randomNumber: Int)
    
    func smallerNumber(result: GameResult, randomNumber: Int)
}

protocol AttemptInformationDelegate: AnyObject {
    
    func configure(with attemptModel: AttemptModel)
}

class RandomNumberPresenter: RandomNumberPresenterProtocol {
    
    weak var delegate: RandomNumberPresenterDelegate?
    
    weak var attemptInformationDelegate: AttemptInformationDelegate?
    
    let interactor: RandomNumberInteractorProtocol
    
    init(interactor: RandomNumberInteractorProtocol) {
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        
        getAttemptInformation()
    }
    
    func getGameResult(for userNumber: Int) {
        
        interactor.getGameResult(for: userNumber) { [unowned self] result in
            
            switch result.result {
            
            case .rightAnswer:
                self.delegate?.rightAnswer(result: .rightAnswer, randomNumber: result.randomNumber)
                
            case .greaterNumber:
                self.delegate?.greaterNumber(result: .greaterNumber, randomNumber: result.randomNumber)
                
            case .smallerNumber:
                self.delegate?.smallerNumber(result: .smallerNumber, randomNumber: result.randomNumber)
                
            case .gameOver:
                self.delegate?.gameOver()
            }
        }
    }
    
    private func getAttemptInformation() {
        
        let attemptInformation = interactor.getAttemptInformation()
        
        attemptInformationDelegate?.configure(with: attemptInformation)
    }
}
