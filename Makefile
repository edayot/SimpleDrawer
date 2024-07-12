define NEWLINE

endef


# check for a .env file and load it if it exists
ifeq ($(wildcard .env),)
    include_env :=
else
    include_env := .env
endif

# If .env exists, include it
ifneq ($(include_env),)
    include $(include_env)
endif


# BUILD_TYPE is an argument passed via make build BUILD_TYPE=release
BUILD_TYPE ?= dev

VERSION = $(shell poetry version -s)
COMMIT_HASH = $(shell git rev-parse --short HEAD)


ifeq ($(BUILD_TYPE), release)
	VERSION_STRING = v$(VERSION)
	ZIPPED = true
else
	VERSION_STRING = v$(VERSION)-$(COMMIT_HASH)
	ZIPPED = false
endif
ifeq ($(BUILD_TYPE), dev)
	VERSION_STRING = $(VERSION)-$(COMMIT_HASH)-dev
endif

# if dev or artifact, we don't want the version in the name
ifeq ($(BUILD_TYPE), artifact)
	version_bool = true
endif

ifdef version_bool
	DATA_NAME = "datapack"
	ASSETS_NAME = "resourcepack"
	DATA_BUNDLED_NAME = "datapack-bundled"
	ASSETS_BUNDLED_NAME = "resourcepack-bundled"
else
	DATA_NAME = "{{ project_name }}-v{{ project_version }}-Datapack"
	ASSETS_NAME = "{{ project_name }}-v{{ project_version }}-Resourcepack"
	DATA_BUNDLED_NAME = "{{ project_name }}-v{{ project_version }}-Datapack-Bundled"
	ASSETS_BUNDLED_NAME = "{{ project_name }}-v{{ project_version }}-Resourcepack-Bundled"
endif

DESCRIPTION = "{{ project_description }} v{{ version_string }}"


DATA_DESCRIPTION = $(DESCRIPTION)\ -\ Datapack
ASSETS_DESCRIPTION = $(DESCRIPTION)\ -\ Resourcepack

ARGS = --project beet.yaml \
	-s meta.version_string=$(VERSION_STRING) \
	-s data_pack.description=$(DATA_DESCRIPTION) \
	-s resource_pack.description=$(ASSETS_DESCRIPTION) \
	-s data_pack.zipped=$(ZIPPED) \
	-s resource_pack.zipped=$(ZIPPED) \
	-s version=$(VERSION) \

UNBUNDLED_ARGS = $(ARGS) \
	-s data_pack.name=$(DATA_NAME) \
	-s resource_pack.name=$(ASSETS_NAME) \
	-s meta.weld_deps.enabled=false \

BUNDLED_ARGS = $(ARGS) \
	-s data_pack.name=$(DATA_BUNDLED_NAME) \
	-s resource_pack.name=$(ASSETS_BUNDLED_NAME) \
	-s meta.bundled=true \




# Build

check_env:

# trow error if any of the required environment variables are not set
# - MINECRAFT_FOLDER
# - SAVE_FOLDER
# - DATAPACKS_FOLDER
# - RESOURCES_PACK_FOLDER

ifndef MINECRAFT_FOLDER
	$(error MINECRAFT_FOLDER is not set)
endif
ifndef SAVE_FOLDER
	$(error SAVE_FOLDER is not set)
endif
ifndef DATAPACKS_FOLDER
	$(error DATAPACKS_FOLDER is not set)
endif
ifndef RESOURCES_PACK_FOLDER
	$(error RESOURCES_PACK_FOLDER is not set)
endif

b: clean run

build: run

run: 
	@rm -rf build
ifeq ($(BUILD_TYPE), dev)
	@poetry run beet $(BUNDLED_ARGS) build
else
	@poetry run beet $(BUNDLED_ARGS) build
	@poetry run beet $(UNBUNDLED_ARGS) build
endif


watch: link
	@rm -rf build
	@poetry run beet --project beet.yaml $(BUNDLED_ARGS) watch

link: check_env
	@poetry run beet l --minecraft $(MINECRAFT_FOLDER) --data-pack $(DATAPACKS_FOLDER) --resource-pack $(RESOURCES_PACK_FOLDER) 



clean:
	@rm -rf build
	@rm -rf .beet_cache
	@rm -rf __pycache__


# Documentation
docs-%:
	echo Trying to build docs
	@cd docs && make $*


