# Read stuff from xml file
yq -p xml '.metadata.versioning.snapshotVersions.snapshotVersion.value' test.xml
