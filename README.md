# Task Manager API

A Ruby on Rails API for managing tasks with user authentication, categories, and task organization.

## Requirements

- Ruby 3.2.2
- PostgreSQL

## Setup

1. Clone the repository
2. Install dependencies:
   ```bash
   bundle install
   ```
3. Setup database:
   ```bash
   rails db:create db:migrate
   ```
4. Start the server:
   ```bash
   bin/rails server
   ```
## Database Structure

The application uses three main models:

- **Users**: Authentication and user management
- **Categories**: Organize tasks into groups
- **Tasks**: The main task items belonging to categories and users

## API Documentation

### Authentication

All authenticated endpoints require a token in the Authorization header:
```
Authorization: Bearer <your-token>
```

### Endpoints

- POST `/users/signup` - Create a new user account
- POST `/users/signin` - Sign in and receive JWT token

#### Categories
- GET `/categories` - List all categories
- POST `/categories` - Create a new category
- GET `/categories/:id` - Get a specific category
- PUT `/categories/:id` - Update a category
- DELETE `/categories/:id` - Delete a category

#### Tasks
- GET `/tasks` - List all tasks
- POST `/tasks` - Create a new task
- GET `/tasks/:id` - Get a specific task
- PUT `/tasks/:id` - Update a task
- DELETE `/tasks/:id` - Delete a task

