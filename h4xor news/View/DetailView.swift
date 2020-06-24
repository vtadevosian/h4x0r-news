//
//  DetailView.swift
//  h4xor news
//
//  Created by Vahram Tadevosian on 6/24/20.
//  Copyright © 2020 Vahram Tadevosian. All rights reserved.
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
        DetailView(url: "https://www.google.com ")
    }
}
