#!/bin/bash
set -euo pipefail

# Set variables (customize these!)
PROJECT_ID="autoscaling-project-449817"
REGION="us-central1"
ZONE="us-central1-a"
INSTANCE_TEMPLATE="web-instance-template"
INSTANCE_GROUP="web-instance-group"
LOAD_BALANCER_NAME="web-load-balancer"
BACKEND_SERVICE="web-backend-service"
HEALTH_CHECK="web-health-check"
URL_MAP="web-url-map"
TARGET_PROXY="web-http-proxy"
FORWARDING_RULE="web-forwarding-rule"
FIREWALL_RULE="allow-web-traffic"
IAM_USER="user:m23csa509@iitj.ac.in"

# Delete Load Balancer Components
echo "Deleting Load Balancer components..."
gcloud compute forwarding-rules delete "$FORWARDING_RULE" --global --quiet
gcloud compute target-http-proxies delete "$TARGET_PROXY" --quiet
gcloud compute url-maps delete "$URL_MAP" --quiet
gcloud compute backend-services delete "$BACKEND_SERVICE" --global --quiet
gcloud compute health-checks delete "$HEALTH_CHECK" --quiet

# Delete Managed Instance Group
echo "Deleting Managed Instance Group..."
gcloud compute instance-groups managed delete "$INSTANCE_GROUP" --zone="$ZONE" --quiet

# Delete Instance Template
echo "Deleting Instance Template..."
gcloud compute instance-templates delete "$INSTANCE_TEMPLATE" --quiet

# Delete Firewall Rules
echo "Deleting Firewall Rules..."
gcloud compute firewall-rules delete allow-http allow-ssh-my-ip allow-health-check --quiet

# Remove IAM Bindings
echo "Removing IAM Bindings..."
gcloud projects remove-iam-policy-binding "$PROJECT_ID" --member="user:ankichauhan@gmail.com" --role=roles/compute.viewer --quiet
gcloud projects remove-iam-policy-binding "$PROJECT_ID" --member="$IAM_USER" --role=roles/compute.instanceAdmin.v1 --quiet

echo "All resources have been deleted successfully."
