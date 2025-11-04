//
//  Filtro1ViewController.swift
//  ProyectoIOSGrupal
//
//  Created by student on 21/10/25.
//

import UIKit

class Filtro1ViewController: UIViewController {

    @IBOutlet weak var textoFiltro1: UILabel!
    @IBOutlet weak var botonSiguiente: UIButton!
    @IBOutlet weak var tableView: UITableView!
    let VerResultadoPeliSegue = "showResultadoPelis"

    
    //Accion al clicar el boton
    @IBAction func showResultadoPelis(_ sender: UIButton) {
        // Comprobar si hay género seleccionado
            guard let _ = generoSeleccionado else {
                // No hay selección: mostrar alerta
                let alert = UIAlertController(
                            title: String(localized: "alertaTitulo"),
                            message: String(localized: "alertaMensaje"),
                            preferredStyle: .alert
                        )
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true)
                return
            }
        print("ver pantalla Resultado pelis")
        self.performSegue(withIdentifier: VerResultadoPeliSegue, sender: self)
    }

    // Array de géneros (solo nombres)
    let generos = ["Action", "Comedy", "Drama", "Fantasy", "Biography", "Sci-Fi", "Adventure", "Crime"]
        
        // Guardamos el nombre seleccionado
        var generoSeleccionado: String?
        var generoSeleccionadoIndex: IndexPath?
    
//Configurar textos
    override func viewDidLoad() {
        super.viewDidLoad()
        textoFiltro1.text = String(localized: "textoFiltro1")
        botonSiguiente.setTitle(String(localized: "botonSiguiente"), for: .normal)
        // Configurar la tabla
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
    // Preparamos el segue para pasar el género seleccionado a la siguiente pantalla
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == VerResultadoPeliSegue,
               let siguienteVC = segue.destination as? ResultadoPelisViewController,
               let genero = generoSeleccionado {
                siguienteVC.generoRecibido = genero
            }
        }
    
}
//extensiones para la tabla
extension Filtro1ViewController: UITableViewDelegate, UITableViewDataSource {

    // Número de filas en la sección de la tabla

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return generos.count // Devuelve la cantidad de géneros disponibles
    }
    
    // Configuración de cada celda de la tabla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaGenero", for: indexPath)
        let genero = generos[indexPath.row] // Obtiene el género correspondiente a esta fila
        cell.textLabel?.text = genero // Asigna el nombre del género a la etiqueta de la celda

        // Marcar solo el seleccionado
        cell.accessoryType = (indexPath == generoSeleccionadoIndex) ? .checkmark : .none
        return cell
    }
    
    // Se ejecuta cuando el usuario selecciona una fila
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Quitar el check anterior
        if let anterior = generoSeleccionadoIndex {
            tableView.cellForRow(at: anterior)?.accessoryType = .none
        }

        // Guardar el nuevo
        generoSeleccionadoIndex = indexPath
        generoSeleccionado = generos[indexPath.row]
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
