# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         Dell-laptop
# Database:                     multisite_development
# Server version:               5.1.37
# Server OS:                    pc-linux-gnu
# Target compatibility:         HeidiSQL w/ MySQL Server 4.1
# Target max_allowed_packet:    16777216
# HeidiSQL version:             4.0
# Date/time:                    2009-11-16 11:45:03
# --------------------------------------------------------

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/

DROP DATABASE `multisite_development`;

#
# Database structure for database 'multisite_development'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `multisite_development` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `multisite_development`;


#
# Table structure for table 'addresses'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `addressable_id` int(11) DEFAULT NULL,
  `addressable_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) TYPE=MyISAM DEFAULT CHARSET=latin1;



#
# Dumping data for table 'addresses'
#

# No data found.



#
# Table structure for table 'connections'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ `connections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) TYPE=MyISAM DEFAULT CHARSET=latin1;



#
# Dumping data for table 'connections'
#

# No data found.



#
# Table structure for table 'content_pages'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ `content_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `markup_style_id` int(11) DEFAULT NULL,
  `content` text,
  `permission_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `content_cache` text,
  `markup_style` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_content_page_permission_id` (`permission_id`),
  KEY `fk_content_page_markup_style_id` (`markup_style_id`)
) TYPE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;



#
# Dumping data for table 'content_pages'
#

