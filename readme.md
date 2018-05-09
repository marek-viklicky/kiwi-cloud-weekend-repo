####
####

repo url: https://hub.docker.com/r/frostwo1f/kiwi-cloud-weekend-repo/
repo cmd: docker pull frostwo1f/kiwi-cloud-weekend-repo

how to run:
docker run -d -p 8080:443 frostwo1f/kiwi-cloud-weekend-repo

and then put this url to your browser:
https://127.0.0.1:8080/

####
####

files description:

Dockerfile
This file contains steps for docker build commands and some comments.
Docker image was built in work dir with all the files present.

default.conf
Added https and ssl listening for default nginx vhost.
I was also trying to manage redirect from port 80, but on localhost & docker I was not able to establish it.

nginx.conf
Added ssl info, paths to ssl files.

localhost.crt
localhost.key
Certificate and key file for localhost generated by openssl with command:
openssl req -x509 -out localhost.crt -keyout localhost.key \
  -newkey rsa:2048 -nodes -sha256 \
  -subj '/CN=localhost' -extensions EXT -config <( \
   printf "[dn]\nCN=localhost\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:localhost\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")

####
####

My Steps:

1. download default nginx image
2. prepare files that need to be edited over default
3. generate cert and key
4. write down dockerfile where my files will be copied to the image
5. create repo on docker hub
6. build my image with proper name
	- docker build -t frostwo1f/kiwi-cloud-weekend-repo .
7. log in to the my repo in docker hub a push my image to it
	- docker login --username=frostwo1f (prompted for pass)
	- docker push frostwo1f/kiwi-cloud-weekend-repo
8. pray to old gods