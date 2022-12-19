protocol RandomNumberInteractorProtocol {
    
    var randomNumberGame: RandomNumberProtocol { get }
    
    func getAttemptInformation() -> AttemptModel
    
    func isUserNumberOutsideRange(userNumber: Int) -> Bool
    
    func getGameResult(for userNumber: Int, onComplete: @escaping (ResultModel) -> Void)
}
