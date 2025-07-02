# Personal Project - Dark Souls 3 Achievement Tracker App

## Overview

- *Project Type:* University Capstone - iPhone Software Engineering
- *Technologies:* Swift, Xcode, CoreData, MVVM, SQLite, macOS

As the final part of a multi stage project for the iPhone Software Engineering course, I designed and developed a Swift-based iOS application that serves as an achievement tracker and guide for the video game Dark Souls 3. The app was built using Xcode on macOS and is fully compatible with iPhones and iPads of all sizes and screen resolutions.

## Key Features & Implementation Highlights:

1. **Responsive UI with AutoLayout**
   - Designed a dynamic user interface using AutoLayout and constraint-based design, ensuring seamless adaptability across devices and orientations (portrait/landscape).
2. **Persistent Data Storage with CoreData + SQLite**
   - On first launch, the app generates a persistent local database of game achievements. User progress is automatically saved and retained across sessions using CoreData and SQLite.
3. **MVVM Architecture for Clean Code Separation**
   - Applied the Model–View–ViewModel (MVVM) design pattern to decouple UI and business logic. This improved testability, modularity, and future scalability — a shift from the MVC pattern used in earlier coursework.      
4. **Game-Inspired UI & Intuitive User Experience**
   - Created a sleek, user-friendly interface with a dark color scheme inspired by the game. Each achievement is displayed with official iconography and accompanied by a tappable checkbox for marking progress.
5. **Visual Progress Tracking with Completion Bars**
   - Used dynamic progress bars to visually represent achievement completion, providing users with an at-a-glance view of their progress.
6. **Unit and UI Test Coverage**
   - Developed and integrated automated tests to validate key application workflows and ensure consistent behavior across different devices and iOS versions. This helped maintain UI stability and catch bugs early during development.
