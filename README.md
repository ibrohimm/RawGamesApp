# Task description

You need to implement the Raw Games app that displays content from [the endpoint](https://api.rawg.io/api/games).
The mobile application has 3 screens called Home, Favorite, Detail. The first screen should contain two tabs. One of them is a list of elements from the response. The other one is the favorites tab. It has the detail screen too.

# Code Documentation

## Design and Architectural Patterns

### VIPER Architectural Pattern

The decision to adopt the VIPER architecture for this iOS application was made after careful consideration of several factors. VIPER, standing for View, Interactor, Presenter, Entity, and Router, provides a structured and scalable approach to iOS app development. The main reasons for choosing VIPER include:

- **Modularity and Separation of Concerns:** VIPER enforces a clear separation of concerns, allowing each module to focus on specific responsibilities. This enhances maintainability and testability of the codebase.
- **Testability:** The architecture facilitates unit testing at multiple levels, contributing to a more robust and reliable codebase. Each component (View, Interactor, Presenter) can be tested independently, aiding in the early detection of issues.
- **Scalability:** VIPER is well-suited for large and complex applications. It accommodates the growth of the codebase by organizing it into distinct modules, each handling a specific aspect of the application's functionality.

### Singleton Pattern

The Singleton pattern was employed for certain components that require a single, globally accessible instance throughout the application. This decision was driven by the need for a centralized point of control or coordination, ensuring consistency and avoiding unnecessary duplication of resources.

### Builder Pattern

The Builder pattern was utilized in scenarios where the construction of complex objects involved multiple steps or configurations. By employing the Builder pattern, we achieve a more readable and maintainable codebase. It also allows for flexibility in constructing objects with varying configurations.

## Favorite Part of the Codebase

The most satisfying aspect of the codebase is the implementation of the data processing module. This section showcases the application's core logic and represents a culmination of problem-solving skills. The modular structure of the VIPER architectural pattern made it easier to implement different algorithms independently.

## App Store Submission Readiness

The application is currently in a state of readiness for submission to the App Store. However, a final checklist and testing phase are imperative before the submission process. Key considerations include:

- Comprehensive testing on various devices and iOS versions.
- Adherence to Apple's App Store guidelines, including privacy and permissions.
- Ensuring a positive and consistent user experience across different scenarios.
- Creating an app icon is a crucial step in preparing your app for App Store submission.

## Missing Points

### Unit Tests

Regrettably, unit tests have not been included in the current codebase, and the primary reason for this omission is a set of unforeseen personal family problems. Due to these challenges, the ability to allocate time and focus required for the comprehensive implementation of unit tests was significantly impacted.

Every project teams acknowledge the importance of thorough testing in ensuring the reliability and maintainability of the code. However, in the face of these personal challenges, the decision was made to prioritize addressing the immediate needs while recognizing the impact on the testing aspect.

As the situation improves, there is a commitment to revisiting this aspect and integrating unit tests into the codebase. Future development cycles will include a dedicated effort to implement comprehensive testing to uphold the code's quality and stability.

## Areas Needing More Time to Develop or Improve:

### 1. Unit Testing:

- **Current Status:** Unit tests are currently absent due to time constraints.
- **Why It's Important:** Implementing comprehensive unit tests is crucial for ensuring the reliability, maintainability, and long-term stability of the codebase. Tests help catch and prevent bugs, validate individual components, and facilitate a smoother development process.
- **Action Plan:** Allocate dedicated time for writing unit tests, starting with critical components and expanding test coverage progressively. This effort will pay off in terms of code quality, bug prevention, and ease of future development.

### 2. Refinement of UI Animations:

- **Current Status:** UI animations are implemented but require further refinement.
- **Why It's Important:** UI animations significantly contribute to the overall user experience. Polished and smooth animations enhance the app's aesthetics, making it more engaging for users. An improved user experience can lead to higher user satisfaction and increased retention.
- **Action Plan:** Invest time in refining existing UI animations to ensure they are smooth, visually appealing, and aligned with the overall design principles. Pay attention to transitions, responsiveness, and consistency across different screens.

### 3. Accessibility Features:

- **Current Status**: Accessibility features may need attention.
- **Why It's Important**: Accessibility is a critical aspect of app development, ensuring that the app is usable by a broad audience, including users with disabilities. Addressing accessibility concerns enhances inclusivity and may be required for compliance with accessibility standards.
- **Action Plan:** Conduct an accessibility audit to identify areas that need improvement. Implement features such as VoiceOver support, Dynamic Type, and other accessibility enhancements to make the app more user-friendly for all.

### 4. Code Documentation:

- **Current Status:** Documentation may need improvement.
- **Why It's Important:** Well-documented code is essential for the understanding, maintenance, and collaboration of the development team. Clear and concise documentation aids in onboarding new developers and facilitates future modifications.
- **Action Plan:** Review and enhance code documentation, providing explanations for complex components, algorithms, and the overall code structure. Ensure that the documentation is up-to-date with the latest changes.

### 5. Performance Optimization:

- **Current Status:** Performance optimizations may be needed.
- **Why It's Important:** Optimizing the app's performance ensures a smooth and responsive user experience, especially on older or resource-constrained devices. Performance improvements can lead to increased user satisfaction and better app reviews.
- **Action Plan:** Profile the app for performance bottlenecks, identify areas of improvement, and implement optimizations where necessary. This could include optimizing algorithms, reducing memory usage, and optimizing network requests.
