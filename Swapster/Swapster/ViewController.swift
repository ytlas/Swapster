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
        tableViewFriends.dataSource = self
        tableViewFriends.delegate = self
        tableViewFriends.register(UINib(nibName: FriendNotificationCell.identifier, bundle: nil), forCellReuseIdentifier: FriendNotificationCell.identifier)
    }
}

//MARK: TableView extension

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 2
        case 2:
            return 10
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = FriendsHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: FriendsHeaderView.height))
        header.didTapOnSeeAll = {
            print("See all of section \(section)")
        }
        switch section {
        case 0:
            header.setTitleWithQuantity(title: "Friend sugestions", quantity: 10)
            return header
        case 1:
            header.setTitleWithQuantity(title: "Pending requests", quantity: 53)
            return header
        case 2:
            header.setTitleWithQuantity(title: "Online", quantity: 20)
            return header
        default: return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FriendNotificationCell.identifier) as? FriendNotificationCell {
            cell.configurateCell()
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

