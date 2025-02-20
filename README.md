# Book Lending Library - Ruby on Rails 8

## Overview
This is a simple Book Lending Library application built with Ruby on Rails 8, using its default authentication system. The application allows registered users to browse available books, borrow a book, return a book, and track borrowed books.

## Features
- User registration and authentication (Rails 8 default authentication system)
- Book listing page displaying availability status
- Book details page with an option to borrow if available
- User profile page displaying currently borrowed books
- Borrowing system with a due date (2 weeks from borrowing date)
- Prevent borrowing of already borrowed books
- Model validations (e.g., title/author/ISBN presence, unique ISBN)
- Error handling to ensure data integrity
- Tests for models, controllers, and views (using Rails' default testing framework)

## Setup Instructions

### Prerequisites
Ensure you have the following installed:
- Ruby 3.x
- Rails 8
- PostgreSQL
- Bundler

### Installation
1. Clone the repository:
   ```sh
   git clone <GITHUB_REPO_URL>
   cd book-lending-library
   ```
2. Install dependencies:
   ```sh
   bundle install
   ```
3. Set up the database:
   ```sh
   rails db:create db:migrate db:seed
   ```
4. Start the Rails server:
   ```sh
   rails server
   ```
5. Open your browser and go to:
   ```sh
   http://localhost:3000
   ```

## Running Tests
Run the test suite to ensure everything works correctly:
```sh
rails test
```

## Usage
- Register an account or log in
- Browse available books
- Click on a book to view details and borrow (if available)
- View your borrowed books on the profile page
- Return books from your profile when done

## Contribution
If you'd like to contribute:
1. Fork the repository
2. Create a new branch (`git checkout -b feature-branch`)
3. Commit your changes (`git commit -m "Added new feature"`)
4. Push to the branch (`git push origin feature-branch`)
5. Open a pull request

## License
This project is open-source and available under the [MIT License](LICENSE).

## GitHub Repository
Find the project on GitHub:
[GitHub Repo URL](<casey829>)

