//
//  HomeViewModelTest.swift
//  PulseBeat-UIKitTests
//
//  Created by nhat on 24/11/24.
//

import Testing
@testable import PulseBeat_UIKit

struct HomeViewModelTest {
    
    class MockAdService: AdService {
        
    }
    
    class MockAnalyticsService: AnalyticsService {
        var loggedEvents: [String] = []
        
        func logEvent(_ event: String) {
            loggedEvents.append(event)
        }
    }
    
    class MockNetworkingService: NetworkingService {
        override func fetchLatestSongs(
            completion: @escaping(Result<[String], Error>) -> Void
        ) {
            completion(.success(
                [
                    "Song 1"
                ]
            ))
        }
    }
    
    // Test variables
    var sut: HomeViewModel!
    var mockAdService: MockAdService!
    var mockAnalyticsService: MockAnalyticsService!
    var mockNetworkingService: MockNetworkingService!
      
    init() {
        mockAdService = MockAdService()
        mockAnalyticsService = MockAnalyticsService()
        mockNetworkingService = MockNetworkingService()
        
        sut = HomeViewModel(
            networkingService: mockNetworkingService,
            analyticsService: mockAnalyticsService,
            adService: mockAdService
        )
    }

    @Test func testFetchLatestSongs() async throws {
            
        sut.fetchLatestSongs()
                    
        #expect(sut.songs.count == 1)
        #expect(sut.songs.first == "Song 1")
    }

}
