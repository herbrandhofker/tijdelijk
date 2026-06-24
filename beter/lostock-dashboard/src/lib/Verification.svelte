<script>
  import { days, pageDetails, extras } from '../data.js'

  function daySummary(dayNum) {
    const details = pageDetails.filter(p => p.day === dayNum)
    const extra = extras.filter(e => e.day === dayNum)
    const drawnMat = details.reduce((s, p) => s + p.mattresses, 0)
    const drawnPet = details.reduce((s, p) => s + p.petten, 0)
    const extraMat = extra.reduce((s, e) => s + e.mattresses, 0)
    const extraPet = extra.reduce((s, e) => s + e.petten, 0)
    return {
      pages: details,
      drawnMat, drawnPet,
      extraMat, extraPet,
      totalMat: drawnMat + extraMat,
      totalPet: drawnPet + extraPet,
      total: drawnMat + drawnPet + extraMat + extraPet,
    }
  }

  const daySummaries = [1, 2, 3, 4].map(daySummary)

  $: grandTotalMat = daySummaries.reduce((s, d) => s + d.totalMat, 0)
  $: grandTotalPet = daySummaries.reduce((s, d) => s + d.totalPet, 0)
  $: grandTotal = grandTotalMat + grandTotalPet

  const declaredTotals = [519, 339, 520, 185]
</script>

<div class="verification">
  <div class="card">
    <h2>Productieverificatie</h2>
    <p class="desc">Controle of de paginatotalen exact overeenkomen met de handgeschreven dagsommen op het voorblad.</p>

    <div class="grand-total">
      <div class="gt-item verified">
        <span class="gt-label">Geverifieerd Totaal</span>
        <span class="gt-value">{grandTotal}</span>
        <span class="gt-sub">stuks (matrassen + petten)</span>
      </div>
      <div class="gt-item">
        <span class="gt-label">Waarvan Matrassen</span>
        <span class="gt-value">{grandTotalMat}</span>
        <span class="gt-sub">stuks</span>
      </div>
      <div class="gt-item">
        <span class="gt-label">Waarvan Petten</span>
        <span class="gt-value">{grandTotalPet}</span>
        <span class="gt-sub">stuks</span>
      </div>
      <div class="gt-item">
        <span class="gt-label">Verhouding</span>
        <span class="gt-value">{(grandTotalPet / grandTotalMat * 100).toFixed(1)}%</span>
        <span class="gt-sub">pijpdoorvoer</span>
      </div>
    </div>

    {#each [1, 2, 3, 4] as dayNum}
      {@const d = daySummaries[dayNum - 1]}
      {@const declared = declaredTotals[dayNum - 1]}
      {@const match = d.total === declared}
      <div class="day-block" class:verified={match} class:mismatch={!match}>
        <div class="db-header">
          <div class="db-title">
            <span class="db-day">{days[dayNum - 1].label}</span>
            <span class="db-date">{days[dayNum - 1].date}</span>
          </div>
          <div class="db-check">
            {#if match}
              <span class="badge ok">✓ Geverifieerd</span>
            {:else}
              <span class="badge err">✗ MISMATCH</span>
            {/if}
            <span class="db-declared">Op voorblad: {declared} st.</span>
            <span class="db-calc">Berekend: {d.total} st.</span>
          </div>
        </div>

        <table class="page-table">
          <thead>
            <tr>
              <th>Pagina</th>
              <th>Sectie</th>
              <th>Matrassen</th>
              <th>Petten</th>
              <th>Totaal</th>
              <th>Notities</th>
            </tr>
          </thead>
          <tbody>
            {#each d.pages as p}
              <tr>
                <td class="pnum">{p.page}</td>
                <td>{p.section}</td>
                <td class="num">{p.mattresses}</td>
                <td class="num">{p.petten}</td>
                <td class="num bold">{p.total}</td>
                <td class="notes">{p.notes}</td>
              </tr>
            {/each}
            {#if d.extraMat > 0 || d.extraPet > 0}
              <tr class="extra-row">
                <td colspan="2">Lijstbestellingen</td>
                <td class="num">{d.extraMat}</td>
                <td class="num">{d.extraPet}</td>
                <td class="num bold">{d.extraMat + d.extraPet}</td>
                <td class="notes">Repetities zonder aparte tekening</td>
              </tr>
            {/if}
          </tbody>
          <tfoot>
            <tr>
              <td colspan="2"><strong>Sectietotaal</strong></td>
              <td class="num"><strong>{d.drawnMat + d.extraMat}</strong></td>
              <td class="num"><strong>{d.drawnPet + d.extraPet}</strong></td>
              <td class="num bold"><strong>{d.total}</strong></td>
              <td></td>
            </tr>
          </tfoot>
        </table>
      </div>
    {/each}
  </div>
</div>

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

  .grand-total {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 12px;
    margin-bottom: 24px;
  }
  .gt-item {
    background: #f9fafb;
    border: 1px solid #eaecf0;
    border-radius: 8px;
    padding: 12px;
    text-align: center;
  }
  .gt-item.verified { background: #ecfdf5; border-color: #a7f3d0; }
  .gt-label { font-size: 10px; text-transform: uppercase; letter-spacing: 0.5px; color: #667085; display: block; }
  .gt-value { font-size: 24px; font-weight: 700; color: #1d2939; display: block; margin: 2px 0; }
  .gt-item.verified .gt-value { color: #065f46; }
  .gt-sub { font-size: 11px; color: #98a2b3; }

  .day-block { margin-bottom: 20px; border: 1px solid #eaecf0; border-radius: 8px; overflow: hidden; }
  .day-block.verified { border-color: #d1fae5; }
  .day-block.mismatch { border-color: #fecaca; }
  .db-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 14px;
    background: #f9fafb;
    border-bottom: 1px solid #eaecf0;
    flex-wrap: wrap;
    gap: 8px;
  }
  .day-block.verified .db-header { background: #ecfdf5; }
  .day-block.mismatch .db-header { background: #fef2f2; }
  .db-title { display: flex; align-items: center; gap: 8px; }
  .db-day { font-weight: 600; font-size: 14px; color: #1d2939; }
  .db-date { font-size: 12px; color: #667085; }
  .db-check { display: flex; align-items: center; gap: 12px; flex-wrap: wrap; }
  .badge {
    font-size: 11px;
    font-weight: 600;
    padding: 3px 8px;
    border-radius: 4px;
  }
  .badge.ok { background: #d1fae5; color: #065f46; }
  .badge.err { background: #fecaca; color: #991b1b; }
  .db-declared, .db-calc { font-size: 12px; color: #475467; }

  .page-table { width: 100%; border-collapse: collapse; font-size: 12px; }
  .page-table th {
    background: #f0f2f5;
    padding: 6px 10px;
    text-align: left;
    font-weight: 600;
    color: #475467;
    font-size: 11px;
    border-bottom: 1px solid #eaecf0;
  }
  .page-table td { padding: 5px 10px; border-bottom: 1px solid #f0f1f3; color: #344054; }
  .page-table tbody tr:hover { background: #f9fafb; }
  .pnum { font-weight: 600; }
  .num { text-align: right; font-variant-numeric: tabular-nums; }
  .bold { font-weight: 600; }
  .extra-row { background: #fffaeb; }
  .extra-row td { color: #92400e; }
  .page-table tfoot td { background: #f0f2f5; border-top: 2px solid #d0d5dd; padding: 6px 10px; }
  .notes { font-size: 11px; color: #667085; max-width: 200px; }
</style>
