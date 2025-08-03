#import "priority.typ": *
#import "utils.typ": *
#import "layout.typ": *

/// Creates a resume section with priority filtering
/// - title (str): Section title
/// - priority (int): Section priority (1-5)
/// - body (content): Section content
/// -> content: Formatted section or empty if filtered out
#let section(title, priority: 1, body) = context {
  let pages = state("target-pages").get()

  if should-show(priority, pages) [
    #heading(level: 2, smallcaps(title))
    #body
  ]
}

/// Creates a prioritized item with optional language tags
/// - title (str): Item title
/// - description (str, content): Item description
/// - priority (int): Item priority (1-5)
/// - languages (array): Array of programming language names
/// -> dict: Dictionary with content and priority for filtering
#let pitem(
  title: "",
  description: "",
  priority: 2,
  languages: (),
) = {
  let lang-text = if languages.len() > 0 {
    " (" + languages.map(lang).join(", ") + ")"
  } else { "" }

  (
    content: [*#title:* #description#lang-text],
    priority: priority,
  )
}

/// Creates an experience entry with filtered items
/// - organization (str): Company or organization name
/// - industry (str): Industry or company type
/// - location (str): Location (city, state/country)
/// - title (str): Job title or position
/// - start-date (str): Start date
/// - end-date (str, none): End date or none for current
/// - priority (int): Entry priority (1-5)
/// - items (array): Array of pitem() entries
/// -> content: Formatted experience entry or empty if filtered
#let experience(
  organization: "",
  industry: "",
  location: "",
  title: "",
  start-date: "",
  end-date: none,
  priority: 1,
  items: (),
) = {
  with-priority-filter(priority, items: items, filtered-items => {
    let date-range = format-date-range(start-date, end-date)

    let header = two-row-grid(
      [*#organization* (#industry)],
      [#location],
      text(size: 10pt, style: "italic")[#title],
      text(size: 10pt, style: "italic")[#date-range],
    )

    render-entry-block(header, filtered-items)
  })
}

/// Creates an education entry with courses and activities
/// - organization (str): School or university name
/// - industry (str): Institution type (e.g., "University")
/// - location (str): Location (city, state/country)
/// - degree (str): Degree name and major
/// - thesis (str, none): Thesis title if applicable
/// - start-date (str): Start date
/// - end-date (str, none): End date or none for current
/// - priority (int): Entry priority (1-5)
/// - courses (array): Array of course names
/// - volunteering (str, none): Volunteer activities description
/// -> content: Formatted education entry or empty if filtered
#let education(
  organization: "",
  industry: "",
  location: "",
  degree: "",
  thesis: none,
  start-date: "",
  end-date: none,
  priority: 1,
  courses: (),
  volunteering: none,
) = {
  with-priority-filter(priority, body => {
    let date-range = format-date-range(start-date, end-date)

    let format-courses(courses) = {
      if courses.len() == 0 { return none }
      if courses.len() == 1 {
        upper(courses.at(0).at(0)) + courses.at(0).slice(1)
      } else {
        let capitalized = courses.map(c => upper(c.at(0)) + c.slice(1))
        let all-but-last = capitalized.slice(0, -1)
        let last = capitalized.at(-1)
        all-but-last.join(", ") + " and " + last
      }
    }

    let items = ()
    let formatted-courses = format-courses(courses)
    if formatted-courses != none {
      items.push([*Courses:* #formatted-courses.])
    }
    if volunteering != none {
      items.push([*Volunteering:* #volunteering])
    }

    let degree-content = [
      #text(size: 10pt, style: "italic")[#degree]
      #if thesis != none [
        #v(-0.5em)
        #text(size: 9pt, fill: rgb(80, 80, 80))[Thesis: #thesis]
      ]
    ]

    let header = two-row-grid(
      [*#organization* (#industry)],
      [#location],
      degree-content,
      text(size: 10pt, style: "italic")[#date-range],
    )

    render-entry-block(header, items)
  })
}

/// Creates a project entry with filtered items
/// - title (str): Project title
/// - organization (str): Associated company or organization
/// - start-date (str): Start date
/// - end-date (str, none): End date or none for current
/// - priority (int): Project priority (1-5)
/// - items (array): Array of project detail items
/// -> content: Formatted project entry or empty if filtered
#let project(
  title: "",
  organization: "",
  start-date: "",
  end-date: none,
  priority: 2,
  items: (),
) = {
  with-priority-filter(priority, items: items, filtered-items => {
    let date-range = format-date-range(start-date, end-date)

    let header = grid(
      columns: (1fr, auto),
      align: (left, right),
      [*#title* - #organization], emph(date-range),
    )

    render-entry-block(header, filtered-items)
  })
}

/// Creates a skill entry with priority filtering
/// - category (str): Skill category or area
/// - description (str, content): Skill description
/// - priority (int): Skill priority (1-5)
/// -> content: Formatted skill entry or empty if filtered
#let skill(category, description, priority: 2) = context {
  let pages = state("target-pages").get()
  if not should-show(priority, pages) { return }
  [*#category:* #description]
}