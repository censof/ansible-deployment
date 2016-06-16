import unittest
from selenium import webdriver
class TestClaimsLogin(unittest.TestCase):

    def setUp(self):
        self.driver = webdriver.PhantomJS()

    def testLogo(self):
        self.driver.get('http://172.17.0.2/eclaim/login/')
        self.assertTrue(self.driver.find_element_by_id('logo').is_displayed())
        self.driver.find_element_by_id('id_user_name').send_keys("implementer")
        self.driver.find_element_by_id('id_password').send_keys("eclaim_implementer")
        self.driver.find_element_by_css_selector('button.btn.btn-primary').click()

    def tearDown(self):
        self.driver.quit()

if __name__ == '__main__':
    unittest.main(verbosity=2)
