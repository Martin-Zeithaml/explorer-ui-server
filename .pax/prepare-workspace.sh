#!/bin/bash -e

################################################################################
# This program and the accompanying materials are made available under the terms of the
# Eclipse Public License v2.0 which accompanies this distribution, and is available at
# https://www.eclipse.org/legal/epl-v20.html
#
# SPDX-License-Identifier: EPL-2.0
#
# Copyright IBM Corporation 2018, 2020
################################################################################

################################################################################
# Build script
# 
# - build client
################################################################################

# contants
SCRIPT_NAME=$(basename "$0")
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
ROOT_DIR=$(cd "$SCRIPT_DIR" && cd .. && pwd)
PAX_WORKSPACE_DIR=.pax

cd "${ROOT_DIR}"

# prepare pax workspace
echo "[${SCRIPT_NAME}] cleaning PAX workspace ..."
rm -fr "${PAX_WORKSPACE_DIR}/content"
mkdir -p "${PAX_WORKSPACE_DIR}/content"

# copy explorer-ui-server to target folder
echo "[${SCRIPT_NAME}] copying explorer UI backend ..."
cp -r dist/. "${PAX_WORKSPACE_DIR}/content/"
cp manifest.yaml "${PAX_WORKSPACE_DIR}/content"

# move ASCII files to another folder
rm -fr "${PAX_WORKSPACE_DIR}/ascii"
mkdir -p "${PAX_WORKSPACE_DIR}/ascii"
rsync -rv \
  --include '*.json' --include '*.html' --include '*.jcl' --include '*.template' \
  --exclude '*.zip' --exclude '*.png' --exclude '*.tgz' --exclude '*.tar.gz' --exclude '*.pax' \
  --prune-empty-dirs --remove-source-files \
  "${PAX_WORKSPACE_DIR}/content/" \
  "${PAX_WORKSPACE_DIR}/ascii"

echo "[${SCRIPT_NAME}] ${PAX_WORKSPACE_DIR} folder is prepared."
exit 0
