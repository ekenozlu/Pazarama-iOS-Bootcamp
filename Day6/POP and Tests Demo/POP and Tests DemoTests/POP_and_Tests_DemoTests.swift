//
//  POP_and_Tests_DemoTests.swift
//  POP and Tests DemoTests
//
//  Created by Eken Özlü on 30.10.2023.
//

import XCTest
@testable import POP_and_Tests_Demo

final class POP_and_Tests_DemoTests: XCTestCase {
    
    private var userViewModelTest : UserViewModel!
    private var mockUserService : MockUserService!
    private var delegate : MockUserViewModelProtocol!

    override func setUpWithError() throws {
        mockUserService = MockUserService()
        userViewModelTest = UserViewModel(userService: mockUserService)
        delegate = MockUserViewModelProtocol()
        userViewModelTest.delegate = delegate
    }

    override func tearDownWithError() throws {
        mockUserService = nil
        userViewModelTest = nil
        delegate = nil
    }

    func testUpdateView_whenAPISuccess_showsEmailUsernameName() throws {
        let mockUser = UserModel(id: 1, name: "Eken", username: "ekenozlu", email: "eken@gmail.com", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: ""))
        
        mockUserService.mockResult = .success(mockUser)
        userViewModelTest.fetchUsers()
        XCTAssertEqual(delegate.updateViewArray.first?.username, "ekenozlu")
    }
    
    func testUpdateView_whenAPIFailure_showsNoUser() throws {
        mockUserService.mockResult = .failure(NSError())
        userViewModelTest.fetchUsers()
        XCTAssertEqual(delegate.updateViewArray.first?.name, "No User")
    }

}


class MockUserService : UserAPIService {
    var mockResult : Result<UserModel, Error>?
    func fetchUser(completion: @escaping (Result<UserModel, Error>) -> Void) {
        if let result = mockResult {
            completion(result)
        }
    }
}

class MockUserViewModelProtocol : UserViewModelProtocol {
    var updateViewArray : [(name: String, username: String, email: String)] = []
    func updateView(name: String, username: String, email: String) {
        updateViewArray.append((name,username,email))
    }
}
