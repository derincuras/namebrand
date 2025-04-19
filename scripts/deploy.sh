#!/bin/bash

# Exit on error
set -e

# Check if server IP is provided
if [ -z "$1" ]; then
    echo "Usage: ./deploy.sh <server_ip>"
    exit 1
fi

SERVER_IP=$1
SSH_USER="root"  # Change this to your SSH user
APP_NAME="namebrand.app"
APP_DIR="/var/www/$APP_NAME"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Function to log messages
log() {
    echo -e "${GREEN}[$(date '+%Y-%m-%d %H:%M:%S')] $1${NC}"
}

# Function to log errors
error() {
    echo -e "${RED}[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: $1${NC}"
    exit 1
}

# Function to log warnings
warn() {
    echo -e "${YELLOW}[$(date '+%Y-%m-%d %H:%M:%S')] WARNING: $1${NC}"
}

log "🚀 Starting deployment to $SERVER_IP"

# Install required software
log "📦 Installing required software..."
ssh $SSH_USER@$SERVER_IP << 'EOF'
    # Update package list
    apt-get update || error "Failed to update package list"

    # Install Node.js
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - || error "Failed to setup Node.js repository"
    apt-get install -y nodejs || error "Failed to install Node.js"

    # Install Nginx
    apt-get install -y nginx || error "Failed to install Nginx"

    # Install PM2
    npm install -g pm2 || error "Failed to install PM2"

    # Install certbot for SSL
    apt-get install -y certbot python3-certbot-nginx || error "Failed to install certbot"

    # Install MongoDB
    apt-get install -y mongodb || error "Failed to install MongoDB"
    systemctl enable mongodb || warn "Failed to enable MongoDB service"
    systemctl start mongodb || warn "Failed to start MongoDB service"
EOF

# Configure Nginx
log "🔧 Configuring Nginx..."
scp scripts/nginx.conf $SSH_USER@$SERVER_IP:/etc/nginx/sites-available/$APP_NAME || error "Failed to copy Nginx configuration"
ssh $SSH_USER@$SERVER_IP << EOF
    ln -sf /etc/nginx/sites-available/$APP_NAME /etc/nginx/sites-enabled/ || error "Failed to enable Nginx site"
    rm -f /etc/nginx/sites-enabled/default || warn "Failed to remove default Nginx site"
    nginx -t || error "Nginx configuration test failed"
    systemctl restart nginx || error "Failed to restart Nginx"
EOF

# Set up SSL
log "🔒 Setting up SSL..."
ssh $SSH_USER@$SERVER_IP << EOF
    certbot --nginx -d $APP_NAME -d www.$APP_NAME --non-interactive --agree-tos --email your-email@example.com || error "Failed to setup SSL"
EOF

# Create application directory
log "📁 Creating application directory..."
ssh $SSH_USER@$SERVER_IP << EOF
    mkdir -p $APP_DIR || error "Failed to create application directory"
    chown -R $SSH_USER:$SSH_USER $APP_DIR || error "Failed to set directory permissions"
EOF

# Copy application files
log "📦 Copying application files..."
rsync -avz --exclude 'node_modules' --exclude '.git' --exclude '.env' ./ $SSH_USER@$SERVER_IP:$APP_DIR/ || error "Failed to copy application files"

# Install dependencies and start application
log "🚀 Starting application..."
ssh $SSH_USER@$SERVER_IP << EOF
    cd $APP_DIR || error "Failed to change to application directory"
    cp .env.production .env || error "Failed to setup environment variables"
    npm install --production || error "Failed to install dependencies"
    pm2 start npm --name "$APP_NAME" -- start || error "Failed to start application"
    pm2 save || error "Failed to save PM2 configuration"
    pm2 startup || warn "Failed to setup PM2 startup"
EOF

log "✅ Deployment completed successfully!"
log "🌐 Your application is now live at https://$APP_NAME" 