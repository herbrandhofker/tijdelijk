const express = require('express');
const path = require('path');
const app = express();
const PORT = process.env.PORT || 3000;

const beterDist = path.join(__dirname, 'beter', 'lostock-dashboard', 'dist');

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

app.get('/oud', (req, res) => {
    res.sendFile(path.join(__dirname, 'dashboard.html'));
});

app.use('/beter', express.static(beterDist));
app.get('/beter/*', (req, res) => {
    res.sendFile(path.join(beterDist, 'index.html'));
});

app.use(express.static(__dirname, {
    index: false,
    dotfiles: 'ignore',
}));

app.listen(PORT, () => {
    console.log(`Server draait op http://localhost:${PORT}`);
    console.log(`  /      – Landingspagina`);
    console.log(`  /oud   – Classic Dashboard`);
    console.log(`  /beter – Productie Dashboard`);
});
