//
//  ApiManager.swift
//  GetMovies
//
//  Created by Linah abdulaziz on 18/05/1443 AH.
//

import Foundation

class ApiManager{
    
    class func getApiResponse(urlPath: String, completionHandler: @escaping (Data?, Error?) -> Void ) {
            let urlSession = URLSession.shared
            guard let url = URL.init(string: urlPath) else { return }
            
            print("1. before api call")
            let task = urlSession.dataTask(with: url) { data, response, error in
                print("2. during an api call")
                if error != nil {
                    print("error: \(String(describing: error?.localizedDescription))")
                    completionHandler(nil, error)
                } else {
                    completionHandler(data, nil)
                }
            }
            
            task.resume()
            
            print("3. after api call")
        }
        
}
