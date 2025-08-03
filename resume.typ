#import "layout.typ": *
#import "content.typ": *

/// Main resume template function
/// - name (str): Full name
/// - email (str): Email address 
/// - website (str): Website URL (without https://)
/// - phone (str): Phone number
/// - profile-image (content, none): Image content (use image("path/to/file.jpg"))
/// - target-pages (int): Target page count (1 or 2)
/// - font (str, array): Font family name or array of fallback fonts
/// - font-code (str, array): Monospace font family name or array of fallback fonts
/// - theme (str): Color theme ("default", "blue", "green")
/// - body (content): Document content
/// -> content: Complete formatted resume
#let resume(
  name: "",
  email: "",
  website: "",
  phone: "",
  profile-image: none,
  target-pages: 2,
  font: "Fira Sans",
  font-code: "Fira Mono",
  theme: "default",
  body,
) = {
  let margins = if target-pages == 1 { 0.75in } else { 0.85in }
  
  let theme-colors = (
    default: (accent: gray, text: black),
    blue: (accent: blue.darken(20%), text: black),
    green: (accent: green.darken(30%), text: black),
  )
  
  let colors = theme-colors.at(theme, default: theme-colors.default)

  set page(paper: "a4", margin: margins)
  set text(font: font, size: 11pt, fill: colors.text)
  set par(justify: true, leading: 0.9em)
  set heading(numbering: none)

  show raw: set text(font: font-code, size: 1.1em)
  show link: underline.with(stroke: colors.accent)

  grid(
    columns: (2fr, 1fr),
    align: (left, right),
    [
      #text(size: 22pt, weight: "bold")[#name]
      #if profile-image != none [
        #h(0.5em)#circular-profile(profile-image, radius: 2em, offset: 1em)
      ]
    ],
    text(size: 10pt)[
      #link("mailto:" + email) \
      #link(website) \
      #link("tel:" + phone)
    ],
  )

  let pages-state = state("target-pages", target-pages)
  pages-state.update(target-pages)
  body
}