#!/usr/bin/env python3
"""
Example usage of GitHub Project Manager.

Make sure to set GITHUB_TOKEN and GITHUB_ORG environment variables before running.
"""

import logging
from github_project_manager import (
    GitHubProjectManager,
    StatusOption,
    IssueLabel,
    IssueMilestone,
)

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
)

# Initialize the manager
manager = GitHubProjectManager()

# Create a project
project_id = manager.create_project("My Test Project")
print(f"Project created with ID: {project_id}")

# Set up status options
status_options = [
    StatusOption("To Do", "RED"),
    StatusOption("In Progress", "YELLOW"),
    StatusOption("Done", "GREEN", "Completed work"),
]
manager.update_status_options(status_options, preserve_existing=False)

# Repository to work with
# IMPORTANT: Replace this with your actual repository name
# Example: repo = "my-awesome-project"
repo = "REPLACE_WITH_YOUR_REPO_NAME"

# Create a label in the repository
label = IssueLabel("enhancement", "0E8A16", "New feature or request")
manager.create_labels(repo, label)

# Create a milestone
milestone = IssueMilestone("v1.0", "First stable release")
manager.create_milestones(repo, milestone)

# Create an issue and add it to the project automatically
issue_body = """
This is a test issue created by the GitHub Project Manager library.

## Description

This is a test issue created by the GitHub Project Manager library.
"""

# Using the add_to_project parameter to automatically add to project
issue_id = manager.create_issue(
    repo, "Test Issue from GitHub Project Manager", issue_body, add_to_project=True
)

print("Example completed successfully!")

# Example of updating an issue with changed description
updated_body = """
This is an updated test issue description.

## Description

This shows how the library will update the issue description if it's changed.
"""

issue_id2 = manager.create_issue(
    repo,
    "Test Issue from GitHub Project Manager",  # Same title as before
    updated_body,  # Different description
    add_to_project=True,
)
# The library will update the description of the existing issue
# and ensure it's in the project
