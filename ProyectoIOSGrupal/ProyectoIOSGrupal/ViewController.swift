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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textoInicio.text = "¿Otra vez sin saber qué ver? Deja que el destino elija."
        
    }


}

