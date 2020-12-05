//
//  KSBookmarkListViewController.swift
//  KeysocTest
//
//  Created by Steve Lai on 5/12/2020.
//

import UIKit
import RxSwift
import RxCocoa

class KSBookmarkListViewController: UIViewController {

    @IBOutlet weak var tvBookmark: UITableView!
    var viewModel: KSBookmarkListViewModel!
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. Tableview
        self.tvBookmark.register(UINib(nibName: "KSBookmarkAlbumTableCell", bundle: nil), forCellReuseIdentifier: "KSBookmarkAlbumTableCell")
        self.tvBookmark.rowHeight = 112
        self.tvBookmark.estimatedRowHeight = 112
        self.tvBookmark.rx.itemDeleted.subscribe(onNext:{[weak self] (indexPath) in
            self?.viewModel.removeBookmark(atIndex: indexPath.row)
        }).disposed(by: self.disposeBag)
        
        // 2. viewmodel
        self.viewModel = KSBookmarkListViewModel()
        // 2. a. Table Cell Display
        self.viewModel.bookmarkViewModels
            .bind(to: tvBookmark
                    .rx
                    .items(cellIdentifier: "KSBookmarkAlbumTableCell", cellType: KSBookmarkAlbumTableCell.self)){ row, viewModel, cell in
                cell.set(data: viewModel)
            }.disposed(by: self.disposeBag)

        // 2. b. Table Cell Deletion

        // Do any additional setup after loading the view.
    }
    

    

}