LOCK TABLES `content_pages` WRITE;
/*!40000 ALTER TABLE `content_pages` DISABLE KEYS;*/
REPLACE INTO `content_pages` (`id`, `title`, `name`, `markup_style_id`, `content`, `permission_id`, `created_at`, `updated_at`, `content_cache`, `markup_style`) VALUES
	(1,'Home Page','home',1,'h1. Welcome to Crosync - a solution for IBM Rational\'s Multisite\r\n\r\nToday’s network availability allows the packets’ transport on LANs or WANs - no more "tranports" via email, mail, or hand carried - the imports latency is minimized. \r\n\r\nThe global management and engineering teams expect and mandate a predictable (NOW) updates turnaround. They depend on it: complex code merges are happening on remote sites – any delayed import to the replicas residing on the local LAN cause missed deadlines, long hours, frustration to engineers and managers alike...\r\n\r\nOn their end of the bargain, the ClearCase administrators are facing multiples challenges caused by the:\r\n* world wide spread - multiple: sites, servers, OS-eses, VOBs repositories, LAN segments, security mechanisms, etc... \r\n* multitude of the servers farm (Unix, Linux, Solaris, Fedora, Windows, AIX,…) and administrative tools,\r\n* cryptic nature of the status reporting (email notifications and distributed VOB logs) – to be inspected AFTER the damage was already done,\r\n* time consuming practice of login into remote servers (telnet, putty, terminal client, VNC) open lengthy log files, interpret their results  and modify epoch tables or take issue with the IT group,\r\n* time zones differences reduce the common window of working hours - increasing the pressures to "have it" done",\r\n* the unavailability of seasoned multisite administrators,\r\n\r\nA single root-cause:\r\n\r\nh2. Lack of a single point of information and control.\r\n\r\n',3,'2006-06-12 00:31:56','2009-02-19 11:04:10','<h1>Welcome to Crosync &#8211; a solution for <span class="caps">IBM</span> Rational&#8217;s Multisite</h1>\n<p>Today’s network availability allows the packets’ transport on LANs or WANs &#8211; no more &#8220;tranports&#8221; via email, mail, or hand carried &#8211; the imports latency is minimized.</p>\n<p>The global management and engineering teams expect and mandate a predictable (<span class="caps">NOW</span>) updates turnaround. They depend on it: complex code merges are happening on remote sites – any delayed import to the replicas residing on the local <span class="caps">LAN</span> cause missed deadlines, long hours, frustration to engineers and managers alike&#8230;</p>\n<p>On their end of the bargain, the ClearCase administrators are facing multiples challenges caused by the:</p>\n<ul>\n	<li>world wide spread &#8211; multiple: sites, servers, OS-eses, VOBs repositories, <span class="caps">LAN</span> segments, security mechanisms, etc&#8230;</li>\n	<li>multitude of the servers farm (Unix, Linux, Solaris, Fedora, Windows, <span class="caps">AIX</span>,…) and administrative tools,</li>\n	<li>cryptic nature of the status reporting (email notifications and distributed <span class="caps">VOB</span> logs) – to be inspected <span class="caps">AFTER</span> the damage was already done,</li>\n	<li>time consuming practice of login into remote servers (telnet, putty, terminal client, <span class="caps">VNC</span>) open lengthy log files, interpret their results  and modify epoch tables or take issue with the IT group,</li>\n	<li>time zones differences reduce the common window of working hours &#8211; increasing the pressures to &#8220;have it&#8221; done&quot;,</li>\n	<li>the unavailability of seasoned multisite administrators,</li>\n</ul>\n<p>A single root-cause:</p>\n<h2>Lack of a single point of information and control.</h2>','Textile'),
	(2,'Session Expired','expired',1,'h1. Session Expired\n\nYour session has expired due to inactivity.\n\nTo continue please login again.\n',3,'2006-06-12 00:33:14','2008-05-07 11:52:49','<h1>Session Expired</h1>\n\n\n	<p>Your session has expired due to inactivity.</p>\n\n\n	<p>To continue please login again.</p>','Textile'),
	(3,'Not Found!','notfound',1,'h1. Not Found\n\nThe page you requested was not found!\n\nPlease contact your system administrator.',3,'2006-06-12 00:33:49','2008-05-07 11:52:49','<h1>Not Found</h1>\n\n\n	<p>The page you requested was not found!</p>\n\n\n	<p>Please contact your system administrator.</p>','Textile'),
	(4,'Permission Denied!','denied',1,'h1. Permission Denied\n\nSorry, but you don\'t have permission to view that page.\n\nPlease contact your system administrator.',3,'2006-06-12 00:34:30','2008-05-07 11:52:49','<h1>Permission Denied</h1>\n\n\n	<p>Sorry, but you don&#8217;t have permission to view that page.</p>\n\n\n	<p>Please contact your system administrator.</p>','Textile'),
	(6,'Contact Us','contact_us',1,'h1. Contact Us\r\n\r\nVisit the Crosync Project Homepage at http://www.github.com/crosync\r\n\r\nFor the Goldberg generator go to http://rubyforge.org/projects/goldberg/\r\n\r\nFor questions, advise, etc..., email us at: crosync.support at gmail dot com\r\n',3,'2006-06-12 10:13:47','2009-11-16 11:04:46','<h1>Contact Us</h1>\n<p>Visit the Crosync Project Homepage at http://www.github.com/crosync</p>\n<p>For the Goldberg generator go to http://rubyforge.org/projects/goldberg/</p>\n<p>For questions, advise, etc&#8230;, email us at: crosync.support at gmail dot com</p>','Textile'),
	(8,'Site Administration','site_admin',1,'h1. Goldberg Setup\n\nThis is where you will find all the Goldberg-specific administration and configuration features.  In here you can:\n\n* Set up Users.\n\n* Manage Roles and their Permissions.\n\n* Set up any Controllers and their Actions for your application.\n\n* Edit the Content Pages of the site.\n\n* Adjust Goldberg\'s system settings.\n\n\nh2. Users\n\nYou can set up Users with a username, password and a Role.\n\n\nh2. Roles and Permissions\n\nA User\'s Permissions affect what Actions they can perform and what Pages they can see.  And because each Menu Item is based either on a Page or an Action, the Permissions determine what Menu Items the User can and cannot see.\n\nA Role is a set of Permissions.  Roles are assigned to Users.  Roles are hierarchical: a Role can have a parent Role; and if so it will inherit the Permissions of the parent Role, and all its parents.\n\n\nh2. Controllers and Actions\n\nTo execute any Action, a user must have the appropriate Permission.  Therefore all Controllers and Actions you set up for your Rails application need to be entered here, otherwise no user will be able to execute them.\n\nYou start by setting up the Controller and assigning it a Permission.  The Permission will be used as the default for any Actions invoked for that Controller.\n\nYou have the option of setting up specific Actions for the Controllers.  You would want to do that if the Action were to appear as a Menu Item, or if it were to have a different level of security to the default for the Controller.\n\n\nh2. Content Pages\n\nGoldberg has a very simple CMS built in.  You can create pages to be displayed on the site, possibly in menu items.\n\n\nh2. Menu Editor\n\nOnce you have set up your Controller Actions and Content Pages, you can put them into the site\'s menu using the Menu Editor.\n\nIn the Menu Editor you can add and remove Menu Items and move them around.  The security of a Menu Item (whether the user can see it or not) depends on the Permission of the Action or Page attached to that Menu Item.\n\nh2. System Settings\n\nGo here to view and edit the settings that determine how Goldberg operates.\n',1,'2006-06-21 21:32:35','2008-05-07 11:52:49','<h1>Goldberg Setup</h1>\n\n\n	<p>This is where you will find all the Goldberg-specific administration and configuration features.  In here you can:</p>\n\n\n	<ul>\n	<li>Set up Users.</li>\n	</ul>\n\n\n	<ul>\n	<li>Manage Roles and their Permissions.</li>\n	</ul>\n\n\n	<ul>\n	<li>Set up any Controllers and their Actions for your application.</li>\n	</ul>\n\n\n	<ul>\n	<li>Edit the Content Pages of the site.</li>\n	</ul>\n\n\n	<ul>\n	<li>Adjust Goldberg&#8217;s system settings.</li>\n	</ul>\n\n\n	<h2>Users</h2>\n\n\n	<p>You can set up Users with a username, password and a Role.</p>\n\n\n	<h2>Roles and Permissions</h2>\n\n\n	<p>A User&#8217;s Permissions affect what Actions they can perform and what Pages they can see.  And because each Menu Item is based either on a Page or an Action, the Permissions determine what Menu Items the User can and cannot see.</p>\n\n\n	<p>A Role is a set of Permissions.  Roles are assigned to Users.  Roles are hierarchical: a Role can have a parent Role; and if so it will inherit the Permissions of the parent Role, and all its parents.</p>\n\n\n	<h2>Controllers and Actions</h2>\n\n\n	<p>To execute any Action, a user must have the appropriate Permission.  Therefore all Controllers and Actions you set up for your Rails application need to be entered here, otherwise no user will be able to execute them.</p>\n\n\n	<p>You start by setting up the Controller and assigning it a Permission.  The Permission will be used as the default for any Actions invoked for that Controller.</p>\n\n\n	<p>You have the option of setting up specific Actions for the Controllers.  You would want to do that if the Action were to appear as a Menu Item, or if it were to have a different level of security to the default for the Controller.</p>\n\n\n	<h2>Content Pages</h2>\n\n\n	<p>Goldberg has a very simple <span class="caps">CMS</span> built in.  You can create pages to be displayed on the site, possibly in menu items.</p>\n\n\n	<h2>Menu Editor</h2>\n\n\n	<p>Once you have set up your Controller Actions and Content Pages, you can put them into the site&#8217;s menu using the Menu Editor.</p>\n\n\n	<p>In the Menu Editor you can add and remove Menu Items and move them around.  The security of a Menu Item (whether the user can see it or not) depends on the Permission of the Action or Page attached to that Menu Item.</p>\n\n\n	<h2>System Settings</h2>\n\n\n	<p>Go here to view and edit the settings that determine how Goldberg operates.</p>','Textile'),
	(9,'Administration','admin',1,'h1. Site Administration\r\n\r\nThis is where the administrator can set up the site.\r\n\r\nThere is one menu item here by default -- "Setup":/menu/setup.  That contains all the configuration options.\r\n\r\nYou can add more menu items here to administer your application if you want, by going to "Setup, Menu Editor":/menu/setup/menus.\r\n\r\nMake sure the controllers / models are generated, so you can make good use of them!\r\n',1,'2006-06-26 16:47:09','2009-11-16 11:04:06','<h1>Site Administration</h1>\n<p>This is where the administrator can set up the site.</p>\n<p>There is one menu item here by default &#8212; <a href="/menu/setup">Setup</a>.  That contains all the configuration options.</p>\n<p>You can add more menu items here to administer your application if you want, by going to <a href="/menu/setup/menus">Setup, Menu Editor</a>.</p>\n<p>Make sure the controllers / models are generated, so you can make good use of them!</p>','Textile'),
	(10,'Credits and Licence','credits',1,'h1. Credits and Licence\r\n\r\nCrosync.com contains original material and third party material from various sources - generous contributions to open source initiatives.\r\n\r\nAll original material is (p) Public Domain, No Rights Reserved.  \r\n\r\nCrosync comes with no warranty whatsoever.\r\n\r\nThe copyright for any third party material remains with the original author, and the material is distributed here under the original terms.  \r\n\r\nMaterial has been selected from sources with licensing terms and conditions that allow use and redistribution for both personal and business purposes.  These licenses include public domain, BSD-style licenses, and Creative Commons licenses (but *not* Creative Commons Non-Commercial).\r\n\r\nIf you are an author and you believe your copyrighted material has been included in Crosync in breach of your licensing terms and conditions, please contact us (crosync at gmail dot com).\r\n\r\nh2. Gems and plugins\r\n\r\nThe product was built using Ruby On Rails technologies (http://rubyonrails.org),\r\n\r\nThe authoring part is a modified version of Goldberg RoR generator- (http://www.goldberg.240gl.org or http://goldberg.rubyforge.org),\r\n\r\nThe scaffold was generated using ActiveScaffold (http://activescaffold.com),\r\n\r\nFilters were adapted from http://code.google.com/p/activescaffoldlistfilters (authored by Tys von Gaza tys at http://gotoybox.com),  \r\n\r\nSending email via gmail thanks to Stephen Chu:\r\n http://www.stephenchu.com/2006/06/how-to-use-gmail-smtp-server-to-send.html\r\n\r\n\r\nh2. Other Features\r\n\r\nCrosync also contains some miscellaneous code and techniques from other sources.\r\n\r\n\r\n',3,'2006-10-02 10:35:35','2009-02-19 10:03:02','<h1>Credits and Licence</h1>\n<p>Crosync.com contains original material and third party material from various sources &#8211; generous contributions to open source initiatives.</p>\n<p>All original material is (p) Public Domain, No Rights Reserved.</p>\n<p>Crosync comes with no warranty whatsoever.</p>\n<p>The copyright for any third party material remains with the original author, and the material is distributed here under the original terms.</p>\n<p>Material has been selected from sources with licensing terms and conditions that allow use and redistribution for both personal and business purposes.  These licenses include public domain, <span class="caps">BSD</span>-style licenses, and Creative Commons licenses (but <strong>not</strong> Creative Commons Non-Commercial).</p>\n<p>If you are an author and you believe your copyrighted material has been included in Crosync in breach of your licensing terms and conditions, please contact us (crosync at gmail dot com).</p>\n<h2>Gems and plugins</h2>\n<p>The product was built using Ruby On Rails technologies (http://rubyonrails.org),</p>\n<p>The authoring part is a modified version of Goldberg RoR generator- (http://www.goldberg.240gl.org or http://goldberg.rubyforge.org),</p>\n<p>The scaffold was generated using ActiveScaffold (http://activescaffold.com),</p>\n<p>Filters were adapted from http://code.google.com/p/activescaffoldlistfilters (authored by Tys von Gaza tys at http://gotoybox.com),</p>\n<p>Sending email via gmail thanks to Stephen Chu:<br />\n http://www.stephenchu.com/2006/06/how-to-use-gmail-smtp-server-to-send.html</p>\n<h2>Other Features</h2>\n<p>Crosync also contains some miscellaneous code and techniques from other sources.</p>','Textile'),
	(11,'Not Permitted','unconfirmed',NULL,'h1. Not Permitted\n\nSorry, but you are not allowed to log into the site until your registration has been confirmed.\n\nIf there is an issue please contact the system administrator.\n',3,'2007-04-01 10:37:42','2008-05-07 11:52:49','<h1>Not Permitted</h1>\n\n\n	<p>Sorry, but you are not allowed to log into the site until your registration has been confirmed.</p>\n\n\n	<p>If there is an issue please contact the system administrator.</p>','Textile'),
	(12,'Members - ONLY','member',NULL,'h1. Members ONLY page - you are logged in!',5,'2008-05-09 10:07:19','2008-07-24 07:18:14','<h1>Members <span class="caps">ONLY</span> page &#8211; you are logged in!</h1>','Textile');
