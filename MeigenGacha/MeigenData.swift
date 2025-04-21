//
//  MeigenData.swift
//  MeigenGacha
//
//  Created by tarou-imokenpi on 2025/04/22.
//

import Foundation

/// API から取得した名言データを表すモデル
struct MeigenData: Codable {
    /// 名言の本文
    let meigen: String

    /// 名言の著者
    let author: String

    enum CodingKeys: String, CodingKey {
        case meigen
        /// API 側の typo (`"auther"`) に対応
        case author = "auther"
    }
}
