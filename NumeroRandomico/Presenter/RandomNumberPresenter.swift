class RandomNumberPresenter {
    
    weak var delegate: RandomNumberPresenterDelegate?
    
    weak var attemptInformationDelegate: AttemptInformationDelegate?
    
    let interactor: RandomNumberInteractorProtocol
    
    init(interactor: RandomNumberInteractorProtocol) {
        self.interactor = interactor
    }
}

extension RandomNumberPresenter: RandomNumberPresenterInput {
    
    func viewDidLoad() {
        
        getAttemptInformation()
    }
    
    func didTapRandomNumberButton(userNumber: Int) {
        
        getGameResult(for: userNumber)
    }
}

extension RandomNumberPresenter: RandomNumberPresenterProtocol {
    
    func getAttemptInformation() {
        
        let attemptInformation = interactor.getAttemptInformation()
        
        attemptInformationDelegate?.configure(with: attemptInformation)
    }
    
    func getGameResult(for userNumber: Int) {
        
        interactor.getGameResult(for: userNumber) { [unowned self] result in
            
            self.attemptInformationDelegate?.configure(with: result.attemptInformation)
            
        }
    }
}