/*!40000 ALTER TABLE `content_pages` ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'controller_actions'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ `controller_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_controller_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `permission_id` int(11) DEFAULT NULL,
  `url_to_use` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_controller_action_permission_id` (`permission_id`),
  KEY `fk_controller_action_site_controller_id` (`site_controller_id`)
) TYPE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;



#
# Dumping data for table 'controller_actions'
#

LOCK TABLES `controller_actions` WRITE;
/*!40000 ALTER TABLE `controller_actions` DISABLE KEYS;*/
REPLACE INTO `controller_actions` (`id`, `site_controller_id`, `name`, `permission_id`, `url_to_use`) VALUES
	(1,1,'view_default',3,NULL),
	(2,1,'view',3,NULL),
	(3,7,'list',NULL,NULL),
	(4,6,'list',3,''),
	(5,3,'login',4,NULL),
	(6,3,'logout',4,''),
	(7,5,'link',4,NULL),
	(8,1,'list',NULL,NULL),
	(9,8,'list',NULL,NULL),
	(10,2,'list',NULL,NULL),
	(11,5,'list',NULL,NULL),
	(12,9,'list',NULL,NULL),
	(13,3,'forgotten',4,NULL),
	(14,3,'login_failed',4,NULL),
	(15,10,'list',NULL,''),
	(16,10,'self_register',4,''),
	(17,10,'confirm_registration',4,''),
	(18,10,'confirm_registration_submit',4,''),
	(19,10,'self_create',4,''),
	(20,10,'forgot_password',4,''),
	(21,10,'forgot_password_submit',4,''),
	(22,10,'reset_password',4,''),
	(23,10,'reset_password_submit',4,''),
	(27,12,'list',5,''),
	(30,15,'list',5,''),
	(31,16,'list',5,''),
	(32,14,'list',5,''),
	(33,19,'list',1,'');
