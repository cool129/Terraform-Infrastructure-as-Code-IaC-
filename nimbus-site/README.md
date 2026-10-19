# Nimbus Compute Website

A modern, responsive website for Nimbus Compute - offering pragmatic DevOps training and B2B services specializing in Azure, Terraform, GitHub Actions, and AKS.

## Overview

This is a static website showcasing Nimbus Compute's services including:
- **B2B Services**: Infrastructure as Code bootstraps, CI/CD acceleration, and cloud cost optimization
- **DevOps Course**: 10-12 week cohort-based training program
- **1:1 Mentorship**: Career guidance and project coaching

## Features

- 📱 **Responsive Design**: Mobile-first approach with hamburger navigation
- ⚡ **Fast Loading**: Pure HTML, CSS, and vanilla JavaScript
- 🎨 **Modern UI**: Clean design with gradients and smooth animations
- ♿ **Accessible**: ARIA labels and semantic HTML
- 📧 **Contact Form**: Interactive form with validation
- 🔗 **Smooth Scrolling**: Anchor navigation with offset for fixed header

## Project Structure

```
nimbus-site/
├── index.html          # Main HTML file
├── styles.css          # All CSS styles
├── app.js             # JavaScript functionality
├── assets/
│   └── logo.svg       # Nimbus Compute logo
├── Dockerfile         # Docker configuration for deployment
├── nginx.conf         # Nginx configuration
└── README.md          # This file
```

## Local Development

### Prerequisites

- Python 3.x (for local server)
- Or any static file server
- Modern web browser

### Quick Start

1. **Clone or navigate to the project directory**
   ```bash
   cd nimbus-site
   ```

2. **Start local server**
   ```bash
   # Using Python 3
   python -m http.server 7777
   
   # Or using Python 2
   python -m SimpleHTTPServer 7777
   
   # Or using Node.js (if you have it installed)
   npx serve . -p 7777
   ```

3. **Open your browser**
   Navigate to `http://localhost:7777`

### Alternative Servers

- **PHP**: `php -S localhost:7777`
- **Ruby**: `ruby -run -e httpd . -p 7777`
- **Live Server** (VS Code extension): Right-click `index.html` → "Open with Live Server"

## Docker Deployment

The project includes Docker configuration for containerized deployment:

1. **Build the Docker image**
   ```bash
   docker build -t nimbus-website .
   ```

2. **Run the container**
   ```bash
   docker run -p 80:80 nimbus-website
   ```

3. **Access the site**
   Navigate to `http://localhost`

## Deployment Options

### Static Hosting Services
- **Netlify**: Drag and drop the `nimbus-site` folder
- **Vercel**: Connect your Git repository
- **GitHub Pages**: Push to a repository and enable Pages
- **Azure Static Web Apps**: Deploy directly from GitHub

### Traditional Web Hosting
- Upload all files to your web server's public directory
- Ensure `index.html` is in the root directory

### CDN Deployment
- Upload files to any CDN service
- Configure appropriate MIME types for `.svg` files

## Browser Support

- ✅ Chrome (latest)
- ✅ Firefox (latest)
- ✅ Safari (latest)
- ✅ Edge (latest)
- ⚠️ IE11 (basic functionality, some CSS features may not work)

## Technical Details

### CSS Features
- CSS Grid and Flexbox for layout
- CSS Custom Properties (variables)
- Modern animations and transitions
- Mobile-first responsive design

### JavaScript Features
- Vanilla JavaScript (no dependencies)
- Mobile menu toggle
- Smooth scrolling navigation
- Form validation and submission
- Dynamic year in footer

### Performance
- No external dependencies
- Optimized CSS with minimal unused code
- Compressed SVG logo
- Efficient JavaScript with event delegation

## Customization

### Colors
Main colors are defined as CSS custom properties in `styles.css`:
```css
:root {
    --primary-color: #2563eb;
    --secondary-color: #1e40af;
    --accent-color: #3b82f6;
    /* ... */
}
```

### Content
- Edit `index.html` to modify text content
- Update sections, services, or course information
- Replace logo in `assets/logo.svg`

### Styling
- Modify `styles.css` for design changes
- The CSS is organized by sections for easy navigation
- Responsive breakpoints are clearly defined

## Contact Form

The contact form currently shows a success alert. To make it functional:

1. **Add backend processing** (PHP, Node.js, etc.)
2. **Use a service** like Formspree, Netlify Forms, or EmailJS
3. **Integrate with APIs** for email sending

Example with Formspree:
```html
<form action="https://formspree.io/f/YOUR_FORM_ID" method="POST">
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test across different browsers
5. Submit a pull request

## License

This project is proprietary to Nimbus Compute. All rights reserved.

## Support

For questions about the website or services, please contact Nimbus Compute through the contact form or visit the website at the deployed URL.

---

**Built with ❤️ for pragmatic DevOps education and training**
