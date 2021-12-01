import Foundation

public typealias Title = SingleLineComponent
public typealias Subtitle = SingleLineComponent
public typealias Info = SingleLineComponent
public typealias SubInfo = SingleLineComponent
public typealias CodeLocation = SingleLineComponent
public typealias CodeResult = SingleLineComponent
public typealias CallOut = SingleLineComponent

public struct SingleLineComponent: Codable, Identifiable {
  public private(set) var id = UUID()
  public private(set) var segments = [ComponentSegment]()
}

extension SingleLineComponent {
  public init(contents: String,
       startingStyle style: ComponentStyle = .standard) {
    let dividers = dividers(from: contents)
      var style = style
      var index = contents.startIndex
      for component in dividers {
        addSegment(contents: contents[index..<component.range.lowerBound],
                   style: style)
        style = ComponentStyle.from(tag: component.tag)
        index = component.range.upperBound
      }
    addSegment(contents: contents[index...],
               style: style)
  }
}

extension SingleLineComponent {
  private func dividers(from string: String) ->  [(range: Range<String.Index>, tag: String)] {
    ComponentStyle.tags
      .compactMap {tag in range(of: tag, in: string)}
      .sorted{$0.0.lowerBound < $1.0.lowerBound}
  }
  
  func range(of tag: String, in string: String) -> (range: Range<String.Index>, tag: String)? {
    guard let range = string.range(of: tag) else {return nil}
    return (range, tag)
  }
}


extension SingleLineComponent {
  mutating private func addSegment(contents: Substring = "",
                                   style: ComponentStyle = .standard) {
    segments.append(ComponentSegment(contents: String(contents),
                             style: style))
  }
}

extension SingleLineComponent: CustomStringConvertible {
  public var description: String {
    segments.reduce(""){lineDescription, segment in
      lineDescription + segment.description
    }
  }
}
