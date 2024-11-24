//
//  FirebaseService.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 24/11/24.
//
import Foundation

class FirebaseService {
    
    private var currentUser: User?
    
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            self.currentUser = User(id: 1, name: "Nhat")
            completion(.success(self.currentUser!))
        }
    }
    
    func logOut(completion: @escaping (Result<Void, Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            self.currentUser = nil
            completion(.success(()))
        }
    }
    
    func getCurrentUser() -> User? {
        currentUser
    }
}
