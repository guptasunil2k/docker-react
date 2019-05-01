From node:alpine as builder 
Workdir '/app'

Copy package.json .
Run npm install
Copy . . 
RUN npm run build

From nginx as runner 
Copy --from=builder /app/build /usr/share/nginx/html