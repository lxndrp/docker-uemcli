# docker-uemcli
A Docker container to simplify running EMC's `uemcli` utility for the management of VNX-based storage systems.

## Requirements
A few things are required to use this utility on your machine:
 - a fairly recent [Docker installation](https://www.docker.com/community-edition#/download)
 - a compatible EMC storage system (e.g. the EMC Unity® family)
 - the [binary RPM package](https://download.emc.com/downloads/DL69818_Unity-Unisphere-UEM-CLI-(Redhat-Linux-32-bit).rpm) of `uemcli` from EMC (you will actually have to login)

Note that `uemcli` **will not work** on VNXe systems.

## Installation and Usage
Because I can't redistribute the original RPM, you have to build your own local Docker image, like so:
 1. Clone this repository.
 2. Drop the downloaded RPM in the same folder as the `Dockerfile`.
 3. Open a shell and run
 ```bash
 docker image build . -t local/uemcli:<yourversion> -t local/uemcli:latest
 ```

After that, you can execute
```bash
docker run -ti --rm --volume ~/.emc:/root/.emc local/uemcli
```
on your favourite shell.

During the first run, `uemcli` will (provided that you successfully login to your storage system **and** pass the `--save-user` switch to it) store your encrypted credentials on the mounted container volume. Subsequent runs will pick them up and use them to seamlessly authenticate you.

If you happen to be lazy, feel free to take a look at the uemcli.alias (using the `alias` BUILTIN of `sh(1)` under *NIX) or uemcli.alias.cmd (using the `DOSKEY` utility under Windows) file; make sure that it gets processed by your shell, and you can run the command by it's name directly.

Note that this is not a tutorial on how to use `uemcli`; EMC did a great job in writing a comprehensive [user manual](https://www.emc.com/collateral/TechnicalDocument/docu69330.pdf); for quick help, try to run
```bash
$ uemcli -help
```
to get a few details on the most common parameters and switches, but since the command is quite powerful, I recommend you to [RTFM](http://www.urbandictionary.com/define.php?term=RTFM).

## Contributing
If you happen to find a bug or have a suggestion for improvement, feel free to open an issue. Thanks!