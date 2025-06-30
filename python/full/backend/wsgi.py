# wsgi.py - Production WSGI entry point
import os
from app import app, init_app

# Initialize the application
init_app()

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port)

---

# run.py - Development entry point
#!/usr/bin/env python3
import os
from app import app, init_app

if __name__ == '__main__':
    # Initialize the application
    init_app()

    # Run in development mode
    debug_mode = os.getenv('FLASK_ENV') == 'development'
    app.run(
        debug=debug_mode,
        host='0.0.0.0',
        port=int(os.getenv('PORT', 5000))
    )
