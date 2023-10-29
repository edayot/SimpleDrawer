


MINECRAFT_FOLDER = /home/erwan/.var/app/org.prismlauncher.PrismLauncher/data/PrismLauncher/instances/1.20.2/.minecraft/
SAVE_FOLDER = $(MINECRAFT_FOLDER)saves/Datapack\ island/
DATAPACKS_FOLDER = $(SAVE_FOLDER)datapacks/
RESOURCES_PACK_FOLDER = $(MINECRAFT_FOLDER)resourcepacks/


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
	ZIPPED = true
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
	DATA_NAME = "{{ project_name }}-{{ version_string }}-Datapack"
	ASSETS_NAME = "{{ project_name }}-{{ version_string }}-Resourcepack"
	DATA_BUNDLED_NAME = "{{ project_name }}-{{ version_string }}-Datapack-Bundled"
	ASSETS_BUNDLED_NAME = "{{ project_name }}-{{ version_string }}-Resourcepack-Bundled"
endif

DESCRIPTION = "{{ project_description }}\n by {{ project_author }}, {{ version_string }}"


DATA_DESCRIPTION = $(DESCRIPTION)\ -\ Datapack
ASSETS_DESCRIPTION = $(DESCRIPTION)\ -\ Resourcepack

ARGS = --project beet.yaml \
	-s meta.version_string=$(VERSION_STRING) \
	-s data_pack.description=$(DATA_DESCRIPTION) \
	-s resource_pack.description=$(ASSETS_DESCRIPTION) \
	-s data_pack.zipped=$(ZIPPED) \
	-s resource_pack.zipped=$(ZIPPED) \

UNBUNDLED_ARGS = $(ARGS) \
	-s data_pack.name=$(DATA_NAME) \
	-s resource_pack.name=$(ASSETS_NAME) \
	-s meta.bundled=false \

BUNDLED_ARGS = $(ARGS) \
	-s data_pack.name=$(DATA_BUNDLED_NAME) \
	-s resource_pack.name=$(ASSETS_BUNDLED_NAME) \
	-s meta.bundled=true \




# Build
b: 
ifeq ($(BUILD_TYPE), dev)
	@poetry run beet $(BUNDLED_ARGS) build
else
	@poetry run beet $(UNBUNDLED_ARGS) build
	@poetry run beet $(BUNDLED_ARGS) build
endif


watch: link
	@poetry run beet --project beet.yaml $(BUNDLED_ARGS) watch

link:
	@poetry run beet l --minecraft $(MINECRAFT_FOLDER) --data-pack $(DATAPACKS_FOLDER) --resource-pack $(RESOURCES_PACK_FOLDER) 



clean:
	@rm -rf build
	@rm -rf .beet_cache
	@rm -rf __pycache__


# Documentation
docs-%:
	echo Trying to build docs
	@cd docs && make $*


