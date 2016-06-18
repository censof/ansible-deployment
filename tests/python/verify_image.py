import unittest
import os
from selenium import webdriver

class TestClaimsLogin(unittest.TestCase):

    def setUp(self):
        self.driver = webdriver.PhantomJS()
        self.ip = os.environ.get('CID', '172.17.0.1')

    def test_verify_main_screen_loaded(self):
        self.driver.get('http://%s/eclaim/login/' % self.ip)
        self.assertTrue(self.driver.find_element_by_id('logo').is_displayed())
        self.driver.find_element_by_id('id_user_name').send_keys("implementer")
        self.driver.find_element_by_id('id_password').send_keys("eclaim_implementer")
        self.driver.find_element_by_css_selector('button.btn.btn-primary').click()
        self.assertEqual(self.driver.find_element_by_class_name("page-title").text,
                         u'Login To Your Account')

    def tearDown(self):
        self.driver.quit()

if __name__ == '__main__':
    unittest.main(verbosity=2)
