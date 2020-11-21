#!/bin/bash

sudo docker-compose down 
sudo docker-compose up -d 
sudo docker-compose exec my5gcore-ue sh  
