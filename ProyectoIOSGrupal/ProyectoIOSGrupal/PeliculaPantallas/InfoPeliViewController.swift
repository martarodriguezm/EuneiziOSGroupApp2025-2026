//
//  InfoPeliViewController.swift
//  ProyectoIOSGrupal
//
//  Created by student on 22/10/25.
//

import UIKit
import RealmSwift


class InfoPeliViewController: UIViewController {
    var pelicula: Pelicula?
    
    
    
    @IBOutlet weak var botonPruebaLista: UIButton!
    @IBOutlet weak var anio: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var titulo: UILabel!
    
    var addBarBt: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titulo.text = pelicula?.title
        director.text = pelicula?.director
        anio.text = pelicula?.releaseDate
        
        self.addBarBt = UIBarButtonItem.init(title: String(localized: "anadirFav"), style: .plain, target: self, action: #selector(self.addBarBtAction))
        self.navigationItem.rightBarButtonItem = self.addBarBt
        
    }
    
    @IBAction func addBarBtAction(sender: UIBarButtonItem) {
        print("añadido a favorito")
       
        guard let peli = pelicula else { return }
        
        if !FavoritosManager.añadir(peli) {
            mostrarAlerta(titulo: "Ya está", mensaje: "Esta película ya está en favoritos.")
        } else {
            mostrarAlerta(titulo: "Añadido", mensaje: "Película añadida a favoritos.")
        }

/*
            if Favoritos.lista.contains(where: { $0.title == peli.title }) {
                mostrarAlerta(titulo: "Ya está", mensaje: "Esta película ya está en favoritos.")
            } else {
                _ = Favoritos.añadir(peli)
                mostrarAlerta(titulo: "Añadido", mensaje: "Película añadida a favoritos.")
            }*/
        }

        func mostrarAlerta(titulo: String, mensaje: String) {
            let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    
    @IBAction func irFav(_ sender: UIButton) {
        performSegue(withIdentifier: "verFav", sender: self)

    }
}
