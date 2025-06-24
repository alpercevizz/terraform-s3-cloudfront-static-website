# Terraform Static Website Hosting on AWS with S3 and CloudFront

This project demonstrates how to host a static website on **Amazon S3** and serve it via **Amazon CloudFront** using **Terraform**. The architecture ensures secure, performant, and scalable static content delivery.

---

## 📁 Project Structure

```bash
terraform-static-site/
├── aws/
│   ├── main.tf
│   ├── s3.tf
│   ├── cloudfront.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── objects.tf
│   └── index.html
├── README.md
└── .gitignore
```

---

## 🚀 What It Does

- Creates an S3 bucket configured for static website hosting
- Uploads a sample `index.html` file
- Configures CloudFront with Origin Access Control (OAC)
- Blocks public access to the S3 bucket
- Delivers content over HTTPS via CloudFront

---

## ⚙️ How to Deploy

### 1. Clone the Repository
```bash
git clone https://github.com/alpercevizz/terraform-static-site.git
cd terraform-static-site/aws
```

### 2. Initialize Terraform
```bash
terraform init
```

### 3. Plan and Apply
```bash
terraform plan
terraform apply
```

> 💡 Ensure your AWS CLI is configured with appropriate permissions (`s3:*`, `cloudfront:*`).

---

## 🌐 Live Site Example

Once deployed, you’ll get a CloudFront domain like:
```
d1234example.cloudfront.net
```
Open this in your browser to see your static website.

---

## 🔐 Security Considerations

- Uses **OAC (Origin Access Control)** instead of older S3 bucket policies
- Bucket is private
- Only CloudFront can access the S3 content securely

---

## 📦 Built With

- **Terraform**
- **AWS S3**
- **AWS CloudFront**
- **Origin Access Control (OAC)**

---

## 🧠 Future Improvements

- [ ] Add GitHub Actions for CI/CD
- [ ] Add custom domain with SSL using Route 53 + ACM
- [ ] Implement Azure equivalent using `azurerm` provider

---

## 📝 License

MIT License

---

Feel free to fork this project and make it your own! Happy hosting ☁️
