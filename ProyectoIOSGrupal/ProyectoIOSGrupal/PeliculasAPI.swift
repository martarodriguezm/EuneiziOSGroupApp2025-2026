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

    // ✅ API pública sin registro (YTS.mx)
    private let baseURL = "https://yts.mx/api/v2/list_movies.json"

    func buscarPelicula(titulo: String, completion: @escaping (Pelicula?) -> Void) {
        let parameters: [String: Any] = [
            "limit": 5,
            "query_term": titulo
        ]

        AF.request(baseURL, parameters: parameters)
            .validate()
            .responseDecodable(of: PeliculasAPIResponse.self) { response in
                switch response.result {
                case .success(let data):
                    if let primera = data.data.movies.first {
                        let pelicula = Pelicula(
                            title: primera.title,
                            description: primera.summary ?? "Sin descripción",
                            director: "Desconocido",
                            releaseDate: String(primera.year),
                            genres: primera.genres ?? [],
                            poster_path: primera.medium_cover_image,
                            overview: primera.summary ?? "Sin descripción"
                        )
                        completion(pelicula)
                    } else {
                        print("⚠️ No se encontraron películas en la API.")
                        completion(nil)
                    }

                case .failure(let error):
                    print("❌ Error al obtener películas desde la API:", error)
                    completion(nil)
                }
            }
    }
}

// MARK: - Modelos de respuesta de YTS.mx

struct PeliculasAPIResponse: Codable {
    let data: PeliculasData
}

struct PeliculasData: Codable {
    let movies: [PeliculaAPIResult]
}

struct PeliculaAPIResult: Codable {
    let title: String
    let year: Int
    let summary: String?
    let genres: [String]?
    let medium_cover_image: String
}
