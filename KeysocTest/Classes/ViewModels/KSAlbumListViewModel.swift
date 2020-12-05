//
//  KSAlbumListViewModel.swift
//  KeysocTest
//
//  Created by Steve Lai on 5/12/2020.
//

import UIKit
import RxSwift
import RxCocoa

class KSAlbumListViewModel: NSObject {
    public var albumViewModels  = BehaviorRelay<[KSAlbumViewModel]>(value: [])
    private let disposeBag      = DisposeBag()

    
    
    override init() {
        super.init()
        fetchData()
        
        KSBookmarkManager.shared.bookmarkedAlbums.asObservable().subscribe(onNext:{[weak self] (albums) in
            let viewModels = self!.albumViewModels.value
            var updated = [KSAlbumViewModel]()
            for var viewModel in viewModels{
                if (albums.contains(where: {viewModel.album.collectionId == $0.collectionId})){
                    viewModel.bookmarked = true
                }else{
                    viewModel.bookmarked = false
                }
                updated.append(viewModel)
            }
            self?.albumViewModels.accept(updated)
        }).disposed(by: self.disposeBag)
    }
    
    func fetchData(){
        let apiService = KSApiService()
        let params = ["term":"jack+johnson","entity":"album"]
        apiService.requestITunesSearch(params: params) {[weak self] (albums) in
            var container = [KSAlbumViewModel]()
            for album in albums{
                let bookmark    = KSBookmarkManager.shared.bookmarkedAlbums.value.first(where: {$0.collectionId == album.collectionId}) != nil
                var viewModel   = KSAlbumViewModel(album: album)
                viewModel.bookmarked = bookmark
                container.append(viewModel)
            }
            self?.albumViewModels.accept(container)
        } failed: { (error) in
            debugPrint(error)
        }
    }
    
    

}
