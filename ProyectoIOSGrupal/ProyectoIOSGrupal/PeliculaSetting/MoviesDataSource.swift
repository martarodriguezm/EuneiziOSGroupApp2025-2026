//
//  MoviesDataSource.swift
//  ProyectoIOSGrupal
//
//  Created by student on 31/10/25.
//

import Foundation
import Alamofire

class MoviesDataSource {

    func fetchMovies(completion: @escaping (Result<[Pelicula], Error>) -> Void) {
            let url = "https://devsapihub.com/api-movies"
            
            AF.request(url).responseDecodable(of: [Pelicula].self) { response in
                switch response.result {
                case .success(let peliculas):
                    completion(.success(peliculas))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    
}
