# Terraform Rancher Users

## Terraform 目标

批量创建用户

## How to run

**Things you'll need**

1. A URL to a running Rancher server
2. ADMIN bearer token for that Rancher

## terraform.tfvars Setup

This is how your `terraform.tfvars` file should look like.

```
rancher_url       = "url-to-your-rancher"
rancher_token_key = "bearer-token-you-create-in-rancher-ui"
user_count        = 1000
user_password     = "whatever-password-you-want-users-to-have"
```

## 如何执行terraform
```
# 初始化项目
terraform init

# 使用apply运行. 当 Terraform 要求您确认类型yes并按ENTER。
terraform apply -var-file="terraform.tfvars"
```

---

## 准备Terraform

参考文档：https://developer.hashicorp.com/terraform/downloads

## main.tf 配置详解

详细配置可以参考 [Rancher2 Provider 文档](https://registry.terraform.io/providers/rancher/rancher2/latest/docs)

<img width="1518" alt="image" src="https://github.com/rootwuj/rancher-tf-users/assets/42061003/f5ca9372-33f3-4fb7-aa40-749311b8dd87">

resource部分参考：

<img width="1550" alt="image" src="https://github.com/rootwuj/rancher-tf-users/assets/42061003/8fc3013d-b41c-4887-95b8-234f7432c5ca">

