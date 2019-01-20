//
//  ViewController.swift
//  photogalleryapp
//
//  Created by Farhan on 12/4/18.
//  Copyright © 2018 Farhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var mycollectionview: UICollectionView!
    let imagearray=[UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "4"),UIImage(named: "5"),UIImage(named: "6"),UIImage(named: "7"),UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "4"),UIImage(named: "5"),UIImage(named: "6"),UIImage(named: "7")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let itemsize=UIScreen.main.bounds.width/2-10
        let layout=UICollectionViewFlowLayout()
        layout.itemSize=CGSize(width: itemsize, height: itemsize)
        layout.minimumInteritemSpacing=10
        layout.minimumLineSpacing=10
        mycollectionview.collectionViewLayout=layout

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagearray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath)as! MainCollectionViewCell
        cell.myview.image=imagearray[indexPath.row]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainstoryboard:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
        let desVC=mainstoryboard.instantiateViewController(withIdentifier: "DetailViewController")as! DetailViewController
        desVC.image = imagearray[indexPath.row]!
        
        self.navigationController?.pushViewController(desVC, animated: true)
    }
    
}

