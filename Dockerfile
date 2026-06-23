FROM node:20-slim

WORKDIR /app

# Copy dependency files
COPY package*.json ./

# Install production dependencies
RUN npm install --omit=dev

# Copy dashboard.html, Excel, PDFs, server.js and pdf_data directory
COPY ["server.js", "dashboard.html", "Lostock Fabric JV+RdW.xlsx", "audit_rapport.pdf", "werkrapportage_ron.pdf", "./"]
COPY pdf_data/ ./pdf_data/

EXPOSE 3000

ENV PORT=3000

CMD ["npm", "start"]
