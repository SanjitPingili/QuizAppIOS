//
//  viewC.swift
//  newApp
//
//  Created by Sahana Krishnan on 3/3/23.
//

import SwiftUI

struct viewC: View {
    var body: some View {
        ZStack {
            Color.orange
            Image(systemName: "square.and.arrow.down.on.square.fill")
                .foregroundColor(Color.white)
                .font(.system(size: 100.0))
        } 
    }
}

struct viewC_Previews: PreviewProvider {
    static var previews: some View {
        viewC()
    }
}
