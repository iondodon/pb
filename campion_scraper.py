from selenium import webdriver

from webdriver_manager.chrome import ChromeDriverManager
from bs4 import BeautifulSoup
from selenium.webdriver.common.by import By
import os
import time


DOMAIN = 'http://campion.edu.ro/arhiva/'
PROBLEMS_DIRECTORY = './problems/campion'
PARSER_DRIVER = webdriver.Chrome(ChromeDriverManager().install())


def login():
    PARSER_DRIVER.get('http://campion.edu.ro/arhiva/index.php?page=connect&action=view')
    username = PARSER_DRIVER.find_element(by=By.XPATH, value='//*[@id="ilogin"]')
    password = PARSER_DRIVER.find_element(by=By.XPATH, value='/html/body/div[2]/table/tbody/tr[2]/td[2]/form/div[3]/table/tbody/tr[2]/td[3]/input')
    submit = PARSER_DRIVER.find_element(by=By.XPATH, value='/html/body/div[2]/table/tbody/tr[2]/td[2]/form/div[3]/table/tbody/tr[3]/td[2]/input')

    username.send_keys('username')
    password.send_keys('password')
    submit.click()


def open_solved_problems_page():
    PARSER_DRIVER.get('http://campion.edu.ro/arhiva/')
    solved_problems_page = PARSER_DRIVER.find_element(by=By.XPATH, value='/html/body/div[1]/div[2]/b/a')
    solved_problems_page.click()


def get_problem_description_html(problem_link):
    PARSER_DRIVER.get(problem_link)
    problem_description = PARSER_DRIVER.find_element(by=By.XPATH, value='/html/body/div[2]/table/tbody/tr[2]/td[2]')
    return problem_description


def get_solution(tests_link):
    PARSER_DRIVER.get(tests_link)
    language = PARSER_DRIVER.find_element(by=By.XPATH, value='/html/body/div[2]/table/tbody/tr[2]/td[2]/div[2]/table/tbody/tr[3]/td[2]/span').text
    source_code_link = PARSER_DRIVER.find_element(by=By.XPATH, value='/html/body/div[2]/table/tbody/tr[2]/td[2]/div[2]/table/tbody/tr[4]/td[4]/a').get_attribute('href')
    source_code = get_source_code(source_code_link)
    return language, source_code


def get_source_code(source_code_link):
    # wait for page to load
    print(source_code_link)
    PARSER_DRIVER.get(source_code_link)
    return PARSER_DRIVER.find_element(by=By.CLASS_NAME, value='sh_sourceCode').text

    
def process_solved_problems():
    solved_problems_table = PARSER_DRIVER.find_element(by=By.XPATH, value='/html/body/div[2]/table/tbody/tr[2]/td[2]/div[3]/table')
    solved_problems_table_html = solved_problems_table.get_attribute('innerHTML')

    soup = BeautifulSoup(solved_problems_table_html, 'html.parser')

    for tr in soup.find_all('tr')[1:]:
        problem_name_column = tr.find_all('td')[1]
        problem_name = problem_name_column.get_text()

        if folder_exists(problem_name):
            print('Problem already exists: ' + problem_name)
            continue

        problem_link = DOMAIN + problem_name_column.find('a').get('href')

        tests_link = DOMAIN + tr.find_all('td')[7].find('a').get('href')
        language, source_code = get_solution(tests_link)

        problem_description_html = get_problem_description_html(problem_link)

        save_problem(problem_name, problem_description_html, language, source_code)


def folder_exists(folder_name):
    return os.path.isdir(PROBLEMS_DIRECTORY + '/' + folder_name)


def save_problem(problem_name, problem_description_html, language, source_code):
    folder_name = problem_name.replace(' ', '_')
    os.mkdir(PROBLEMS_DIRECTORY + '/' + folder_name)

    with open(PROBLEMS_DIRECTORY + '/' + folder_name + '/problem_name.html', 'w') as f:
        f.write(problem_description_html.get_attribute('innerHTML'))
    with open(PROBLEMS_DIRECTORY + '/' + folder_name + '/problem_name.' + language, 'w') as f:
        f.write(source_code)


def main():
    login()
    open_solved_problems_page()
    process_solved_problems()



if __name__ == '__main__':
    main()
    PARSER_DRIVER.quit()
