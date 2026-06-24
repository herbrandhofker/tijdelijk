<script>
  import Overview from './lib/Overview.svelte'
  import PageBrowser from './lib/PageBrowser.svelte'
  import SectionFlow from './lib/SectionFlow.svelte'
  import Verification from './lib/Verification.svelte'
  import { project, days, pageDetails } from './data.js'

  let tab = 'overview'
  const tabs = [
    { id: 'overview', label: 'Overzicht' },
    { id: 'pages', label: 'Meetstaten' },
    { id: 'sections', label: 'Secties' },
    { id: 'verification', label: 'Verificatie' },
  ]
</script>

<div class="app">
  <header>
    <div class="header-content">
      <div class="brand">
        <span class="brand-icon">〈〉</span>
        <div>
          <h1>{project.title}</h1>
          <p class="subtitle">Productie-dashboard — {project.contractor} / {project.client}</p>
        </div>
      </div>
      <div class="header-stats">
        <div class="stat"><span class="stat-val">{project.totalItems}</span> totaal</div>
        <div class="stat"><span class="stat-val">{project.totalMattresses}</span> matrassen</div>
        <div class="stat"><span class="stat-val">{project.totalPetten}</span> petten</div>
      </div>
    </div>
    <nav>
      {#each tabs as t}
        <button class="tab" class:active={tab === t.id} on:click={() => tab = t.id}>
          {t.label}
        </button>
      {/each}
    </nav>
  </header>

  <main>
    {#if tab === 'overview'}
      <Overview />
    {:else if tab === 'pages'}
      <PageBrowser />
    {:else if tab === 'sections'}
      <SectionFlow />
    {:else if tab === 'verification'}
      <Verification />
    {/if}
  </main>
</div>

<style>
  .app {
    min-height: 100vh;
    background: #f5f7fa;
  }
  header {
    background: #1a2744;
    color: #fff;
    position: sticky;
    top: 0;
    z-index: 10;
  }
  .header-content {
    max-width: 1400px;
    margin: 0 auto;
    padding: 12px 24px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 8px;
  }
  .brand {
    display: flex;
    align-items: center;
    gap: 10px;
  }
  .brand-icon {
    font-size: 20px;
    opacity: 0.7;
    font-weight: bold;
  }
  h1 {
    font-size: 18px;
    font-weight: 600;
    margin: 0;
    color: #fff;
    letter-spacing: 0;
  }
  .subtitle {
    font-size: 11px;
    opacity: 0.7;
    margin: 0;
  }
  .header-stats {
    display: flex;
    gap: 20px;
  }
  .stat {
    font-size: 11px;
    opacity: 0.8;
    text-align: center;
  }
  .stat-val {
    display: block;
    font-size: 16px;
    font-weight: 700;
    opacity: 1;
    color: #a8c8f0;
  }
  nav {
    display: flex;
    gap: 0;
    background: #0f1a2e;
    padding: 0 24px;
    max-width: 1400px;
    margin: 0 auto;
  }
  .tab {
    padding: 10px 20px;
    font-size: 13px;
    border: none;
    background: none;
    color: #8899b0;
    cursor: pointer;
    border-bottom: 2px solid transparent;
    transition: all 0.15s;
    font-family: inherit;
  }
  .tab:hover { color: #c0d0e8; }
  .tab.active {
    color: #fff;
    border-bottom-color: #6a9fd8;
    background: rgba(255,255,255,0.05);
  }
  main {
    max-width: 1400px;
    margin: 0 auto;
    padding: 20px 24px;
  }
</style>
