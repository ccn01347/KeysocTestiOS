//
//  KSBookmarkAlbumTableCell.swift
//  KeysocTest
//
//  Created by Steve Lai on 5/12/2020.
//

import UIKit
import RxSwift

class KSBookmarkAlbumTableCell: UITableViewCell {

    @IBOutlet weak var ivArtwork: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbCaption: UILabel!
    @IBOutlet weak var lbPrice: UILabel!
    var disposeBag: DisposeBag!
    
    
    func set(data: KSBookmarkViewModel) {
        self.lbTitle.text = data.title
        self.lbPrice.text = data.price
        self.lbCaption.text = data.caption
        self.ivArtwork.kf.setImage(with: data.artWorkUrl)

        self.disposeBag = DisposeBag()
        
    }
}
