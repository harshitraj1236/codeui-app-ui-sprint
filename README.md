# EV Control Panel - CodeUI.apk (Equinox 7.0)

**Track:** Track 2 – SwiftUI
**Framework:** SwiftUI (iOS)

## Design Write-up
This EV Control Panel leverages SwiftUI's ZStack, continuous springs, and spatial transitions to deliver a high-fidelity automotive interface. A dark, neon-cyan palette combined with ultra-thin materials establishes a premium aesthetic. The layout utilizes `rotation3DEffect` within a horizontal `ScrollView` and `GeometryReader` to create a 3D spatial garage carousel. The dashboard prioritizes hierarchy through an animated, custom circular battery tracker and a `LazyVGrid` of interactive control modules featuring haptic feedback. The architecture emphasizes state-driven UI (`@State`, `@Binding`) for fluid, single-page navigation without disrupting user immersion. *(87 words)*

## Core Components Utilized
* `ZStack`, `VStack`, `HStack`, `Group`
* `ScrollView` (Horizontal & Vertical)
* `LazyVGrid`
* `GeometryReader`
* `@State`, `@Binding`
* `withAnimation` (Spring response & damping)
* `Transition` (.move, .scale, .opacity)
* `Button`, `Image`, `Text`
* Background/Overlay & `.ultraThinMaterial`

## Submission Assets
* **Source Code:** "https://github.com/harshitraj1236/codeui-app-ui-sprint"
* **Application Build:** "https://youtube.com/shorts/WPNqNM4TZ2g?feature=share"
