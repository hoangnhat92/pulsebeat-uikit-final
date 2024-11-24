//
//  NetworkingService.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 23/11/24.
//
import Foundation

class NetworkingService {
    static let shared = NetworkingService()
    
    private let session = URLSession.shared
    
    func fetch<T: Decodable>(
        urlString: String,
        responseType: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        // Perform network request
    }
}
