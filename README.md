# Kubernetize the spring app

## Get a clean manifest
The idea is to convert the docker-compose into a functional Kubernetes manifest.

> Make sure a `docker-compose up` works before anything else.

Before beginning with conversion I tweaked the `docker-compose.yml` to:
- Add the service labels
- Add the environment variables

ay be able to do this with : https://github.com/spring-petclinic/spring-petclinic-microservices-config but I have no f**** clue how it works

Create the Kubernetes manifest:
```shell
kompose convert
mv *.yaml base/
```

Create `base/mysql-secret.yaml` with the credentials for your AWS RDS.

Create `kustomize.yaml` for each directory.

### The DB access issue

/!\ For each (visits, vets, customers) we need to configure the Mysql connectivity.

This is usually done in sprint with an `application.properties` (cf. https://stackoverflow.com/questions/35531661/using-env-variable-in-spring-boots-application-properties).

But per [the doc](https://github.com/Riduidel/spring-petclinic-microservices/tree/POEI#use-the-spring-mysql-profile), you may have to configure it elsewhere. I have no f*** clue how this works.

If `application.properties` works then `kustomize` documents how to manage such a file here : https://kubernetes.io/docs/tasks/manage-kubernetes-objects/kustomization/#configmapgenerator

## Kustomize
Kustomize is a `kubectl` built-in to manage multiple environments of the same app at once.

## Deploy
To deploy the all shebang run `kubectl kustomize` ; for a single environment `kubectl kustomize ./prod`

If there are different images in prod vs dev or else, I put an example of an image transformer under [dev/kustomization.yaml](dev/kustomization.yaml)

## Disclaimer

Not tested !!!!

## Sources
- https://kubernetes.io/docs/tasks/configure-pod-container/translate-compose-kubernetes/
- https://github.com/kubernetes-sigs/kustomize/tree/master/examples/multibases
