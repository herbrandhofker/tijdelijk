FROM node:22-alpine AS build-beter
WORKDIR /app
COPY beter/lostock-dashboard/package*.json ./beter/lostock-dashboard/
RUN npm ci --prefix beter/lostock-dashboard
COPY beter/lostock-dashboard/ ./beter/lostock-dashboard/
COPY beter/pdf_data ./beter/pdf_data
RUN npm run build --prefix beter/lostock-dashboard

FROM node:22-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY --from=build-beter /app/beter/lostock-dashboard/dist ./beter/lostock-dashboard/dist
COPY server.js index.html dashboard.html ./
COPY pdf_data ./pdf_data
COPY Lostock*.xlsx audit_rapport.pdf werkrapportage_ron.pdf ./
EXPOSE 3000
ENV PORT=3000
CMD ["npm", "start"]