//
//  BotonHome.swift
//  ProyectoIOSGrupal
//
//  Created by student on 4/11/25.
//

import Foundation
import UIKit

extension UIViewController {

    // Se ejecuta cuando la clase se carga — hacemos swizzling
    static let swizzleViewWillAppear: Void = {
        let originalSelector = #selector(viewWillAppear(_:))
        let swizzledSelector = #selector(swizzled_viewWillAppear(_:))

        if let originalMethod = class_getInstanceMethod(UIViewController.self, originalSelector),
           let swizzledMethod = class_getInstanceMethod(UIViewController.self, swizzledSelector) {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }()

    // Esta función se llama automáticamente al inicio de la app
    @objc func swizzled_viewWillAppear(_ animated: Bool) {
        // Llamar al método original
        swizzled_viewWillAppear(animated)

        // Agregar el botón Home
        agregarBotonHome()
    }

    func agregarBotonHome() {
            // No mostrar en el primer ViewController (Home)
            if navigationController?.viewControllers.first == self {
                return
            }

            let home = UIBarButtonItem(
                image: UIImage(systemName: "house.fill"),
                style: .plain,
                target: self,
                action: #selector(volverAlHome)
            )

            // Si ya hay botones en la derecha, añadimos la casita al final
            if let existingRightItems = navigationItem.rightBarButtonItems {
                // Evitamos duplicar la casita si ya está
                if !existingRightItems.contains(where: { $0.image == UIImage(systemName: "house.fill") }) {
                    navigationItem.rightBarButtonItems = existingRightItems + [home]
                }
            } else if let existingRightItem = navigationItem.rightBarButtonItem {
                navigationItem.rightBarButtonItems = [existingRightItem, home]
            } else {
                navigationItem.rightBarButtonItem = home
            }
        }


    @objc func volverAlHome() {
        navigationController?.popToRootViewController(animated: true)
    }
}
