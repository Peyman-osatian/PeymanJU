//
//  String+HtmlDecoding.swift
//  JU Quize
//
//  Created by Mahsa  on 2020-12-04.
//  Copyright © 2020 com.mahsa. All rights reserved.
//

import Foundation

extension String {
    var htmlDecoded: String? {
        let data = Data(utf8)
        let decodedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        return decodedString?.string
    }
}
