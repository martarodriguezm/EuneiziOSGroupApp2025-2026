//
//  PeliculasAPI.swift
//  ProyectoIOSGrupal
//
//  Created by student on 28/10/25.
//

import Foundation
import Alamofire

class PeliculasAPI {

    static let shared = PeliculasAPI()
    private init() {}

    private let baseURL = "https://movie-database-alternative.p.rapidapi.com/"

    // 🔹 Cambia aquí tus cabeceras si usas otra API pública sin login
    private let headers: HTTPHeaders = [
        "X-RapidAPI-Key": "demo", // Puedes dejar "demo" o quitar este header si usas una versión pública
        "X-RapidAPI-Host": "movie-database-alternative.p.rapidapi.com"
    ]

    func buscarPelicula(titulo: String, completion: @escaping (Pelicula?) -> Void) {

        let parameters: [String: Any] = [
            "s": titulo, // búsqueda por palabra clave
            "r": "json"
        ]

        AF.request(baseURL, parameters: parameters, headers: headers)
            .validate()
            .responseDecodable(of: PeliculasAPIResponse.self) { response in
                switch response.result {
                case .success(let data):
                    if let primera = data.Search.first {
                        let pelicula = Pelicula(
                            title: primera.Title,
                            description: primera.Type,
                            director: "Desconocido",
                            releaseDate: primera.Year,
                            genres: [titulo],
                            poster_path: primera.Poster,
                            overview: primera.Title
                        )
                        completion(pelicula)
                    } else {
                        completion(nil)
                    }

                case .failure(let error):
                    print("Error al obtener películas de la API:", error)
                    completion(nil)
                }
            }
    }
}

// MARK: - Modelos de respuesta API
struct PeliculasAPIResponse: Codable {
    let Search: [PeliculaAPIResult]
}

struct PeliculaAPIResult: Codable {
    let Title: String
    let Year: String
    let `Type`: String
    let Poster: String
}
