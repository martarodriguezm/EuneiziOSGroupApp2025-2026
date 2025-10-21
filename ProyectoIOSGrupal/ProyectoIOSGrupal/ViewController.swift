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
        
        textoInicio.text = String(localized: "textoInicio")
        botonDescubrirPelis.setTitle(String(localized: "botonInicio"), for: .normal)
        botonDescubrirPelis.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        botonDescubrirPelis.titleLabel?.adjustsFontForContentSizeCategory = true


        
    }


}

