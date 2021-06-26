argocd:
	kubectl create namespace argocd
	kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

update-argocd-server:
	kubectl apply -f .argocd/argocd-server-nodeport.yml

get-initial-admin-password:
	kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

deploy-prod:
	kubectl apply -f  .argocd/nginx-prod.yml

deploy-staging:
	kubectl apply -f  .argocd/nginx-staging	.yml

deploy: deploy-prod deploy-staging
