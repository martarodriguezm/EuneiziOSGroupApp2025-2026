//
//  PeliculasJSONDataSource.swift
//  ProyectoIOSGrupal
//
//  Created by student on 22/10/25.
//

import Foundation

class PeliculasJSONDataSource: PeliculasDataSourceProtocol {
    func fetchPeliculas(forGenero genero: String, completion: @escaping ([Pelicula]) -> Void) {
        guard let url = Bundle.main.url(forResource: "peliculas", withExtension: "json") else {
            completion([])
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let peliculas = try JSONDecoder().decode([Pelicula].self, from: data)
            let filtradas = peliculas.filter { $0.genres.contains(genero) }
            completion(filtradas)
        } catch {
            print("Error al leer JSON: \(error)")
            completion([])
        }
    }
}
