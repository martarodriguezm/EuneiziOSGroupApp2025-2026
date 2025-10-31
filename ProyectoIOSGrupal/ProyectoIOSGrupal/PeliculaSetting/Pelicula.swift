//
//  Pelicula.swift
//  ProyectoIOSGrupal
//
//  Created by student on 22/10/25.
//

//structura de la pelicula
/*import Foundation
struct Pelicula: Codable, Equatable {
    let title: String
    let description: String
    let director: String
    let releaseDate: String
    let genres: [String]
}
*/

import Foundation

struct Pelicula: Codable {
    let id: Int
    let title: String
    let description: String
    let year: Int
    let imageUrl: String
    let genre: String
    let stars: Double

    enum CodingKeys: String, CodingKey {
        case id, title, description, year, genre, stars
        case imageUrl = "image_url" // mapear JSON "image_url" -> propiedad Swift "imageUrl"
    }
}


