protocol RandomNumberInteractorProtocol {
    
    var randomNumber: RandomNumberProtocol { get }
    
    func getGameResult(for userNumber: Int, onComplete: @escaping (GameResult) -> Void)
}

class RandomNumberInteractor: RandomNumberInteractorProtocol {
    
    let randomNumber: RandomNumberProtocol
    
    init(randomNumber: RandomNumberProtocol) {
        self.randomNumber = randomNumber
    }
    
    func getGameResult(for userNumber: Int, onComplete: @escaping (GameResult) -> Void) {
        
        let gameResult = randomNumber.checkResult(for: userNumber)
        
        onComplete(gameResult)
    }
}
