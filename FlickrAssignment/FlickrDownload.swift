//
//  FlickrDownload.swift
//  FlickrAssignment
//
//  Created by admin on 11/03/2022.
//

import Foundation
import UIKit

extension UIImageView {
    
    func imageDownload(owner: String) {
        
        guard let url = URL(string: owner) else
        {return}
        let urlSession = URLSession.shared
        let dataTask = urlSession.dataTask(with: url) {
            data, responce, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }

        }
        dataTask.resume()
    }
}

