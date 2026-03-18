# 🚀 SpaceX Launches

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
  <img src="https://img.shields.io/badge/BLoC-5eb1ff?style=for-the-badge&logo=bloc&logoColor=white" />
  <img src="https://img.shields.io/badge/Dio-FF6F61?style=for-the-badge" />
</p>

<p align="center">
  Flutter test-task application for exploring SpaceX rocket launches with smooth animations and clean architecture.
</p>

---

## 📱 App Preview

<p align="center">
  <img src=".github/assets/spacex_test_task.gif" width="350" style="border-radius:12px; box-shadow:0 6px 15px rgba(0,0,0,0.25);" />
</p>

---

## ✨ Overview

This project is a **test task implementation** based on a Figma design and SpaceX API.

The goal was to build a **single-screen application** that displays rockets and their launches with a focus on:

- smooth UI interactions  
- clean and scalable architecture  
- accurate design implementation  

---

## 🚀 Key Features

* 🚀 **Animated Rocket Slider**  
  Custom `PageView` with scaling effect — selected rocket is highlighted while side items are reduced  

* 🔄 **Dynamic Data Loading**  
  Launches are automatically fetched when the selected rocket changes  

* 📦 **Launch List**  
  Displays formatted date, mission name, and launch site  

* 🌐 **External Navigation** *(optional feature)*  
  Open launch details in Wikipedia  

* 🎨 **Pixel Perfect UI**  
  Fully implemented according to Figma (spacing, colors, typography, shadows)  

---

## 🏗 Architecture

The project follows a **Feature-Driven Architecture** with separation of concerns.

### 🔧 Technical Highlights

* **BLoC** — state management without UI coupling  
* **GetIt** — dependency injection  
* **Dio** — API layer with DTO models  
* **PageController** — custom slider behavior & animation  
* **Reactive UI updates** based on selected rocket  

---

## 🛠 Tech Stack

| Category | Technology |
| :--- | :--- |
| **Framework** | Flutter |
| **Language** | Dart |
| **State Management** | BLoC |
| **Networking** | Dio |
| **Dependency Injection** | GetIt |
| **API** | SpaceX API |

---

## 🎨 Design Implementation

* Based on Figma test task  
* Dark theme UI  
* Accurate spacing, shadows and layout  
* Custom scaling animation for carousel  
* Typography aligned with design specs  

---

## 🎯 What This Project Demonstrates

* Working with real REST API  
* Building custom UI components (carousel with animation)  
* State synchronization between UI and data layer  
* Clean architecture for scalable apps  
* Attention to detail in UI implementation  

---

## 🔧 Notes

This project was created as a **test task** and is used as a portfolio example.  

For convenience of review, environment configuration is included in the repository.