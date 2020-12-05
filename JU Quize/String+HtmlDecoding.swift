//
//  String+HtmlDecoding.swift
//  JU Quize
//
//  Created by Peyman Osatian on 2020-12-05.
//  Copyright © 2020 Peyman Osatian. All rights reserved.
//

import Foundation

extension String {
    var htmlDecoded: String? {
        let data = Data(utf8)
        let decodedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        return decodedString?.string
    }
}
