// MIT License
//
// Copyright (c) 2019 Anton Yereshchenko
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

struct Card {
  var title: String
  var details: String
  var image: UIImage?
  var icon: UIImage?
}

extension Card {
  static var cards: [Card] {
    var cards = [Card]()
    cards.append(
      Card(
        title: "Flight Booking",
        details: "A lot of special proposition especially for you.",
        image: UIImage(named: "TravelSky"),
        icon: UIImage(named: "TravelSkyIcon")
      )
    )
    
    cards.append(
      Card(
        title: "Car rentals",
        details: "Take the nearest car that already waits.",
        image: UIImage(named: "TravelMap"),
        icon: UIImage(named: "TravelMapIcon")
      )
    )

    cards.append(
      Card(
        title: "All you have to do is enjoying your trip",
        details: "With our service, you will reach your destination as fast as possible.",
        image: UIImage(named: "TravelStreet"),
        icon: UIImage(named: "TravelStreetIcon")
      )
    )
    return cards
  }
}
