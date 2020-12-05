//
//  KSBookmarkManager.swift
//  KeysocTest
//
//  Created by Steve Lai on 5/12/2020.
//

import Foundation
import RxSwift
import RxCocoa

class KSBookmarkManager: NSObject {
    static let shared = KSBookmarkManager()
    
    var bookmarkedAlbums =  BehaviorRelay<[KSAlbum]>(value: [])
    
    func addBookmark(album: KSAlbum) {
        
        if let _ = bookmarkedAlbums.value.first(where: {$0.collectionId == album.collectionId}){
            return
        }
        var current = bookmarkedAlbums.value
        current.append(album)
        bookmarkedAlbums.accept(current)


    }
    
    
    func removeBookmark(album: KSAlbum) {
        if let index = bookmarkedAlbums.value.firstIndex(where: {$0.collectionId == album.collectionId}){
            var current = bookmarkedAlbums.value
            current.remove(at: index)
            bookmarkedAlbums.accept(current)

        }
    }
}
