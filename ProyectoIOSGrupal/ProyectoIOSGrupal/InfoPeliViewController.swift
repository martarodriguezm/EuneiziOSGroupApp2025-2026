//
//  InfoPeliViewController.swift
//  ProyectoIOSGrupal
//
//  Created by student on 22/10/25.
//

import UIKit

class InfoPeliViewController: UIViewController {
    var pelicula: Pelicula?
    
    @IBOutlet weak var botonAñadirFav: UIButton!
    @IBOutlet weak var anio: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var titulo: UILabel!
    
    //@IBAction func anadirFav(_ sender: UIButton) {
    
   // }
    override func viewDidLoad() {
        super.viewDidLoad()
        titulo.text = pelicula?.title
                director.text = pelicula?.director
                anio.text = pelicula?.releaseDate
        
        botonAñadirFav.setTitle(String(localized: "anadirFav"), for: .normal)
        botonAñadirFav.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        botonAñadirFav.titleLabel?.adjustsFontForContentSizeCategory = true

        
    }
    
}
