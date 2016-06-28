import unittest
import os
from selenium import webdriver
from time import sleep

class TestClaimsLogin(unittest.TestCase):

    def setUp(self):
        self.driver = webdriver.PhantomJS()
        self.ip = os.environ.get('DOCKER_IP', '172.17.0.1')

    def test_verify_main_screen_loaded(self):
        self.driver.get('http://%s/eclaim/login/' % self.ip)

        self.driver.find_element_by_id('id_user_name').send_keys("implementer")
        self.driver.find_element_by_id('id_password').send_keys("eclaim_implementer")
        self.driver.find_element_by_css_selector('button.btn.btn-primary').click()
        self.driver.implicitly_wait(30)
        greeting = self.driver.find_element_by_id("user-greeting")
        self.assertTrue(greeting.is_displayed())
        self.assertEqual(greeting.text, u'Hello, Implementer ()')
        # import ipdb; ipdb.set_trace()
        self.driver.execute_script("set_language('ms')")
        sleep(5)
        self.assertEqual(self.driver.find_element_by_tag_name("h4").text,
                         u'Paparana Utama')

    def tearDown(self):
        self.driver.get('http://%s/eclaim/logout' % self.ip)
        self.driver.quit()

if __name__ == '__main__':
    unittest.main(verbosity=2)
