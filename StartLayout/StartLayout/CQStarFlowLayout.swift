//
//  CQStarFlowLayout.swift
//  StartLayout
//
//  Created by 陈乾 on 2017/3/8.
//  Copyright © 2017年 Cha1ien. All rights reserved.
//

import UIKit

class CQStarFlowLayout: UICollectionViewFlowLayout {
    
    fileprivate var totalNum : Int!
    fileprivate var attributeArrM : Array<UICollectionViewLayoutAttributes>!
    
    //准备布局都会走这个方法
    override func prepare(){
    
        //切记要调用super
        super.prepare()
        //根据组获取item的个数
      totalNum =  collectionView?.numberOfItems(inSection: 0)
        
        attributeArrM = []

        for i in 0..<totalNum{
            
            let indexpath = IndexPath(item: i, section: 0)
            attributeArrM.append(layoutAttributesForItem(at: indexpath)!)
            
        }
    
    }
    
    //返回每个item的布局位置
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributeArrM
    }
    
    
    //返回布局参数数组
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
         let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        
        attributes.size = CGSize(width: (collectionView?.bounds.size.width)!/(CGFloat(totalNum)/2)-30, height: (collectionView?.bounds.size.width)!/(CGFloat(totalNum)/2)-30)
        

        let attrAnagle = 2 * Double(M_PI) * Double(indexPath.row) / Double(totalNum)
        //一个小于半径的常量
        let attrL = (collectionView?.bounds.size.width)!/3-10;
        //半径
        let attrR = (collectionView?.bounds.size.width)!/2;
        //利用勾股定理算X Y
        let attrX = attrR + attrL * CGFloat(sin(attrAnagle))
        let attrY = attrR - attrL * CGFloat(cos(attrAnagle))
        attributes.center = CGPoint(x: attrX, y: attrY)
        
        return attributes

        
     }
    
    //返回collectionView的大小
    override var collectionViewContentSize: CGSize{
      return CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width)
    }
    

}
