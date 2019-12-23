//
//  DetailView.swift
//  H4X0R News
//
//  Created by Mustafa Alsoffi on 22/12/2019.
//  Copyright © 2019 Mustafa Alsoffi. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let url: String?
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}


