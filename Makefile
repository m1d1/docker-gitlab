#:vim noet

#
# ARM64 docker image, based on sameersbn's gitlab
# 
# 2022-12-28, michael.dinkelaker(at)gmail.com
#
# history: 
# 	2022-12-28, first version gitlab 15.7
# 	2023-05-31, update for gitlab 16.0.1 (switch to stock pgsql v15)
#	2023-08-29, public release on github

.SILENT:
.PHONY: all new download patch build deploy clean


PWD	:= $(shell pwd)


all: download patch build


new: clean all


download:
	printf "** downloading files\n"
	@test -d $(PWD)/docker-gitlab || git clone --depth=1 https://github.com/sameersbn/docker-gitlab.git


patch:
	# this is patching install.sh, to download the arm64 version of golang instead of amd64.
	@test -f $(PWD)/docker-gitlab/assets/build/install.sh.org~ || \
	printf "** patching install.sh for arm64\npatching Makefile tagging image as m1d1/gitlab:latest";\
	cp ./docker-gitlab/assets/build/install.sh ./docker-gitlab/assets/build/install.sh.org~;\
     	sed -i 's/amd64/arm64/g' ./docker-gitlab/assets/build/install.sh
	sed -i 's/sameersbn/m1d1/g' ./docker-gitlab/Makefile
	 

build:
	cd docker-gitlab;\
	make release

deploy:
	cd /srv/docker/gitlab;docker-compose up -d

clean:
	@rm -rf $(PWD)/docker-gitlab
	@docker system prune -af


