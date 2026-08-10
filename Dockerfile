FROM kivy/buildozer:latest

# Set working directory
WORKDIR /app

# Copy the entire project
COPY . /app

# Run buildozer
ENTRYPOINT ["buildozer"]
CMD ["android", "debug"]
