//
//  CargarPeliculas.swift
//  ProyectoIOSGrupal
//
//  Created by student on 28/10/25.
//

import Foundation

class CargarPeliculas {
    var peliculas: [Pelicula] = [] // Lista de pelis
    
    
    init() {
        loadPeliculas() // Cargar peliculas al iniciar
    }
    
    //Listado de pelis
    func loadPeliculas() {
            peliculas = [
                Pelicula(
                    title: "Castle in the Sky",
                    description: "A young girl and a boy try to find a floating city.",
                    director: "Hayao Miyazaki",
                    releaseDate: "1986",
                    genres: ["Aventura", "Drama"]
                ),
                Pelicula(
                    title: "My Neighbor Totoro",
                    description: "Two girls move to the countryside and meet magical creatures.",
                    director: "Hayao Miyazaki",
                    releaseDate: "1988",
                    genres: ["Terror", "Drama"]
                ),
                Pelicula(
                    title: "Spirited Away",
                    description: "A girl enters a magical world and tries to save her parents.",
                    director: "Hayao Miyazaki",
                    releaseDate: "2001",
                    genres: ["Terror", "Aventura"]
                ),
                Pelicula(
                    title: "Kiki's Delivery Service",
                    description: "A young witch starts her own delivery service in a new town.",
                    director: "Hayao Miyazaki",
                    releaseDate: "1989",
                    genres: ["Romántica", "Comedia"]
                )
            ]
        }
    
    func getPeliculas(forGenero genero: String, maximo: Int = 3) -> [Pelicula] {
            let filtradas = peliculas.filter { $0.genres.contains(genero) }
            return Array(filtradas.shuffled().prefix(maximo))
        }
}
