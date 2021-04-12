# Essa função processa a quantidade de jogadores a cada time de forma decrescente e jogando
# a saida em um arquivo csv para uso em relatórios, gráficos ou ferramentas de analytics
from pyspark import SparkContext, SparkConf
from pyspark.shell import spark, sqlContext
from pyspark.sql import SQLContext

conf = SparkConf().setAppName("PySparkShell")
df = spark.read.csv('/home/lucas/spark/players.csv', header=True)
df = df.groupBy("team").count().orderBy("count", ascending=False).repartition(1).write.format("com.databricks.spark.csv").option("header", "true").save("teamVsPlayersNumbers")