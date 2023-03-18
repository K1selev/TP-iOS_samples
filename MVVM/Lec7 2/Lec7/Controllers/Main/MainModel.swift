//
//  MainModel.swift
//  Lec7
//
//  Created by Andrey Babkov on 29.11.2022.
//

import Foundation
import UIKit

struct PostNetworkObject {
    let id: Int
    let author: String
    let description: String
    let imageName: String
    let isLiked: Bool
}

struct PostViewObject {
    let id: Int
    let author: String
    let description: String
    let image: UIImage?
    let isLiked: Bool
}

final class MainModel {
    private let service: MainServiceDescription = MainService.shared
    private let mockService: MainServiceDescription = MainMockService()
    
    // private let databaseService: MainServiceDescription = MainService.shared
    ///private let databaseService2: MainServiceDescription = MainService.shared
    
    func loadPosts(completion: @escaping ([PostNetworkObject]) -> Void) {
        service.loadPosts(completion: completion)
    }
    
    func loadStories() {
        
    }
}
