//
//  MainPresenter.swift
//  Lec7
//
//  Created by Andrey Babkov on 29.11.2022.
//

import Foundation
import UIKit

protocol MainPresenterOutput: AnyObject {
    func reload()
    func reload(indexPath: IndexPath)
}

final class MainPresenter {
    private let model = MainModel()
    private weak var output: MainPresenterOutput?
    
    var viewObjects = [PostViewObject]()
    
    init(output: MainPresenterOutput) {
        self.output = output
    }
    
    func didLoadView() {
        loadPosts()
    }
    
    func didTapLikeButton(with isLiked: Bool, viewObject: PostViewObject) {
        let index = viewObjects.firstIndex { item in
            viewObject.id == item.id
        }
        
        guard let index = index else {
            return
        }
        
        let viewObject = PostViewObject(
            id: viewObject.id,
            author: viewObject.author,
            description: viewObject.description,
            image: viewObject.image,
            isLiked: !viewObject.isLiked
        )
        
        viewObjects.remove(at: index)
        viewObjects.insert(viewObject, at: index)
        
        output?.reload(indexPath: IndexPath(row: index + 1, section: 0))
    }
}

private extension MainPresenter {
    func loadPosts() {
        model.loadPosts(completion: { [weak self] postsNetworkObjects in
            var postsViewObjects = [PostViewObject]()
            
            postsViewObjects = postsNetworkObjects.map { networkObject in
                PostViewObject(
                    id: networkObject.id,
                    author: networkObject.author,
                    description: networkObject.description,
                    image: UIImage(named: networkObject.imageName),
                    isLiked: networkObject.isLiked
                )
            }
            
            self?.viewObjects = postsViewObjects
            self?.output?.reload()
        })
    }
}
