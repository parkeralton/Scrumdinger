//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by York MacBook 043 on 8/2/23.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            configuration.title
            configuration.icon


        }
    }
}

extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self{ Self()}
        
    }
