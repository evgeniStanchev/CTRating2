//
//  CTRating2.swift
//  CTRatings2-Master
//
//  Created by Evgeni Stanchev on 11.01.23.
//

import SwiftUI

public struct CTRating2: View {
    var maxRating: Int
    @Binding var currentRating: Int
    var width:Int = 20
    var color: UIColor
    var ratingImage: RatingImage
    
    public init(maxRating: Int, currentRating: Binding<Int>, width: Int = 20, color: UIColor = .systemYellow, ratingImage: RatingImage = .star) {
        self.maxRating = maxRating
        self._currentRating = currentRating
        self.width = width
        self.color = color
        self.ratingImage = ratingImage
    }
    
    public var body: some View {
        HStack {
            ForEach(0..<maxRating) { rating in
                correctImage(for: rating)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color(color))
                    .onTapGesture {
                        self.currentRating = rating + 1
                    }
            }
        }.frame(width: CGFloat(maxRating * width))
    }
    
    func correctImage(for rating: Int) -> Image {
        if rating < currentRating {
            return ratingImage.fillImage
        } else {
            return ratingImage.openImage
        }
    }
}

struct CTRating_Previews: PreviewProvider {
    static var previews: some View {
        CTRating2(maxRating: 5, currentRating: .constant(3))
            .environment(\.colorScheme, .light)
            .previewLayout(.sizeThatFits)
            .padding(10)
    }
}
