//
//  LoginViewModel.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 23/11/24.
//
enum LoginError: Error {
    case emptyFields
    case invalidCredentials
    case networkFailure(String)
    
    var localizedDescription: String {
        switch self {
        case .emptyFields:
            return "Username and password must not be empty."
        case .invalidCredentials:
            return "Invalid username or password."
        case .networkFailure(let message):
            return "Network error: \(message)"
        }
    }
}

struct ForgotPasswordResponse: Decodable {
    let code: Int
    let message: String
}


class LoginViewModel {
    
    let networkingService: NetworkingServiceProtocol
    let firebaseService: FirebaseService
    let analyticsService: AnalyticsServiceProtocol
    
    init(
        networkingService: NetworkingServiceProtocol,
        firebaseService: FirebaseService,
        analyticsService: AnalyticsServiceProtocol
    ) {
        self.networkingService = networkingService
        self.firebaseService = firebaseService
        self.analyticsService = analyticsService
    }
    
    func login(username: String, password: String, completion: @escaping (Result<User, LoginError>) -> Void) {
        if !username.isEmpty && !password.isEmpty {
            firebaseService
                .login(email: username, password: password) { result in
                    switch result {
                    case .success(let user):
                        self.analyticsService.logEvent("Login_Success",parameters: [
                            "username": username
                        ])
                        completion(.success((user)))
                    case  .failure(let error):
                        completion(.failure(.networkFailure(error.localizedDescription)))
                    }
                }
        } else {
            completion(.failure(LoginError.emptyFields))
        }
    }
    
    func resetPassword() {
        networkingService
            .resetPassword { result in
                // Handle result
            }
    }
}
