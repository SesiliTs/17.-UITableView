//
//  ItemDetailsViewController.swift
//  17. UITableView
//
//  Created by Sesili Tsikaridze on 30.10.23.
//

import UIKit

class ItemDetailsViewController: UIViewController {
    
    //MARK: - Properties
    
    let imageView = UIImageView()
    let name = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        imageSetup()
        nameSetup()
        stackViewSetup()
    }
    
    //MARK: - Setup
    
    private func imageSetup() {
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.contentMode = .scaleAspectFit
    }
    
    private func nameSetup() {
        name.font = .systemFont(ofSize: 16, weight: .bold)
        name.textColor = .lightGray
        name.textAlignment = .center
        
        view.addSubview(name)
    }
    
    let stackView = UIStackView()
    
    func stackViewSetup() {
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 50
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(name)
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
        
    }
    
}
