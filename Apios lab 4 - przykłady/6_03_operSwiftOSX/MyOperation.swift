//
//  Created by Adam Wojtasik on 28/11/2017.
//  Last modifications: 01.04.2019
//  Copyright © 2017 Politechnika Warszawska. All rights reserved.
//

import Foundation


class MyOperation : Operation{
	let numer: Int
	init(_ nr: Int){
		numer = nr
		super.init()
		self.completionBlock = { print("zakończona MyOperation nr \(self.numer)") }
	}
	
	override func main(){
		Robotnik.pracuj("MyOperation nr \(numer)")
	}
}
