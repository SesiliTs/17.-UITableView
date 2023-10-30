//
//  ViewController.swift
//  17. UITableView
//
//  Created by Sesili Tsikaridze on 30.10.23.
//

import UIKit

protocol MainVCDelegate: AnyObject {
    func addNewItem(name: String, image: UIImage)
}

class MainViewController: UIViewController, MainVCDelegate {
    func addNewItem(name: String, image: UIImage) {
        tvShows.append(.init(name: name, image: image))
        tableView.reloadData()
    }
    
    
    //MARK: - NavigationBar
    func navigationControllerSetup() {
        self.navigationController?.navigationBar.barStyle = .default        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonClicked))
        
    }
    
    @objc func plusButtonClicked() {
        pushToAddNewItem()
    }
    
    
    //MARK: - Properties
    
    private let tableView = UITableView()
    private let headerLabel = UILabel()
    private var tvShows = TVShow.tvShows
    
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationControllerSetup()
        navigationController?.hidesBarsOnSwipe = false
        view.backgroundColor = .white
        setupTableView()
        setupHeaderLabel()
    }
    
    //MARK: - Setups
    
    private func initTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func registerTableViewCells() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setTableViewConstraints() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    private func setupTableView() {
        initTableView()
        registerTableViewCells()
        setTableViewConstraints()
    }
    
    private func initHeaderLabel() {
        headerLabel.text = "Some of my favourite TV Shows"
        headerLabel.font = .systemFont(ofSize: 16, weight: .bold)
        headerLabel.textColor = .lightGray
        headerLabel.textAlignment = .center
        
        view.addSubview(headerLabel)
    }
    
    private func headerLabelConstraints() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            headerLabel.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -30),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            headerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    private func setupHeaderLabel() {
        initHeaderLabel()
        headerLabelConstraints()
    }
    
    
    func pushToAddNewItem() {
        let colorPage = AddNewItemToListViewController()
        colorPage.delegate = self
        navigationController?.pushViewController(colorPage, animated: true)
    }
    
}

//MARK: - Extensions

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tvShows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let tvShow = tvShows[indexPath.row]
        cell.textLabel?.text = tvShow.name
        cell.imageView?.image = tvShow.image
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsViewController = ItemDetailsViewController()
        detailsViewController.imageView.image = tvShows[indexPath.row].image
        detailsViewController.name.text = tvShows[indexPath.row].name
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}


