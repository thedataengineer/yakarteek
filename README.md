# karteekyadavilli.me

Personal site for Aswani Karteek Yadavilli — profile, services, and booking.
Built with [Astro](https://astro.build) and deployed to
[Cloudflare Workers](https://developers.cloudflare.com/workers/static-assets/).

## Structure

| Path                        | What's there                                                     |
| :-------------------------- | :--------------------------------------------------------------- |
| `src/consts.ts`             | Site title, description, contact email, Calendly handle, socials |
| `src/data/services.ts`      | The service catalogue that drives `/services` and the nav        |
| `src/pages/`                | One route per file (`/`, `/about`, `/book`, `/services`, `/blog`) |
| `src/pages/services/[slug]` | A page per entry in `services.ts`                                |
| `src/content/blog/`         | Blog posts as Markdown / MDX, schema in `src/content.config.ts`  |
| `src/layouts/BlogPost.astro`| Layout every post renders into                                   |
| `public/`                   | Static assets served as-is (fonts, images, `favicon.svg`)        |

## Configuration

Identity and per-deploy values live in `src/consts.ts`:

- `CONTACT_EMAIL` — address behind the `mailto:` on `/book`
- `CALENDLY_URL` — full Calendly scheduling URL. Empty means the embed is
  skipped and `/book` falls back to the email CTA.
- `SOCIALS` — profile URLs. An empty string hides that link everywhere.

The canonical origin is `site` in `astro.config.mjs`; it feeds canonical tags,
`sitemap-index.xml`, the RSS feed, and Open Graph URLs. `trailingSlash: "always"`
keeps internal links in the same shape the build emits, so navigation never
costs a redirect.

`wrangler.json` keeps `main` pointed at `@astrojs/cloudflare/entrypoints/server`;
the adapter's Vite plugin fills in the assets directory at build time. Keep
`compatibility_date` reasonably current — a stale date makes the adapter emit
`[object Object]` for every prerendered page instead of HTML.

## Adding a blog post

Drop a `.md` or `.mdx` file in `src/content/blog/`. The filename becomes the
URL slug. Frontmatter must satisfy the schema in `src/content.config.ts`:

```yaml
---
title: "Post title"
description: "Shown in listings, meta description, and the RSS feed"
pubDate: "Jan 15 2026"
updatedDate: "Feb 01 2026" # optional
heroImage: "/blog-placeholder-1.jpg" # optional
---
```

## Commands

| Command            | Action                                                  |
| :----------------- | :------------------------------------------------------ |
| `npm install`      | Install dependencies                                    |
| `npm run dev`      | Dev server at `localhost:4321` (runs in the background)  |
| `npm run build`    | Build to `./dist/` (`client/` assets + `server/` worker) |
| `npm run preview`  | Build, then serve through Wrangler as Workers will run it |
| `npm run check`    | Build + `tsc` + `wrangler deploy --dry-run`              |
| `npm run deploy`   | Deploy to Cloudflare Workers                             |
| `npm run cf-typegen` | Regenerate `worker-configuration.d.ts` from `wrangler.json` |
| `npx astro dev status` / `stop` / `logs` | Manage the background dev server    |
| `npx wrangler tail` | Stream live logs from the deployed Worker               |

## Credit

Styling is derived from the Astro blog starter, which is based on
[Bear Blog](https://github.com/HermanMartinus/bearblog/) (MIT).
