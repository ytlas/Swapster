//
//  ViewController.swift
//  Swapster
//
//  Created by Artemio Pánuco on 28/08/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableViewFriends: UITableView!
    //pawprint
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureBarButtons()
    }
    
    func configureBarButtons() {
        //TODO: Change titles, images, icons, titleColors in this method
        let newMessageImage = UIImage(systemName: "pawprint")
        newMessageImage?.withTintColor(.white)
        let newMessageButton = UIBarButtonItem(title: "", image: newMessageImage, target: self, action: #selector(newMessageTapped))
        newMessageButton.tintColor = .white
        
        let addFriendImage = UIImage(systemName: "arrow.down.message.fill")
        addFriendImage?.withTintColor(.white)
        let addFriendButton = UIBarButtonItem(title: "", image: addFriendImage, target: self, action: #selector(newMessageTapped))
        newMessageButton.tintColor = .white
        
        
        navigationItem.rightBarButtonItems = [addFriendButton, newMessageButton]
        
    }
    
    @objc func newMessageTapped() {
        print("Tap on new message...")
    }
    
    func configureTableView() {
        //tableViewFriends.dataSource = self
        //tableViewFriends.delegate = self
        tableViewFriends.register(UINib(nibName: FriendNotificationCell.identifier, bundle: nil), forCellReuseIdentifier: FriendNotificationCell.identifier)
    }


}

