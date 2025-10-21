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
    let VerFiltro2Segue = "showFiltro2"

    @IBAction func showResultadoPelis(_ sender: UIButton) {
        print("ver pantalla Resultado pelis")
        self.performSegue(withIdentifier: VerResultadoPeliSegue, sender: self)
    }

    // Array de géneros (solo nombres)
        let generos = ["Acción", "Comedia", "Drama", "Terror", "Romántica", "Ciencia ficción", "Aventura"]
        
        // Guardamos el nombre seleccionado
        var generoSeleccionado: String?
        var generoSeleccionadoIndex: IndexPath?
    

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

extension Filtro1ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return generos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaGenero", for: indexPath)
        let genero = generos[indexPath.row]
        cell.textLabel?.text = genero

        // Marcar solo el seleccionado
        cell.accessoryType = (indexPath == generoSeleccionadoIndex) ? .checkmark : .none
        return cell
    }

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
