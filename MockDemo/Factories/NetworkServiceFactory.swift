//
//  NetworkServiceFactory.swift
//  MockDemo
//
//  Created by M_2195552 on 2023-07-18.
//

import Foundation

class NetworkServiceFactory {
    
    static func create() -> NetworkService {
        
        let environment = ProcessInfo.processInfo.environment["ENV"]
        
        if let environment, environment == "TEST" {
            return MockWebservice()
        } else {
            return Webservice()
        }
    }
}

