//
//  ViewController.swift
//  PhotoSearch
//
//  Created by 蔡佳宣 on 2019/8/3.
//  Copyright © 2019 蔡佳宣. All rights reserved.
//

import UIKit
import PinterestSDK

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    var photos: [UIImage] = [#imageLiteral(resourceName: "561bb7df8ce061d86c2a30ee23571f1b"), #imageLiteral(resourceName: "0f5111cbfdd510acd8ed54343b66c58f"), #imageLiteral(resourceName: "photo-1460400408855-36abd76648b9"), #imageLiteral(resourceName: "6ed2d87a1c13d13e20c974c59cc8ee88"), #imageLiteral(resourceName: "photo-1523314906480-8f65cbed7113"), #imageLiteral(resourceName: "08dc1447752d1c6ce2b07db4e200eafd"), #imageLiteral(resourceName: "2b4580527472bcb08f07864c54624a03"), #imageLiteral(resourceName: "c33dd5f32366fb13418d08706ce86446"),#imageLiteral(resourceName: "57e234dd25476e883801a38e0ca7c7ce"), #imageLiteral(resourceName: "photo-1525439379067-022e6f49a310"), #imageLiteral(resourceName: "ICI-UK-Market-Yourself-as-a-Freelance-Interior-Designer"), #imageLiteral(resourceName: "20150905004920_232502933"),#imageLiteral(resourceName: "Fashion-designing-professionals"), #imageLiteral(resourceName: "designer-typography-table-shop-1-1000x500")]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavigationBar()
        if let layout = collectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        getData()
    }

    func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath) as UICollectionViewCell
        guard let photoCell = cell as? PinterestCollectionViewCell else { return cell }
        photoCell.pinterestImage.image = photos[indexPath.item]
        return photoCell
    }
}

extension ViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        let width = (collectionView.bounds.width - 6 * 3) / 2
        let height = (width / photos[indexPath.item].size.width) * photos[indexPath.item].size.height
        return height
    }
}
