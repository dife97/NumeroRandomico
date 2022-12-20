protocol RandomNumberProtocol {

    var attemptModel: AttemptModel { get }
    
    var range: RangeModel { get set }
    
    var randomNumber: Int { get }
    
    func generateRandomNumber(from range: RangeModel) -> Int
    
    func getResult(for userNumber: Int) -> ResultModel
    
    func reset()
}

extension RandomNumberProtocol {
    
    func generateRandomNumber(from range: RangeModel) -> Int {
        
        return Int.random(in: self.range.startNumber ... self.range.lastNumber)
    }
}
