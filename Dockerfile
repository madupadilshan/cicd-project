# 1. Base image (Node.js තියෙන පෙට්ටියක්)
FROM node:18-alpine

# 2. වැඩ කරන තැන
WORKDIR /app

# 3. 'package.json' copy කරලා, 'npm install' ගහනවා
COPY package*.json ./
RUN npm install

# 4. ඉතුරු code ඔක්කොම copy කරනවා
COPY . .

# 5. App එක දුවන port එක ලෝකෙට කියනවා
EXPOSE 3000

# 6. App එක start කරන command එක
CMD ["node", "index.js"]