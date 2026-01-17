# File Size Automation Project

This project describes a workflow for generating files of different sizes, managing them in a GitHub repository, and ensuring that large files are cleaned up automatically. The approach combines file generation, sorting, GitHub commits, repository cleanup using **BFG Repo-Cleaner**, and periodic automation with **CRON**.

---

## 📂 File Generation
- A dedicated folder is created to store files.
- Files of specific sizes are generated using operating system commands:
  - 10 files of 50MB each  
  - 20 files of 100MB each  
  - 30 files of 500MB each  
  - 5 files of 1GB each  
  - 3 files of 5GB each  
  - 1 file of 10GB  
- This ensures a diverse set of files for testing repository management with both small and very large files.

---

## 📊 Sorting Files
- Once files are created, all files larger than 50MB are identified.
- These files are sorted in decreasing order of size.
- The sorted list provides visibility into which files are the largest and most likely to cause issues in a GitHub repository.

---

## 🔗 GitHub Commit of Large File
- A large file greater than 2GB is committed to the GitHub repository.
- This step demonstrates how oversized files can enter version control and highlights the challenges they create.

---

## 🧹 Repository Cleanup with BFG
- The large file is removed from the repository.
- **BFG Repo-Cleaner** is used to clean the repository history and eliminate traces of the oversized file.
- After cleanup, Git garbage collection is performed to optimize the repository and ensure it is free of unnecessary large blobs.

---

## ⏱️ CRON Automation
- A CRON job is scheduled to run periodically.
- The CRON process performs two key tasks:
  1. **Detection and Cleanup of Large Files**  
     - If files larger than 2GB are found, they are removed from the repository.  
     - BFG Repo-Cleaner is executed to clean the history.  
     - The repository is force-pushed to ensure the cleanup is reflected remotely.  
  2. **Commit of Small Files (<50MB)**  
     - Files smaller than 50MB are automatically committed and pushed to the repository.  
     - This ensures that only manageable files are tracked in GitHub.

---
<img width="1479" height="375" alt="Screenshot 2026-01-17 140235" src="https://github.com/user-attachments/assets/19b2ad13-73ce-4a73-8625-119673045a0a" />
<img width="1484" height="747" alt="Screenshot 2026-01-17 125118" src="https://github.com/user-attachments/assets/dc31f5ae-4171-4792-9521-a4b72386ee0b" />
<img width="1323" height="847" alt="Screenshot 2026-01-17 125133" src="https://github.com/user-attachments/assets/773d36a5-0030-4504-b097-affecbee6c64" />

## 🛠 Requirements
- **Git** installed and configured with access to your repository.
- **Java** installed (required for running BFG Repo-Cleaner).
- **BFG Repo-Cleaner** downloaded from the [official site](https://rtyley.github.io/bfg-repo-cleaner).
- **CRON** available on the operating system to schedule periodic tasks.

---

## ✅ Summary
This project demonstrates:
- How to generate files of varying sizes for testing.
- How to identify and sort files larger than 50MB.
- The impact of committing oversized files (>2GB) to GitHub.
- How to clean up repositories using BFG Repo-Cleaner.
- How to automate detection, cleanup, and commits with CRON.

By following this workflow, repositories remain clean, efficient, and free from problematic large files, while still tracking smaller files that are safe to commit.

