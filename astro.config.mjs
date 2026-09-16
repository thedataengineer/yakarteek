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
	integrations: [mdx(), sitemap()],
	adapter: cloudflare({
		platformProxy: {
			enabled: true,
		},
	}),
});
