echo "Starting db..."
docker compose up -d
echo ""

echo "Running migrations..."
docker compose run --rm atlas migrate apply --env local
echo ""

echo "Killing db..."
docker compose down
