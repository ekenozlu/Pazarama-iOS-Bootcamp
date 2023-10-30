//
//  POP_and_Test_Demo_LoginAppTests.swift
//  POP and Test Demo LoginAppTests
//
//  Created by Eken Özlü on 30.10.2023.
//

import XCTest
@testable import POP_and_Test_Demo_LoginApp

final class POP_and_Test_Demo_LoginAppTests: XCTestCase {
    
    private var viewModel : RootViewModel!
    private var mockStorageService : MockLoginStorageService!
    private var delegate : MockRootViewModelProtocol!

    override func setUpWithError() throws {
        mockStorageService = MockLoginStorageService()
        viewModel = RootViewModel(loginStorageService: mockStorageService)
        delegate = MockRootViewModelProtocol()
        viewModel.delegate = delegate
    }

    override func tearDownWithError() throws {
        
    }

    func testShowLogin_whenLoginStorageReturnsEmptyUserAccessToken() throws {
        mockStorageService.mockDictionary = [:]
        viewModel.checkLogin()
        
        XCTAssertEqual(delegate.check.first, .login)
    }
    
    func testShowLogin_whenLoginStorageReturnsUserAccessToken() throws {
        mockStorageService.mockDictionary["ACCESS_TOKEN"] = "UUID"
        viewModel.checkLogin()
        
        XCTAssertEqual(delegate.check.first, .main)
    }
    
    func testShowLogin_whenLoginStorageReturnsEmptyString() throws {
        mockStorageService.mockDictionary["ACCESS_TOKEN"] = ""
        viewModel.checkLogin()
        
        XCTAssertEqual(delegate.check.first, .login)
    }
    
}


class MockLoginStorageService : LoginStorageService {
    var userAccessTokenKey: String {
        return "ACCESS_TOKEN"
    }
    
    var mockDictionary : [String : String] = [:]
    
    func setUserAccessToken(token: String) {
        mockDictionary[userAccessTokenKey] = token
    }
    
    func getUserAccessToken() -> String? {
        return mockDictionary[userAccessTokenKey]
    }
    
}

class MockRootViewModelProtocol : RootViewModelProtocol {
    
    enum Check {
        case login
        case main
    }
    
    var check : [Check] = []
    
    func showMainVC() {
        check.append(.main)
    }
    
    func showLoginVC() {
        check.append(.login)
    }
    
    
}
