# XRPL Node on Kubernetes
## Build docker image for XRPL node (Ripple) with custom configuration and auto-update and deploy on kubernetes
This allows you to run XRPL node with minimal usage on a container and serve a public http websocket at port 80 and the local rpc admin service in the container at port 5005. Other ports (443, 6006, 51235) can be mapped but should be enabled in the config first.
### Build Image for Docker
Pull the repo and land inside the xrpl-node-k8s directory and run:
#### docker build -t imagename:tag .
### Run on Docker
#### docker run -dit --name xrplnode -p 80:80 imagename:tag
### Deploy on Kubernetes
You should have running kubernetes cluster with kubectl configured.
#### kubectl apply -f deployxrplnode.yaml
### Verify
#### kubectl exec podname /opt/ripple/bin/rippled server_info
