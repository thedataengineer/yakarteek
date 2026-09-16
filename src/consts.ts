// Site-wide constants. Values that change per-deploy or per-identity live here
// so pages never hard-code them.

export const SITE_TITLE = 'Aswani Karteek Yadavilli';
export const SITE_DESCRIPTION =
  'Data engineer, speaker, and advisor. Book me for keynotes, consulting, training, mentorship, and more.';

export const CONTACT_EMAIL = 'book@yadavilli.com';

// Full Calendly scheduling URL (event links work too).
// Leave empty and the booking page falls back to the email CTA.
export const CALENDLY_URL = 'https://calendly.com/karteek-3oc/30min';

// Social links. Empty string = link is not rendered.
export const SOCIALS = {
  github: 'https://github.com/thedataengineer',
  x: 'https://twitter.com/thekarteek',
  linkedin: 'https://www.linkedin.com/in/yakarteek/',
} as const;
