import unittest

from nose.plugins.attrib import attr

import debsources.query as qry
from debsources.tests.db_testing import DbTestFixture
from debsources.tests.testdata import TEST_DB_NAME


@attr('Queries')
class QueriesTest(unittest.TestCase, DbTestFixture):

    @classmethod
    def setUpClass(cls):
        cls.db_setup_cls()

        # creates an app object, which is used to run queries
        from debsources.app import app_wrapper

        # erases a few configuration parameters needed for testing:
        uri = "postgresql:///" + TEST_DB_NAME
        app_wrapper.app.config["SQLALCHEMY_DATABASE_URI"] = uri
        app_wrapper.app.config['LIST_OFFSET'] = 5
        app_wrapper.app.testing = True

        app_wrapper.go()

        cls.app = app_wrapper.app.test_client()
        cls.app_wrapper = app_wrapper

    @classmethod
    def tearDownClass(cls):
        cls.app_wrapper.engine.dispose()
        cls.db_teardown_cls()

    def test_packages_prefixes(self):
        self.assertEqual(qry.pkg_names_get_packages_prefixes(
            self.app_wrapper.app.config["CACHE_DIR"]),
            ['b', 'c', 'd', 'f', 'g', 'l', 'libc', 'm',
             'n', 'o', 'p', 's', 'u'])

    def test_list_versions(self):
        # Test without suit
        packages = qry.pkg_names_list_versions(self.session, "gnubg")
        self.assertEqual([p.version for p in packages],
                         ["0.90+20091206-4", "0.90+20120429-1", "1.02.000-2"])

        # Test with suit
        packages = qry.pkg_names_list_versions(self.session, "gnubg", "wheezy")
        self.assertEqual([p.version for p in packages], ["0.90+20120429-1"])

        # Test returning suites without suit as parameter
        self.assertTrue({'suites': [u'wheezy'], 'version': u'0.90+20120429-1',
                         'area': u'main'} in
                        qry.pkg_names_list_versions_w_suites(self.session,
                                                             "gnubg"))

        # Test returning suites with a suit as parameter
        self.assertEqual(qry.pkg_names_list_versions_w_suites(self.session,
                                                              "gnubg",
                                                              "jessie"),
                         [{'suites': [u'jessie', u'sid'],
                          'version': u'1.02.000-2', 'area': u'main'}])

    def test_find_ctag(self):
        self.assertEqual(qry.find_ctag(self.session, "swap")[0], 8)

        ctags = qry.find_ctag(self.session, "swap", "gnubg")
        self.assertEqual(ctags[0], 5)
        self.assertTrue({'path': 'eval.c', 'line': 1747,
                        'version': u'0.90+20091206-4', 'package': u'gnubg'}
                        in ctags[1])