/// Determines the priority threshold based on target page count
/// - pages (int): Target number of pages (1 or 2)
/// -> int: Maximum priority level to show
#let priority-threshold(pages) = if pages == 1 { 1 } else { 2 }

/// Determines if content should be displayed based on priority and page target
/// - priority (int): Content priority level (1-5)
/// - pages (int): Target number of pages
/// -> bool: Whether to show the content
#let should-show(priority, pages) = priority <= priority-threshold(pages)

/// Filters items based on priority threshold and extracts content
/// - items (array): Array of items to filter
/// - threshold (int): Maximum priority level to include
/// -> array: Filtered array of content
#let filter-prioritized-items(items, threshold) = {
  items
    .filter(item => {
      if type(item) == dictionary and "priority" in item {
        item.priority <= threshold
      } else { true }
    })
    .map(item => {
      if type(item) == dictionary and "content" in item {
        item.content
      } else { item }
    })
}

/// Wrapper function to handle common priority filtering pattern
/// - priority (int): Entry priority level
/// - items (array): Array of items to filter (optional)
/// - body (function): Function to call if priority check passes, receives filtered items
/// -> content: Result of body function or empty if filtered out
#let with-priority-filter(priority, items: (), body) = context {
  let pages = state("target-pages").get()
  
  if not should-show(priority, pages) { return }
  
  let filtered-items = if items.len() > 0 {
    filter-prioritized-items(items, priority-threshold(pages))
  } else { () }
  
  body(filtered-items)
}