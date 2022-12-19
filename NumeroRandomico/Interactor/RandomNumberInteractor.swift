protocol RandomNumberInteractorProtocol {
    
    var randomNumberGame: RandomNumberProtocol { get }
    
    func getGameResult(for userNumber: Int, onComplete: @escaping (ResultModel) -> Void)
}

class RandomNumberInteractor: RandomNumberInteractorProtocol {
    
    let randomNumberGame: RandomNumberProtocol
    
    init(randomNumberGame: RandomNumberProtocol) {
        self.randomNumberGame = randomNumberGame
    }
    
    func getGameResult(for userNumber: Int, onComplete: @escaping (ResultModel) -> Void) {
        
        let gameResult = randomNumberGame.getResult(for: userNumber)
        
        onComplete(gameResult)
    }
}
