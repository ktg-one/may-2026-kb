# **AI Opportunity Audit: Manaa Living**

## **🚀 Overview**

This repository contains the complete, branded, and interactive single-page AI Opportunity Audit report developed by Good AI Australia for the client, Manaa Living.

The project is designed as a comprehensive, self-contained multimedia briefing package. It translates the findings of the IA-AIOS (Industry-Adaptive AI Opportunity Scoring) framework into an engaging, client-friendly experience that includes:

* A branded, professional user interface matching the Manaa Living aesthetic.  
* Interactive data visualizations to break down the AI opportunity score.  
* An embedded audio overview and video instruction placeholder.  
* A context-aware chatbot to answer questions about the report's findings.  
* A client-side "Download All" feature to package the entire briefing for the client.

## **📁 Project Structure**

The project uses a clean, simple structure to keep all assets organized. Ensure your files are placed exactly as shown below for all features, including the download package, to work correctly.

manaa-ai-audit/  
├── Manaa\_Living\_AI\_Audit\_Report.docx  
├── index.html  
└── README.md  
└── assets/  
    ├── audio/  
    │   └── audio\_overview.mp3  
    └── video/  
        └── video\_instructions.mp4

## **🛠️ Getting Started**

This is a self-contained web application with no build process required.

1. **Clone the repository:**  
   git clone \<your-repo-url\>

2. **Navigate to the project directory:**  
   cd manaa-ai-audit

3. View the Report:  
   Open the index.html file in any modern web browser. For the "Download All" feature to function correctly (as it uses the fetch API), it's highly recommended to view the file through a local web server. The easiest way is using the Live Server extension in Visual Studio Code.

## **💻 Technologies Used**

* **HTML5:** For the core structure and content.  
* **Tailwind CSS:** For all utility-first styling.  
* **JavaScript (ES6+):** For interactivity, chart logic, and the download feature.  
* **Chart.js:** For responsive, interactive data visualizations.  
* **JSZip:** For client-side creation of the downloadable .zip package.

## **🚨 Action Required: Pre-Delivery Checklist**

Before sending the report to the client, you must add the final media and document assets. The report is already coded to look for them in specific locations.

* **\[ \] Add the Audio Overview:**  
  * **File:** audio\_overview.mp3  
  * **Location:** /assets/audio/  
* **\[ \] Add the Video Instructions:**  
  * **File:** video\_instructions.mp4 (or get the embed code from NotebookLM/YouTube).  
  * **Location:** /assets/video/  
  * **Action:** Replace the placeholder div in index.html with your \<video\> tag or embed code.  
* **\[ \] Add the Formal Report Document:**  
  * **File:** Manaa\_Living\_AI\_Audit\_Report.docx  
  * **Location:** The root project folder (alongside index.html).

## **✨ Key Features**

* **Branded UI & Color Scheme:** The entire report is styled to match the Manaa Living corporate brand for a seamless client experience.  
* **Interactive Data Visualizations:** Charts break down the AI score and industry-specific metrics, providing a clear data narrative.  
* **Multimedia Briefing:** Combines an autoplaying audio overview with a video placeholder to create a guided walkthrough of the findings.  
* **Context-Aware Chatbot:** An integrated AI assistant, pre-loaded with the report's key findings, allows the client to ask questions and get instant summaries.  
* **Client-Side Download Package:** The "Download All" button uses JSZip to fetch all project files (.html, .mp3, .mp4, .docx) and packages them into a single .zip file for the client to download directly from their browser.