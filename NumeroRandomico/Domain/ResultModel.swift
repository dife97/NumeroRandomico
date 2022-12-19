struct ResultModel {
    
    let userNumber: Int
    let randomNumber: Int
    let attemptInformation: AttemptModel
    let result: GameResult
}

enum GameResult {
    
    case rightAnswer
    case greaterNumber
    case smallerNumber
    case gameOver
}
