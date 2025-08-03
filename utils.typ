/// Formats a programming language name in monospace font
/// - name (str): The name of the programming language
/// -> content: The formatted language name
#let lang(name) = raw(name)

/// Formats a date range string
/// - start (str): Start date
/// - end (str, none): End date or none for current
/// -> str: Formatted date range
#let format-date-range(start, end) = {
  if end != none { start + " - " + end } else { start + " - current" }
}