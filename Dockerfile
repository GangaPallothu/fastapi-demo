
# Use a small Python base image
FROM python:3.12-slim

# Install uv (fast Python env manager)
RUN pip install --no-cache-dir uv

# Set work directory
WORKDIR /app

# Copy project metadata first for better caching
COPY pyproject.toml ./
# Install dependencies (no dev extras)
RUN uv sync --no-dev

# Copy the application code
COPY app.py ./

# Expose the app port
EXPOSE 8000

# Start the FastAPI app with Uvicorn via uv
CMD ["uv", "run", "uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
