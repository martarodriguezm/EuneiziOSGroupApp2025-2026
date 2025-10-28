//
//  ListaFavViewController.swift
//  ProyectoIOSGrupal
//
//  Created by student on 28/10/25.
//
import UIKit
import RealmSwift


class ListaFavViewController: UIViewController {
    
    private var favoritos: [Favorito] = []

   
    @IBOutlet weak var listaFav: UITableView!
    @IBOutlet weak var tituloFav: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tituloFav.text = "Películas favoritas"
                listaFav.dataSource = self
                listaFav.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favoritos = FavoritosManager.listar() // Cargar favoritos desde Realm
        listaFav.reloadData()
    }
    
    /*override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listaFav.reloadData()
    }*/

}

extension ListaFavViewController: UITableViewDataSource, UITableViewDelegate {
    
    /*func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Favoritos.lista.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaFav", for: indexPath)
        let peli = Favoritos.lista[indexPath.row]
        celda.textLabel?.text = peli.title
        return celda
    }

    // Para permitir eliminar una peli al deslizar
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Favoritos.eliminar(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaFav", for: indexPath)
        let peli = favoritos[indexPath.row]
        celda.textLabel?.text = peli.title
        return celda
    }

    // Para permitir eliminar una peli al deslizar
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Usar el manager de Realm
            FavoritosManager.eliminar(favoritos[indexPath.row])
            favoritos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }


    }

