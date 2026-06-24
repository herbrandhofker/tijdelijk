FROM node:22-alpine AS build
WORKDIR /app
COPY lostock-dashboard/package*.json ./
RUN npm ci
COPY lostock-dashboard/ .
COPY pdf_data/pages public/pdf_data/pages/
COPY pdf_data/crops public/pdf_data/crops/
RUN npm run build

FROM nginx:1.27-alpine
COPY lostock-dashboard/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
