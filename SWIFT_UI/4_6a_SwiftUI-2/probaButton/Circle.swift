//
//  Created by apios on 02/11/2019.
//  Copyright © 2019 Adam Wojtasik. All rights reserved.
//

import SwiftUI

struct CircleTest: View {
    
    var body: some View {
        Image("panorama-warszawy")
            .clipShape(Circle())
            .padding(.horizontal, -282)
            .padding(.vertical, -110)
            .scaleEffect(0.5)
    }
}

struct Circle_Previews: PreviewProvider {
    static var previews: some View {
        CircleTest()
    }
}
