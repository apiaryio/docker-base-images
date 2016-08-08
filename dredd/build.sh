DREDD_VERSION=`./scripts/getLatestStableNodePackage dredd`
echo "Building version: $DREDD_VERSION"
docker build -t apiaryio/dredd:$DREDD_VERSION --build-arg DREDD_VERSION="$DREDD_VERSION" -f dredd/Dockerfile --no-cache dredd/
docker tag apiaryio/dredd:$DREDD_VERSION apiaryio/dredd:stable
docker tag apiaryio/dredd:$DREDD_VERSION apiaryio/dredd:latest
