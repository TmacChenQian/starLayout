//
//  CQStarCell.swift
//  StartLayout
//
//  Created by 陈乾 on 2017/3/9.
//  Copyright © 2017年 Cha1ien. All rights reserved.
//

import UIKit

class CQStarCell: UICollectionViewCell {
    
    var image: UIImage? {
        didSet{
            self.imageView.image = image;
        }
    }

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.imageView.contentMode = UIViewContentMode.scaleAspectFill
        self.imageView.clipsToBounds = true
        self.contentView.addSubview(self.imageView)
        self.imageView.frame = self.contentView.bounds;
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var imageView: UIImageView = {
        let imgv = UIImageView()
        return imgv
    }()
    
    
}
