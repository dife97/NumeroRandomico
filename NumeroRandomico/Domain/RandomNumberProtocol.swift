protocol RandomNumberProtocol {

    var attemptModel: AttemptModel { get }
    
    func generateRandomNumber(from range: RangeModel) -> Int
    
    func getResult(for userNumber: Int) -> ResultModel
    
    func reset()
}

extension RandomNumberProtocol {
    
    func generateRandomNumber(from range: RangeModel = RangeModel(startNumber: 0, lastNumber: 10)) -> Int {
        
        return Int.random(in: range.startNumber ... range.lastNumber)
    }
}

struct AttemptModel {

    let maxNumberOfTries: Int
    var currentTryNumber: Int
}
