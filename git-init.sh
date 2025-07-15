#!/bin/bash
# This script initializes a git repository for the garden-flutter-app project

echo "# garden-flutter-app" >> README.md

# Initialize git
git init

# Add all files
git add .

# Commit the files
git commit -m "Initial commit"

# Set your remote (replace with your GitHub URL)
git remote add origin git@github.com:turanga-lila/garden-flutter-app.git

# Create main branch locally first
git branch -M main

# Push to the main branch
git push -u origin main
