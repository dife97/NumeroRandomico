protocol RandomNumberProtocol {

    var attemptModel: AttemptModel { get }
    
    var range: RangeModel { get set }
    
    func generateRandomNumber(from range: RangeModel) -> Int
    
    func getResult(for userNumber: Int) -> ResultModel
    
    func reset()
}

extension RandomNumberProtocol {
    
    func generateRandomNumber(from range: RangeModel) -> Int {
        
        return Int.random(in: self.range.startNumber ... self.range.lastNumber)
    }
}
