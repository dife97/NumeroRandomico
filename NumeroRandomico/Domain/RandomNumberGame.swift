class RandomNumberGame: RandomNumberProtocol {
    
    var attemptModel: AttemptModel = AttemptModel(maxNumberOfTries: 3, currentTryNumber: 1)

    var range: RangeModel = RangeModel(startNumber: 0, lastNumber: 10)
    
    private lazy var _randomNumber = generateRandomNumber(from: range)
    
    var randomNumber: Int {
        get {
            return _randomNumber
        }
    }
    
    func getResult(for userNumber: Int) -> ResultModel {
        
        attemptModel.currentTryNumber += 1
        
        if userNumber == randomNumber {
            reset()
            
            return ResultModel(userNumber: userNumber,
                               randomNumber: randomNumber,
                               attemptInformation: attemptModel,
                               result: .rightAnswer)
        }
        
        if userNumber > randomNumber && attemptModel.currentTryNumber <= attemptModel.maxNumberOfTries {
                        
            return ResultModel(userNumber: userNumber,
                               randomNumber: randomNumber,
                               attemptInformation: attemptModel,
                               result: .greaterNumber)
        }
        
        if userNumber < randomNumber && attemptModel.currentTryNumber <= attemptModel.maxNumberOfTries {
            
            return ResultModel(userNumber: userNumber,
                               randomNumber: randomNumber,
                               attemptInformation: attemptModel,
                               result: .smallerNumber)
        }
        
        else {
            reset()
            
            return ResultModel(userNumber: userNumber, randomNumber: 0, attemptInformation: attemptModel, result: .gameOver)
        }
    }
    
    func reset() {
        
        attemptModel.currentTryNumber = 1
        _randomNumber = generateRandomNumber(from: range)
    }
}
