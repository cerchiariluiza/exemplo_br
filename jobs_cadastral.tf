

resource "aws_glue_job" "job_conversor_cadastral_1" {
  name     = "job_conversor_cadastral_1"

  role_arn = "arn:aws:iam:colocar igual outros jobsva"
  #toDO
  glue_version = "3.0"
  max_retries  = 1
  timeout      = 2880
  worker_type = "G.1X"
  number_of_workers = 2
	
  command {
    script_location = "s3://pessoajuridica-INTERPOLAR/scripts/job_conversor_cadastral_1.py"
	#todo
	python_version = "3"
  }
    default_arguments = {
	#todo
    # ... PROCURAR GRUPO DE LOGS
    "--continuous-log-logGroup"          = "MUDARarn:aws:logs:us-east-1:626768611881:log-group:/aws-glue/jobs/logs-v2:*"
    "--enable-continuous-cloudwatch-log" = "true"
    "--enable-continuous-log-filter"     = "true"
    "--enable-metrics"                   = "true"
  }
}



resource "aws_glue_job" "job_conversor_cadastral_2" {
  name     = "job_conversor_cadastral_2"

  role_arn = "arn:aws:iam:colocar igual outros jobsva"
  #toDO
  glue_version = "3.0"
  max_retries  = 1
  timeout      = 2880
  worker_type = "G.1X"
  number_of_workers = 2
	
  command {
    script_location = "s3://mudar/scripts/job_conversor_cadastral_2.py"
	#todo
	python_version = "3"
  }
    default_arguments = {
	#todo
    # ... potentially other arguments ...
    "--continuous-log-logGroup"          = "MUDARarn:aws:logs:us-east-1:626768611881:log-group:/aws-glue/jobs/logs-v2:*"
    "--enable-continuous-cloudwatch-log" = "true"
    "--enable-continuous-log-filter"     = "true"
    "--enable-metrics"                   = "true"
  }
}

resource "aws_glue_job" "job_conversor_cadastral_3" {
  name     = "job_conversor_cadastral_3"

  role_arn = "arn:aws:iam:colocar igual outros jobsva"

  glue_version = "3.0"
  max_retries  = 3
  timeout      = 2880
  worker_type = "G.1X"
  number_of_workers = 2
	
  command {
    script_location = "s3://mudar/scripts/job_conversor_cadastral_3.py"
	#todo
	python_version = "3"
  }
    default_arguments = {
	#todo
    # ... potentially other arguments ...
    "--continuous-log-logGroup"          = "arn:aws:logs:us-east-1:626768611881:log-group:/aws-glue/jobs/logs-v2:*"
    "--enable-continuous-cloudwatch-log" = "true"
    "--enable-continuous-log-filter"     = "true"
    "--enable-metrics"                   = "true"
  }
}


resource "aws_glue_job" "job_conversor_cadastral_4" {
  name     = "job_conversor_cadastral_4"

  role_arn = "arn:aws:iam:colocar igual outros jobsva"
  #toDO
  glue_version = "3.0"
  max_retries  = 1
  timeout      = 2880
  worker_type = "G.1X"
  number_of_workers = 2
	
  command {
    script_location = "s3://mudar/scripts/job_conversor_cadastral_4.py"
	#todo
	python_version = "3"
  }
    default_arguments = {
	#todo
    # ... potentially other arguments ...
    "--continuous-log-logGroup"          = "arn:aws:logs:us-east-1:626768611881:log-group:/aws-glue/jobs/logs-v2:*"
    "--enable-continuous-cloudwatch-log" = "true"
    "--enable-continuous-log-filter"     = "true"
    "--enable-metrics"                   = "true"
  }
}

fazer do 5 ao 10