/*!40000 ALTER TABLE `controller_actions` ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'hosts'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ `hosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `hostname` varchar(255) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) TYPE=MyISAM DEFAULT CHARSET=latin1;



#
# Dumping data for table 'hosts'
#

# No data found.



#
# Table structure for table 'menu_items'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ `menu_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `seq` int(11) DEFAULT NULL,
  `controller_action_id` int(11) DEFAULT NULL,
  `content_page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menu_item_controller_action_id` (`controller_action_id`),
  KEY `fk_menu_item_content_page_id` (`content_page_id`),
  KEY `fk_menu_item_parent_id` (`parent_id`)
) TYPE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;



#
# Dumping data for table 'menu_items'
#

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS;*/
REPLACE INTO `menu_items` (`id`, `parent_id`, `name`, `label`, `seq`, `controller_action_id`, `content_page_id`) VALUES
	(1,NULL,'home','Home',1,NULL,1),
	(2,NULL,'contact_us','Contact Us',4,NULL,6),
	(3,NULL,'admin','Administration',2,NULL,9),
	(5,9,'setup/permissions','Permissions',3,4,NULL),
	(6,9,'setup/roles','Roles',2,3,NULL),
	(7,9,'setup/pages','Content Pages',5,8,NULL),
	(8,9,'setup/controllers','Controllers / Actions',4,9,NULL),
	(9,3,'setup','Setup',1,NULL,8),
	(11,9,'setup/menus','Menu Editor',6,11,NULL),
	(12,9,'setup/system_settings','System Settings',7,12,NULL),
	(13,9,'setup/users','Users',1,15,NULL),
	(14,2,'credits','Credits &amp; Licence',1,NULL,10),
	(15,NULL,'Multisite','Multisite Admin',3,NULL,12),
	(16,24,'Sites','Sites',1,27,NULL),
	(19,24,'Hosts','Hosts (Servers)',2,30,NULL),
	(20,24,'Vobs','Vobs',3,32,NULL),
	(22,24,'Oplogs','Oplogs',4,31,NULL),
	(24,15,'Tables','Tables',1,NULL,12);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'oplogs'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ `oplogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  `row_replica` int(11) NOT NULL,
  `column_replica` int(11) NOT NULL,
  `opnumber` int(11) NOT NULL,
  `oid` varchar(50) NOT NULL,
  `process` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) TYPE=MyISAM DEFAULT CHARSET=latin1;



#
# Dumping data for table 'oplogs'
#

# No data found.



#
# Table structure for table 'permissions'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) TYPE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;



#
# Dumping data for table 'permissions'
#

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS;*/
REPLACE INTO `permissions` (`id`, `name`) VALUES
	(1,'Administer site'),
	(2,'Public pages - edit'),
	(3,'Public pages - view'),
	(4,'Public actions - execute'),
	(5,'Members only page -- all');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'plugin_schema_info'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ `plugin_schema_info` (
  `plugin_name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL
) TYPE=MyISAM DEFAULT CHARSET=latin1;



#
# Dumping data for table 'plugin_schema_info'
#

LOCK TABLES `plugin_schema_info` WRITE;
/*!40000 ALTER TABLE `plugin_schema_info` DISABLE KEYS;*/
REPLACE INTO `plugin_schema_info` (`plugin_name`, `version`) VALUES
	('goldberg',4),
	('goldberg',4);
