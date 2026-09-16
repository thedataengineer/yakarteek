// @ts-check
import { defineConfig } from "astro/config";
import mdx from "@astrojs/mdx";
import sitemap from "@astrojs/sitemap";

import cloudflare from "@astrojs/cloudflare";

// https://astro.build/config
export default defineConfig({
	site: "https://karteekyadavilli.me",
	// Output is directory-format, so canonical URLs end in "/". Keep internal
	// links in the same shape to avoid a 307 on every navigation.
	trailingSlash: "always",
	// Nothing here uses sessions. Left on, the adapter injects a SESSION KV
	// binding with no namespace id, which fails on deploy.
	session: false,
	integrations: [mdx(), sitemap()],
	adapter: cloudflare({
		// No astro:assets usage, so skip the Cloudflare Images binding and
		// optimize at build time if images are ever added to prerendered pages.
		imageService: "compile",
	}),
});
