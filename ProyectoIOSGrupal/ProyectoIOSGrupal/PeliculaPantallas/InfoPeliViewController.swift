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
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var descrip: UILabel!
    @IBOutlet weak var anio: UILabel!
    @IBOutlet weak var genero: UILabel!
    @IBOutlet weak var stars: UILabel!
    
    @IBOutlet weak var imagen: UIImageView!
    
    
    var addBarBt: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titulo.text = pelicula?.title
               descrip.text = pelicula?.description
        anio.text = pelicula != nil
                ? "\(String(localized: "Anio")): \(pelicula!.year)"
                : " "
            
            stars.text = pelicula != nil
                ? "\(String(localized: "Puntuacion")): \(String(format: "%.1f", pelicula!.stars))"
                : " "
            
            genero.text = pelicula != nil
                ? "\(String(localized: "Genero")): \(pelicula!.genre)"
                : " "
               
               if let imageUrlString = pelicula?.imageUrl,
                  let url = URL(string: imageUrlString) {
                   
                   // Descargar la imagen en segundo plano
                   URLSession.shared.dataTask(with: url) { data, response, error in
                       if let data = data, let downloadedImage = UIImage(data: data) {
                           // Actualizar la UI
                           DispatchQueue.main.async {
                               self.imagen.image = downloadedImage
                           }
                       }
                   }.resume()
               }
        
        self.addBarBt = UIBarButtonItem.init(title: String(localized: "anadirFav"), style: .plain, target: self, action: #selector(self.addBarBtAction))
        self.navigationItem.rightBarButtonItem = self.addBarBt
        
    }
    
    //añadir a fav con feedback
    @IBAction func addBarBtAction(sender: UIBarButtonItem) {
        print("añadido a favorito")
       
        guard let peli = pelicula else { return }
        
        if !FavoritosManager.añadir(peli) {
            mostrarAlerta(titulo: String(localized: "titulo_favorito_ya_esta"), mensaje: String(localized: "mensaje_favorito_ya_esta"))
        } else {
            mostrarAlerta(titulo: String(localized: "titulo_favorito_añadido"), mensaje: String(localized: "pelisFavTitulo"))
        }

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
