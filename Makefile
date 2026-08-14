# Peak Systems — local development & QA
# ---------------------------------------------------------------------------
# This Makefile is a convenience for developers doing local testing and QA.
# It is NOT needed to deploy the website — see README.md for deployment.
#
# The website is plain static files in ./site with no build step, so "serve"
# is really all you need. The other targets are optional quality checks that
# use `npx` (bundled with Node.js) and download tools on first run.
#
# Usage: run `make` (or `make help`) to list targets.
# ---------------------------------------------------------------------------

SITE_DIR := site
PORT     := 8000
URL      := http://localhost:$(PORT)

.DEFAULT_GOAL := help

.PHONY: help
help: ## Show this help
	@echo "Peak Systems — make targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN{FS=":.*?## "}{printf "  \033[1m%-12s\033[0m %s\n", $$1, $$2}'
	@echo ""
	@echo "Most common: 'make serve' then open $(URL)"

.PHONY: serve
serve: ## Preview the site locally at http://localhost:8000 (Ctrl+C to stop)
	@echo "Serving $(SITE_DIR) at $(URL)  —  press Ctrl+C to stop"
	@cd $(SITE_DIR) && python3 -m http.server $(PORT)

.PHONY: dev
dev: serve ## Alias for 'serve'

.PHONY: open
open: ## Open the local preview in your default browser (run 'make serve' first)
	@open $(URL) 2>/dev/null || xdg-open $(URL) 2>/dev/null || echo "Open $(URL) in your browser"

.PHONY: validate
validate: ## Check every HTML page for markup errors (needs Node.js + Java)
	@echo "Validating HTML in $(SITE_DIR) ..."
	@npx --yes html-validate "$(SITE_DIR)/**/*.html"

.PHONY: links
links: ## Check for broken internal links (needs Node.js)
	@echo "Checking links in $(SITE_DIR) ..."
	@npx --yes linkinator $(SITE_DIR) --recurse --silent --skip "^(mailto|sms|tel):"

.PHONY: a11y
a11y: ## Accessibility audit of every page (needs Node.js; run 'make serve' in another terminal first)
	@echo "Auditing pages at $(URL) for WCAG 2 AA ..."
	@for page in / /about.html /services.html /work.html /contact.html; do \
		echo "--- $$page ---"; \
		npx --yes pa11y --standard WCAG2AA "$(URL)$$page" || exit 1; \
	done
	@echo "Accessibility audit passed."

.PHONY: check
check: validate links ## Run HTML validation and link checking together

.PHONY: size
size: ## Show the total size and largest files in the site
	@echo "Total site size:"; du -sh $(SITE_DIR)
	@echo "Largest files:"; find $(SITE_DIR) -type f -exec du -h {} + | sort -rh | head -10

.PHONY: clean
clean: ## Remove local scratch files (none are tracked; safe to run)
	@find . -name '.DS_Store' -delete 2>/dev/null || true
	@echo "Cleaned."
