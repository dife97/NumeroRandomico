protocol RandomNumberPresenterInput {
    
    func viewDidLoad()
    
    func didTapRandomNumberButton(userNumber: Int)
    
    func didChangeValue(for value: String?)
}

protocol RandomNumberPresenterProtocol {
    
    var interactor: RandomNumberInteractorProtocol { get }
    
    func getAttemptInformation()
    
    func getRangeInformation()
    
    func getGameResult(for userNumber: Int)
}

protocol AttemptInformationDelegate: AnyObject {
    
    func configure(with attemptModel: AttemptModel)
}

protocol RangeInformationDelegate: AnyObject {
    
    func configureRangeInformation(startNumber: Int, lastNumber: Int)
}

protocol RandomNumberPresenterDelegate: AnyObject {
    
    func didReceiveEmptyValue()
    
    func didReceiveGreaterValue()
    
    func didReceiveAcceptableValue()
    
    func gameOver()
    
    func rightAnswer(result: ResultModel)
    
    func greaterNumber(result: ResultModel)
    
    func smallerNumber(result: ResultModel)
}
