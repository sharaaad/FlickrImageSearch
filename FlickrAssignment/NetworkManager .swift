//
//  NetworkManager .swift
//  FlickrAssignment
//
//  Created by admin on 11/03/2022.
//

import Foundation

    
protocol flickrNetwork {
    var delegateViewModel: FlickrModel? {get set}
    func getImage(search: String)
}

class NetworkManager: flickrNetwork {
    
    weak var delegateViewModel: FlickrModel?
    var data: [Photo] = []
    
    func getImage(search: String) {
        
        let flickrURL = "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=0e08e76eff544231b992197c7c7c22a9&text=\(search)&format=json&nojsoncallback=1"
        let imageURL = URL(string: flickrURL)
        guard imageURL != nil else  {
            return
        }
        let sessionURL = URLSession.shared
        let dataInfo = sessionURL.dataTask(with: imageURL!) {
            data, responce, error in
            guard let data = data else {
                return
            }

            let jsonDecode = JSONDecoder()
            do{
                let responceDecode = try jsonDecode.decode(Pictures.self, from: data)
                self.data = responceDecode.photos.photo
                self.delegateViewModel?.imageResponce(responce: responceDecode)
            }
            catch{
                print(error.localizedDescription)
            }
            
        }
        dataInfo.resume()
    }

    }
    

