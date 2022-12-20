class RandomNumberPresenter {
    
    weak var delegate: RandomNumberPresenterDelegate?
    
    weak var attemptInformationDelegate: AttemptInformationDelegate?
    
    weak var rangeInformationDelegate: RangeInformationDelegate?
    
    let interactor: RandomNumberInteractorProtocol
    
    init(interactor: RandomNumberInteractorProtocol) {
        self.interactor = interactor
    }
}

extension RandomNumberPresenter: RandomNumberPresenterInput {
    
    func viewDidLoad() {
        
        getAttemptInformation()
        
        getRangeInformation()
    }
    
    func didTapRandomNumberButton(userNumber: Int) {
        
        getGameResult(for: userNumber)
    }
    
    func didChangeValue(for value: String?) {
        
        guard let value = value else {
            
            delegate?.didTypeEmptyValue()
            
            return
        }
        
        guard let userNumber = Int(value) else { return }
        
        if interactor.isUserNumberOutsideRange(userNumber: userNumber) {
            
            delegate?.didTypeGreaterValue()
        } else {
            delegate?.didTypeAcceptableValue()
        }
    }
}

extension RandomNumberPresenter: RandomNumberPresenterProtocol {
    
    func getAttemptInformation() {
        
        let attemptInformation = interactor.getAttemptInformation()
        
        attemptInformationDelegate?.configure(with: attemptInformation)
    }
    
    func getRangeInformation() {
        
        let range = interactor.getRangeInformation()
        
        rangeInformationDelegate?.configureRangeInformation(startNumber: range.startNumber,
                                                            lastNumber: range.lastNumber)
    }
    
    func getGameResult(for userNumber: Int) {
        
        interactor.getGameResult(for: userNumber) { [unowned self] result in
            
            self.attemptInformationDelegate?.configure(with: result.attemptInformation)
            
            switch result.result {
                
            case .rightAnswer:
                self.delegate?.rightAnswer(message: .rightAnswer)
                
            case .greaterNumber:
                self.delegate?.greaterNumber(message: .greaterNumber)
                
            case .smallerNumber:
                self.delegate?.smallerNumber(message: .smallerNumber)
                
            case .gameOver:
                self.delegate?.gameOver(message: .gameOver)
            }
        }
    }
}


