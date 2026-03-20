//
//  CleanArchTests.swift
//  CleanArchTests
//
//  Created by G Yacobu on 20/03/26.
//

import XCTest
@testable import CleanArch

final class FetchCommentsUseCaseTests: XCTestCase {
    
    //Mark: Success
    func testExecuteSuccess() async throws {
        
        //Arrange
        let mockService =  MockNetworkService()
        mockService.fileName = "MockResponse"
        
        let useCase = FetchCommentsUseCase(service: mockService)
        
        //Act
        let result = try await useCase.execute()
        
        // Assert
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.userName, "john")
 
    }
    
    func testExecuteFailure() async {
        
        let mockService = MockNetworkService()
        mockService.shouldReturnError = true
        
        let useCase = FetchCommentsUseCase(service: mockService)
        
        do {
            _ = try await useCase.execute()
            XCTFail("Expected error but got success")
            
        }catch {
            XCTAssertNotNil(error)
        }
    }
}

@MainActor
final class CommentViewModelTests: XCTestCase {
    
    func testLoadCommentsSuccess() async {
        
        let mockService = MockNetworkService()
        let useCase = FetchCommentsUseCase(service: mockService)
        let vm = await CommentViewModel(useCase: useCase)
        
        
        // Act
        await vm.loadComments()
        
        //Assert
        XCTAssertFalse(vm.comments.isEmpty)
        XCTAssertNil(vm.errorMessage)
        XCTAssertFalse(vm.isLoading)
    }
    
    
    
    func testLoadCommentsFailure() async {
        
        let mockService = MockNetworkService()
        mockService.shouldReturnError = true
        let useCase = FetchCommentsUseCase(service: mockService)
        let vm = CommentViewModel(useCase: useCase)
        
        await vm.loadComments()
        XCTAssertTrue(vm.comments.isEmpty)
        XCTAssertNotNil(vm.errorMessage)
    }
}
