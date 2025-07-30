#import "@preview/flexible-resume:0.1.0": *

#show: resume.with(
  name: "Your Full Name",
  email: "your.name@example.com",
  website: "yourwebsite.com",
  phone: "+1 (555) 000-0000",
  profile-image: none,
  target-pages: 2,
  font: "Fira Sans",
)

#section("Experience")[
  #experience(
    organization: "Company Name",
    industry: "Industry Type",
    location: "City, State/Country",
    title: "Your Job Title",
    start-date: "Month Year",
    end-date: none,
    priority: 1,
    items: (
      pitem(
        title: "Key Achievement",
        description: "Describe what you accomplished, including metrics and impact where possible.",
        priority: 1,
        languages: ("Technology", "Language"),
      ),
      pitem(
        title: "Another Achievement",
        description: "Another significant accomplishment or responsibility.",
        priority: 2,
      ),
    ),
  )

]

#section("Major Projects", priority: 1)[
  #project(
    title: "Project Name",
    organization: "Company/Organization",
    start-date: "Month Year",
    end-date: "Month Year",
    priority: 1,
    items: (
      [*Technical aspect*: Description of technical work and challenges solved.],
      [*Impact*: Quantifiable results and business impact of the project.],
    ),
  )

]

#section("Skills")[
  #skill(
    "Skill Category",
    [Describe your expertise in this area, mentioning specific technologies, tools, or methodologies.],
    priority: 1,
  )

  #skill(
    "Another Skill Area",
    [Detail your proficiency and experience with relevant tools and techniques.],
    priority: 2,
  )

]

#section("Education")[
  #education(
    organization: "University Name",
    industry: "University",
    location: "City, State/Country",
    degree: "Degree Name and Major",
    thesis: none,
    start-date: "Month Year",
    end-date: "Month Year",
    priority: 1,
    courses: ("relevant course", "another course", "third course"),
    volunteering: none,
  )

]

#section("Additional Information", priority: 2)[
  #skill(
    "Languages",
    "List spoken languages and proficiency levels.",
    priority: 2,
  )

  #skill(
    "Certifications",
    "List relevant professional certifications or licenses.",
    priority: 2,
  )

  #skill(
    "Interests",
    "Brief mention of relevant hobbies or professional interests.",
    priority: 2,
  )
]
