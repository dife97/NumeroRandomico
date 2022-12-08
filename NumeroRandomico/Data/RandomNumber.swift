class RandomNumber: RandomNumberProtocol {
    
    var maxNumberOfTries: Int = 3
    
    var currentTryNUmber: Int = 0
    
    func checkResult(for userNumber: Int) -> GameResult {
        
        if currentTryNUmber > maxNumberOfTries {
            return .gameOver
        }
        
        let randomNumber = generateRandomNumber()
        
        currentTryNUmber += 1
        
        if userNumber == randomNumber {
            return .rightAnswer
        }
        
        if userNumber > randomNumber {
            return .greaterNumber
        }
        
        else {
            return .smallerNumber
        }
    }
    
    func reset() {
        
        currentTryNUmber = 0
    }
}
