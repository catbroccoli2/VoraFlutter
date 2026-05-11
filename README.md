# Vora Climate Control

A room climate control interface built with Flutter for the Vora Mobile Development internship skill task.

## Preview

> Run on Windows desktop — the app renders inside a phone-sized frame (390×844) to simulate a mobile experience.

## Features

- Room name and live status indicator
- Current temperature and humidity readings
- Adjustable target temperature with bounds (16°C – 30°C)
- Power on/off toggle with animated switch
- Fan speed selector (Low, Medium, High)
- All controls disable gracefully when power is off

## Tech Stack

- **Flutter** 3.41.9
- **Provider** ^6.1.2 — state management

## Getting Started

**Requirements:** Flutter SDK 3.0+

```bash
git clone https://github.com/catbroccoli2/VoraFlutter.git
cd vora-climate-control
flutter pub get
flutter run -d windows
```

No additional setup, environment variables, or dependencies required.

## Project Structure