/*!40000 ALTER TABLE `plugin_schema_info` ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'roles'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `default_page_id` int(11) DEFAULT NULL,
  `cache` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `start_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role_parent_id` (`parent_id`),
  KEY `fk_role_default_page_id` (`default_page_id`)
) TYPE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;



#
# Dumping data for table 'roles'
#

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS;*/
REPLACE INTO `roles` (`id`, `name`, `parent_id`, `description`, `default_page_id`, `cache`, `created_at`, `updated_at`, `start_path`) VALUES
	(1,'Public',NULL,'Members of the public who are not logged in.',NULL,'--- \n:credentials: !ruby/object:Goldberg::Credentials \n  actions: \n    goldberg/auth: \n      logout: true\n      forgotten: true\n      login: true\n      login_failed: true\n    vobs: \n      list: false\n    goldberg/menu_items: \n      list: false\n      link: true\n    hosts: \n      list: false\n    goldberg/site_controllers: \n      list: false\n    oplogs: \n      list: false\n    sites: \n      list: false\n    goldberg/system_settings: \n      list: false\n    goldberg/permissions: \n      list: true\n    goldberg/roles: \n      list: false\n    goldberg/content_pages: \n      list: false\n      view: true\n      view_default: true\n    users: \n      list: false\n    goldberg/users: \n      forgot_password: true\n      list: false\n      reset_password: true\n      self_register: true\n      reset_password_submit: true\n      forgot_password_submit: true\n      confirm_registration: true\n      self_create: true\n      confirm_registration_submit: true\n    goldberg/controller_actions: \n      list: false\n  controllers: \n    goldberg/auth: false\n    vobs: false\n    goldberg/roles_permissions: false\n    goldberg/menu_items: false\n    hosts: false\n    goldberg/site_controllers: false\n    oplogs: false\n    sites: false\n    goldberg/system_settings: false\n    goldberg/roles: false\n    goldberg/permissions: false\n    goldberg/content_pages: false\n    users: false\n    goldberg/users: false\n    goldberg/controller_actions: false\n  pages: \n    member: false\n    admin: false\n    site_admin: false\n    unconfirmed: true\n    notfound: true\n    contact_us: true\n    denied: true\n    credits: true\n    expired: true\n    home: true\n  permission_ids: \n  - 4\n  - 3\n  role_id: 1\n  role_ids: \n  - 1\n  updated_at: 2009-11-16 11:04:46 -08:00\n:menu: !ruby/object:Goldberg::Menu \n  by_id: \n    5: &id001 !ruby/object:Goldberg::Menu::Node \n      content_page_id: \n      controller_action_id: 4\n      id: 5\n      label: Permissions\n      name: setup/permissions\n      parent: \n      parent_id: 9\n      site_controller_id: 6\n      url: /goldberg/permissions/list\n    1: &id004 !ruby/object:Goldberg::Menu::Node \n      content_page_id: 1\n      controller_action_id: \n      id: 1\n      label: Home\n      name: home\n      parent: \n      parent_id: \n      site_controller_id: \n      url: /home\n    2: &id002 !ruby/object:Goldberg::Menu::Node \n      children: \n      - 14\n      content_page_id: 6\n      controller_action_id: \n      id: 2\n      label: Contact Us\n      name: contact_us\n      parent: \n      parent_id: \n      site_controller_id: \n      url: /contact_us\n    14: &id003 !ruby/object:Goldberg::Menu::Node \n      content_page_id: 10\n      controller_action_id: \n      id: 14\n      label: Credits &amp; Licence\n      name: credits\n      parent: \n      parent_id: 2\n      site_controller_id: \n      url: /credits\n  by_name: \n    setup/permissions: *id001\n    contact_us: *id002\n    credits: *id003\n    home: *id004\n  crumbs: \n  - 1\n  root: &id005 !ruby/object:Goldberg::Menu::Node \n    children: \n    - 1\n    - 2\n    parent: \n  selected: \n    1: *id004\n  vector: \n  - *id005\n  - *id004\n','2006-06-23 21:03:49','2009-11-16 11:04:46','/menu/home'),
	(2,'Member',1,'Logged in registered users (clients)',NULL,'--- \n:credentials: !ruby/object:Goldberg::Credentials \n  actions: \n    goldberg/auth: \n      logout: true\n      forgotten: true\n      login: true\n      login_failed: true\n    vobs: \n      list: true\n    goldberg/menu_items: \n      list: false\n      link: true\n    hosts: \n      list: true\n    goldberg/site_controllers: \n      list: false\n    oplogs: \n      list: true\n    sites: \n      list: true\n    goldberg/system_settings: \n      list: false\n    goldberg/permissions: \n      list: true\n    goldberg/roles: \n      list: false\n    goldberg/content_pages: \n      list: false\n      view: true\n      view_default: true\n    users: \n      list: false\n    goldberg/users: \n      forgot_password: true\n      list: false\n      reset_password: true\n      self_register: true\n      reset_password_submit: true\n      forgot_password_submit: true\n      confirm_registration: true\n      self_create: true\n      confirm_registration_submit: true\n    goldberg/controller_actions: \n      list: false\n  controllers: \n    goldberg/auth: false\n    vobs: true\n    goldberg/roles_permissions: false\n    goldberg/menu_items: false\n    hosts: true\n    goldberg/site_controllers: false\n    oplogs: true\n    sites: true\n    goldberg/system_settings: false\n    goldberg/roles: false\n    goldberg/permissions: false\n    goldberg/content_pages: false\n    users: false\n    goldberg/users: false\n    goldberg/controller_actions: false\n  pages: \n    member: true\n    admin: false\n    site_admin: false\n    unconfirmed: true\n    notfound: true\n    contact_us: true\n    denied: true\n    credits: true\n    expired: true\n    home: true\n  permission_ids: \n  - 5\n  - 4\n  - 4\n  - 2\n  - 3\n  - 3\n  role_id: 2\n  role_ids: \n  - 2\n  - 1\n  updated_at: 2009-11-16 11:04:46 -08:00\n:menu: !ruby/object:Goldberg::Menu \n  by_id: \n    16: &id003 !ruby/object:Goldberg::Menu::Node \n      content_page_id: \n      controller_action_id: 27\n      id: 16\n      label: Sites\n      name: Sites\n      parent: \n      parent_id: 24\n      site_controller_id: 12\n      url: /sites/list\n    5: &id007 !ruby/object:Goldberg::Menu::Node \n      content_page_id: \n      controller_action_id: 4\n      id: 5\n      label: Permissions\n      name: setup/permissions\n      parent: \n      parent_id: 9\n      site_controller_id: 6\n      url: /goldberg/permissions/list\n    22: &id006 !ruby/object:Goldberg::Menu::Node \n      content_page_id: \n      controller_action_id: 31\n      id: 22\n      label: Oplogs\n      name: Oplogs\n      parent: \n      parent_id: 24\n      site_controller_id: 16\n      url: /oplogs/list\n    1: &id010 !ruby/object:Goldberg::Menu::Node \n      content_page_id: 1\n      controller_action_id: \n      id: 1\n      label: Home\n      name: home\n      parent: \n      parent_id: \n      site_controller_id: \n      url: /home\n    24: &id004 !ruby/object:Goldberg::Menu::Node \n      children: \n      - 16\n      - 19\n      - 20\n      - 22\n      content_page_id: 12\n      controller_action_id: \n      id: 24\n      label: Tables\n      name: Tables\n      parent: \n      parent_id: 15\n      site_controller_id: \n      url: /member\n    2: &id008 !ruby/object:Goldberg::Menu::Node \n      children: \n      - 14\n      content_page_id: 6\n      controller_action_id: \n      id: 2\n      label: Contact Us\n      name: contact_us\n      parent: \n      parent_id: \n      site_controller_id: \n      url: /contact_us\n    19: &id005 !ruby/object:Goldberg::Menu::Node \n      content_page_id: \n      controller_action_id: 30\n      id: 19\n      label: Hosts (Servers)\n      name: Hosts\n      parent: \n      parent_id: 24\n      site_controller_id: 15\n      url: /hosts/list\n    14: &id009 !ruby/object:Goldberg::Menu::Node \n      content_page_id: 10\n      controller_action_id: \n      id: 14\n      label: Credits &amp; Licence\n      name: credits\n      parent: \n      parent_id: 2\n      site_controller_id: \n      url: /credits\n    20: &id002 !ruby/object:Goldberg::Menu::Node \n      content_page_id: \n      controller_action_id: 32\n      id: 20\n      label: Vobs\n      name: Vobs\n      parent: \n      parent_id: 24\n      site_controller_id: 14\n      url: /vobs/list\n    15: &id001 !ruby/object:Goldberg::Menu::Node \n      children: \n      - 24\n      content_page_id: 12\n      controller_action_id: \n      id: 15\n      label: Multisite Admin\n      name: Multisite\n      parent: \n      parent_id: \n      site_controller_id: \n      url: /member\n  by_name: \n    Multisite: *id001\n    Vobs: *id002\n    Sites: *id003\n    Tables: *id004\n    Hosts: *id005\n    Oplogs: *id006\n    setup/permissions: *id007\n    contact_us: *id008\n    credits: *id009\n    home: *id010\n  crumbs: \n  - 1\n  root: &id011 !ruby/object:Goldberg::Menu::Node \n    children: \n    - 1\n    - 15\n    - 2\n    parent: \n  selected: \n    1: *id010\n  vector: \n  - *id011\n  - *id010\n','2006-06-23 21:03:50','2009-11-16 11:04:46','/menu/home'),
	(3,'Administrator',2,'',8,'--- \n:credentials: !ruby/object:Goldberg::Credentials \n  actions: \n    goldberg/auth: \n      logout: true\n      forgotten: true\n      login: true\n      login_failed: true\n    vobs: \n      list: true\n    goldberg/menu_items: \n      list: true\n      link: true\n    hosts: \n      list: true\n    goldberg/site_controllers: \n      list: true\n    oplogs: \n      list: true\n    sites: \n      list: true\n    goldberg/system_settings: \n      list: true\n    goldberg/permissions: \n      list: true\n    goldberg/roles: \n      list: true\n    goldberg/content_pages: \n      list: true\n      view: true\n      view_default: true\n    users: \n      list: true\n    goldberg/users: \n      forgot_password: true\n      list: true\n      reset_password: true\n      self_register: true\n      reset_password_submit: true\n      forgot_password_submit: true\n      confirm_registration: true\n      self_create: true\n      confirm_registration_submit: true\n    goldberg/controller_actions: \n      list: true\n  controllers: \n    goldberg/auth: true\n    vobs: true\n    goldberg/roles_permissions: true\n    goldberg/menu_items: true\n    hosts: true\n    goldberg/site_controllers: true\n    oplogs: true\n    sites: true\n    goldberg/system_settings: true\n    goldberg/roles: true\n    goldberg/permissions: true\n    goldberg/content_pages: true\n    users: true\n    goldberg/users: true\n    goldberg/controller_actions: true\n  pages: \n    member: true\n    admin: true\n    site_admin: true\n    unconfirmed: true\n    notfound: true\n    contact_us: true\n    denied: true\n    credits: true\n    expired: true\n    home: true\n  permission_ids: \n  - 1\n  - 5\n  - 4\n  - 4\n  - 2\n  - 2\n  - 3\n  - 3\n  role_id: 3\n  role_ids: \n  - 3\n  - 2\n  - 1\n  updated_at: 2009-11-16 11:04:47 -08:00\n:menu: !ruby/object:Goldberg::Menu \n  by_id: \n    16: &id006 !ruby/object:Goldberg::Menu::Node \n      content_page_id: \n      controller_action_id: 27\n      id: 16\n      label: Sites\n      name: Sites\n      parent: \n      parent_id: 24\n      site_controller_id: 12\n      url: /sites/list\n    5: &id012 !ruby/object:Goldberg::Menu::Node \n      content_page_id: \n      controller_action_id: 4\n      id: 5\n      label: Permissions\n      name: setup/permissions\n      parent: \n      parent_id: 9\n      site_controller_id: 6\n      url: /goldberg/permissions/list\n    22: &id011 !ruby/object:Goldberg::Menu::Node \n      content_page_id: \n      controller_action_id: 31\n      id: 22\n      label: Oplogs\n      name: Oplogs\n      parent: \n      parent_id: 24\n      site_controller_id: 16\n      url: /oplogs/list\n    11: &id001 !ruby/object:Goldberg::Menu::Node \n      content_page_id: \n      controller_action_id: 11\n      id: 11\n      label: Menu Editor\n      name: setup/menus\n      parent: \n      parent_id: 9\n      site_controller_id: 5\n      url: /goldberg/menu_items/list\n    6: &id003 !ruby/object:Goldberg::Menu::Node \n      content_page_id: \n      controller_action_id: 3\n      id: 6\n      label: Roles\n      name: setup/roles\n      parent: \n      parent_id: 9\n      site_controller_id: 7\n      url: /goldberg/roles/list\n    12: &id007 !ruby/object:Goldberg::Menu::Node \n      content_page_id: \n      controller_action_id: 12\n      id: 12\n      label: System Settings\n      name: setup/system_settings\n      parent: \n      parent_id: 9\n      site_controller_id: 9\n      url: /goldberg/system_settings/list\n    1: &id018 !ruby/object:Goldberg::Menu::Node \n      content_page_id: 1\n      controller_action_id: \n      id: 1\n      label: Home\n      name: home\n      parent: \n      parent_id: \n      site_controller_id: \n      url: /home\n    7: &id016 !ruby/object:Goldberg::Menu::Node \n      content_page_id: \n      controller_action_id: 8\n      id: 7\n      label: Content Pages\n      name: setup/pages\n      parent: \n      parent_id: 9\n      site_controller_id: 1\n      url: /goldberg/content_pages/list\n    24: &id009 !ruby/object:Goldberg::Menu::Node \n      children: \n      - 16\n      - 19\n      - 20\n      - 22\n      content_page_id: 12\n      controller_action_id: \n      id: 24\n      label: Tables\n      name: Tables\n      parent: \n      parent_id: 15\n      site_controller_id: \n      url: /member\n    13: &id002 !ruby/object:Goldberg::Menu::Node \n      content_page_id: \n      controller_action_id: 15\n      id: 13\n      label: Users\n      name: setup/users\n      parent: \n      parent_id: 9\n      site_controller_id: 10\n      url: /goldberg/users/list\n    2: &id014 !ruby/object:Goldberg::Menu::Node \n      children: \n      - 14\n      content_page_id: 6\n      controller_action_id: \n      id: 2\n      label: Contact Us\n      name: contact_us\n      parent: \n      parent_id: \n      site_controller_id: \n      url: /contact_us\n    19: &id010 !ruby/object:Goldberg::Menu::Node \n      content_page_id: \n      controller_action_id: 30\n      id: 19\n      label: Hosts (Servers)\n      name: Hosts\n      parent: \n      parent_id: 24\n      site_controller_id: 15\n      url: /hosts/list\n    8: &id017 !ruby/object:Goldberg::Menu::Node \n      content_page_id: \n      controller_action_id: 9\n      id: 8\n      label: Controllers / Actions\n      name: setup/controllers\n      parent: \n      parent_id: 9\n      site_controller_id: 8\n      url: /goldberg/site_controllers/list\n    14: &id015 !ruby/object:Goldberg::Menu::Node \n      content_page_id: 10\n      controller_action_id: \n      id: 14\n      label: Credits &amp; Licence\n      name: credits\n      parent: \n      parent_id: 2\n      site_controller_id: \n      url: /credits\n    3: &id008 !ruby/object:Goldberg::Menu::Node \n      children: \n      - 9\n      content_page_id: 9\n      controller_action_id: \n      id: 3\n      label: Administration\n      name: admin\n      parent: \n      parent_id: \n      site_controller_id: \n      url: /admin\n    20: &id005 !ruby/object:Goldberg::Menu::Node \n      content_page_id: \n      controller_action_id: 32\n      id: 20\n      label: Vobs\n      name: Vobs\n      parent: \n      parent_id: 24\n      site_controller_id: 14\n      url: /vobs/list\n    9: &id013 !ruby/object:Goldberg::Menu::Node \n      children: \n      - 13\n      - 6\n      - 5\n      - 8\n      - 7\n      - 11\n      - 12\n      content_page_id: 8\n      controller_action_id: \n      id: 9\n      label: Setup\n      name: setup\n      parent: \n      parent_id: 3\n      site_controller_id: \n      url: /site_admin\n    15: &id004 !ruby/object:Goldberg::Menu::Node \n      children: \n      - 24\n      content_page_id: 12\n      controller_action_id: \n      id: 15\n      label: Multisite Admin\n      name: Multisite\n      parent: \n      parent_id: \n      site_controller_id: \n      url: /member\n  by_name: \n    setup/menus: *id001\n    setup/users: *id002\n    setup/roles: *id003\n    Multisite: *id004\n    Vobs: *id005\n    Sites: *id006\n    setup/system_settings: *id007\n    admin: *id008\n    Tables: *id009\n    Hosts: *id010\n    Oplogs: *id011\n    setup/permissions: *id012\n    setup: *id013\n    contact_us: *id014\n    credits: *id015\n    setup/pages: *id016\n    setup/controllers: *id017\n    home: *id018\n  crumbs: \n  - 1\n  root: &id019 !ruby/object:Goldberg::Menu::Node \n    children: \n    - 1\n    - 3\n    - 15\n    - 2\n    parent: \n  selected: \n    1: *id018\n  vector: \n  - *id019\n  - *id018\n','2006-06-23 21:03:48','2009-11-16 11:04:47','/menu/admin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'roles_permissions'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ `roles_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_roles_permission_role_id` (`role_id`),
  KEY `fk_roles_permission_permission_id` (`permission_id`)
) TYPE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;



