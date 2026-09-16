export interface Service {
  slug: string;
  title: string;
  icon: string;
  tagline: string;
  description: string;
  whatYouGet: string[];
  idealFor: string;
}

export const services: Service[] = [
  {
    slug: 'keynotes',
    title: 'Keynotes',
    icon: '🎤',
    tagline: 'Opening and closing talks that set the tone for your event.',
    description:
      'High-energy keynotes on modern data platforms, AI agents, and what actually ships in production. Tailored to your audience and theme.',
    whatYouGet: [
      'A custom 30–60 min talk built around your event theme',
      'Live demos or story-driven narrative, your call',
      'Slides and follow-up resources for attendees',
    ],
    idealFor: 'Conferences, summits, and company all-hands.',
  },
  {
    slug: 'public-speaking',
    title: 'Public Speaking',
    icon: '🗣️',
    tagline: 'Panels, fireside chats, and conference sessions.',
    description:
      'Panel appearances, moderated discussions, and breakout sessions on data engineering, LLM evaluation, and applied AI.',
    whatYouGet: [
      'Panel or fireside participation',
      'Breakout / track sessions',
      'Pre-event prep call with organizers',
    ],
    idealFor: 'Meetups, conference tracks, and industry panels.',
  },
  {
    slug: 'advisory',
    title: 'Advisory & Consulting',
    icon: '🧭',
    tagline: 'A senior data/AI partner on call for your team.',
    description:
      'Architecture reviews, roadmap pressure-testing, and hands-on guidance for data platform and AI initiatives.',
    whatYouGet: [
      'Recurring advisory sessions or fixed-scope engagements',
      'Architecture and data-strategy reviews',
      'Written recommendations you can act on',
    ],
    idealFor: 'Founders and eng leaders scaling data or AI.',
  },
  {
    slug: 'solutions',
    title: 'Solutions',
    icon: '🛠️',
    tagline: 'Design and delivery of data platforms and AI systems.',
    description:
      'End-to-end design and build of data pipelines, platforms, and LLM/agent systems — from proof of concept to production.',
    whatYouGet: [
      'Discovery and solution design',
      'Hands-on implementation or embedded delivery',
      'Handoff docs and team enablement',
    ],
    idealFor: 'Teams that need it built, not just advised.',
  },
  {
    slug: 'training',
    title: 'Training',
    icon: '📚',
    tagline: 'Practical workshops for engineering teams.',
    description:
      'Cohort-based, hands-on training on data engineering, LLM tooling, and building with AI agents.',
    whatYouGet: [
      'Half-day to multi-day workshops',
      'Hands-on labs and take-home exercises',
      'Customized to your stack',
    ],
    idealFor: 'Engineering teams leveling up on data + AI.',
  },
  {
    slug: 'guidance',
    title: 'Guidance',
    icon: '💡',
    tagline: 'Focused sessions to unblock a specific problem.',
    description:
      'One-off working sessions to work through a thorny technical or career decision, no long-term commitment.',
    whatYouGet: [
      '60–90 min focused working session',
      'Concrete next steps by the end',
      'Optional written summary',
    ],
    idealFor: 'Anyone stuck on a specific decision.',
  },
  {
    slug: 'university-classes',
    title: 'University Classes',
    icon: '🎓',
    tagline: 'Guest lectures and course modules for students.',
    description:
      'Guest lectures and short modules bringing real-world data engineering and AI into the classroom.',
    whatYouGet: [
      'Guest lecture or multi-session module',
      'Real-world case studies and demos',
      'Q&A and career guidance for students',
    ],
    idealFor: 'Universities and bootcamps.',
  },
  {
    slug: 'mentorship',
    title: 'Mentorship',
    icon: '🤝',
    tagline: 'Ongoing 1:1 support for your growth.',
    description:
      'Recurring 1:1 mentorship for engineers moving into data, AI, or senior/lead roles.',
    whatYouGet: [
      'Regular 1:1 sessions (biweekly or monthly)',
      'Async support between sessions',
      'Personalized growth plan',
    ],
    idealFor: 'Engineers investing in their trajectory.',
  },
];
