import Foundation
import RealmSwift

class FavoritosManager {

    
    // Función para añadir una película a favoritos
    // Devuelve true si se añadió correctamente, false si ya existía
    static func añadir(_ peli: Pelicula) -> Bool {
        let realm = try! Realm()
        // Evitar duplicados
        if realm.objects(Favorito.self).filter("title = %@", peli.title).first != nil {
            return false
        }
        
        // Crear un objeto Favorito nuevo
        let favorito = Favorito()
        favorito.title = peli.title

        // Guardar el Favorito en Realm
        try! realm.write {
            realm.add(favorito)
        }
        
        // Retornar true porque se añadió correctamente
        return true
    }
    
    // Función para eliminar un favorito de Realm
    static func eliminar(_ favorito: Favorito) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(favorito)
        }
    }
    
    // Función para obtener todos los favoritos guardados
    static func listar() -> [Favorito] {
        let realm = try! Realm()
        
        // Devuelve un array con todos los Favorito almacenados
        return Array(realm.objects(Favorito.self))
    }
}
