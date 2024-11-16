Extract
Extract is a Flutter-based mobile application that allows users to upload images, extract text from them using Google’s Machine Learning Kit, and manage these images in a Google Cloud Storage bucket.

Features:
Image-to-Text Conversion: Users can upload images, and the app extracts text from the images using Google ML Kit.

Image Management:
Upload images to a Google Cloud Storage bucket.
View a list of previously uploaded images.
Delete images stored in the bucket.


Technologies Used:
Frontend: Flutter
Backend: PHP deployed on Google App Engine
Cloud Services: Google Cloud Storage, App Engine
Machine Learning: Google ML Kit


Setup Instructions:
Prerequisites
Flutter SDK installed on your local machine.
A Google Cloud project with:
A Cloud Storage bucket created.
App Engine configured with the backend deployed.
A service account key for local testing.
