#!/usr/bin/env bash
set -euo pipefail

# Run from the root of the yakarteek repo.
echo "Setting up profile / book-my-time site..."

mkdir -p src/data src/pages/services

# 1. src/consts.ts
cat > src/consts.ts <<'EOF'
export const SITE_TITLE = 'Aswani Karteek Yadavilli';
export const SITE_DESCRIPTION =
  'Data engineer, speaker, and advisor. Book me for keynotes, consulting, training, mentorship, and more.';
EOF

# 2. src/data/services.ts
cat > src/data/services.ts <<'EOF'
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
EOF

# 3. src/components/Header.astro
cat > src/components/Header.astro <<'EOF'
---
import { SITE_TITLE } from '../consts';
import { services } from '../data/services';
---
<header>
  <nav>
    <a href="/" class="brand">{SITE_TITLE}</a>
    <div class="tabs">
      <a href="/">Home</a>
      <a href="/about">About</a>
      {services.map((s) => <a href={`/services/${s.slug}`}>{s.title}</a>)}
      <a href="/book" class="book">Book me</a>
    </div>
  </nav>
  <style>
    header { border-bottom: 1px solid rgb(var(--gray-light)); margin-bottom: 2rem; }
    nav { max-width: 960px; margin: 0 auto; padding: 1rem; display: flex; flex-wrap: wrap; align-items: center; gap: 0.75rem 1.25rem; }
    .brand { font-weight: 700; font-size: 1.1rem; text-decoration: none; color: rgb(var(--black)); }
    .tabs { display: flex; flex-wrap: wrap; gap: 0.5rem 1rem; align-items: center; }
    .tabs a { text-decoration: none; color: rgb(var(--gray-dark)); font-size: 0.95rem; }
    .tabs a:hover { color: rgb(var(--accent)); }
    .tabs a.book { background: rgb(var(--accent)); color: #fff; padding: 0.35rem 0.9rem; border-radius: 8px; }
  </style>
</header>
EOF

# 4. src/pages/index.astro
cat > src/pages/index.astro <<'EOF'
---
import BaseHead from '../components/BaseHead.astro';
import Header from '../components/Header.astro';
import Footer from '../components/Footer.astro';
import { SITE_TITLE, SITE_DESCRIPTION } from '../consts';
import { services } from '../data/services';
---
<!doctype html>
<html lang="en">
  <head><BaseHead title={SITE_TITLE} description={SITE_DESCRIPTION} /></head>
  <body>
    <Header />
    <main>
      <section class="hero">
        <p class="eyebrow">Pittsburgh · Data Engineer & Advisor</p>
        <h1>Aswani Karteek Yadavilli</h1>
        <p class="lede">
          I build data platforms and AI systems that make it to production — and
          I help teams and audiences do the same. Available for keynotes,
          advisory, training, mentorship, and hands-on delivery.
        </p>
        <div class="hero-cta">
          <a href="/book" class="btn">Book time with me</a>
          <a href="/about" class="btn ghost">About me</a>
        </div>
        <div class="socials">
          <a href="https://github.com/thedataengineer" target="_blank" rel="noopener">GitHub</a>
          <a href="https://twitter.com/thekarteek" target="_blank" rel="noopener">X</a>
          <a href="https://www.linkedin.com/in/YOUR-HANDLE" target="_blank" rel="noopener">LinkedIn</a>
        </div>
      </section>

      <section>
        <h2>How I can help</h2>
        <div class="grid">
          {services.map((s) => (
            <a class="card" href={`/services/${s.slug}`}>
              <span class="icon">{s.icon}</span>
              <h3>{s.title}</h3>
              <p>{s.tagline}</p>
            </a>
          ))}
        </div>
      </section>
    </main>
    <Footer />

    <style>
      .hero { max-width: 720px; margin: 0 auto 3rem; text-align: center; }
      .eyebrow { text-transform: uppercase; letter-spacing: 0.08em; font-size: 0.8rem; color: rgb(var(--gray)); }
      .lede { font-size: 1.15rem; line-height: 1.6; color: rgb(var(--gray-dark)); }
      .hero-cta { display: flex; gap: 0.75rem; justify-content: center; margin: 1.5rem 0 1rem; flex-wrap: wrap; }
      .btn { background: rgb(var(--accent)); color: #fff; padding: 0.6rem 1.2rem; border-radius: 8px; text-decoration: none; }
      .btn.ghost { background: transparent; color: rgb(var(--accent)); border: 1px solid rgb(var(--accent)); }
      .socials { display: flex; gap: 1.25rem; justify-content: center; }
      .grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(220px, 1fr)); gap: 1rem; }
      .card { display: block; padding: 1.25rem; border: 1px solid rgb(var(--gray-light)); border-radius: 12px; text-decoration: none; color: inherit; transition: box-shadow 0.15s, transform 0.15s; }
      .card:hover { box-shadow: var(--box-shadow); transform: translateY(-2px); }
      .card .icon { font-size: 1.6rem; }
      .card h3 { margin: 0.4rem 0 0.2rem; }
      .card p { margin: 0; color: rgb(var(--gray-dark)); font-size: 0.95rem; }
    </style>
  </body>
