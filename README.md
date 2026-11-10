# Resume

Sam McKendrick's resume as a single web page, plus a script that prints it to PDF.

## Files

| File | Purpose |
| --- | --- |
| `index.html` | The resume. One self-contained page: content, styles and the timeline script. No build step. |
| `make-pdf.sh` | Prints `index.html` to a two-page A4 PDF using Chrome. |
| `Sam-McKendrick-Resume.pdf` | The built PDF. Ignored by git because it can contain a phone number (see below). |
| `.gitignore` | Keeps built PDFs out of the repo. |

## View it

Open `index.html` in a browser. The page adapts to phones and tablets and follows the reader's light or dark mode.

The bar under the name is a career timeline. Select a period to jump to that role.

## Edit it

Open `index.html` in any editor and change the text.

- Each job is an `<article class="role">` block inside the Experience section.
- Each timeline period is an `<a class="seg">` link near the top. Its `flex` value is the length of the role in months, and its `href` points at the matching role's `id`. Add `eu` to the class for a period based in Poland.
- Colours are variables at the top of the `<style>` block, with a second set for dark mode.

The only external request is to Google Fonts for Inter and Lora. The page falls back to system fonts if that request fails.

## Build the PDF

`make-pdf.sh` needs Chrome, Chromium, Edge or Brave, and nothing else.

```bash
RESUME_PHONE="+61 400 000 000" ./make-pdf.sh    # PDF with a phone number
./make-pdf.sh                                   # PDF without one
```

The script reports the page count and warns if an edit pushes the resume past two pages. The fix is to trim text, or to lower `html { font-size: ... }` in the `@media print` block of `index.html`.

Optional settings:

- `CHROME`: path to the browser, if the script cannot find one.
- `CHROME_FLAGS`: extra flags, for example `--no-sandbox` inside a container.

The "Save as PDF" button on the page gives the same layout without a phone number.

## Phone number

The web page has no phone number, so the number stays off the public internet. `make-pdf.sh` adds `RESUME_PHONE` to a temporary copy of the page, prints that copy, and deletes it.

A PDF built with a phone number should stay out of a public repo. The included `.gitignore` excludes `*.pdf` for that reason. Delete that line if you build a PDF without a number and want it in the repo.

## Publish with GitHub Pages

1. Push `index.html` to the repo's default branch.
2. In the repo on GitHub, open Settings, then Pages.
3. Under "Build and deployment", choose "Deploy from a branch", then pick the default branch and the `/ (root)` folder.

The page goes live at `https://<username>.github.io/<repo>/`.
