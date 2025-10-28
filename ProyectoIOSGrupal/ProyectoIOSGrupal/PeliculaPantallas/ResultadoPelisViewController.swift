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

        private var peliculas: [Pelicula] = [] // Guardamos las películas filtradas (máximo 3)

        override func viewDidLoad() {
            super.viewDidLoad()

            tituloResult.text = String(localized: "tituloResultado")
            print("Género recibido: \(String(describing: generoRecibido))")

            // Configurar tabla
            tablaResult.dataSource = self
            tablaResult.delegate = self
            tablaResult.register(UITableViewCell.self, forCellReuseIdentifier: "celdaPelicula")
            

            // Si se ha recibido un género, cargamos las películas de esa categoría
            if let genero = generoRecibido {
                let gestor = CargarPeliculas() // Creamos una instancia de nuestro gestor de películas
                // Obtener máximo 3 películas aleatorias de la categoría
                peliculas = gestor.getPeliculas(forGenero: genero)
                // Recargamos la tabla para mostrar los datos
                tablaResult.reloadData()
            }

        }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == VerInfoPeliSegue,
               let detalleVC = segue.destination as? InfoPeliViewController,
               let pelicula = sender as? Pelicula {
                
                // Pasamos la película seleccionada al ViewController de info
                detalleVC.pelicula = pelicula
            }
        }
    }

    extension ResultadoPelisViewController: UITableViewDataSource, UITableViewDelegate {
        
        // Número de filas de la tabla = número de películas filtradas
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return peliculas.count
        }
        
        // Configuración de cada celda de la tabla
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "celdaResultado", for: indexPath)
            cell.textLabel?.text = peliculas[indexPath.row].title
            return cell
        }
        
        // Acción al seleccionar una fila
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let peliculaSeleccionada = peliculas[indexPath.row] // Guardamos la película seleccionada
            performSegue(withIdentifier: VerInfoPeliSegue, sender: peliculaSeleccionada) // Ejecutamos el segue hacia la pantalla de info con la película seleccionada
            tableView.deselectRow(at: indexPath, animated: true) // Deseleccionamos la fila para que no quede marcada

        }
    }
