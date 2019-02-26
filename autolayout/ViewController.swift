//
//  ViewController.swift
//  autolayout
//
//  Created by Max Nelson on 2/25/19.
//  Copyright © 2019 Maxcodes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.75, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath)
        let imageView = UIImageView(image: UIImage(named: items[indexPath.row]))
        cell.addSubview(imageView)
        cell.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: cell.topAnchor, constant: 0).isActive = true
        imageView.leadingAnchor.constraint(equalTo: cell.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: cell.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: 0).isActive = true
        return cell
    }
    
    
    var collection:UICollectionView!
    
    var items = [
        "alexitems",
        "alexbox",
        "alexlake"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupUI()
    }

    fileprivate func setupUI() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.contentInset = UIEdgeInsets(top: 4, left: 12, bottom: 4, right: 12)
        view.addSubview(collection)
        
        collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        collection.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collection.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collection.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CELL")
        collection.dataSource = self
        collection.delegate = self
        
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Learn Collection Views"
        title.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        
        let description = UILabel()
        description.numberOfLines = 0
        description.translatesAutoresizingMaskIntoConstraints = false
        description.text = "In my courses in the description of my yuotube videos, you can learn concepts like UICollectionView, & UITableView, in depth."
        description.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        
        let stack = UIStackView(arrangedSubviews: [title, description])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 6
        view.addSubview(stack)
        stack.topAnchor.constraint(equalTo: collection.bottomAnchor, constant: 10).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
    }

}


