#!/bin/bash

echo "=================================="
echo "MusicPlayer - Quick Setup Script"
echo "=================================="
echo ""

# Color codes
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check Python version
echo -e "${YELLOW}Checking Python version...${NC}"
python --version

# Create virtual environment
echo -e "${YELLOW}Creating virtual environment...${NC}"
python -m venv venv

# Activate virtual environment
echo -e "${YELLOW}Activating virtual environment...${NC}"
source venv/bin/activate

# Install requirements
echo -e "${YELLOW}Installing dependencies...${NC}"
pip install --upgrade pip
pip install -r requirements.txt

# Create directories
echo -e "${YELLOW}Creating media directories...${NC}"
mkdir -p media/songs media/covers media/avatars

# Run migrations
echo -e "${YELLOW}Running database migrations...${NC}"
python manage.py makemigrations
python manage.py migrate

# Load sample songs
echo -e "${YELLOW}Loading sample songs...${NC}"
python manage.py seed_songs

echo ""
echo -e "${GREEN}=================================="
echo "Setup Complete!"
echo "==================================${NC}"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "1. Create superuser account:"
echo "   python manage.py createsuperuser"
echo ""
echo "2. Run development server:"
echo "   python manage.py runserver"
echo ""
echo "3. Access the application:"
echo "   http://localhost:8000"
echo ""
echo "4. Access admin panel:"
echo "   http://localhost:8000/admin"
echo ""
