import XCTest
@testable import NumeroRandomico

final class RandomNumberTests: XCTestCase {
    
//    func test_checkResult_should_use_and_return_same_userNumber_passed_as_parameter() {
//        
//        let userNumber = 7
//        
//        let sut = RandomNumber()
//        
//        let result = sut.checkResult(for: userNumber)
//        
//        XCTAssertEqual(result.userNumber, userNumber)
//    }
//    
//    func test_checkResult_should_return_same_generated_randomNumber() {
//        
//        let userNumber = 7
//        
//        let sut = RandomNumber()
//        
//        let result = sut.checkResult(for: userNumber)
//        
//        XCTAssertEqual(result.randomNumber, sut.randomNumber)
//    }
//    
//    func test_currentTryNumber_should_increase_by_one_after_checkResult_call() {
//        
//        let userNumber = 7
//        
//        let sut = RandomNumber()
//        
//        let currentTryNumber = sut.currentTryNumber
//        
//        let result = sut.checkResult(for: userNumber)
//        
//        XCTAssertEqual(sut.currentTryNumber, currentTryNumber + 1)
//    }
//    
//    func test_currentTryNumber_should_reset_after_maxNumberOfTries() {
//        
//        let userNumber = 7
//        
//        let sut = RandomNumber()
//        sut.maxNumberOfTries = 3
//        
//        let tryOne = sut.checkResult(for: userNumber)
//        let tryTwo = sut.checkResult(for: userNumber)
//        let tryThree = sut.checkResult(for: userNumber)
//        let tryFour = sut.checkResult(for: userNumber)
//    
//        let currentTryNumber = sut.currentTryNumber
//        
//        XCTAssertTrue(currentTryNumber == 0)
//    }
//    
//    func test_reset_should_set_tryNumber_to_zero() {
//        
//        let userNumber = 7
//        
//        let sut = RandomNumber()
//        
//        let result = sut.checkResult(for: userNumber)
//        
//        sut.reset()
//        
//        let currentTryNumber = sut.currentTryNumber
//        
//        XCTAssertTrue(currentTryNumber == 0)
//    }
//    
//    func test_rightAnswer_should_call_reset() {
//        
//        let userNumber = 7
//        
//        let sut = RandomNumber()
//        
//        repeat {
//            let result = sut.checkResult(for: userNumber)
//            
//        } while sut.randomNumber != userNumber
//                    
//        let currentTryNumber = sut.currentTryNumber
//        
//        XCTAssertTrue(currentTryNumber == 0)
//    }
}
