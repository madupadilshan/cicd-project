pipeline {
    agent any // Jenkins server එකේම run වෙන්න

    stages {
        // 1. Code එක GitHub වලින් අරගන්නවා
        stage('1. Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/madupadilshan/cicd-project.git'
                // !!! 'YourUsername/cicd-project.git' වෙනුවට ඔබේ repo URL එක යොදන්න
            }
        }

        // 2. Docker 'මැජික් පෙට්ටිය' හදනවා
        stage('2. Build Docker Image') {
            steps {
                script {
                    // 'my-node-app' කියන්නේ අපි image එකට දෙන නම
                    sh 'docker build -t my-node-app .'
                }
            }
        }

        // 3. පරණ පෙට්ටිය අයින් කරලා, අලුත් එක දාලා run කරනවා
        stage('3. Deploy New Container') {
            steps {
                script {
                    // 'my-app-container' නමින් පරණ එකක් දුවනවනම්, නවත්තලා අයින් කරනවා
                    // '|| true' දාන්නේ එහෙම එකක් නැතත් error නොවී ඉන්න
                    sh 'docker stop my-app-container || true'
                    sh 'docker rm my-app-container || true'

                    // අලුතෙන් හදපු 'my-node-app' image එකෙන් 'my-app-container' නමින් අලුත් එකක් දුවවනවා
                    // -d = background එකේ දුවන්න
                    // -p 80:3000 = Server එකේ Port 80 එකට එන traffic, පෙට්ටිය ඇතුළේ Port 3000 ට යවන්න
                    // (අපේ app එක 3000න්, ලෝකෙට පේන්නේ 80න්)
                    sh 'docker run -d -p 80:3000 --name my-app-container my-node-app'
                }
            }
        }
    }
}