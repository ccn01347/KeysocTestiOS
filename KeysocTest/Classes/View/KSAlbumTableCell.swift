//
//  KSAlbumTableCell.swift
//  KeysocTest
//
//  Created by Steve Lai on 5/12/2020.
//

import UIKit
import RxSwift
import Kingfisher

class KSAlbumTableCell: UITableViewCell {
    @IBOutlet weak var ivArtwork: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbCaption: UILabel!
    @IBOutlet weak var btnBookmark: UIButton!
    @IBOutlet weak var lbPrice: UILabel!
    var disposeBag: DisposeBag!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.ivArtwork.layer.cornerRadius = 8.0
        self.ivArtwork.layer.masksToBounds = true
    }
    

    
    func set(data: KSAlbumViewModel){
        self.lbTitle.text = data.title
        self.lbPrice.text = data.price
        self.lbCaption.text = data.caption
        self.ivArtwork.kf.setImage(with: data.artWorkUrl)
        self.btnBookmark.setImage(data.bookmarkImage, for: .normal)
        self.disposeBag = DisposeBag()
        self.btnBookmark.rx.tap.asDriver().drive(onNext:{
            if (data.bookmarked){
                KSBookmarkManager.shared.removeBookmark(album: data.album)
            }else{
                KSBookmarkManager.shared.addBookmark(album: data.album)
            }
        }).disposed(by: self.disposeBag)
    }
}
