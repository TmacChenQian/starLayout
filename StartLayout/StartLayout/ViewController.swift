//
//  ViewController.swift
//  StartLayout
//
//  Created by 陈乾 on 2017/3/8.
//  Copyright © 2017年 Cha1ien. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    fileprivate var collectionView: UICollectionView!
    fileprivate var num : Int!
    fileprivate var changeAnagle:CGFloat!
    
    lazy var imageM : Array = { () -> Array<Any> in 
        let arr = Array<Any>()
        return arr
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置UI
        setupUI();
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)

        
        //图片数组
        imageM = ["0","1","2","4","5","6","7","8"]
        
    }
    
    fileprivate func setupUI(){
        
        num = 8
        changeAnagle = 0
        //初始化collectionView
        collectionView = UICollectionView(frame:CGRect(x: 0, y: 100, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width) , collectionViewLayout: CQStarFlowLayout())
        //设置背景
        collectionView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)

        //注册cell
        collectionView.register(CQStarCell.self, forCellWithReuseIdentifier: "collectionView");
        //准守代理和数据源
        collectionView.delegate = self;
        collectionView.dataSource = self;
        
        view.addSubview(collectionView)
        
    }
    
    //MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return num
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionView", for: indexPath) as? CQStarCell;
       
        let image = UIImage(named: imageM[indexPath.row] as! String)
        cell?.image = image
        return cell!;
        
    }
    //MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //45度
        changeAnagle = changeAnagle + (2 * CGFloat(M_PI))/CGFloat(num)
        //一圈后重置
        if changeAnagle == 2*CGFloat(M_PI) {
            changeAnagle = 0
        }
        UIView.animate(withDuration: 0.5) {
            
            //只有collectionView和cell一起滚动才会有这个合在一起的动画效果
            self.collectionView.transform = CGAffineTransform(rotationAngle: self.changeAnagle)
            
            for i in 0..<self.num {
                let endindexpath = NSIndexPath(item: i, section: 0)
                let cell = collectionView.cellForItem(at: endindexpath as IndexPath)
                cell!.transform = CGAffineTransform(rotationAngle: -self.changeAnagle)
            }
            
        };
        
        
    }
    
}

