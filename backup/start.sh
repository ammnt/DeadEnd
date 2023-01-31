#/bin/sh
cd ./backup

wget -nv -q --https-only --show-progress -O - "https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt" > AdGuardSDNSFilter.txt 
wget -nv -q --https-only --show-progress -O - "https://adaway.org/hosts.txt" > adaway_hosts.txt
wget -nv -q --https-only --show-progress -O - "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=adblockplus&showintro=1&mimetype=plaintext" > peter_lowes.txt
wget -nv -q --https-only --show-progress -O - "https://raw.githubusercontent.com/StevenBlack/hosts/master/data/StevenBlack/hosts" > StevenBlack_adhoc.txt
wget -nv -q --https-only --show-progress -O - "https://www.github.developerdan.com/hosts/lists/ads-and-tracking-extended.txt" > ads-tracking_extended.txt
wget -nv -q --https-only --show-progress -O - "https://raw.githubusercontent.com/notracking/hosts-blocklists/master/hostnames.txt" > notracking.txt
wget -nv -q --https-only --show-progress -O - "https://gitlab.com/quidsup/notrack-blocklists/-/raw/master/trackers.hosts" > notrack.txt
wget -nv -q --https-only --show-progress -O - "https://raw.githubusercontent.com/d3ward/toolz/master/src/d3host.txt" > d3host.txt
wget -nv -q --https-only --show-progress -O - "https://someonewhocares.org/hosts/zero/hosts" > dan_pollocks_someonewhocares.txt
wget -nv -q --https-only --show-progress -O - "https://winhelp2002.mvps.org/hosts.txt" > mvps_winhelp2002.txt
wget -nv -q --https-only --show-progress -O - "https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt" > disconnect_ad.txt
wget -nv -q --https-only --show-progress -O - "https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt" > disconnect_tracking.txt
wget -nv -q --https-only --show-progress -O - "https://s3.amazonaws.com/lists.disconnect.me/simple_malvertising.txt" > disconnect_malvertising.txt
wget -nv -q --https-only --show-progress -O - "https://raw.githubusercontent.com/bcye/Hello-Goodbye/master/pihole.txt" > Hello-Goodbye.txt
wget -nv -q --https-only --show-progress -O - "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.2o7Net/hosts" > add_2o7Net.txt
wget -nv -q --https-only --show-progress -O - "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/UncheckyAds/hosts" > UncheckyAds.txt
wget -nv -q --https-only --show-progress -O - "https://raw.githubusercontent.com/pafnuty/onlineConsultantBlocker/master/hosts" > onlineConsultantBlocker.txt
wget -nv -q --https-only --show-progress -O - "https://raw.githubusercontent.com/acuna-public/CallbackWidgetsBlocker/master/callbacks.txt" > CallbackWidgetsBlocker.txt
wget -nv -q --https-only --show-progress -O - "https://blocklistproject.github.io/Lists/ads.txt" > blocklistproject_ads.txt
wget -nv -q --https-only --show-progress -O - "https://blocklistproject.github.io/Lists/tracking.txt" > blocklistproject_tracking.txt
wget -nv -q --https-only --show-progress -O - "https://raw.githubusercontent.com/p-mng/hosts-file-backup/master/ad_servers.txt" > hphosts_adservers.txt
wget -nv -q --https-only --show-progress -O - "https://raw.githubusercontent.com/AdguardTeam/cname-trackers/master/combined_disguised_trackers.txt" > adguard_cname.txt
wget -nv -q --https-only --show-progress -O - "https://raw.githubusercontent.com/nextdns/cname-cloaking-blocklist/master/domains" > nextdns_cname.txt
wget -nv -q --https-only --show-progress -O - "https://gist.githubusercontent.com/ammnt/8b3d07a0ecdb48fe0f7e289525a11446/raw/4ff2818cc1aa12b5e9da2aeeb467cdc2fe8197f4/orwell1984.txt" > orwell1984.txt
wget -nv -q --https-only --show-progress -O - "https://antipopads-re.energized.pro/formats/filter.txt" > antipopads_re.txt

echo "Update completed..."
exit 0