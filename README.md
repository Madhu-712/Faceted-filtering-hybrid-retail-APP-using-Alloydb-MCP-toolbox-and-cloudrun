# Hybrid Search Retail Application

This project demonstrates a hybrid search application for a retail use case, leveraging AlloyDB, Gemini, and Cloud Run. The application combines traditional keyword-based search with contextual search (Vector Search) and faceted filtering to provide a more intuitive and accurate search experience.

## Getting Started

### Prerequisites

*   A Google Cloud Platform (GCP) project
*   gcloud CLI installed and configured
*   Java 21+
*   Maven

## Step-wise Execution

1.  **Set up AlloyDB:**
    *   Create an AlloyDB instance and a table to store the product data.
    *   Enable the `pgvector` and `google_ml_integration` extensions.
    *   Create indexes for text and image embeddings.

2.  **Set up the MCP Toolbox:**
    *   Deploy the MCP (Model Context Protocol) Toolbox for Databases to Cloud Run. This toolbox simplifies the integration of Generative AI and Agentic tools with AlloyDB.

3.  **Develop the Java Application:**
    *   Develop a Java application using Spring Boot to interact with the search system.
    *   The application should handle both keyword-based and vector-based searches.
    *   Implement faceted filtering to allow users to refine search results based on product attributes.

4.  **Deploy to Cloud Run:**
    *   Deploy the Java application to Cloud Run.

5.  **Demo:**
    *   Access the deployed application to test the hybrid search functionality.

## Cleanup

*   Follow the instructions in the codelab to clean up the deployed resources to avoid incurring further charges.
