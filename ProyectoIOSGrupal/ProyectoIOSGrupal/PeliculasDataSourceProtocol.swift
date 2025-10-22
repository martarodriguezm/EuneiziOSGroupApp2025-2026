//
//  PeliculasDataSourceProtocol.swift
//  ProyectoIOSGrupal
//
//  Created by student on 22/10/25.
//

import Foundation

protocol PeliculasDataSourceProtocol {
    func fetchPeliculas(forGenero genero: String, completion: @escaping ([Pelicula]) -> Void)
}
