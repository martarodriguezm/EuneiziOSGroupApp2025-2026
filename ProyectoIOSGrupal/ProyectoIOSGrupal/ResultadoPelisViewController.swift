//
//  ResultadoPelisViewController.swift
//  ProyectoIOSGrupal
//
//  Created by student on 21/10/25.
//

import UIKit

class ResultadoPelisViewController: UIViewController {
    
    let VerInfoPeliSegue = "showInfo"

    var generoRecibido: String?

        @IBOutlet weak var tituloResult: UILabel!
        @IBOutlet weak var tablaResult: UITableView!

        private let dataSource: PeliculasDataSourceProtocol = PeliculasJSONDataSource()
        private var peliculas: [Pelicula] = [] // Guardamos las películas filtradas (máximo 3)

        override func viewDidLoad() {
            super.viewDidLoad()

            tituloResult.text = String(localized: "tituloResultado")
            print("Género recibido: \(String(describing: generoRecibido))")

            // Configurar tabla
            tablaResult.dataSource = self
            tablaResult.delegate = self
            tablaResult.register(UITableViewCell.self, forCellReuseIdentifier: "celdaPelicula")

            // Cargar películas
            guard let genero = generoRecibido else { return }
            dataSource.fetchPeliculas(forGenero: genero) { [weak self] peliculas in
                DispatchQueue.main.async {
                    // Solo las 3 primeras
                    self?.peliculas = Array(peliculas.prefix(3))
                    self?.tablaResult.reloadData()
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
