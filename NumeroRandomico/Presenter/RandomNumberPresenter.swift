protocol RandomNumberPresenterProtocol {
    
    var interactor: RandomNumberInteractorProtocol { get }
    
    func getGameResult(for userNumber: Int)
}

protocol RandomNumberPresenterDelegate: AnyObject {
    
    func gameOver()
    
    func rightAnswer()
    
    func greaterNumber()
    
    func smallerNumber()
}

class RandomNumberPresenter: RandomNumberPresenterProtocol {
    
    weak var delegate: RandomNumberPresenterDelegate?
    
    let interactor: RandomNumberInteractorProtocol
    
    init(interactor: RandomNumberInteractorProtocol) {
        self.interactor = interactor
    }
    
    func getGameResult(for userNumber: Int) {
        
        interactor.getGameResult(for: userNumber) { [unowned self] result in

            switch result {
                
            case .rightAnswer:
                self.delegate?.rightAnswer()
                
            case .greaterNumber:
                self.delegate?.greaterNumber()
                
            case .smallerNumber:
                self.delegate?.smallerNumber()
                
            case .gameOver:
                self.delegate?.gameOver()
            }
        }
    }
}
