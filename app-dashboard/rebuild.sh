#npm install @vue/cli-service
docker stop app-pm-dashboard-vuejs-001
docker rm app-pm-dashboard-vuejs-001
npm run build
docker build -t app-pm-dashboard-vuejs .
docker run -dit --name app-pm-dashboard-vuejs-001 -p 80:80 app-pm-dashboard-vuejs