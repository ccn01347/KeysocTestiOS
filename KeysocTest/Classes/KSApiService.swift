//
//  APIManager.swift
//  KeysocTest
//
//  Created by Steve Lai on 5/12/2020.
//

import Foundation
import RxSwift
import RxAlamofire


class KSApiService: NSObject {

    var disposeBag = DisposeBag()
    func requestITunesSearch(params: [String: String], success: @escaping([KSAlbum]) -> (), failed: @escaping (Error) -> ()) {
        let url = "https://itunes.apple.com/search"
        RxAlamofire.data(.get, url,
             parameters: params)
          .subscribe(onNext: {
            let albums = self.parseSearchResponse(data: $0)
            success(albums)
          }, onError: {
            failed($0)
          }).disposed(by: disposeBag)
        
    }
    
    func parseSearchResponse(data: Data) -> [KSAlbum]{
        let jsonDecoder = JSONDecoder()
        let container = try! jsonDecoder.decode(KSITunesSearchResponse.self, from: data)
        return container.results
        
    }
}
