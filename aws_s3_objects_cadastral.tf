resource "aws_s3_bucket_object" "file_job_conversor_cadastral_1" {
  bucket = "pessoajuridicaMUDAR"
  key    = "/scripts/job_conversor_cadastral_1.py"
  source = "scripts/job_conversor_cadastral_1.py"

}
resource "aws_s3_bucket_object" "job_conversor_cadastral_2" {
  bucket = "MUDAR"
  key    = "/scripts/job_conversor_cadastral_2.py"
  source = "scripts/job_conversor_cadastral_2.py"

}

resource "aws_s3_bucket_object" "job_conversor_cadastral_3" {
 bucket = "mudar, bucket so primeiro nome sem s3://" 
  key    = "/scripts/job_conversor_cadastral_3.py"
  source = "scripts/job_conversor_cadastral_3.py"

}
resource "aws_s3_bucket_object" "job_conversor_cadastral_4" {
  bucket = "mudar, bucket so primeiro nome sem s3://" 
  key    = "/scripts/job_conversor_cadastral_4.py"
  source = "scripts/job_conversor_cadastral_4.py"

}


fazer do 5 ao 10
