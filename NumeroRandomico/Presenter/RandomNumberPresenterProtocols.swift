protocol RandomNumberPresenterInput {
    
    func viewDidLoad()
    
    func didTapRandomNumberButton(userNumber: Int)
}

protocol RandomNumberPresenterProtocol {
    
    var interactor: RandomNumberInteractorProtocol { get }
    
    func getAttemptInformation()
    
    func getGameResult(for userNumber: Int)
}

protocol AttemptInformationDelegate: AnyObject {
    
    func configure(with attemptModel: AttemptModel)
}

protocol RandomNumberPresenterDelegate: AnyObject {
    
    func gameOver()
    
    func rightAnswer(result: ResultModel)
    
    func greaterNumber(result: ResultModel)
    
    func smallerNumber(result: ResultModel)
}
