//
//  ExpandableSectionView.swift
//  PriceTag
//
//  Created by George Zheng on 12/5/17.
//  Copyright © 2017 George Zheng. All rights reserved.
//

import UIKit

class ExpandableSectionView: UITableViewHeaderFooterView {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    
    
    var section: Section?
    
    var delegate:ExpandableSectionViewDelegate?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapSectionView)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapSectionView)))
    }
    
    func customInit(section: Section, delegate:ExpandableSectionViewDelegate){
        self.section = section
        self.delegate = delegate
        
        dateLabel.textColor = .white
        totalLabel.textColor = .white
        dateLabel.text = section.date
        totalLabel.text = String(format:"$ %.2f", section.total)
        
        containerView.backgroundColor = ColorUtil.BACKGROUND_COLOR
        
        containerView.layer.borderWidth = 1.5
        containerView.layer.cornerRadius = 10
        containerView.layer.borderColor = UIColor.white.cgColor
    }
  
    @objc private func tapSectionView(sender: UITapGestureRecognizer){
        if let delegate = self.delegate{
            delegate.toggleSection(section: section)
        }
    }
}

protocol ExpandableSectionViewDelegate {
    func toggleSection(section: Section?)
}

struct Section{
    var date:String
    var total:Double
    var expanded:Bool
    var section:Int
}
