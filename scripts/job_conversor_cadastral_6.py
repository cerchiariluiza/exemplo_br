import datetime
import json
from pprint import pprint
from pyspark.sql.functions import lit
import boto3
import pyspark.sql.functions as f 
from pyspark.sql import Window
import sys
from awsglue.job import Job
from awsglue.transforms import *
from awsglue.context import GlueContext
from pyspark.context import SparkContext
from awsglue.utils import getResolvedOptions
from awsglue.dynamicframe import DynamicFrame
from pyspark.sql.types import ArrayType, StructField, StructType, StringType, IntegerType, DoubleType
from pyspark.sql.functions import col
from pyspark.sql.types import StringType,BooleanType,DateType
from pyspark.sql.functions import lit
from pyspark.sql.functions import col
from pyspark.sql.types import StringType,BooleanType
# #inicio job
args = getResolvedOptions(sys.argv, ['JOB_NAME'])
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
environment = 'der' 
AWS_REGION = "us-east-1"

#config datas
dt_yesterday_referencia = datetime.datetime.now() - datetime.timedelta(days=1)
year_yesterday_referencia = dt_yesterday_referencia.year
month_yesterday_referencia = str(dt_yesterday_referencia.month).zfill(2)
day_yesterday_referencia= str(dt_yesterday_referencia.day).zfill(2)
date_yesterday_referencia = "%s%s%s" % (year_yesterday_referencia,  month_yesterday_referencia, day_yesterday_referencia)
date_yesterday_referencia_query = "%s%s%s%s%s%s" % (year_yesterday_referencia,"-",month_yesterday_referencia,"-",day_yesterday_referencia, '%')
date_today_processamento  = datetime.datetime.now() - datetime.timedelta(days=0)
year_today_processamento = date_today_processamento.year
month_today_processamento = str(date_today_processamento.month).zfill(2)
day_today_processamento = str(date_today_processamento.day).zfill(2)
date_today_processamento = "%s%s%s" % (year_today_processamento, month_today_processamento, day_today_processamento)

# #parameter store tipos de bonus
AWS_REGION = "us-east-1"
ssm_client = boto3.client("ssm", region_name=AWS_REGION)
investimento_parametrizado = ssm_client.get_parameter(Name='I',WithDecryption=False)
fopa_parametrizado = ssm_client.get_parameter(Name='F',WithDecryption=False)
# boleto_parametrizado = ssm_client.get_parameter(Name='M',WithDecryption=False)
rede_parametrizado = ssm_client.get_parameter(Name='R',WithDecryption=False)

# # #base_outros_bonus
# select = glueContext.create_dynamic_frame.from_catalog(database = "banco_bonus", table_name = "receptor")
# select.toDF().createOrReplaceTempView("view")
# query= "SELECT * FROM view"
# busca = spark.sql(query)

          
                    
fonte_em_avro = glueContext.create_dynamic_frame_from_options("s3",
{'paths': ["s3://mudar/boletos/"],
'exclusions':\
 "[\"s3://mudar/boletos/0000+*\",\"s3://mudar/boletos/000000+ (1*\",\"s3://mudar/boletos/000000+ (2*\",\"s3://mudar/boletos/000000+ (3*\",\"s3://mudar/boletos/000000+ (4*\",\"s3://mudar/boletos/000000+ (0*\",\"s3://mudar/boletos/000000+ (7*\",\"s3://mudar/boletos/000000+ (8*\",\"s3://mudar/boletos/000000+ (9*\"]",
'recurse':True,\
'groupFiles': 'inPartition',
'groupSize': '1048576'}, \
format="json",\
transformation_ctx = "fonte_em_avro")

busca = fonte_em_avro.toDF()
# fonte.show()
busca.show()

df = busca.withColumn('year', lit(year_yesterday_referencia))\
                                        .withColumn('month', lit(month_yesterday_referencia))\
                                        .withColumn('day', lit(day_yesterday_referencia))\


BUCKET_OUTPUT_DF= '%s%s' % ('s3://mudar', 'r')
output_sumarizador= '%s%s' % (BUCKET_OUTPUT_DF,'/bonus/conversor')
from awsglue.dynamicframe import DynamicFrame
dif = DynamicFrame.fromDF(df, glueContext, 'test_nest')
datasink= glueContext.write_dynamic_frame.from_options(frame = dif,\
connection_type = 's3', \
connection_options = {'path': output_sumarizador,\
    'compression': 'snappy',\
      'partitionKeys': ['year', 'month', 'day']},
    format='glueparquet',
transformation_ctx = 'datasink')


job.commit()