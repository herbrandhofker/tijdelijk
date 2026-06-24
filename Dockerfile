FROM node:22-alpine AS build-beter
WORKDIR /app
COPY apps/tijdelijk/beter/lostock-dashboard/package*.json ./beter/lostock-dashboard/
RUN npm ci --prefix beter/lostock-dashboard
COPY apps/tijdelijk/beter/lostock-dashboard/ ./beter/lostock-dashboard/
COPY apps/tijdelijk/beter/pdf_data ./beter/pdf_data
RUN npm run build --prefix beter/lostock-dashboard

FROM node:22-alpine
WORKDIR /app
COPY apps/tijdelijk/package*.json ./
RUN npm ci --omit=dev
COPY --from=build-beter /app/beter/lostock-dashboard/dist ./beter/lostock-dashboard/dist
COPY apps/tijdelijk/server.js apps/tijdelijk/index.html apps/tijdelijk/dashboard.html ./
COPY apps/tijdelijk/pdf_data ./pdf_data
COPY apps/tijdelijk/Lostock*.xlsx apps/tijdelijk/audit_rapport.pdf apps/tijdelijk/werkrapportage_ron.pdf ./
EXPOSE 3000
ENV PORT=3000
CMD ["npm", "start"]