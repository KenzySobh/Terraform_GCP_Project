run.sh

#!/bin/bash
# run.sh - Deploy GCP Project automatically from YAML config

set -e  # Stop script on any error

CONFIG_FILE="configs/example-project.yaml"

echo "🚀 Starting Auto-GCP Deployment..."

# Step 1: Authenticate to GCP (if not already)
echo "🔑 Authenticating to GCP..."
gcloud auth application-default login

# Step 2: Navigate to scripts folder
cd scripts

# Step 3: Run the deploy script with the YAML config
echo "📦 Deploying infrastructure..."
python3 deploy.py "../$CONFIG_FILE"

echo "✅ Deployment completed successfully!"