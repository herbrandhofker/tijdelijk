<script>
  import { pageDetails } from '../data.js'

  let selected = pageDetails[0]
  let imgError = false
  let search = ''
  $: imgSrc = selected ? `/pdf_data/pages/page-${String(selected.page).padStart(3, '0')}.png` : ''
  $: cropSrc = selected ? `/pdf_data/crops/crop_page_${String(selected.page).padStart(3, '0')}.png` : ''

  function selectPage(p) {
    selected = p
    imgError = false
  }

  function dayPages(dayNum) {
    return pageDetails.filter(p => p.day === dayNum)
  }

  $: filtered = pageDetails.filter(p => !search || String(p.page).includes(search))

  function dayPagesFiltered(dayNum) {
    return filtered.filter(p => p.day === dayNum)
  }

  const dayLabels = ['1e dag (9 juni)', '2e dag (10 juni)', '3e dag (11 juni)', '4e dag (12 juni)']
</script>

<div class="browser">
  <div class="sidebar">
    <input type="text" class="search" placeholder="Zoek paginanummer..." bind:value={search} />
    {#each [1, 2, 3, 4] as dayNum}
      <div class="day-group">
        <div class="day-header">{dayLabels[dayNum - 1]}</div>
        {#each dayPagesFiltered(dayNum) as p}
          <button
            class="page-btn"
            class:active={selected?.page === p.page}
            on:click={() => selectPage(p)}
          >
            <span class="pnum">p.{p.page}</span>
            <span class="ptot">{p.total} st.</span>
          </button>
        {/each}
      </div>
    {/each}
  </div>

  {#if selected}
    <div class="viewer">
      <div class="viewer-header">
        <h2>Pagina {selected.page}</h2>
        <div class="page-meta">
          <span class="tag">{selected.section}</span>
          <span class="tag date">{selected.date}</span>
          <span class="tag">{selected.day}</span>
        </div>
      </div>

      <div class="page-stats">
        <div class="pstat"><span class="pstat-val">{selected.mattresses}</span> matrassen</div>
        <div class="pstat"><span class="pstat-val">{selected.petten}</span> petten</div>
        <div class="pstat primary"><span class="pstat-val">{selected.total}</span> totaal</div>
        <div class="pstat"><span class="pstat-val">{selected.photos}</span> foto's</div>
      </div>

      <div class="image-area">
        {#if !imgError}
          <div class="img-col">
            <img src={imgSrc} alt="Pagina {selected.page}" on:error={() => imgError = true} />
          </div>
        {:else}
          <div class="img-col error-col">
            <p>Afbeelding niet beschikbaar</p>
          </div>
        {/if}
        <div class="crop-col">
          <h3>Paginatotaal (rechtsonder)</h3>
          <img src={cropSrc} alt="Crop pagina {selected.page}" />
          {#if selected.notes}
            <div class="note">{selected.notes}</div>
          {/if}
        </div>
      </div>
    </div>
  {:else}
    <div class="empty">Selecteer een meetstaat om te bekijken</div>
  {/if}
</div>

<style>
  .browser { display: flex; gap: 20px; min-height: 70vh; }
  .sidebar {
    width: 200px;
    flex-shrink: 0;
    background: #fff;
    border-radius: 10px;
    border: 1px solid #eaecf0;
    padding: 12px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.04);
    overflow-y: auto;
    max-height: calc(100vh - 150px);
  }
  .search {
    width: 100%;
    padding: 6px 10px;
    border: 1px solid #d0d5dd;
    border-radius: 6px;
    font-size: 12px;
    margin-bottom: 12px;
    box-sizing: border-box;
    font-family: inherit;
  }
  .day-group { margin-bottom: 8px; }
  .day-header {
    font-size: 10px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    color: #667085;
    font-weight: 600;
    padding: 4px 6px;
    margin-bottom: 2px;
  }
  .page-btn {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
    padding: 5px 8px;
    border: none;
    background: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 12px;
    color: #344054;
    font-family: inherit;
    transition: background 0.1s;
  }
  .page-btn:hover { background: #f0f2f5; }
  .page-btn.active { background: #e8f0fe; color: #1a56db; font-weight: 600; }
  .pnum { font-weight: 500; }
  .ptot { font-size: 11px; color: #667085; }
  .page-btn.active .ptot { color: #1a56db; }

  .viewer { flex: 1; min-width: 0; }
  .viewer-header { display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 8px; margin-bottom: 12px; }
  .viewer-header h2 { font-size: 18px; font-weight: 600; margin: 0; color: #1d2939; }
  .page-meta { display: flex; gap: 6px; }
  .tag {
    font-size: 11px;
    padding: 3px 8px;
    border-radius: 4px;
    background: #f0f2f5;
    color: #475467;
  }
  .tag.date { background: #e8f0fe; color: #1a56db; }

  .page-stats {
    display: flex;
    gap: 8px;
    margin-bottom: 16px;
  }
  .pstat {
    flex: 1;
    background: #fff;
    border: 1px solid #eaecf0;
    border-radius: 8px;
    padding: 10px;
    text-align: center;
    font-size: 11px;
    color: #667085;
  }
  .pstat.primary { background: #1a2744; color: #fff; border-color: #1a2744; }
  .pstat.primary .pstat-val { color: #a8c8f0; }
  .pstat-val { display: block; font-size: 22px; font-weight: 700; color: #1d2939; margin-bottom: 2px; }

  .image-area {
    display: flex;
    gap: 16px;
    align-items: flex-start;
  }
  .img-col {
    flex: 1;
    background: #fff;
    border: 1px solid #eaecf0;
    border-radius: 8px;
    overflow: hidden;
  }
  .img-col img { width: 100%; display: block; }
  .error-col { padding: 40px; text-align: center; color: #667085; }
  .crop-col {
    width: 280px;
    flex-shrink: 0;
    background: #fff;
    border: 1px solid #eaecf0;
    border-radius: 8px;
    padding: 12px;
  }
  .crop-col h3 { font-size: 12px; font-weight: 600; margin: 0 0 8px; color: #475467; }
  .crop-col img { width: 100%; display: block; border-radius: 4px; }
  .note {
    margin-top: 8px;
    padding: 6px 10px;
    background: #fffaeb;
    border: 1px solid #fde68a;
    border-radius: 5px;
    font-size: 11px;
    color: #92400e;
  }
  .empty {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #98a2b3;
    font-size: 14px;
  }
</style>
