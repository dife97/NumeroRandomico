class RandomNumberGame: RandomNumberProtocol {
    
    var maxNumberOfTries: Int = 3
    
    var currentTryNumber: Int = 0

    func getResult(for userNumber: Int) -> ResultModel {
        
        if currentTryNumber >= maxNumberOfTries {
            reset()
            
            return ResultModel(userNumber: userNumber, randomNumber: 0, result: .gameOver)
        }
        
        let randomNumber = generateRandomNumber()
        
        currentTryNumber += 1
        
        if userNumber == randomNumber {
            reset()
            
            return ResultModel(userNumber: userNumber, randomNumber: randomNumber, result: .rightAnswer)
        }
        
        if userNumber > randomNumber {
            return ResultModel(userNumber: userNumber, randomNumber: randomNumber, result: .greaterNumber)
        }
        
        else {
            return ResultModel(userNumber: userNumber, randomNumber: randomNumber, result: .smallerNumber)
        }
    }
    
    func reset() {
        
        currentTryNumber = 0
    }
}
