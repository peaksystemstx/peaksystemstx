# Putting Your Peak Systems Website Online

> **⚠️ This guide is retired (August 2026).** The site now publishes
> automatically: every push to this repo's `main` branch deploys the `site`
> folder to GitHub Pages, and `peaksystemstx.com` points there via Cloudflare
> DNS. Nothing to drag anywhere. The Netlify walkthrough below is kept only
> for historical reference.

This guide takes you from the website files on your computer to a **live website at
`peaksystemstx.com`** — replacing your current Squarespace site.

It is written for someone who has **never built or published a website before**. You do
**not** need to know anything about coding. Every step is a click or a copy‑and‑paste.
Read it top to bottom and do the steps in order. Take your time — you can’t break anything.

**About how long it takes:** roughly **30–45 minutes** of clicking, plus some waiting.
One step (connecting your web address) can take a few hours to finish on its own in the
background — that’s normal, and you don’t have to sit and watch it.

---

## A few words in plain English

You’ll see these words below. Here’s what they mean, in everyday terms:

| Word | What it really means |
|------|----------------------|
| **The website files** | The `site` folder that came with this guide. It *is* your website — every page and photo is inside it. |
| **Web host** | A company whose computers hold your website and show it to visitors. We’ll use a free one called **Netlify**. Think of it as the “land” your house sits on. |
| **Domain** | Your web address: `peaksystemstx.com`. You already own this. Think of it as your “street address.” |
| **DNS / nameservers** | The internet’s address book. It’s what tells the world “when someone types `peaksystemstx.com`, send them to this website.” We’ll update one setting here. |
| **Deploy / publish** | Fancy words for “put the website online.” |

That’s the whole vocabulary. You’re now caught up.

---

## What you need before you start

- [ ] The **`site` folder** (it sits next to this guide). Know where it is on your computer.
- [ ] Your **email address** (to create a free account).
- [ ] Your **Squarespace login** (you’ll sign in near the end to switch things over).
- [ ] About **half an hour** and a cup of coffee.

You do **not** need to install anything or pay anything. The web host we use is free for a
small website like this one.

---

## The plan (three simple stages)

1. **Put the new website online** at a temporary address, so you can see it working.
2. **Point your real address** (`peaksystemstx.com`) at the new website.
3. **Turn off the old Squarespace site** — carefully, so you keep your domain.

Let’s go.

---

## Stage 1 — Put the new website online (about 10 minutes)

We’ll use **Netlify**, a free web host that lets you publish a website by dragging a
folder onto a web page. No accounts to configure, no files to edit.

