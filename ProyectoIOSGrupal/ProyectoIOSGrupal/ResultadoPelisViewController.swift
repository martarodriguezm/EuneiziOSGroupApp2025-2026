//
//  ResultadoPelisViewController.swift
//  ProyectoIOSGrupal
//
//  Created by student on 21/10/25.
//

import UIKit

class ResultadoPelisViewController: UIViewController {
    @IBOutlet weak var ResultadoPelis: UITableView!
    
    let VerInfoPeliSegue = "showInfo"

    var generoRecibido: String?

        @IBOutlet weak var tituloResult: UILabel!
    @IBOutlet weak var tablaResult: UITableView!
        private let dataSource: PeliculasDataSourceProtocol = PeliculasJSONDataSource()
        private var peliculas: [Pelicula] = [] // Guardamos las películas filtradas (máximo 3)

        override func viewDidLoad() {
            // Cargar películas
            guard let genero = generoRecibido else { return }

            // 🔸 Diccionario de palabras clave más útiles para la API
            let keywordsPorGenero = [
                "Acción": "Mission",
                "Comedia": "Funny",
                "Drama": "Love",
                "Terror": "Horror",
                "Ciencia Ficción": "Future",
                "Aventura": "Journey",
                "Romance": "Heart"
            ]

            // Si el género tiene una palabra clave asignada, la usamos
            let keyword = keywordsPorGenero[genero] ?? genero

            print("🔍 Buscando películas en la API para el género: \(genero) (keyword: \(keyword))")

            PeliculasAPI.shared.buscarPelicula(titulo: keyword) { [weak self] peliculaEncontrada in
                guard let self = self else { return }

                if let peliculaAPI = peliculaEncontrada {
                    print("✅ Película obtenida desde API: \(peliculaAPI.title)")
                    self.peliculas = [peliculaAPI] // solo 1 resultado de la API
                    DispatchQueue.main.async {
                        self.tablaResult.reloadData()
                    }

                } else {
                    print("⚠️ No se encontraron películas en la API, cargando desde JSON local...")

                    // Cargar desde JSON local como respaldo
                    self.dataSource.fetchPeliculas(forGenero: genero) { peliculasLocales in
                        DispatchQueue.main.async {
                            self.peliculas = Array(peliculasLocales.prefix(3))
                            self.tablaResult.reloadData()
                        }
                    }
                }
            }

            
        }

        // MARK: - Navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == VerInfoPeliSegue,
               let detalleVC = segue.destination as? InfoPeliViewController,
               let pelicula = sender as? Pelicula {
                detalleVC.pelicula = pelicula
            }
        }
    }

    // MARK: - UITableViewDataSource y UITableViewDelegate
    extension ResultadoPelisViewController: UITableViewDataSource, UITableViewDelegate {

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return peliculas.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "celdaResultado", for: indexPath)
            cell.textLabel?.text = peliculas[indexPath.row].title
            return cell
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let peliculaSeleccionada = peliculas[indexPath.row]
            performSegue(withIdentifier: VerInfoPeliSegue, sender: peliculaSeleccionada)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
