#include <iostream>
#include <regex>
#include <fstream>
#include <string>

bool is_blacklisted(const std::string &item, const std::string &listfile) {
    std::ifstream f(listfile);
    if(!f) return false;
    std::string line;
    while(std::getline(f, line)) {
        if(line.size() && item.find(line) != std::string::npos) return true;
    }
    return false;
}

void onMessageReceived(const std::string &msg, const std::string &sender) {
    std::regex url_regex("(https?://\\S+)");
    std::smatch m;
    std::string s = msg;
    while(std::regex_search(s, m, url_regex)) {
        std::string url = m[1];
        std::cout << "Found URL: " << url << std::endl;
        if(is_blacklisted(url, "/etc/namoos/antivirus/urls.blacklist")) {
            std::cout << "URL is blacklisted. Blocking and warning user." << std::endl;
            // TODO: notify UI
        } else {
            // call sandbox checker (simplified)
            std::string cmd = std::string("/usr/bin/link_sandbox ") + url;
            system(cmd.c_str());
        }
        s = m.suffix();
    }
    if(is_blacklisted(sender, "/etc/namoos/antivirus/numbers.blacklist")) {
        std::cout << "Sender number is blacklisted: " << sender << std::endl;
    }
}
