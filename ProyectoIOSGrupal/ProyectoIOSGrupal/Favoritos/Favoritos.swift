//
//  Favoritos.swift
//  ProyectoIOSGrupal
//
//  Created by student on 28/10/25.
//
/*
import Foundation

class Favoritos {
    
    static private let clave = "favoritos_guardados"
        
        static var lista: [Pelicula] = cargar()

        static func añadir(_ peli: Pelicula) -> Bool {
            if lista.contains(peli) {
                return false
            }
            lista.append(peli)
            guardar()
            return true
        }

        static func eliminar(at index: Int) {
            guard index < lista.count else { return }
            lista.remove(at: index)
            guardar()
        }

        static func guardar() {
            let encoder = JSONEncoder()
            if let datos = try? encoder.encode(lista) {
                UserDefaults.standard.set(datos, forKey: clave)
            }
        }

        static func cargar() -> [Pelicula] {
            if let datos = UserDefaults.standard.data(forKey: clave) {
                let decoder = JSONDecoder()
                if let pelis = try? decoder.decode([Pelicula].self, from: datos) {
                    return pelis
                }
            }
            return []
        }
}
*/
