//
//  KSAlbumListViewController.swift
//  KeysocTest
//
//  Created by Steve Lai on 5/12/2020.
//

import UIKit
import RxSwift
import RxCocoa

class KSAlbumListViewController: UIViewController {
    @IBOutlet weak var tvAlbums: UITableView!
    
    var viewModel: KSAlbumListViewModel!
    var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. Setup Tableview
        self.tvAlbums.register(UINib(nibName: "KSAlbumTableCell", bundle: nil), forCellReuseIdentifier: "KSAlbumTableCell")
        self.tvAlbums.estimatedRowHeight = 112
        self.tvAlbums.rowHeight = 112 //UITableView.automaticDimension
        
        // 2. View Model
        self.viewModel = KSAlbumListViewModel()
        self.viewModel.albumViewModels
            .bind(to: tvAlbums
                    .rx
                    .items(cellIdentifier: "KSAlbumTableCell", cellType: KSAlbumTableCell.self)){ row, viewModel, cell in
                cell.set(data: viewModel)
            }.disposed(by: self.disposeBag)

        // Do any additional setup after loading the view.
    }
    

    

}
