# health_check.py - Health check script
#!/usr/bin/env python3
"""
Health check script for Docker containers
"""
import requests
import sys
import os

def check_health():
    """Check if the application is healthy"""
    try:
        api_url = os.getenv('API_URL', 'http://localhost:5000')
        response = requests.get(f"{api_url}/api/health", timeout=10)

        if response.status_code == 200:
            data = response.json()
            if data.get('status') == 'healthy':
                print("✅ Application is healthy")
                return True
            else:
                print("❌ Application reports unhealthy status")
                return False
        else:
            print(f"❌ Health check failed with status {response.status_code}")
            return False

    except requests.exceptions.RequestException as e:
        print(f"❌ Health check failed: {e}")
        return False

if __name__ == '__main__':
    if check_health():
        sys.exit(0)
    else:
        sys.exit(1)
