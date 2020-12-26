# Glanfile

Simple scripts using EXIF tools to automatically scrub pictures/files of any EXIF data. Good for running on a cloud server where you don't want to worry about removing EXIF from files off all your devices.

## Dependancies
* exiftools
* inotify-tools

## Setting up

This repo contains two shell scripts (one for removing all EXIF data and one for monitoring) and a SystemD service file that runs the monitoring shell script. First thing you'll need to do is clone the Repo.

```
git clone https://github.com/CoogyEoin/Glanfile.git
```

Next thing is you'll need to copy the shell scripts into your **/usr/local/bin/** directory so they can be ran and the glanfile.service file into your **/etc/systemd/system** file so SystemD can run it.

```
cp monitor_exif.sh /usr/local/bin/
cp remove_bulk_data.sh /usr/local/bin/
cp glanfile.service /etc/systemd/system/
```

Edit your monitoring_exif.sh script and **put the directory you want to monitor as the my_directory variable**. It won't work otherwise. Then just enable and start the service and you should be good to go.

```
systemctl daemon-reload
systemctl enable glanfile
systemctl start glanfile
```

If all goes well then every time you add a new file the EXIF data will be removed. To remove all the data initially you can run the below command.

```
/usr/local/bin/remove_bulk_data.sh -d <Whatever your directory is>
```

Stay happy and stay private.
