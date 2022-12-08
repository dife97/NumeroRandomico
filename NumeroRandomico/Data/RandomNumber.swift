class RandomNumber: RandomNumberProtocol {
    
    var userNumber: Int
    
    var maxNumberOfTries: Int = 3
    
    var currentTryNUmber: Int = 0
    
    init(userNumber: Int) {
        self.userNumber = userNumber
    }
    
    func checkResult(userNumber: Int) -> RandomNumberResult {
        
        let randomNumber = generateRandomNumber()
        
        if userNumber == randomNumber {
            return RandomNumberResult(rightAnswer: true, greaterOrSmaller: .equal)
        }
        
        if userNumber > randomNumber {
            return RandomNumberResult(rightAnswer: false, greaterOrSmaller: .greater)
        }
        
        else {
            return RandomNumberResult(rightAnswer: false, greaterOrSmaller: .smaller)
        }
    }
    
    func reset() {
        
        userNumber = 0
        currentTryNUmber = 0
    }
}
