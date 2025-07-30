#import "resume-template-style.typ": *

#show: resume.with(
  name: "Jane Doe",
  email: "jane.doe@example.com",
  website: "janedoe.dev",
  phone: "+1 (555) 123-4567",
  profile-image: "sample-profile.jpg",
  target-pages: 2,
)

#section("Experience")[
  #experience(
    organization: "TechCorp Solutions",
    industry: "Software Development",
    location: "San Francisco, CA",
    title: "Senior Software Engineer",
    start-date: "Mar. 2022",
    priority: 1,
    items: (
      pitem(
        title: "Full-stack development",
        description: "Led development of customer-facing web application serving 50k+ daily users with real-time data processing and interactive dashboards.",
        priority: 1,
        languages: ("React", "Node.js", "PostgreSQL"),
      ),
      pitem(
        title: "System architecture",
        description: "Designed microservices architecture reducing deployment time by 75% and improving system reliability to 99.9% uptime.",
        priority: 1,
      ),
      pitem(
        title: "Team leadership",
        description: "Mentored 3 junior developers and conducted code reviews for team of 8 engineers.",
        priority: 2,
      ),
    ),
  )

  #experience(
    organization: "StartupXYZ",
    industry: "E-commerce",
    location: "Austin, TX",
    title: "Software Engineer",
    start-date: "Jun. 2020",
    end-date: "Feb. 2022",
    priority: 1,
    items: (
      pitem(
        title: "Backend development",
        description: "Built RESTful APIs and payment processing systems handling $2M+ in transactions monthly.",
        priority: 1,
        languages: ("Python", "Django", "Redis"),
      ),
      pitem(
        title: "Database optimization",
        description: "Optimized database queries reducing response times by 60% and implemented caching strategies.",
        priority: 2,
        languages: ("SQL", "MongoDB"),
      ),
    ),
  )
]

#section("Major Projects")[
  #project(
    title: "Real-time Analytics Platform",
    organization: "TechCorp Solutions",
    start-date: "Aug. 2023",
    end-date: "Dec. 2023",
    priority: 1,
    items: (
      [*Architecture*: Designed event-driven system processing 1M+ events per hour using Apache Kafka and stream processing.],
      [*Visualization*: Built interactive dashboards with D3.js providing real-time insights to business stakeholders.],
      [*Performance*: Achieved sub-100ms query response times through optimized data structures and caching layers.],
    ),
  )

  #project(
    title: "Mobile Payment Integration",
    organization: "StartupXYZ",
    start-date: "Nov. 2021",
    end-date: "Jan. 2022",
    priority: 2,
    items: (
      [*Integration*: Implemented Stripe and PayPal payment gateways with comprehensive error handling and retry logic.],
      [*Security*: Built PCI-compliant payment processing with encryption and fraud detection capabilities.],
    ),
  )
]

#section("Skills")[
  #skill(
    "Programming Languages",
    [Proficient in modern web development stack with focus on scalable backend systems and responsive frontend interfaces.],
    priority: 1,
  )

  #skill(
    "Cloud & DevOps",
    [Experience with AWS services, Docker containerization, CI/CD pipelines, and infrastructure as code using Terraform.],
    priority: 1,
  )

  #skill(
    "Databases",
    [Designed and optimized relational and NoSQL databases including PostgreSQL, MongoDB, and Redis for high-performance applications.],
    priority: 2,
  )
]

#section("Education")[
  #education(
    organization: "University of California",
    industry: "University",
    thesis: "Some subject",
    location: "Berkeley, CA",
    degree: "Bachelor of Science in Computer Science",
    start-date: "Aug. 2016",
    end-date: "May 2020",
    priority: 1,
    courses: (
      "algorithms and data structures",
      "computer systems",
      "database systems",
      "software engineering",
      "machine learning",
    ),
    volunteering: "Teaching assistant for introductory programming courses.",
  )
]

#section("Additional Experience")[
  #skill(
    "Open Source Contributions",
    [Active contributor to open-source projects including popular JavaScript libraries with 10k+ GitHub stars. Regular speaker at local tech meetups.],
    priority: 2,
  )

  #skill(
    "Certifications",
    [AWS Certified Solutions Architect, Google Cloud Professional Developer, certified in Agile and Scrum methodologies.],
    priority: 2,
  )
]
