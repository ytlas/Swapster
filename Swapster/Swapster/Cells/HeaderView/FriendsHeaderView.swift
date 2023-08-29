//
//  FriendsHeaderView.swift
//  Swapster
//
//  Created by Artemio Pánuco on 28/08/23.
//

import Foundation
import UIKit

class FriendsHeaderView: UIView {
    static let identifier: String = "FriendsHeaderView"
    static let height = CGFloat(50)
    @IBOutlet weak var titleWithQuantity: UILabel!
    @IBOutlet weak var btnSeeAll: UIButton!
    var didTapOnSeeAll: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        headerSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        headerSetup()
    }
    
    func headerSetup() {
        let nib = UINib(nibName: FriendsHeaderView.identifier, bundle: nil)
        guard let view = nib.instantiate(withOwner: self,  options: nil).first as? UIView
        else { fatalError("Unable to convert nib") }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        self.btnSeeAll.addTarget(self, action: #selector(onSeeAll), for: .touchUpInside)
    }
    
    @objc func onSeeAll() {
        didTapOnSeeAll?()
    }
    
    func setTitleWithQuantity(title: String, quantity: Int) {
        self.titleWithQuantity.text = "\(title) 〜 \(quantity)"
    }
}
