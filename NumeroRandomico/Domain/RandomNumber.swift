protocol RandomNumber {
    
    var randomNumber: Int { get }
    
    var numberOfTries: Int { get }
    
    var tryNUmber: Int { get }
    //TODO: testar se quando o tryNumber foi setado igual ao numberOfTries, a função reset() está sendo invocada
    
    func generateRandomNumber(with range: RandomNumberRangeModel) -> Int
    //TODO: testar se o número armazenado em randomNumber é igual ao número gerado nesta função
    
    func checkResult(randomNumber: Int, userNumber: Int) -> RandomNumberResult
    //TODO: testar se o rightAnswer = true está invocando o reset()
    //TODO: testar se o greaterOrSmaller realmente é maior ou menor ao número digitado pelo user
    
    
    func reset()
}

//TODO: unit test to guarantee the last number is greater than first one
struct RandomNumberRangeModel {
    
    let startNumber: Int
    let lastNumber: Int
}

struct RandomNumberResult {
    
    let rightAnswer: Bool
    let greaterOrSmaller: GreaterOrSmaller
}

enum GreaterOrSmaller {
    
    case greater
    case smaller
}
