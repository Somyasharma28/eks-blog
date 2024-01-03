
cat >app-deploy.yml <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: redis
  namespace: blog
  labels:
    app: redis
spec:
  selector:
    matchLabels:
      app: redis
  template:
    metadata:
      labels:
        app: redis
    spec:
      containers:
        - name: redis
          image: redis
          ports:
            - containerPort: 6379
EOF
chmod +x app-deploy.yml 
kubectl apply -f app-deploy.yml -n blog

