//
//  FlickrViewModel.swift
//  FlickrAssignment
//
//  Created by admin on 21/03/2022.
//

import Foundation

protocol FlickrModel: AnyObject {
    func imageResponce(responce: Pictures)
}

class FlickrViewModel: FlickrModel {
    weak var delegate: Result?
    var networkManager: flickrNetwork = NetworkManager()
    init(delegate: Result){
        self.delegate = delegate
    }
    
    var data: [Photo] = []
    
    func getImage(search: String) {
        networkManager.delegateViewModel = self
        networkManager.getImage(search: search)
        }
    
    func imageResponce(responce: Pictures) {
              self.data = responce.photos.photo
                DispatchQueue.main.async {
                    self.delegate?.getResult()
    }

}
}
