import Foundation
import RealmSwift

class FavoritosManager {

    static func añadir(_ peli: Pelicula) -> Bool {
        let realm = try! Realm()
        // Evitar duplicados
        if realm.objects(Favorito.self).filter("title = %@", peli.title).first != nil {
            return false
        }

        let favorito = Favorito()
        favorito.title = peli.title

        try! realm.write {
            realm.add(favorito)
        }

        return true
    }

    static func eliminar(_ favorito: Favorito) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(favorito)
        }
    }

    static func listar() -> [Favorito] {
        let realm = try! Realm()
        return Array(realm.objects(Favorito.self))
    }
}
