# NodeBB

**WARNING: Test images only. Not intensively tested!**  
\
These two docker images provide a plug n' play installation of NodeBB.  
The [v1 image](v1/) provides an helper installation script and the entire nodebb package on a mounted volume.  
The [v2 image](v2/) provides a custom docker image with the specified NodeBB version and only necessary data for NodeBB on a mounted volume.

## ❓ Should I choose v1 or v2?

**v1** is simpler and has better support for plugins and source code modifications (because it is loaded from a mounted volume). This is similar to a non-Docker installation.

**v2** is the "traditional" way to use a program within Docker. The NodeBB volume contains only the forum data and to update it, the Docker base image must be updated. **It has not been fully tested and may contain bugs.**

## 🚀 Deploy

1. Choose between v1 or v2.
2. (***optional***) Create a `docker-compose.override.yml` file and edit it to suit your needs.
3. Copy `.env.example` to `.env` and edit it accordingly.
4. (***v1 only***) Run `docker compose up install`.
5. Run `docker compose up -d`.
