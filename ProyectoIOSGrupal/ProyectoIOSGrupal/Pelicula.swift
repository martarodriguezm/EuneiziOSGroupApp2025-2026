import Foundation

struct Pelicula: Codable {
    let title: String
    let description: String
    let director: String
    let releaseDate: String
    let genres: [String]
    let poster_path: String?
    let overview: String? // 🔹 ahora opcional para no romper el JSON local
}
