//
//  ViewController.swift
//  ProyectoIOSGrupal
//
//  Created by student on 21/10/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textoInicio: UILabel!
    @IBOutlet weak var botonDescubrirPelis: UIButton!
    @IBOutlet weak var BotonFavoritos: UIButton!
    let VerFiltro1Segue = "showFiltro1"
    let VerFavoritosSegue = "VerFavoritos"
    //accion al pulsar el boton
    @IBAction func showFiltro1(_ sender: UIButton) {
        print("ver pantalla filtro1")
        self.performSegue(withIdentifier: VerFiltro1Segue, sender: self)
    }
    
    @IBAction func VerFavoritos(_ sender: UIButton) {
        print("ver pantalla favoritos")
        self.performSegue(withIdentifier: VerFavoritosSegue, sender: self)
    }
    //Configurar los textos del label y boton
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BotonFavoritos.setTitle(String(localized: "VerFavoritos"), for: .normal)
        textoInicio.text = String(localized: "textoInicio")
        botonDescubrirPelis.setTitle(String(localized: "botonInicio"), for: .normal)
        botonDescubrirPelis.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        botonDescubrirPelis.titleLabel?.adjustsFontForContentSizeCategory = true

        
    }

}

