import Foundation

//TODO: For now the ImageSlide and DemoSlide will typealias EmptySlide

public typealias ImageSlide = EmptySlide
public typealias DemoSlide = EmptySlide

public struct EmptySlide: Slide, Identifiable, Codable {
  public private(set) var id = UUID()
  public init() {
  }
}
