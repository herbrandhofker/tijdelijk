<script>
  import { sections, pageDetails, days } from '../data.js'

  let expanded = sections[0]
  let zoomed = null

  function toggleSection(s) {
    expanded = expanded === s ? null : s
  }

  function toggleZoom(p) {
    zoomed = zoomed === p ? null : p
  }

  function keyHandler(fn) {
    return (e) => { if (e.key === 'Enter' || e.key === ' ') fn() }
  }

  $: dayColor = (d) => ['#3b82f6', '#10b981', '#f59e0b', '#ef4444'][d - 1]
</script>

<div class="flow">
  <div class="card">
    <h2>Sectie-overzicht</h2>
    <p class="desc">15 werkgebieden verdeeld over 4 inmeetdagen. Klik op een sectie om de details te zien.</p>
    <div class="sections">
      {#each [1, 2, 3, 4] as dayNum}
        <div class="day-col">
          <div class="day-label" style="color: {dayColor(dayNum)}">
            {days[dayNum - 1].label}
            <span class="day-total">{days[dayNum - 1].total} st.</span>
          </div>
          {#each sections.filter(s => s.day === dayNum) as sec}
            <button
              class="sec-card"
              style="border-left-color: {dayColor(dayNum)}"
              class:expanded={expanded === sec}
              on:click={() => toggleSection(sec)}
            >
              <div class="sec-header">
                <span class="sec-name">{sec.name}</span>
                <span class="sec-pages">{sec.pages.length} pag.</span>
              </div>
              {#if expanded === sec}
                <div class="sec-detail">
                  <div class="pages-row">
                    {#each sec.pages as p}
                      <div class="page-thumb" role="button" tabindex="0" on:click|stopPropagation={() => toggleZoom(p)} on:keydown={keyHandler(() => toggleZoom(p))}>
                        <img src="/pdf_data/pages/page-{String(p).padStart(3, '0')}.png" alt="Pagina {p}" />
                        <span>p.{p}</span>
                      </div>
                    {/each}
                  </div>
                  <div class="sec-meta">
                    <span>Foto's: pag. {sec.photos}</span>
                    {#each sec.pages as p}
                      {@const detail = pageDetails.find(d => d.page === p)}
                      {#if detail}
                        <span class="page-summary">
                          p.{detail.page}: {detail.mattresses}m + {detail.petten}p = {detail.total}
                        </span>
                      {/if}
                    {/each}
                  </div>
                </div>
              {/if}
            </button>
          {/each}
        </div>
      {/each}
    </div>
  </div>
</div>

{#if zoomed}
  <div class="overlay" role="dialog" aria-modal="true" tabindex="0" on:click={() => zoomed = null} on:keydown={keyHandler(() => zoomed = null)}>
    <!-- svelte-ignore a11y_click_events_have_key_events a11y_no_static_element_interactions -->
    <div class="overlay-img" on:click|stopPropagation>
      <button class="close-btn" on:click={() => zoomed = null}>✕</button>
      <img src="/pdf_data/pages/page-{String(zoomed).padStart(3, '0')}.png" alt="Pagina {zoomed}" />
      <p class="overlay-label">Pagina {zoomed}</p>
    </div>
  </div>
{/if}

<style>
  .card {
    background: #fff;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.06);
    border: 1px solid #eaecf0;
  }
  h2 { font-size: 15px; font-weight: 600; margin: 0 0 4px; color: #1d2939; }
  .desc { font-size: 12px; color: #667085; margin: 0 0 20px; }
  .sections { display: grid; grid-template-columns: repeat(4, 1fr); gap: 16px; }
  .day-col { display: flex; flex-direction: column; gap: 8px; }
  .day-label {
    font-size: 13px;
    font-weight: 600;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 6px 0;
    border-bottom: 1px solid #eaecf0;
  }
  .day-total { font-size: 12px; font-weight: 400; opacity: 0.7; }
  .sec-card {
    background: #f9fafb;
    border: 1px solid #eaecf0;
    border-left: 3px solid;
    border-radius: 6px;
    padding: 8px 10px;
    cursor: pointer;
    text-align: left;
    font-family: inherit;
    width: 100%;
    transition: background 0.1s;
  }
  .sec-card:hover { background: #f0f2f5; }
  .sec-card.expanded { background: #f0f4fe; }
  .sec-header { display: flex; justify-content: space-between; align-items: center; }
  .sec-name { font-size: 12px; font-weight: 600; color: #344054; }
  .sec-pages { font-size: 11px; color: #667085; }
  .sec-detail { margin-top: 8px; }
  .pages-row { display: flex; flex-wrap: wrap; gap: 6px; margin-bottom: 6px; }
  .page-thumb {
    width: 70px;
    border: 1px solid #d0d5dd;
    border-radius: 4px;
    overflow: hidden;
    cursor: pointer;
    background: none;
    padding: 0;
    font-family: inherit;
  }
  .page-thumb img { width: 100%; height: 50px; object-fit: cover; display: block; }
  .page-thumb span { display: block; font-size: 10px; text-align: center; color: #475467; padding: 2px; }
  .sec-meta { display: flex; flex-wrap: wrap; gap: 4px; font-size: 10px; color: #667085; }
  .page-summary { background: #eef2f6; padding: 1px 5px; border-radius: 3px; }

  .overlay {
    position: fixed;
    inset: 0;
    background: rgba(0,0,0,0.7);
    z-index: 100;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  .overlay-img {
    position: relative;
    max-width: 90vw;
    max-height: 90vh;
    background: #fff;
    border-radius: 8px;
    padding: 12px;
  }
  .overlay-img img { max-width: 100%; max-height: 80vh; display: block; }
  .overlay-label { text-align: center; font-size: 13px; color: #475467; margin: 8px 0 0; }
  .close-btn {
    position: absolute;
    top: -12px;
    right: -12px;
    width: 28px;
    height: 28px;
    border-radius: 50%;
    border: none;
    background: #1a2744;
    color: #fff;
    font-size: 14px;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
  }
</style>