#
# Dumping data for table 'roles_permissions'
#

LOCK TABLES `roles_permissions` WRITE;
/*!40000 ALTER TABLE `roles_permissions` DISABLE KEYS;*/
REPLACE INTO `roles_permissions` (`id`, `role_id`, `permission_id`) VALUES
	(4,3,1),
	(6,1,3),
	(7,3,2),
	(9,1,4),
	(10,2,5),
	(11,2,4),
	(12,2,2),
	(13,2,3);
/*!40000 ALTER TABLE `roles_permissions` ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'schema_info'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ `schema_info` (
  `version` int(11) DEFAULT NULL
) TYPE=MyISAM DEFAULT CHARSET=latin1;



#
# Dumping data for table 'schema_info'
#

LOCK TABLES `schema_info` WRITE;
/*!40000 ALTER TABLE `schema_info` DISABLE KEYS;*/
REPLACE INTO `schema_info` (`version`) VALUES
	(0),
	(0);
/*!40000 ALTER TABLE `schema_info` ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'sites'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sitename` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) TYPE=MyISAM DEFAULT CHARSET=latin1;



#
# Dumping data for table 'sites'
#

# No data found.



#
# Table structure for table 'site_controllers'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ `site_controllers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `builtin` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_site_controller_permission_id` (`permission_id`)
) TYPE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;



#
# Dumping data for table 'site_controllers'
#

LOCK TABLES `site_controllers` WRITE;
/*!40000 ALTER TABLE `site_controllers` DISABLE KEYS;*/
REPLACE INTO `site_controllers` (`id`, `name`, `permission_id`, `builtin`) VALUES
	(1,'goldberg/content_pages',1,1),
	(2,'goldberg/controller_actions',1,1),
	(3,'goldberg/auth',1,1),
	(5,'goldberg/menu_items',1,1),
	(6,'goldberg/permissions',1,1),
	(7,'goldberg/roles',1,1),
	(8,'goldberg/site_controllers',1,1),
	(9,'goldberg/system_settings',1,1),
	(10,'goldberg/users',1,1),
	(11,'goldberg/roles_permissions',1,1),
	(12,'sites',5,0),
	(14,'vobs',5,0),
	(15,'hosts',5,0),
	(16,'oplogs',5,0),
	(19,'users',1,0);
