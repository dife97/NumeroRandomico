class RandomNumberGame: RandomNumberProtocol {
    
    var attemptModel: AttemptModel = AttemptModel(maxNumberOfTries: 3, currentTryNumber: 1)

    var range: RangeModel = RangeModel(startNumber: 0, lastNumber: 10)
    
    func getResult(for userNumber: Int) -> ResultModel {
        
        if attemptModel.currentTryNumber >= attemptModel.maxNumberOfTries {
            reset()
            
            return ResultModel(userNumber: userNumber, randomNumber: 0, attemptInformation: attemptModel, result: .gameOver)
        }
        
        let randomNumber = generateRandomNumber(from: range)
        
        attemptModel.currentTryNumber += 1
        
        if userNumber == randomNumber {
            reset()
            
            return ResultModel(userNumber: userNumber,
                               randomNumber: randomNumber,
                               attemptInformation: attemptModel,
                               result: .rightAnswer)
        }
        
        if userNumber > randomNumber {
            return ResultModel(userNumber: userNumber,
                               randomNumber: randomNumber,
                               attemptInformation: attemptModel,
                               result: .greaterNumber)
        }
        
        else {
            return ResultModel(userNumber: userNumber,
                               randomNumber: randomNumber,
                               attemptInformation: attemptModel,
                               result: .smallerNumber)
        }
    }
    
    func reset() {
        
        attemptModel.currentTryNumber = 1
    }
}
