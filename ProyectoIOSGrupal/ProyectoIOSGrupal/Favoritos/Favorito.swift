//
//  Favorito.swift
//  ProyectoIOSGrupal
//
//  Created by student on 28/10/25.
//

import Foundation
import RealmSwift

// Clase que representa un objeto "Favorito" en la base de datos Realm
class Favorito: Object {
    @objc dynamic var title: String = ""
}
