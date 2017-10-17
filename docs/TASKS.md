# CI / CD website:
Phase AWS
- [x] Middleman
  - [x] Setup blogging template correctly
  - [x] Setup make build for the website

- [ ] Travis
  - [ ] Call top-level `make`
    - [ ] website make
    - [ ] terraform make

- [ ] Terraform
  - [ ] Make file
    - [x] [terraform-s3-dir build directory of website](https://github.com/saymedia/terraform-s3-dir)
    - [x] git ignore generated tf files
  - [ ] AWS provider
    - [x] Create bucket
  - [ ] DNS
    - aws.12factor.io / 12factor.io

- [ ] DNS
  - [ ] Delegate 12factor.io to AWS nameservers

- [ ] Create article on the above

# Company tasks
- [ ] Homepage
  * https://weareadaptive.com/
  * https://www.featurist.co.uk/


# Blog post
## Porting
### Linkerd
- [ ] running linkerd in a container on ECS (kev)
- [ ] linkerd and consul (ed)


### Nginx
- [ ] client mutual authentication in a container (kev)
- [ ] linkerd and nginx reverse proxy to communicate with external service as if it's an internal service

### Consul
- [ ] consul startup using systemd (ed)


### kong
- [ ] INSTALL KONG API GATEWAY FROM SOURCE ON MACOSX (ed)

### AWS
- [ ] FISH FUNCTION TO SWITCH AWS PROFILES (ed)
- [ ] CREATING AN OAUTH2 CUSTOM LAMDA AUTHORIZER FOR USE WITH AMAZONS (AWS) API GATEWAY USING HYDRA

## New
- [ ] Testing using docker (i.e. with go program)
- [ ] Testing using pacts
- [ ]

## Cloud native (12 factor)
??

## Multicloud
- [ ] Website deploy to multicloud
