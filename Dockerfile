from node:alpine3.14 as builder
workdir '/app'
copy package.json .
run npm install
copy . .
run npm run build

from nginx
copy --from=builder /app/build /usr/share/nginx/html