/*!40000 ALTER TABLE `site_controllers` ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'system_settings'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ `system_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(255) NOT NULL,
  `site_subtitle` varchar(255) DEFAULT NULL,
  `footer_message` varchar(255) DEFAULT '',
  `public_role_id` int(11) NOT NULL,
  `session_timeout` int(11) NOT NULL DEFAULT '0',
  `site_default_page_id` int(11) NOT NULL,
  `not_found_page_id` int(11) NOT NULL,
  `permission_denied_page_id` int(11) NOT NULL,
  `session_expired_page_id` int(11) NOT NULL,
  `menu_depth` int(11) NOT NULL DEFAULT '0',
  `start_path` varchar(255) DEFAULT NULL,
  `site_url_prefix` varchar(255) DEFAULT NULL,
  `self_reg_enabled` tinyint(1) DEFAULT NULL,
  `self_reg_role_id` int(11) DEFAULT NULL,
  `self_reg_confirmation_required` tinyint(1) DEFAULT NULL,
  `self_reg_confirmation_error_page_id` int(11) DEFAULT NULL,
  `self_reg_send_confirmation_email` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_system_settings_public_role_id` (`public_role_id`),
  KEY `fk_system_settings_site_default_page_id` (`site_default_page_id`),
  KEY `fk_system_settings_not_found_page_id` (`not_found_page_id`),
  KEY `fk_system_settings_permission_denied_page_id` (`permission_denied_page_id`),
  KEY `fk_system_settings_session_expired_page_id` (`session_expired_page_id`)
) TYPE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;



#
# Dumping data for table 'system_settings'
#

LOCK TABLES `system_settings` WRITE;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS;*/
REPLACE INTO `system_settings` (`id`, `site_name`, `site_subtitle`, `footer_message`, `public_role_id`, `session_timeout`, `site_default_page_id`, `not_found_page_id`, `permission_denied_page_id`, `session_expired_page_id`, `menu_depth`, `start_path`, `site_url_prefix`, `self_reg_enabled`, `self_reg_role_id`, `self_reg_confirmation_required`, `self_reg_confirmation_error_page_id`, `self_reg_send_confirmation_email`) VALUES
	(1,'Crosync','Dashboard Services for ClearCase Multisite','A <a href="http://github.com/crosync">Crosync</a> site    --------     IBM ClearCase and IBM ClearCase Multisite are IBM\'s trademarks / copyrights....',1,7200,1,3,4,2,3,'','http://localhost:3000/',0,NULL,0,11,0);
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'users'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `password_salt` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `start_path` varchar(255) DEFAULT NULL,
  `self_reg_confirmation_required` tinyint(1) DEFAULT NULL,
  `confirmation_key` varchar(255) DEFAULT NULL,
  `password_changed_at` datetime DEFAULT NULL,
  `password_expired` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role_id` (`role_id`)
) TYPE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;



#
# Dumping data for table 'users'
#

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS;*/
REPLACE INTO `users` (`id`, `name`, `password`, `role_id`, `password_salt`, `fullname`, `email`, `start_path`, `self_reg_confirmation_required`, `confirmation_key`, `password_changed_at`, `password_expired`) VALUES
	(1,'admin','d9107be4205cc157307cfd1240674d4c37a83951',3,'-6166206180.785037571356138','','','',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'vobs'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ `vobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_id` int(11) NOT NULL,
  `replica_uuid` varchar(50) DEFAULT NULL,
  `family_uuid` varchar(50) DEFAULT NULL,
  `tag` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `access` varchar(50) DEFAULT NULL,
  `gpath` varchar(100) DEFAULT NULL,
  `lpath` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `replica_name` varchar(50) DEFAULT NULL,
  `attribute` varchar(50) DEFAULT NULL,
  `replica_type` varchar(50) DEFAULT NULL,
  `master_replica` varchar(100) DEFAULT NULL,
  `owner` varchar(100) DEFAULT NULL,
  `group` varchar(50) DEFAULT NULL,
  `identities` varchar(50) DEFAULT NULL,
  `permissions` varchar(50) DEFAULT NULL,
  `feature_level` varchar(50) DEFAULT NULL,
  `connectivity` varchar(50) DEFAULT NULL,
  `incident` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `host` (`host_id`)
) TYPE=MyISAM DEFAULT CHARSET=latin1;



#
# Dumping data for table 'vobs'
#

# No data found.

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
