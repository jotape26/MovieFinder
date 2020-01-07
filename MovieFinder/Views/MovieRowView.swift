//
//  MovieRowView.swift
//  MovieFinder
//
//  Created by João Leite on 07/01/20.
//  Copyright © 2020 João Leite. All rights reserved.
//

import SwiftUI

struct MovieRowView: View {
    
    @State var movie : MovieDTO
    
    var body: some View {
        HStack {
            ImageViewContainer(imageUrl: movie.posterPath)
            VStack(alignment: .leading) {
                Text(movie.title).bold().lineLimit(nil)
                Text("Release Date: \(movie.release_date)")

                
                HStack {
                    ZStack {
                        Image(systemName: "star.fill")
                        .resizable()
                            .foregroundColor(movie.votes < 5 ? .red : .yellow)
                            .frame(width: CGFloat(50.0), height: CGFloat(50.0))
                        
                        Text(movie.votes.description).foregroundColor(.white)
                            .bold()
                            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                            .offset(x: 0, y: 2)
                    }
                    
                    Text("/ 10")
                }
            }
        }
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(movie: MovieDTO(json: [:]))
    }
}