</html>
EOF

# 5. src/pages/services/[slug].astro
cat > 'src/pages/services/[slug].astro' <<'EOF'
---
import BaseHead from '../../components/BaseHead.astro';
import Header from '../../components/Header.astro';
import Footer from '../../components/Footer.astro';
import { services } from '../../data/services';

export function getStaticPaths() {
  return services.map((service) => ({
    params: { slug: service.slug },
    props: { service },
  }));
}

const { service } = Astro.props;
---
<!doctype html>
<html lang="en">
  <head><BaseHead title={`${service.title} — Aswani Karteek Yadavilli`} description={service.tagline} /></head>
  <body>
    <Header />
    <main>
      <article class="service">
        <span class="icon">{service.icon}</span>
        <h1>{service.title}</h1>
        <p class="tagline">{service.tagline}</p>
        <p>{service.description}</p>

        <h2>What you get</h2>
        <ul>{service.whatYouGet.map((item) => <li>{item}</li>)}</ul>

        <p class="ideal"><strong>Ideal for:</strong> {service.idealFor}</p>

        <a href="/book" class="btn">Book {service.title.toLowerCase()}</a>
      </article>
    </main>
    <Footer />

    <style>
      .service { max-width: 680px; margin: 0 auto; }
      .service .icon { font-size: 2.5rem; }
      .tagline { font-size: 1.2rem; color: rgb(var(--gray-dark)); }
      .ideal { color: rgb(var(--gray-dark)); }
      .btn { display: inline-block; background: rgb(var(--accent)); color: #fff; padding: 0.6rem 1.2rem; border-radius: 8px; text-decoration: none; margin-top: 1rem; }
    </style>
  </body>
</html>
EOF

# 6. src/pages/book.astro
cat > src/pages/book.astro <<'EOF'
---
import BaseHead from '../components/BaseHead.astro';
import Header from '../components/Header.astro';
import Footer from '../components/Footer.astro';
---
<!doctype html>
<html lang="en">
  <head><BaseHead title="Book me — Aswani Karteek Yadavilli" description="Book time with Aswani Karteek Yadavilli." /></head>
  <body>
    <Header />
    <main>
      <section class="book">
        <h1>Let's work together</h1>
        <p>Pick a time below, or email me at <a href="mailto:you@example.com">you@example.com</a> with what you have in mind.</p>

        <!-- Replace YOUR_HANDLE with your Calendly username -->
        <div class="calendly-inline-widget" data-url="https://calendly.com/YOUR_HANDLE" style="min-width:320px;height:700px;"></div>
        <script type="text/javascript" src="https://assets.calendly.com/assets/external/widget.js" async></script>
      </section>
    </main>
    <Footer />
    <style>
      .book { max-width: 760px; margin: 0 auto; }
    </style>
  </body>
</html>
EOF

# 7. src/pages/about.astro
cat > src/pages/about.astro <<'EOF'
---
import BaseHead from '../components/BaseHead.astro';
import Header from '../components/Header.astro';
import Footer from '../components/Footer.astro';
---
<!doctype html>
<html lang="en">
  <head><BaseHead title="About — Aswani Karteek Yadavilli" description="About Aswani Karteek Yadavilli." /></head>
  <body>
    <Header />
    <main>
      <article class="about">
        <h1>About</h1>
        <p>
          I'm a data engineer based in Pittsburgh. I design and build data
          platforms and AI systems — pipelines, LLM tooling, and agent-based
          workflows — with a focus on what actually holds up in production.
        </p>
        <p>
          I currently work at <a href="https://accionlabs.com" target="_blank" rel="noopener">Accion Labs</a>
          and build independently under Yadavilli Solutions. Lately I've been deep
          in applied AI: agent orchestration, LLM evaluation, and developer tooling.
        </p>
        <p>
          Find me on <a href="https://github.com/thedataengineer" target="_blank" rel="noopener">GitHub</a>
          and <a href="https://twitter.com/thekarteek" target="_blank" rel="noopener">X</a>.
        </p>
        <a href="/book" class="btn">Book time with me</a>
      </article>
    </main>
    <Footer />
    <style>
      .about { max-width: 680px; margin: 0 auto; }
      .btn { display: inline-block; background: rgb(var(--accent)); color: #fff; padding: 0.6rem 1.2rem; border-radius: 8px; text-decoration: none; margin-top: 1rem; }
    </style>
  </body>
</html>
EOF

echo "Done. Files written:"
echo "  src/consts.ts"
echo "  src/data/services.ts"
echo "  src/components/Header.astro"
echo "  src/pages/index.astro"
echo "  src/pages/services/[slug].astro"
echo "  src/pages/book.astro"
echo "  src/pages/about.astro"
echo ""
echo "Next: fill in email, Calendly handle, and LinkedIn URL, then commit."
