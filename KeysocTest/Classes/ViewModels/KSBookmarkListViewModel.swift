//
//  KSBookmarkListViewModel.swift
//  KeysocTest
//
//  Created by Steve Lai on 5/12/2020.
//

import Foundation
import RxSwift
import RxCocoa

class KSBookmarkListViewModel: NSObject {
    public var bookmarkViewModels   = BehaviorRelay<[KSBookmarkViewModel]>(value: [])
    private let disposeBag          = DisposeBag()
    
    override init() {
        super.init()
        
        KSBookmarkManager.shared.bookmarkedAlbums.asObservable().subscribe(onNext:{[weak self] (albums) in
            var container = [KSBookmarkViewModel]()
            for album in albums {
                container.append(KSBookmarkViewModel(album: album))
            }
            self?.bookmarkViewModels.accept(container)
        }).disposed(by: self.disposeBag)
    }
    
    
    func removeBookmark(atIndex: Int) {
        if (bookmarkViewModels.value.count > atIndex){
            let value = bookmarkViewModels.value[atIndex]
            KSBookmarkManager.shared.removeBookmark(album: value.album)

        }
        
        
    }
    
}
