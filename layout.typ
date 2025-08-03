/// Creates a 2×2 grid layout for resume entries (header/detail rows)
/// - left-top (content): Top-left content
/// - right-top (content): Top-right content  
/// - left-bottom (content): Bottom-left content
/// - right-bottom (content): Bottom-right content
/// -> content: Formatted 2×2 grid
#let two-row-grid(left-top, right-top, left-bottom, right-bottom) = {
  grid(
    columns: (1fr, auto),
    align: (left, right),
    row-gutter: 0.4em,
    left-top, right-top,
    left-bottom, right-bottom,
  )
}

/// Renders a resume entry block with header and items
/// - header (content): The entry header content
/// - items (array): Array of content items to display as a list
/// -> content: Formatted entry block
#let render-entry-block(header, items) = {
  block(breakable: false)[
    #header
    #if items.len() > 0 {
      v(-0.3em)
      list(..items)
    }
  ]
}

/// Creates a circular profile image
/// - img (content): Image content
/// - radius (length): Circle radius (default: 1.5em)
/// - offset (length): Vertical offset (default: 1em)
/// -> content: Circular cropped image
#let circular-profile(img, radius: 1.5em, offset: 1em) = {
  let size = radius * 2
  box(
    move(
      dy: offset,
      block(
        height: size,
        width: size,
        clip: true,
        radius: radius,
        img,
      ),
    ),
  )
}