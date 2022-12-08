protocol RandomNumberProtocol {
    
//    var userNumber: Int { get }
    //TODO: testar se userNumber recebido é o mesmo userNumber passado como parametro da checkResult
    
//    var randomNumber: Int { get }
    //TODO: testar se randomNumber gerado pela função é o mesmo que está sendo comparado com o userNumber
    
    var maxNumberOfTries: Int { get }
    
    var currentTryNUmber: Int { get }
    //TODO: testar se quando o tryNumber foi setado igual ao numberOfTries, a função reset() está sendo invocada
    
    func generateRandomNumber(with range: RandomNumberRangeModel) -> Int
    //TODO: testar se o número armazenado em randomNumber é igual ao número gerado nesta função
    
    func checkResult(for userNumber: Int) -> GameResult
    //TODO: testar se o rightAnswer = true está invocando o reset()
    //TODO: testar se o greaterOrSmaller realmente é maior ou menor ao número digitado pelo user
    //TODO: testar se está incrementando o tryNumber APENAS se menor que maxNumberOfTries
    
    func reset()
    //TODO: testar se variáveis realmente foram resetadas após invocação dessa função
}

extension RandomNumberProtocol {
    
    func generateRandomNumber(with range: RandomNumberRangeModel = RandomNumberRangeModel(startNumber: 0, lastNumber: 10)) -> Int {
        
        // logic of random number
        return 1
    }
}

//TODO: unit test to guarantee the last number is greater than first one
struct RandomNumberRangeModel {
    
    let startNumber: Int
    let lastNumber: Int
}

enum GameResult {
    
    case rightAnswer
    case greaterNumber
    case smallerNumber
    case gameOver
}
