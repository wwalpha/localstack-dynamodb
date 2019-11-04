# Localstack DynamoDB Endpoint with AWS Fargate

Lambda 自動テストの一環として、テストデータを含めた Dynamodb Endpoint を高速かつ廉価で提供するを目的とする

## なぜやるのか

CI/CD の自動テストで AWS DynamoDB を使った場合、いくつ課題がある

- ダブル DynamoDB Resource 確保にコストがかかる
- 同じ AWS Account で DynamoDB 使う場合、テーブル名も変わり、Lambda の環境変数も変更が必要
- 初期データの投入時間が長い、Build 時間が長くなる

## なにをやるのか

- Localstack 立ち上げ、初期データの投入
- データ入りの Docker Image を作成し、AWS/GCP で管理
- Terraform で AWS Fargate/GCP CloudRun を作成し、Endpoint を提供する
- 再起動すると、再利用が可能

## どこでやるのか

Public Cloud Container Service、且つ 高速プロビジョニング

- AWS Fargate
- GCP Cloud Run

## どう使うのか
