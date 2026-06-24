<script>
  import { project, days, pageDetails, extras } from '../data.js'

  const dayData = days.map(d => {
    const details = pageDetails.filter(p => p.day === d.dayNum)
    const extra = extras.filter(e => e.day === d.dayNum)
    const matr = details.reduce((s, p) => s + p.mattresses, 0) + extra.reduce((s, e) => s + e.mattresses, 0)
    const pet = details.reduce((s, p) => s + p.petten, 0) + extra.reduce((s, e) => s + e.petten, 0)
    return { ...d, matr, pet }
  })

  const maxVal = Math.max(...dayData.map(d => d.total))
  const barH = 220
  const barW = 70
  const gap = 30

  function barHeight(v) { return (v / maxVal) * barH }
</script>

<div class="overview">
  <div class="kpi-row">
    <div class="kpi-card primary">
      <span class="kpi-label">Totaal Productie</span>
      <span class="kpi-value">{project.totalItems}</span>
      <span class="kpi-sub">stuks</span>
    </div>
    <div class="kpi-card">
      <span class="kpi-label">Matrassen</span>
      <span class="kpi-value">{project.totalMattresses}</span>
      <span class="kpi-sub">stuks</span>
    </div>
    <div class="kpi-card">
      <span class="kpi-label">Petten</span>
      <span class="kpi-value">{project.totalPetten}</span>
      <span class="kpi-sub">stuks</span>
    </div>
    <div class="kpi-card">
      <span class="kpi-label">Meetstaten</span>
      <span class="kpi-value">{pageDetails.length}</span>
      <span class="kpi-sub">pagina's</span>
    </div>
    <div class="kpi-card">
      <span class="kpi-label">Secties</span>
      <span class="kpi-value">15</span>
      <span class="kpi-sub">werkgebieden</span>
    </div>
  </div>

  <div class="card">
    <h2>Productie per dag</h2>
    <div class="chart-wrap">
      <svg width={dayData.length * (barW + gap) + gap} height={barH + 50}>
        <line x1="10" y1={barH} x2={dayData.length * (barW + gap) + gap} y2={barH} stroke="#d0d5dd" stroke-width="1" />
        {#each dayData as d, i}
          {@const x = gap + i * (barW + gap)}
          {@const bh = barHeight(d.total)}
          {@const y = barH - bh}
          <rect x={x} y={y} width={barW} height={bh} rx="4" fill="#3b82f6" opacity="0.85" />
          <rect x={x} y={y} width={barW} height={barHeight(d.matr)} rx="4" fill="#2563eb" opacity="0.6" />
          <rect x={x} y={barH - barHeight(d.pet)} width={barW} height={barHeight(d.pet)} rx="2" fill="#f59e0b" opacity="0.8" />
          <text x={x + barW / 2} y={barH + 16} text-anchor="middle" font-size="11" fill="#475467">{d.label}</text>
          <text x={x + barW / 2} y={y - 6} text-anchor="middle" font-size="13" font-weight="600" fill="#1d2939">{d.total}</text>
        {/each}
      </svg>
      <div class="legend">
        <span class="leg-item"><span class="leg-swatch matr"></span> Matrassen</span>
        <span class="leg-item"><span class="leg-swatch pet"></span> Petten</span>
      </div>
    </div>
  </div>

  <div class="card">
    <h2>Projectgegevens</h2>
    <table class="meta">
      <tbody>
        <tr><td>Opdrachtgever</td><td>{project.client}</td></tr>
        <tr><td>Project</td><td>{project.title}</td></tr>
        <tr><td>Uitvoering</td><td>{project.material}</td></tr>
        <tr><td>Inmeters</td><td>{project.inmeters}</td></tr>
        <tr><td>Periode</td><td>{project.period}</td></tr>
        <tr><td>Matrassen : Petten</td><td>{project.totalMattresses} : {project.totalPetten} ({(project.totalPetten / project.totalMattresses * 100).toFixed(1)}% pijpdoorvoer)</td></tr>
      </tbody>
    </table>
  </div>
</div>

<style>
  .overview { display: flex; flex-direction: column; gap: 20px; }
  .kpi-row { display: grid; grid-template-columns: repeat(auto-fit, minmax(160px, 1fr)); gap: 12px; }
  .kpi-card {
    background: #fff;
    border-radius: 10px;
    padding: 16px;
    text-align: center;
    box-shadow: 0 1px 3px rgba(0,0,0,0.06);
    border: 1px solid #eaecf0;
  }
  .kpi-card.primary {
    background: linear-gradient(135deg, #1a2744, #2a4070);
    color: #fff;
  }
  .kpi-card.primary .kpi-sub { color: #a8c8f0; }
  .kpi-label { font-size: 11px; text-transform: uppercase; letter-spacing: 0.5px; opacity: 0.7; display: block; }
  .kpi-value { font-size: 28px; font-weight: 700; display: block; margin: 4px 0; }
  .kpi-sub { font-size: 12px; opacity: 0.6; }
  .card {
    background: #fff;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.06);
    border: 1px solid #eaecf0;
  }
  h2 { font-size: 15px; font-weight: 600; margin: 0 0 16px; color: #1d2939; }
  .chart-wrap { display: flex; flex-direction: column; align-items: center; gap: 12px; }
  .legend { display: flex; gap: 20px; font-size: 12px; color: #475467; }
  .leg-item { display: flex; align-items: center; gap: 6px; }
  .leg-swatch { display: inline-block; width: 12px; height: 12px; border-radius: 3px; }
  .leg-swatch.matr { background: #2563eb; }
  .leg-swatch.pet { background: #f59e0b; }
  .meta { width: 100%; border-collapse: collapse; font-size: 13px; }
  .meta td { padding: 6px 12px; border-bottom: 1px solid #f0f1f3; }
  .meta td:first-child { font-weight: 600; color: #475467; width: 140px; }
</style>
