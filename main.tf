module "react_frontend" {
    source ="./modules/s3-website"
    bucket_name = "alireza-cyf-react-app"

}

output "frontend_url"{
    value module.react_frontend.website_endpoint
}