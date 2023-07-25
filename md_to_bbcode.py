# Small script to convert the README.md to bbcode for planetminecraft page

from selenium import webdriver



def md_to_bbcode(md):
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_argument("--headless")
    driver = webdriver.Chrome(options=chrome_options)
    driver.get("https://mm2bc.ustc-zzzz.net/")
    driver.execute_script("window.localStorage.setItem('markdownInput', arguments[0]);", md)
    driver.refresh()
    # /html/body/main/div/div[2]/p/p
    bbcode = driver.find_element("xpath", "/html/body/main/div/div[2]/p/p").text
    driver.close()
    return bbcode
    



with open("README.md", "r") as f:
    md = f.read()

# Remove banner
md=md.replace("![Banner](https://raw.githubusercontent.com/edayot/SimpleDrawer/master/images/simple_drawer.png)","")

bbcode = md_to_bbcode(md)

with open("README.bbcode", "w") as f:
    f.write(bbcode)



