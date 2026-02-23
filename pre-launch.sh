#!/usr/bin/env bash
# BizBrain OS Pre-Launch Automation Script
# Run this to complete all automated setup tasks before launch week.
# Usage: bash pre-launch.sh

set -e
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; CYAN='\033[0;36m'; NC='\033[0m'

echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${CYAN}  BizBrain OS - Pre-Launch Setup${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

COMPLETED=0
FAILED=0
SKIPPED=0

check() { echo -e "${GREEN}  [DONE]${NC} $1"; ((COMPLETED++)); }
fail()  { echo -e "${RED}  [FAIL]${NC} $1"; ((FAILED++)); }
skip()  { echo -e "${YELLOW}  [SKIP]${NC} $1 -- $2"; ((SKIPPED++)); }
step()  { echo -e "\n${CYAN}Step $1:${NC} $2"; }

# ─── Step 1: Verify repos exist ───
step 1 "Verify GitHub repositories"

for REPO in bizbrain-os create-bizbrain bizbrain-os-site; do
  if curl -sf "https://api.github.com/repos/TechIntegrationLabs/$REPO" > /dev/null 2>&1; then
    check "github.com/TechIntegrationLabs/$REPO exists"
  else
    fail "github.com/TechIntegrationLabs/$REPO NOT FOUND"
  fi
done

# ─── Step 2: Publish to npm ───
step 2 "Publish create-bizbrain to npm"

if npm view create-bizbrain version 2>/dev/null; then
  check "create-bizbrain already published on npm"
else
  echo -e "  ${YELLOW}npm package not yet published.${NC}"
  if npm whoami 2>/dev/null; then
    echo -e "  Publishing now..."
    cd ~/Repos/create-bizbrain
    npm publish 2>&1 && check "Published create-bizbrain to npm" || fail "npm publish failed"
    cd -
  else
    skip "npm publish" "Run 'npm adduser' first, then re-run this script"
  fi
fi

# ─── Step 3: Deploy website to Vercel ───
step 3 "Deploy website to Vercel"

if command -v vercel &> /dev/null; then
  echo -e "  ${YELLOW}Vercel CLI found. Deploying...${NC}"
  cd ~/Repos/bizbrain-os-site
  vercel --prod 2>&1 | tail -5 && check "Website deployed to Vercel" || skip "Vercel deploy" "Run manually: cd ~/Repos/bizbrain-os-site && vercel --prod"
  cd -
else
  skip "Vercel deploy" "Install Vercel CLI: npm i -g vercel"
fi

# ─── Step 4: Verify AGPL license ───
step 4 "Verify AGPL v3 license"

if grep -q "GNU AFFERO GENERAL PUBLIC LICENSE" ~/Repos/bizbrain-os/LICENSE 2>/dev/null; then
  check "AGPL v3 license in place"
else
  fail "License file doesn't contain AGPL v3 -- check ~/Repos/bizbrain-os/LICENSE"
fi

# ─── Step 5: Verify CLA ───
step 5 "Verify CLA configuration"

if [ -f ~/Repos/bizbrain-os/.github/CLA.md ]; then
  check "CLA.md exists"
else
  fail "CLA.md missing from .github/"
fi

# ─── Step 6: Check GitHub Discussions ───
step 6 "Verify GitHub Discussions enabled"

if curl -sf "https://api.github.com/repos/TechIntegrationLabs/bizbrain-os" | grep -q '"has_discussions":true'; then
  check "GitHub Discussions enabled"
else
  skip "GitHub Discussions" "Enable manually at github.com/TechIntegrationLabs/bizbrain-os/settings"
fi

# ─── Step 7: Check domain ───
step 7 "Check domain status"

if curl -sf "https://bizbrain-os.com" > /dev/null 2>&1; then
  check "bizbrain-os.com is live"
else
  skip "bizbrain-os.com" "Domain not yet configured -- connect to Vercel deployment"
fi

# ─── Step 8: Verify launch content ───
step 8 "Verify launch content exists"

if [ -f ~/BB1-Conversations/bizbrain-launch-content.md ]; then
  check "Launch content drafts ready"
else
  fail "Launch content not found at ~/BB1-Conversations/bizbrain-launch-content.md"
fi

# ─── Summary ───
echo ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "  ${GREEN}Completed: $COMPLETED${NC}  ${RED}Failed: $FAILED${NC}  ${YELLOW}Skipped: $SKIPPED${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

if [ $FAILED -gt 0 ] || [ $SKIPPED -gt 0 ]; then
  echo ""
  echo -e "${YELLOW}Manual steps remaining:${NC}"
  [ $FAILED -gt 0 ] && echo -e "  - Fix any ${RED}[FAIL]${NC} items above"
  echo -e "  - Run 'npm adduser' then re-run this script (if npm not published)"
  echo -e "  - Deploy website: cd ~/Repos/bizbrain-os-site && vercel --prod"
  echo -e "  - Connect bizbrain-os.com domain in Vercel dashboard"
  echo -e "  - Register bizbrain-os.com domain (if not owned yet)"
  echo -e "  - File trademark application for 'BizBrain OS' at uspto.gov"
  echo ""
fi
