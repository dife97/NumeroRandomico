struct ResultModel {
    
    let userNumber: Int
    let randomNumber: Int
    let result: GameResult
}

enum GameResult {
    
    case rightAnswer
    case greaterNumber
    case smallerNumber
    case gameOver
}
