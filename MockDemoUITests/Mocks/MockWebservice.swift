//
//  MockWebservice.swift
//  MockDemoUITests
//
//  Created by M_2195552 on 2023-07-18.
//

import Foundation

class MockWebservice: NetworkService {
    func login(username: String, password: String, completion: @escaping (Result<Void, NetworkError>) -> Void) {
        if username == "JohnDoe" && password == "Password" {
            completion(.success(()))
        } else {
            completion(.failure(.notAuthenticated))
        }
    }
}
