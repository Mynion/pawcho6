#Sprawozdanie – Laboratorium 6

##Budowa obrazu
DOCKER_BUILDKIT=1 docker build --ssh default -t ghcr.io/mynion/lab6:latest .

##Wysłanie obrazu
docker push ghcr.io/mynion/lab6:latest

##Obraz został opublikowany w GitHub Container Registry:
ghcr.io/mynion/lab6:latest

##Uruchomienie serwera
docker run -d -p 8080:80 --name lab6 ghcr.io/mynion/lab6:latest

##Wynik działania
<img width="671" height="411" alt="image" src="https://github.com/user-attachments/assets/ea55bc99-f9c9-45d8-bfa6-6a1e3cae7477" />

<img width="1449" height="69" alt="image" src="https://github.com/user-attachments/assets/51fb8105-9ebf-4fb6-bb3f-d6619a3e24e0" />
