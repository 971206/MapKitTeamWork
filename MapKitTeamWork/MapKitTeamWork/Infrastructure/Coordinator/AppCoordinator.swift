//
//  AppCoordinator.swift
//  MapKitTeamWork
//
//  Created by MacBook  on 07.07.21.
//

import  UIKit

final class AppCoordinator: CoordinatorProtocol {
    
    // MARK: - Private properties
    private var window: UIWindow?
    private var navigationController: UINavigationController?
    
    // MARK: - Internal properties
    
    var countryManager: CountryManagerProtocol
    
    init(_ window: UIWindow?, navigationController: UINavigationController?) {
        self.window = window
        self.navigationController = navigationController
        self.countryManager = CountryManager()
    }
    
    func start() {
        let vc = SelectedCountryViewController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func proceedToSelectedCountryMapVC(with country: CountryModel, coordinator: CoordinatorProtocol) {
        let vc = SelectedCountryMapViewController.instantiateFromStoryboard()
        vc.country = country
        vc.coordinator = coordinator
        navigationController?.pushViewController(vc, animated: true)
    }
}
