//
//  KSAlbum.swift
//  KeysocTest
//
//  Created by Steve Lai on 5/12/2020.
//

import Foundation

struct KSAlbum: Decodable {
    var wrapperType: String             //"collection",
    var collectionType: String          //"Album",
    var artistId: Int                   //909253,
    var collectionId: Int               //1440857781,
    var amgArtistId: Int?               //468749,
    var artistName: String              //"Jack Johnson",
    var collectionName: String          //"In Between Dreams (Bonus Track Version)",
    var collectionCensoredName: String  //"In Between Dreams (Bonus Track Version)",
    var artistViewUrl: String           //"https://music.apple.com/us/artist/jack-johnson/909253?uo=4",
    var collectionViewUrl: String       //"https://music.apple.com/us/album/in-between-dreams-bonus-track-version/1440857781?uo=4",
    var artworkUrl60: String            //"https://is2-ssl.mzstatic.com/image/thumb/Music118/v4/24/46/97/24469731-f56f-29f6-67bd-53438f59ebcb/source/60x60bb.jpg",
    var artworkUrl100: String           //"https://is2-ssl.mzstatic.com/image/thumb/Music118/v4/24/46/97/24469731-f56f-29f6-67bd-53438f59ebcb/source/100x100bb.jpg",
    var collectionPrice: Float          //6.99,
    var collectionExplicitness: String  //"notExplicit",
    var trackCount: Int                 //16,
    var copyright: String               //"℗ 2013 Jack Johnson",
    var country: String                 //"USA",
    var currency: String                //"USD",
    var releaseDate: String             //"2005-03-01T08:00:00Z",
    var primaryGenreName: String        //"Rock"
}
