From node:alpine as builder 
Workdir '/app'

Copy package.json .
Run npm install
Copy . . 
RUN npm run build

From nginx as runner 
Expose 80
Copy --from=builder /app/build /usr/share/nginx/html