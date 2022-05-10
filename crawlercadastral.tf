resource "aws_glue_crawler" "crowler_cadastral_conversor_completo" {
  database_name = "banco_bonus"
  name          = "crowler_cadastral_conversor_completo"
  role = "arn:aws:iam::colocarigualoutroscrawlers"
  table_prefix = "tb_"

  s3_target {
    path = "s3://colocarigualoutros/bonus/cadastral/cadastral_conversor/"
  }
}