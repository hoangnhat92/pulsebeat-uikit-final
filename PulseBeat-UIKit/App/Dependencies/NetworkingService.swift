//
//  NetworkingService.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 23/11/24.
//
import Foundation

protocol NetworkingServiceProtocol {
    func resetPassword(completion: @escaping(Result<Void, Error>) -> Void)
    func fetchLatestSongs(completion: @escaping(Result<[String], Error>) -> Void)
}

class NetworkingService: NetworkingServiceProtocol {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func resetPassword(completion: @escaping(Result<Void, Error>) -> Void) {
        // Perform network here
    }
    
    func fetchLatestSongs(completion: @escaping(Result<[String], Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            completion(.success(
                [
                    "A Bar Song",
                    "Please Please Please",
                    "Taste",
                    "Espresso",
                    "Good News",
                    "Die With A Smile",
                    "We can't be friends",
                    "Like that",
                    "First Persoon Shooter"
                ]
            ))
        }
    }
}
