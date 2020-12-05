//
//  KSAlbumListViewModel.swift
//  KeysocTest
//
//  Created by Steve Lai on 5/12/2020.
//

import UIKit

struct KSAlbumViewModel {
    let album: KSAlbum
    var bookmarked: Bool = false
    private let priceFomatter = NumberFormatter()

    
    
    init(album: KSAlbum) {
        self.album = album
        priceFomatter.numberStyle = .currency
        
    }
    
    var artWorkUrl: URL{
        get{
            return URL(string: album.artworkUrl100)!
        }
    }
    var title: String{
        get{
            return album.collectionName
        }
    }
    
    var caption: String{
        get{
            return album.artistName
        }
    }
    
    var price: String{
        get{
            return priceFomatter.string(from: NSNumber(value: album.collectionPrice)) ?? ""
        }
    }
    
    var bookmarkImage: UIImage{
        get{
            if (bookmarked){
                return UIImage(named: "bookmark-24px")!
            }else{
                return UIImage(named: "bookmark_border-24px")!
            }
        }
    }
    
}
