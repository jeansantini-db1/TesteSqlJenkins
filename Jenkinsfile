pipeline {
  agent {
    dockerfile {
      filename 'jenkins/Dockerfile'
    }
  }

  environment {
    GITHUB_REPO = 'jeansantini-db1/TesteSqlJenkins'
    GITHUB_TOKEN = credentials('github_token')
    ORACLE_CONN = 'localhost:1521/ORCLCDB'
  }

  stages {
    stage('Executar scripts Oracle') {
      steps {
        dir('.') {
          withCredentials([usernamePassword(credentialsId: 'oracle-cred', usernameVariable: 'ORACLE_USER', passwordVariable: 'ORACLE_PASS')]) {
            sh '''
              echo "set define off;" > exec.sql
              for file in dev/*.sql; do
                echo "-- Executando $file" >> exec.sql
                cat "$file" >> exec.sql
                echo -e "\n\n" >> exec.sql
              done
              sqlplus -S $ORACLE_USER/$ORACLE_PASS@$ORACLE_CONN @exec.sql
            '''
          }
        }
      }
    }
  }

  post {
    failure { echo "❌ Algo deu errado na execução dos scripts." }
    success { echo "✅ Scripts executados com sucesso." }
  }
}
