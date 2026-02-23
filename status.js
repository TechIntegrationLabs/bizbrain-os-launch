#!/usr/bin/env node
// BizBrain OS Launch Status Checker
// Usage: node status.js

const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');
const os = require('os');

const GREEN = '\x1b[32m';
const RED = '\x1b[31m';
const YELLOW = '\x1b[33m';
const CYAN = '\x1b[36m';
const DIM = '\x1b[2m';
const NC = '\x1b[0m';

const home = os.homedir();
const results = { done: 0, pending: 0, blocked: 0 };

function check(label, condition) {
  if (condition) {
    console.log(`  ${GREEN}[DONE]${NC} ${label}`);
    results.done++;
  } else {
    console.log(`  ${RED}[TODO]${NC} ${label}`);
    results.pending++;
  }
}

function blocked(label, reason) {
  console.log(`  ${YELLOW}[WAIT]${NC} ${label} ${DIM}-- ${reason}${NC}`);
  results.blocked++;
}

function section(title) {
  console.log(`\n${CYAN}${title}${NC}`);
}

function fileExists(p) {
  try { return fs.existsSync(p.replace('~', home)); } catch { return false; }
}

function cmdWorks(cmd) {
  try { execSync(cmd, { stdio: 'pipe', timeout: 10000 }); return true; } catch { return false; }
}

console.log(`\n${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}`);
console.log(`${CYAN}  BizBrain OS Launch Status${NC}`);
console.log(`${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}`);

// ─── Repos ───
section('GitHub Repositories');
check('bizbrain-os repo', cmdWorks('curl -sf https://api.github.com/repos/TechIntegrationLabs/bizbrain-os'));
check('create-bizbrain repo', cmdWorks('curl -sf https://api.github.com/repos/TechIntegrationLabs/create-bizbrain'));
check('bizbrain-os-site repo', cmdWorks('curl -sf https://api.github.com/repos/TechIntegrationLabs/bizbrain-os-site'));

// ─── Files ───
section('Local Files');
check('bizbrain-os source', fileExists(path.join(home, 'Repos/bizbrain-os/.bizbrain')));
check('create-bizbrain package', fileExists(path.join(home, 'Repos/create-bizbrain/bin/index.js')));
check('Website source', fileExists(path.join(home, 'Repos/bizbrain-os-site/index.html')));
check('AGPL v3 license', (() => {
  try { return fs.readFileSync(path.join(home, 'Repos/bizbrain-os/LICENSE'), 'utf8').includes('AFFERO'); } catch { return false; }
})());
check('CLA config', fileExists(path.join(home, 'Repos/bizbrain-os/.github/CLA.md')));
check('Launch content drafts', fileExists(path.join(home, 'BB1-Conversations/bizbrain-launch-content.md')));

// ─── Distribution ───
section('Distribution');
const npmPublished = cmdWorks('npm view create-bizbrain version');
check('npm package published', npmPublished);
if (!npmPublished) {
  console.log(`    ${DIM}Fix: cd ~/Repos/create-bizbrain && npm adduser && npm publish${NC}`);
}

const websiteLive = cmdWorks('curl -sf https://bizbrain-os.com');
check('Website live (bizbrain-os.com)', websiteLive);
if (!websiteLive) {
  console.log(`    ${DIM}Fix: cd ~/Repos/bizbrain-os-site && vercel --prod (then connect domain)${NC}`);
}

// ─── Platform Accounts ───
section('Platform Accounts');
blocked('X/Twitter @BizBrainOS handle', 'Check manually at x.com');
blocked('Discord server configured', 'Set up channels and welcome message');
blocked('Product Hunt upcoming page', 'Create at producthunt.com/posts/new');
blocked('Trademark filed', 'File at uspto.gov ($850-$2,500)');
blocked('Domain registered', 'Register bizbrain-os.com');

// ─── Content Assets ───
section('Content Assets');
check('Launch posts drafted', fileExists(path.join(home, 'BB1-Conversations/bizbrain-launch-content.md')));
blocked('Demo video recorded', 'Record 60-sec screencast with OBS/Loom');
blocked('Screenshots for README', 'Screenshot dashboard setup + operational modes');
blocked('Social banner (1200x630)', 'Create OG image for X/Twitter sharing');

// ─── Summary ───
const total = results.done + results.pending + results.blocked;
console.log(`\n${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}`);
console.log(`  ${GREEN}Done: ${results.done}${NC}  ${RED}Todo: ${results.pending}${NC}  ${YELLOW}Manual: ${results.blocked}${NC}  Total: ${total}`);
console.log(`  Progress: ${Math.round(results.done / total * 100)}%`);
console.log(`${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n`);

if (results.pending > 0) {
  console.log(`${YELLOW}Next step:${NC} Run 'bash ~/Repos/bizbrain-os-launch/pre-launch.sh' to fix automated items.\n`);
}
