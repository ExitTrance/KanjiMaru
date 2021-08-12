# KanjiMaru

Not in development anymore for reasons I shall not state here. Still loved the design I created, so it will stay up.
----



Flashcard and Japanese Characters writing mobile application made in Flutter. Still a work in progress! 

As I have been frustrated by the fact that apps on the market do not provide a 'good' way to learn to write Japanese Characters, I have decided to create my own app.  

Inspired by both Anki and WaniKani, tools which I still use at the moment on my Japanese learning journey. While they are great tools, I have been wanting to create something of my own for a while.


## UI
`Current Mock 'Overview Screen' in Figma`

<img src="screenshots/Screenshot_2021-03-06-184714.png" width="250" height="450" /> 

`Current 'Overview Screen' in Flutter`

<img src="screenshots/CurrentProgressOverview.png" width="250" height="450" /> 

## Planned Features
Barebone features that this project will have to satisfy for me. Subject to change. 
UIs will change throughout time, so a tick does not mean it's the final version.

- [ ] Front-end
    - [x] Login Page
    - [x] Overview Page
    - [ ] Statistics Page 
    - [ ] Settings Page
    - [ ] Games Page
- [ ] Firestore
    - [ ] Login System
        - [x] Email/Password login
        - [ ] Google Login
        - [ ] Facebook Login
        - [ ] Anonymous Login
    - [x] Firestore Integration
    - [x] Update UI on Firestore Changes
    - [x] Update Firestore on User Interaction/Background Processing
    - [x] Create models to represent data to be stored in Firestore

- [ ] SRS
    - [x] Implement the SM2 algorithm
    - [ ] Hook up SRS to the rest of the application
    - [ ] Create efficient ways of mapping SRS data to Firestore



- [ ] Learn System (Cannot review what you have not learned yet.)
- [ ] Flashcard (Review) System


- [ ] Kanji Writing Cards
    - [ ] Implement Writing Package
- [ ] WaniKani Import
- [ ] Implement Import from pre-defined decks

- [ ] Japanese Character Data
    - [x] Deserialize JP Data and Graphics into usable format 
    - [x] Make Deserialized data available via providers
    - [ ] Hook up Backend to this Data

- [ ] Learning Games
    - [ ] Implement Shiritori
    - [ ] Implement Game where you have n pairs of cards mixed up, and you try to match them (Meaning -> Reading or other way around)


## Where does the name come KanjiMaru come from?
It comes from an adorable fluff ball named Maru. The reason I remember the Kanji '丸'.

`Click to watch the video. You must watch it!`

[![Maru](https://img.youtube.com/vi/JqTfk7Etr3c/0.jpg)](https://www.youtube.com/watch?v=JqTfk7Etr3c)
