# This script can be used to test the load of a dummy authenticated JupyterHub
# It was written to test the load on various Google Cloud configurations.

from selenium import webdriver
import argparse

parser = argparse.ArgumentParser(description='Arguments to add users to jhub.')
parser.add_argument('--n', type=int, help='Number of users to add.')
parser.add_argument('--address', type=str, help='Location of jhub.')
parser.add_argument(
    '--startid',
    type=int,
    help='ID number to start users (int).')

args = parser.parse_args()


def add_user(address, username):
    '''
    Adds one user to the provided address with the provided username.
    Assumes this is for testing purposes and uses 'test' as password.
    '''
    driver = webdriver.PhantomJS()
    driver.set_window_size(1120, 550)
    driver.get(address)

    driver.find_element_by_id("username_input").send_keys(username)
    driver.find_element_by_id("password_input").send_keys("test")
    driver.find_element_by_id("login_submit").click()
    driver.find_element_by_id("start").click()


def add_n_users(n, address, start_id):
    '''
    Adds n number of users to given address starting with the provided id.
    Uses function 'add_user' above.
    '''
    for i in range(n):
        add_user(address=address, username="user" + str(start_id))
        start_id += 1

    print("Last start id: " + str(start_id - 1))

if __name__ == "__main__":
    add_n_users(n=args.n, address=args.address, start_id=args.startid)
