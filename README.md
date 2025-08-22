# Flexible resume template

A Typst resume template with priority-based content filtering. Create single-page resumes or multi-page CVs from the same source.

## Installation

Clone this template to your local Typst packages directory:

```bash
git clone https://github.com/wvhulle/flexible-resume.git $XDG_DATA_HOME/typst/packages/local/flexible-resume/0.0.1
```

Requires [Typst](https://typst.app/docs/tutorial/installation/).

## Features

- Priority-based filtering (1-page vs multi-page layouts)
- Profile image support with proper alignment
- Programming language highlighting in monospace
- Smart date and list formatting

## Usage

```typst
#import "@local/flexible-resume:0.0.1": *

#show: resume.with(
  name: "Your Name",
  email: "your.email@example.com", 
  website: "your-website.com",
  phone: "+1 234 567 8900",
  target-pages: 2,
)

#section("Experience")[
  #experience(
    organization: "Company Name",
    location: "City, Country",
    title: "Your Title", 
    start-date: "Jan. 2020",
    end-date: "Dec. 2023",
    items: (
      pitem(
        title: "Achievement",
        description: "What you accomplished",
        priority: 1,
        languages: ("Python", "Rust"),
      ),
    ),
  )
]
```

## API Reference

**Main template:**
```typst
#resume(name, email, website, phone, profile-image: none, target-pages: 2, font: "Fira Sans", body)
```

**Content functions:**
```typst
#section(title, priority: 1, body)
#experience(organization, location, title, start-date, end-date: none, priority: 1, items: ())
#education(organization, location, degree, start-date, end-date: none, priority: 1)  
#project(title, organization, start-date, end-date: none, priority: 2, items: ())
#skill(category, description, priority: 2)
#pitem(title, description, priority: 2, languages: ())
```

**Priority system:**
- `target-pages: 1` → Priority 1 items only (essential)
- `target-pages: 2+` → Priority 1-2 items (detailed)

Programming languages in `pitem()` appear in monospace.

## License

MIT