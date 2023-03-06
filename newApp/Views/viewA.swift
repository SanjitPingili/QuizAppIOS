//
//  viewA.swift
//  newApp
//
//  Created by Sahana Krishnan on 3/3/23.
//

import SwiftUI

struct viewA: View {
    var body: some View {
        ZStack {
            Color.orange
            Image(systemName: "doc.fill")
                .foregroundColor(Color.white)
                .font(.system(size: 100.0))
        } 
    }
}

struct viewA_Previews: PreviewProvider {
    static var previews: some View {
        viewA()
    }
}
