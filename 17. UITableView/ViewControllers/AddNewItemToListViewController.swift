//
//  AddNewItemToListViewController.swift
//  17. UITableView
//
//  Created by Sesili Tsikaridze on 30.10.23.
//

import UIKit

class AddNewItemToListViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    weak var delegate: MainVCDelegate?
    
    //MARK: - Properties
    
    private let showName = UITextField()
    private let addImage = UIButton()
    private let showImage = UIImageView()
    private let saveChanges = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupAllViews()
        stackViewSetup()
    }
    
    //MARK: - Setups
    
    func showNameSetup() {
        showName.placeholder = "input show name"
        showName.textColor = .gray
        showName.borderStyle = .roundedRect
        showName.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func addImageSetup() {
        addImage.setTitle("add Image", for: .normal)
        addImage.backgroundColor = .blue
        addImageAction()
        addImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func showImageSetup() {
        showImage.contentMode = .scaleAspectFit
        showImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        showImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func saveButtonSetup() {
        saveChanges.setTitle("save changes", for: .normal)
        saveChanges.backgroundColor = .blue
        saveChangesButtonAction()
        saveChanges.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupAllViews() {
        showNameSetup()
        addImageSetup()
        showImageSetup()
        saveButtonSetup()
    }
    
    let stackView = UIStackView()
    
    func stackViewSetup() {
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 50
        
        stackView.addArrangedSubview(showName)
        stackView.addArrangedSubview(addImage)
        stackView.addArrangedSubview(showImage)
        stackView.addArrangedSubview(saveChanges)
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
        
    }
    
    //MARK: - Actions
    
    func addImageAction() {
        addImage.addAction(UIAction(handler: { [weak self] action  in
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            self?.present(picker, animated: true)
        }), for: .touchUpInside)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            showImage.image = selectedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    func saveChangesButtonAction() {
        saveChanges.addAction(UIAction(handler: { [weak self] action  in
            if self?.showName.text?.isEmpty == true || self?.showImage == nil {
                print("fill textfield or upload photo")
            } else {
                self?.delegate?.addNewItem(name: self?.showName.text ?? "", image: self?.showImage.image ?? .fleabag)
            }
        }), for: .touchUpInside)
    }
    
    
}
