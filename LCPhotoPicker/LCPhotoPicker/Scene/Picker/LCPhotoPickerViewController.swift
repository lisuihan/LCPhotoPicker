//
//  LCPhotoPickerViewController.swift
//  LCPhotoPicker
//
//  Created by ucf-y on 2019/1/29.
//  Copyright © 2019 ucf-y. All rights reserved.
//

import UIKit

class LCPhotoPickerViewController: LCBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    private lazy var  collectionView:UICollectionView = {
        
        let cellW = (self.view.frame.width - 3)/4.0
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: cellW, height: cellW)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        
        var height = CGFloat(0)
        if LCTool.isiPhoneX(){
            height = kScreenHeight - 88
        }else{
            height = kScreenHeight - 64
        }
        let colletion = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: height), collectionViewLayout: layout)
        colletion.borderColor = UIColor.white
        colletion.delegate = self
        colletion.dataSource = self
        colletion.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 34, right: 0)
        return colletion
    }()

}


extension LCPhotoPickerViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
