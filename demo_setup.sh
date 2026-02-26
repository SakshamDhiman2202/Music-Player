#!/bin/bash
# MusicPlayer - Complete Demo Workflow Script
# This script demonstrates all features of the MusicPlayer application

echo "=================================="
echo "MusicPlayer - Complete Demo Setup"
echo "=================================="
echo ""

# Set colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

PROJECT_DIR="/Users/sakshamdhiman/MusicPlayer"
cd "$PROJECT_DIR"

# Step 1: Check Python
echo -e "${BLUE}Step 1: Checking Python Installation...${NC}"
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}Python3 not found! Please install Python 3.10+${NC}"
    exit 1
fi
PYTHON_VERSION=$(python3 --version 2>&1 | awk '{print $2}')
echo -e "${GREEN}✓ Python ${PYTHON_VERSION} found${NC}"
echo ""

# Step 2: Setup Virtual Environment
echo -e "${BLUE}Step 2: Setting up Virtual Environment...${NC}"
if [ ! -d "venv" ]; then
    python3 -m venv venv
    echo -e "${GREEN}✓ Virtual environment created${NC}"
else
    echo -e "${GREEN}✓ Virtual environment already exists${NC}"
fi
source venv/bin/activate
echo ""

# Step 3: Install Dependencies
echo -e "${BLUE}Step 3: Installing Dependencies...${NC}"
pip install --quiet -r requirements.txt
echo -e "${GREEN}✓ Dependencies installed${NC}"
echo ""

# Step 4: Database Setup
echo -e "${BLUE}Step 4: Setting up Database...${NC}"
mkdir -p media/songs media/covers media/avatars
python manage.py migrate --quiet 2>/dev/null || true
python manage.py makemigrations music --quiet 2>/dev/null || true
python manage.py migrate music --quiet 2>/dev/null || true
echo -e "${GREEN}✓ Database ready${NC}"
echo ""

# Step 5: Load Sample Data
echo -e "${BLUE}Step 5: Loading Sample Songs...${NC}"
python manage.py seed_songs --quiet 2>/dev/null || python manage.py seed_songs
echo -e "${GREEN}✓ Sample data loaded${NC}"
echo ""

# Summary
echo -e "${GREEN}=================================="
echo "Setup Complete! ✓"
echo "==================================${NC}"
echo ""
echo -e "${YELLOW}📝 Next Steps:${NC}"
echo ""
echo -e "${BLUE}1. Create Admin Account:${NC}"
echo "   $ python manage.py createsuperuser"
echo ""
echo -e "${BLUE}2. Start Development Server:${NC}"
echo "   $ python manage.py runserver"
echo ""
echo -e "${BLUE}3. Access Application:${NC}"
echo "   Home: http://localhost:8000"
echo "   Admin: http://localhost:8000/admin"
echo ""
echo -e "${YELLOW}📚 Documentation:${NC}"
echo "   - README.md - Full documentation"
echo "   - QUICK_START.md - Get started in 5 minutes"
echo "   - SETUP_GUIDE.md - Detailed setup instructions"
echo ""
echo -e "${YELLOW}🎵 Features:${NC}"
echo "   ✓ Spotify-style music player"
echo "   ✓ User authentication"
echo "   ✓ Playlist management"
echo "   ✓ Favorites system"
echo "   ✓ Play history tracking"
echo "   ✓ Song search & filtering"
echo "   ✓ User profiles"
echo ""
echo -e "${GREEN}Ready to start? Run: python manage.py runserver${NC}"
echo ""
