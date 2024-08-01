import SwiftUI

struct CategoryCard: View {
    var title: String
    var requiredTime: String
    var imageName: String

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .fill(Color(.systemGray6))
                    .cornerRadius(10)
                    .shadow(radius: 5)

                VStack(alignment: .leading) {
                    Text(title)
                        .font(.callout)
                        .fontWeight(.bold)
                    Text(requiredTime)
                        .font(.footnote)
                        .foregroundColor(Color(.systemGray))
                        .fontWeight(.semibold)
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)

                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width * 0.5)
                    .offset(x: geometry.size.width / 3.5, y: geometry.size.height / 3.5)
                    
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .aspectRatio(1, contentMode: .fit) // Maintain the square aspect ratio
    }
}

struct CategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCard(title: "Food", requiredTime: "25 mins", imageName: "food")
            .frame(width: 150, height: 150)
    }
}
