//
//  ProtocolOriented_ProjectTests.swift
//  ProtocolOriented ProjectTests
//
//  Created by Eken Özlü on 28.10.2023.
//

import XCTest
@testable import ProtocolOriented_Project

final class ProtocolOriented_ProjectTests: XCTestCase {
    
    private var viewModel : UserViewModel!
    private var userService : MockUserService!
    private var output : MockUserViewModelOutput!
    
    override func setUpWithError() throws {
        userService = MockUserService()
        viewModel = UserViewModel(userService: userService)
        output = MockUserViewModelOutput()
        viewModel.output = output
    }

    override func tearDownWithError() throws {
        viewModel = nil
        userService = nil
    }

    func testUpdateView_whenAPISuccess_showsEmailNameUsername() throws {
        let mockUser = UserModel(name: "Eken Özlü", username: "ekenozlu", email: "ekenozlu8@gmail.com")
        
        userService.mockResult = .success(mockUser)
        viewModel.fetchUsers()
        
        XCTAssertEqual(output.updateViewArray.count, 1)
        XCTAssertEqual(output.updateViewArray.first?.name, "Eken Özlü")
        XCTAssertEqual(output.updateViewArray.first?.username, "ekenozlu")
    }
    
    func testUpdateView_whenAPIFailure_showsNoUser() throws {
        userService.mockResult = .failure(NSError())
        
        viewModel.fetchUsers()
        XCTAssertEqual(output.updateViewArray.first?.name, "No User")
    }
    
    class MockUserService : UserService {
        
        var mockResult : Result<ProtocolOriented_Project.UserModel, Error>?
        
        func downloadUser(completion: @escaping (Result<ProtocolOriented_Project.UserModel, Error>) -> ()) {
            if let result = mockResult {
                completion(result)
            }
        }
    }
    
    class MockUserViewModelOutput : UserViewModelOutput {
        var updateViewArray : [(name:String, username:String, email:String)] = []
        func updateView(name: String, username: String, email: String) {
            updateViewArray.append((name,username,email))
        }
        
        
    }

}
