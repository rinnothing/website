# CV-website
The idea of the project is to create an easy to set up website for your CV

## Technologies
To do this I used docker compose with nginx and latex docker image from [kjarosh](https://github.com/kjarosh/latex-docker)

## How to use
- Clone the repo
- Put your .tex files into `latex` folder (for each .tex file you will receive one .pdf)
- Add your html to `front` folder
- Enter your port and domain name into `.env` file
- Run `make start`
- Run `make restart` to apply your changes
- If case something brakes you can run `make rebuild`

## Known issues
- [ ] Sometimes compose doesn't build `builder` image first and you need to build it explicitly
- [ ] Https not supported (plan to add nginx-proxy-manager)
- [ ] Sometimes you miss latex packages required to render pdf
- [ ] 404 page displays nothing
