---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: linux-tweet-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: linux-tweet-app
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 1
  template:
    metadata:
      labels:
        app: linux-tweet-app
    spec:
      containers:
      - name: schoolonair-cms
        image: 969220108910.dkr.ecr.us-east-1.amazonaws.com/linux-tweet-app:$IMAGE_TAG
        imagePullPolicy: Always
        env:
          - name: TEST
            value: test_3
        ports:
          - containerPort: 80
        readinessProbe:
          httpGet:
            path: /
            port: 80
          initialDelaySeconds: 5
          periodSeconds: 5
          successThreshold: 1
      restartPolicy: Always
---
apiVersion: v1
kind: Service
metadata:
  name: linux-tweet-app
spec:
  type: LoadBalancer
  ports:
  - name: http
    port: 80
    protocol: TCP
    targetPort: 80
  selector:
    app: linux-tweet-app