1. Open your web browser and go to **[app.netlify.com/signup](https://app.netlify.com/signup)**.
2. Sign up for a **free** account. The easiest option is **“Sign up with email,”** or use
   your Google account if you have one. Follow the prompts to confirm your email.
3. Once you’re signed in, look for the **“Sites”** page (it’s usually the first thing you
   see). On it, find the box that says something like:
   > *“Want to deploy a new site without connecting to Git? Drag and drop your site output folder here.”*
4. Open a second window showing your **`site` folder** (the one with `index.html` inside it).
5. **Drag the whole `site` folder** onto that box in Netlify and let go.

   > ⚠️ Drag the **folder itself**, not the files inside it. If you’re unsure, click into
   > the `site` folder, and make sure you can see files named `index.html`, `about.html`,
   > and a folder called `images`. Then go **back up one level** and drag the `site` folder.

6. Netlify will spend a few seconds uploading and then show you a **web address** that looks
   like `https://something-random-1234.netlify.app`.

**✅ Checkpoint:** Click that `.netlify.app` link. **Your new website should open.** Click
around — Home, About, Services, Our Work, Contact. Try it on your phone too. This is your
real website; it just has a temporary address for now.

> 💡 **Give it a friendlier temporary name (optional).** In Netlify, go to
> **Site configuration → Change site name** and pick something like `peak-systems`. Your
> temporary address becomes `peak-systems.netlify.app`. This is just for your convenience;
> the real address comes next.

---

## Stage 2 — Point `peaksystemstx.com` at the new website (about 15 minutes, then some waiting)

Right now, `peaksystemstx.com` still shows your **old** Squarespace site. In this stage we
tell your web address to show the **new** website instead.

### Step 2a — Tell Netlify your web address

1. In Netlify, open your site, then go to **Domain management** (sometimes under
   **Site configuration → Domain management**).
2. Click **“Add a domain”** (or **“Add custom domain”**).
3. Type **`peaksystemstx.com`** and click **Verify / Add**.
4. If Netlify asks “Add `www.peaksystemstx.com` too?”, say **yes**.

Netlify now knows the address you want. Next we update the address book so it actually
points here.

### Step 2b — Let Netlify handle the address book (recommended, easiest)

Netlify will show you a few options. The simplest for a beginner is to let **Netlify manage
your DNS**. When you choose this, Netlify gives you a short list of **nameservers** — four
lines that look like this (yours will be different):

```
dns1.p01.nsone.net
dns2.p01.nsone.net
dns3.p01.nsone.net
dns4.p01.nsone.net
```

**Copy these down** (or leave the Netlify tab open). You’ll paste them into Squarespace next.

### Step 2c — Enter those nameservers at Squarespace

Your domain is currently managed by Squarespace, so that’s where you update the address book.

1. In a new tab, sign in to **Squarespace** and go to your **domain settings**. The path is
   usually: **Settings → Domains → `peaksystemstx.com`**.
2. Look for a section called **“Nameservers”** (it may be under **DNS settings** or an
   **Advanced** area).
3. Choose the option to **use custom / your own nameservers** (turn off “Squarespace
   nameservers” or “Use Squarespace defaults”).
4. **Delete** any nameservers listed there and **paste in the four from Netlify**, one per
   line.
5. **Save.**

> 🆘 **Can’t find the nameservers setting?** Don’t guess. Contact **Squarespace support**
> (they have 24/7 chat) and say exactly this: *“I want to point my domain
> peaksystemstx.com to another web host. Please help me set my nameservers to the ones my
> new host gave me.”* Give them the four lines. This is a common, routine request.

**Now you wait.** The internet’s address book takes time to update everywhere — usually
**under an hour**, occasionally up to **24 hours**. During this time your site may flip
between the old and new version. That’s normal. You don’t need to do anything.

**✅ Checkpoint:** After a while, go to **`https://peaksystemstx.com`** in a **private/incognito
window** (so your browser doesn’t show you a saved copy). When you see the **new** website
there, this stage is done.

### Step 2d — The padlock (secure “https”) turns on by itself

Once your address is pointing at Netlify, Netlify automatically sets up the little **padlock
🔒** that makes your address start with `https://` (this is what tells visitors the site is
safe). This can take up to a few hours after Stage 2 finishes. You don’t have to do anything.
If, after a day, you still see a “not secure” warning, open Netlify → **Domain management**
and click **“Verify DNS configuration,”** then **“Provision certificate.”**

---

## Stage 3 — Switch off the old Squarespace site (do this last)

Only do this **after** `peaksystemstx.com` is reliably showing the new website (Stage 2
checkpoint passed). Give it a full day to be safe.

> ⛔ **The one thing to be careful about:** *Keep your domain.* Your web address and your
> Squarespace **website subscription** are two separate things. You want to stop paying for
> the **website**, but **keep owning `peaksystemstx.com`**. If you cancel the wrong thing,
> you could lose your address.

**Do this:**

1. In Squarespace, go to **Settings → Billing** (or **Subscriptions**).
2. Find the **website / site plan** subscription and **cancel or downgrade** it.
3. When you reach your **domain** (`peaksystemstx.com`), **keep it** — do **not** cancel or
   let it expire. Make sure **auto‑renew stays ON** so you don’t lose it. (A domain costs
   only around $20 a year to keep.)

> 🆘 **Not sure which is which?** Ask Squarespace support: *“I’ve moved my website to a new
> host. I want to cancel my Squarespace website plan but keep my domain peaksystemstx.com
> and keep it renewing. Can you help me do that safely?”*

That’s it — you’re fully moved over. 🎉

---

## Making changes to the website later

Your website is just the files in the **`site`** folder, so updating it is simple:

- **To change words** (like the phone number or a description): open the matching `.html`
  file in the `site` folder with any text editor (even TextEdit or Notepad), change the
  words, and save.
- **To change a photo:** put your new photo in the `site/images` folder, giving it the
  **same name** as the one you’re replacing.

**To publish your changes**, go to Netlify → your site → the **“Deploys”** tab, and **drag
the `site` folder onto the page** again. Netlify replaces the old version in a few seconds.
Your address stays the same. That’s the whole update process.

---

## If something looks wrong

| What you see | What’s happening | What to do |
|--------------|------------------|------------|
| The `.netlify.app` link shows a blank page or “Page not found” | You may have dragged the *files* instead of the *folder* | Re-do Stage 1, step 5 — drag the **`site` folder** itself |
| Photos are missing | The `images` folder didn’t get uploaded | Make sure the `images` folder is **inside** the `site` folder before dragging, then re-drag |
| `peaksystemstx.com` still shows the old site after an hour | The address book is still updating, or nameservers weren’t saved | Wait a bit longer; double‑check the four nameservers were saved at Squarespace exactly |
| “Not secure” warning in the address bar | The padlock hasn’t finished setting up | Wait a few hours; if still stuck, use Netlify → Domain management → “Provision certificate” |
| You’re just stuck | It happens | Netlify has a free help center and community; Squarespace has 24/7 chat for the domain part |

---

## Where everything lives (quick reference)

```
peak/
├── README.md      ← this guide
├── site/          ← THE WEBSITE — this is the folder you drag to Netlify
│   ├── index.html     (Home)
│   ├── about.html     (About)
│   ├── services.html  (Services)
│   ├── work.html      (Our Work)
│   ├── contact.html   (Contact)
│   └── images/        (all photos and the logo)
└── Makefile       ← ignore this; it’s a tool for developers, not needed to publish
```

You only ever need the **`site`** folder to publish. Everything your visitors see is in there.

---

*Prefer a different free host? The `site` folder also works, unchanged, on
[Cloudflare Pages](https://pages.cloudflare.com/) or [GitHub Pages](https://pages.github.com/).
The steps above use Netlify because it’s the friendliest for a first‑time publisher, but you
are not locked in.*
