-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-08-2016 a las 18:54:42
-- Versión del servidor: 10.1.8-MariaDB
-- Versión de PHP: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `helpdesk`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_api_key`
--

CREATE TABLE `helpdesk_api_key` (
  `id` int(10) UNSIGNED NOT NULL,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `ipaddr` varchar(64) NOT NULL,
  `apikey` varchar(255) NOT NULL,
  `can_create_tickets` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `can_exec_cron` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `notes` text,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_attachment`
--

CREATE TABLE `helpdesk_attachment` (
  `object_id` int(11) UNSIGNED NOT NULL,
  `type` char(1) NOT NULL,
  `file_id` int(11) UNSIGNED NOT NULL,
  `inline` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_attachment`
--

INSERT INTO `helpdesk_attachment` (`object_id`, `type`, `file_id`, `inline`) VALUES
(1, 'C', 2, 0),
(8, 'T', 1, 1),
(9, 'T', 1, 1),
(10, 'T', 1, 1),
(11, 'T', 1, 1),
(12, 'T', 1, 1),
(13, 'T', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_canned_response`
--

CREATE TABLE `helpdesk_canned_response` (
  `canned_id` int(10) UNSIGNED NOT NULL,
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `isenabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL DEFAULT '',
  `response` text NOT NULL,
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_canned_response`
--

INSERT INTO `helpdesk_canned_response` (`canned_id`, `dept_id`, `isenabled`, `title`, `response`, `lang`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 'What is osTicket (sample)?', 'osTicket is a widely-used open source support ticket system, an attractive alternative to higher-cost and complex customer support systems - simple, lightweight, reliable, open source, web-based and easy to setup and use.', 'en_US', '', '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(2, 0, 1, 'Sample (with variables)', 'Hi %{ticket.name.first}, <br /><br /> Your ticket #%{ticket.number} created on %{ticket.create_date} is in %{ticket.dept.name} department.', 'en_US', '', '2016-08-09 17:54:53', '2016-08-09 17:54:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_config`
--

CREATE TABLE `helpdesk_config` (
  `id` int(11) UNSIGNED NOT NULL,
  `namespace` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_config`
--

INSERT INTO `helpdesk_config` (`id`, `namespace`, `key`, `value`, `updated`) VALUES
(1, 'core', 'admin_email', 'it@diazmorones.com', '2016-08-09 22:54:53'),
(2, 'core', 'helpdesk_url', 'http://localhost:8080/tickets/', '2016-08-09 22:54:53'),
(3, 'core', 'helpdesk_title', 'DM Helpdesk', '2016-08-09 22:54:53'),
(4, 'core', 'schema_signature', 'b26f29a6bb5dbb3510b057632182d138', '2016-08-09 22:54:53'),
(5, 'dept.1', 'assign_members_only', '', '2016-08-09 22:54:52'),
(6, 'dept.2', 'assign_members_only', '', '2016-08-09 22:54:52'),
(7, 'dept.3', 'assign_members_only', '', '2016-08-09 22:54:52'),
(8, 'sla.1', 'transient', '0', '2016-08-09 22:54:52'),
(9, 'list.1', 'configuration', '{"handler":"TicketStatusList"}', '2016-08-09 22:54:53'),
(10, 'core', 'time_format', 'h:i A', '2016-08-09 22:54:53'),
(11, 'core', 'date_format', 'm/d/Y', '2016-08-09 22:54:53'),
(12, 'core', 'datetime_format', 'm/d/Y g:i a', '2016-08-09 22:54:53'),
(13, 'core', 'daydatetime_format', 'D, M j Y g:ia', '2016-08-09 22:54:53'),
(14, 'core', 'default_timezone_id', '8', '2016-08-09 22:54:53'),
(15, 'core', 'default_priority_id', '2', '2016-08-09 22:54:53'),
(16, 'core', 'enable_daylight_saving', '0', '2016-08-09 22:54:53'),
(17, 'core', 'reply_separator', '-- reply above this line --', '2016-08-09 22:54:53'),
(18, 'core', 'isonline', '1', '2016-08-09 22:54:53'),
(19, 'core', 'staff_ip_binding', '0', '2016-08-09 22:54:53'),
(20, 'core', 'staff_max_logins', '4', '2016-08-09 22:54:53'),
(21, 'core', 'staff_login_timeout', '2', '2016-08-09 22:54:53'),
(22, 'core', 'staff_session_timeout', '30', '2016-08-09 22:54:53'),
(23, 'core', 'passwd_reset_period', '0', '2016-08-09 22:54:53'),
(24, 'core', 'client_max_logins', '4', '2016-08-09 22:54:53'),
(25, 'core', 'client_login_timeout', '2', '2016-08-09 22:54:53'),
(26, 'core', 'client_session_timeout', '30', '2016-08-09 22:54:53'),
(27, 'core', 'max_page_size', '25', '2016-08-09 22:54:53'),
(28, 'core', 'max_open_tickets', '0', '2016-08-09 22:54:53'),
(29, 'core', 'autolock_minutes', '3', '2016-08-09 22:54:53'),
(30, 'core', 'default_smtp_id', '0', '2016-08-09 22:54:53'),
(31, 'core', 'use_email_priority', '0', '2016-08-09 22:54:53'),
(32, 'core', 'enable_kb', '0', '2016-08-09 22:54:53'),
(33, 'core', 'enable_premade', '1', '2016-08-09 22:54:53'),
(34, 'core', 'enable_captcha', '0', '2016-08-09 22:54:53'),
(35, 'core', 'enable_auto_cron', '0', '2016-08-09 22:54:53'),
(36, 'core', 'enable_mail_polling', '0', '2016-08-09 22:54:53'),
(37, 'core', 'send_sys_errors', '1', '2016-08-09 22:54:53'),
(38, 'core', 'send_sql_errors', '1', '2016-08-09 22:54:53'),
(39, 'core', 'send_login_errors', '1', '2016-08-09 22:54:53'),
(40, 'core', 'save_email_headers', '1', '2016-08-09 22:54:53'),
(41, 'core', 'strip_quoted_reply', '1', '2016-08-09 22:54:53'),
(42, 'core', 'ticket_autoresponder', '0', '2016-08-09 22:54:53'),
(43, 'core', 'message_autoresponder', '0', '2016-08-09 22:54:53'),
(44, 'core', 'ticket_notice_active', '1', '2016-08-09 22:54:53'),
(45, 'core', 'ticket_alert_active', '1', '2016-08-09 22:54:53'),
(46, 'core', 'ticket_alert_admin', '1', '2016-08-09 22:54:53'),
(47, 'core', 'ticket_alert_dept_manager', '1', '2016-08-09 22:54:53'),
(48, 'core', 'ticket_alert_dept_members', '0', '2016-08-09 22:54:53'),
(49, 'core', 'message_alert_active', '1', '2016-08-09 22:54:53'),
(50, 'core', 'message_alert_laststaff', '1', '2016-08-09 22:54:53'),
(51, 'core', 'message_alert_assigned', '1', '2016-08-09 22:54:53'),
(52, 'core', 'message_alert_dept_manager', '0', '2016-08-09 22:54:53'),
(53, 'core', 'note_alert_active', '0', '2016-08-09 22:54:53'),
(54, 'core', 'note_alert_laststaff', '1', '2016-08-09 22:54:53'),
(55, 'core', 'note_alert_assigned', '1', '2016-08-09 22:54:53'),
(56, 'core', 'note_alert_dept_manager', '0', '2016-08-09 22:54:53'),
(57, 'core', 'transfer_alert_active', '0', '2016-08-09 22:54:53'),
(58, 'core', 'transfer_alert_assigned', '0', '2016-08-09 22:54:53'),
(59, 'core', 'transfer_alert_dept_manager', '1', '2016-08-09 22:54:53'),
(60, 'core', 'transfer_alert_dept_members', '0', '2016-08-09 22:54:53'),
(61, 'core', 'overdue_alert_active', '1', '2016-08-09 22:54:53'),
(62, 'core', 'overdue_alert_assigned', '1', '2016-08-09 22:54:53'),
(63, 'core', 'overdue_alert_dept_manager', '1', '2016-08-09 22:54:53'),
(64, 'core', 'overdue_alert_dept_members', '0', '2016-08-09 22:54:53'),
(65, 'core', 'assigned_alert_active', '1', '2016-08-09 22:54:53'),
(66, 'core', 'assigned_alert_staff', '1', '2016-08-09 22:54:53'),
(67, 'core', 'assigned_alert_team_lead', '0', '2016-08-09 22:54:53'),
(68, 'core', 'assigned_alert_team_members', '0', '2016-08-09 22:54:53'),
(69, 'core', 'auto_claim_tickets', '1', '2016-08-09 22:54:53'),
(70, 'core', 'show_related_tickets', '1', '2016-08-09 22:54:53'),
(71, 'core', 'show_assigned_tickets', '1', '2016-08-09 22:54:53'),
(72, 'core', 'show_answered_tickets', '0', '2016-08-09 22:54:53'),
(73, 'core', 'hide_staff_name', '0', '2016-08-09 22:54:53'),
(74, 'core', 'overlimit_notice_active', '0', '2016-08-09 22:54:53'),
(75, 'core', 'email_attachments', '1', '2016-08-09 22:54:53'),
(76, 'core', 'number_format', '######', '2016-08-09 22:54:53'),
(77, 'core', 'sequence_id', '0', '2016-08-09 22:54:53'),
(78, 'core', 'log_level', '2', '2016-08-09 22:54:53'),
(79, 'core', 'log_graceperiod', '12', '2016-08-09 22:54:53'),
(80, 'core', 'client_registration', 'public', '2016-08-09 22:54:53'),
(81, 'core', 'max_file_size', '1048576', '2016-08-09 22:54:53'),
(82, 'core', 'landing_page_id', '1', '2016-08-09 22:54:53'),
(83, 'core', 'thank-you_page_id', '2', '2016-08-09 22:54:53'),
(84, 'core', 'offline_page_id', '3', '2016-08-09 22:54:53'),
(85, 'core', 'system_language', 'en_US', '2016-08-09 22:54:53'),
(86, 'mysqlsearch', 'reindex', '1', '2016-08-09 22:54:53'),
(87, 'core', 'default_email_id', '1', '2016-08-09 22:54:53'),
(88, 'core', 'alert_email_id', '2', '2016-08-09 22:54:53'),
(89, 'core', 'default_dept_id', '1', '2016-08-09 22:54:53'),
(90, 'core', 'default_sla_id', '1', '2016-08-09 22:54:53'),
(91, 'core', 'default_template_id', '1', '2016-08-09 22:54:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_content`
--

CREATE TABLE `helpdesk_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT 'other',
  `name` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_content`
--

INSERT INTO `helpdesk_content` (`id`, `content_id`, `isactive`, `type`, `name`, `body`, `lang`, `notes`, `created`, `updated`) VALUES
(1, 1, 1, 'landing', 'Landing', '<h1>Welcome to the Support Center</h1> <p> In order to streamline support requests and better serve you, we utilize a support ticket system. Every support request is assigned a unique ticket number which you can use to track the progress and responses online. For your reference we provide complete archives and history of all your support requests. A valid email address is required to submit a ticket. </p>', 'en_US', 'The Landing Page refers to the content of the Customer Portal''s initial view. The template modifies the content seen above the two links <strong>Open a New Ticket</strong> and <strong>Check Ticket Status</strong>.', '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(2, 2, 1, 'thank-you', 'Thank You', '<div>%{ticket.name},\n<br>\n<br>\nThank you for contacting us.\n<br>\n<br>\nA support ticket request has been created and a representative will be\ngetting back to you shortly if necessary.</p>\n<br>\n<br>\nSupport Team\n</div>', 'en_US', 'This template defines the content displayed on the Thank-You page after a\nClient submits a new ticket in the Client Portal.', '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(3, 3, 1, 'offline', 'Offline', '<div><h1>\n<span style="font-size: medium">Support Ticket System Offline</span>\n</h1>\n<p>Thank you for your interest in contacting us.</p>\n<p>Our helpdesk is offline at the moment, please check back at a later\ntime.</p>\n</div>', 'en_US', 'The Offline Page appears in the Customer Portal when the Help Desk is offline.', '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(4, 4, 1, 'registration-staff', 'Welcome to osTicket', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> We''ve created an account for you at our help desk at %{url}.<br /> <br /> Please follow the link below to confirm your account and gain access to your tickets.<br /> <br /> <a href="%{link}">%{link}</a><br /> <br /> <em style="font-size: small">Your friendly Customer Support System<br /> %{company.name}</em> </div>', 'en_US', 'This template defines the initial email (optional) sent to Agents when an account is created on their behalf.', '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(5, 5, 1, 'pwreset-staff', 'osTicket Staff Password Reset', '<h3><strong>Hi %{staff.name.first},</strong></h3> <div> A password reset request has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address.<br /> <br /> Follow the link below to login to the help desk and change your password.<br /> <br /> <a href="%{link}">%{link}</a><br /> <br /> <em style="font-size: small">Your friendly Customer Support System</em> <br /> <img src="cid:b56944cb4722cc5cda9d1e23a3ea7fbc" alt="Powered by osTicket" width="126" height="19" style="width: 126px" /> </div>', 'en_US', 'This template defines the email sent to Staff who select the <strong>Forgot My Password</strong> link on the Staff Control Panel Log In page.', '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(6, 6, 1, 'banner-staff', 'Authentication Required', '', 'en_US', 'This is the initial message and banner shown on the Staff Log In page. The first input field refers to the red-formatted text that appears at the top. The latter textarea is for the banner content which should serve as a disclaimer.', '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(7, 7, 1, 'registration-client', 'Welcome to %{company.name}', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> We''ve created an account for you at our help desk at %{url}.<br /> <br /> Please follow the link below to confirm your account and gain access to your tickets.<br /> <br /> <a href="%{link}">%{link}</a><br /> <br /> <em style="font-size: small">Your friendly Customer Support System <br /> %{company.name}</em> </div>', 'en_US', 'This template defines the email sent to Clients when their account has been created in the Client Portal or by an Agent on their behalf. This email serves as an email address verification. Please use %{link} somewhere in the body.', '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(8, 8, 1, 'pwreset-client', '%{company.name} Help Desk Access', '<h3><strong>Hi %{user.name.first},</strong></h3> <div> A password reset request has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address.<br /> <br /> Follow the link below to login to the help desk and change your password.<br /> <br /> <a href="%{link}">%{link}</a><br /> <br /> <em style="font-size: small">Your friendly Customer Support System <br /> %{company.name}</em> </div>', 'en_US', 'This template defines the email sent to Clients who select the <strong>Forgot My Password</strong> link on the Client Log In page.', '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(9, 9, 1, 'banner-client', 'Sign in to %{company.name}', 'To better serve you, we encourage our Clients to register for an account.', 'en_US', 'This composes the header on the Client Log In page. It can be useful to inform your Clients about your log in and registration policies.', '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(10, 10, 1, 'registration-confirm', 'Account registration', '<div><strong>Thanks for registering for an account.</strong><br/> <br /> We''ve just sent you an email to the address you entered. Please follow the link in the email to confirm your account and gain access to your tickets. </div>', 'en_US', 'This templates defines the page shown to Clients after completing the registration form. The template should mention that the system is sending them an email confirmation link and what is the next step in the registration process.', '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(11, 11, 1, 'registration-thanks', 'Account Confirmed!', '<div> <strong>Thanks for registering for an account.</strong><br /> <br /> You''ve confirmed your email address and successfully activated your account. You may proceed to open a new ticket or manage existing tickets.<br /> <br /> <em>Your friendly support center</em><br /> %{company.name} </div>', 'en_US', 'This template defines the content displayed after Clients successfully register by confirming their account. This page should inform the user that registration is complete and that the Client can now submit a ticket or access existing tickets.', '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(12, 12, 1, 'access-link', 'Ticket [#%{ticket.number}] Access Link', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> An access link request for ticket #%{ticket.number} has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> Follow the link below to check the status of the ticket #%{ticket.number}.<br /> <br /> <a href="%{recipient.ticket_link}">%{recipient.ticket_link}</a><br /> <br /> If you <strong>did not</strong> make the request, please delete and disregard this email. Your account is still secure and no one has been given access to the ticket. Someone could have mistakenly entered your email address.<br /> <br /> --<br /> %{company.name} </div>', 'en_US', 'This template defines the notification for Clients that an access link was sent to their email. The ticket number and email address trigger the access link.', '2016-08-09 17:54:53', '2016-08-09 17:54:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_department`
--

CREATE TABLE `helpdesk_department` (
  `dept_id` int(11) UNSIGNED NOT NULL,
  `tpl_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sla_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `email_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `autoresp_email_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `manager_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dept_name` varchar(128) NOT NULL DEFAULT '',
  `dept_signature` text NOT NULL,
  `ispublic` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `group_membership` tinyint(1) NOT NULL DEFAULT '0',
  `ticket_auto_response` tinyint(1) NOT NULL DEFAULT '1',
  `message_auto_response` tinyint(1) NOT NULL DEFAULT '0',
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_department`
--

INSERT INTO `helpdesk_department` (`dept_id`, `tpl_id`, `sla_id`, `email_id`, `autoresp_email_id`, `manager_id`, `dept_name`, `dept_signature`, `ispublic`, `group_membership`, `ticket_auto_response`, `message_auto_response`, `updated`, `created`) VALUES
(1, 0, 0, 0, 0, 0, 'Support', 'Support Department', 1, 1, 1, 1, '2016-08-09 17:54:52', '2016-08-09 17:54:52'),
(2, 0, 1, 0, 0, 0, 'Sales', 'Sales and Customer Retention', 1, 1, 1, 1, '2016-08-09 17:54:52', '2016-08-09 17:54:52'),
(3, 0, 0, 0, 0, 0, 'Maintenance', 'Maintenance Department', 0, 0, 1, 1, '2016-08-09 17:54:52', '2016-08-09 17:54:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_draft`
--

CREATE TABLE `helpdesk_draft` (
  `id` int(11) UNSIGNED NOT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL,
  `namespace` varchar(32) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `extra` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_draft`
--

INSERT INTO `helpdesk_draft` (`id`, `staff_id`, `namespace`, `body`, `extra`, `created`, `updated`) VALUES
(1, 1, 'ticket.response.1', '', NULL, '2016-08-09 22:57:34', '2016-08-09 22:57:44'),
(2, 1, 'ticket.note.1', '', NULL, '2016-08-09 22:57:34', '2016-08-09 22:57:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_email`
--

CREATE TABLE `helpdesk_email` (
  `email_id` int(11) UNSIGNED NOT NULL,
  `noautoresp` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `priority_id` tinyint(3) UNSIGNED NOT NULL DEFAULT '2',
  `dept_id` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `topic_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `userid` varchar(255) NOT NULL,
  `userpass` varchar(255) CHARACTER SET ascii NOT NULL,
  `mail_active` tinyint(1) NOT NULL DEFAULT '0',
  `mail_host` varchar(255) NOT NULL,
  `mail_protocol` enum('POP','IMAP') NOT NULL DEFAULT 'POP',
  `mail_encryption` enum('NONE','SSL') NOT NULL,
  `mail_port` int(6) DEFAULT NULL,
  `mail_fetchfreq` tinyint(3) NOT NULL DEFAULT '5',
  `mail_fetchmax` tinyint(4) NOT NULL DEFAULT '30',
  `mail_archivefolder` varchar(255) DEFAULT NULL,
  `mail_delete` tinyint(1) NOT NULL DEFAULT '0',
  `mail_errors` tinyint(3) NOT NULL DEFAULT '0',
  `mail_lasterror` datetime DEFAULT NULL,
  `mail_lastfetch` datetime DEFAULT NULL,
  `smtp_active` tinyint(1) DEFAULT '0',
  `smtp_host` varchar(255) NOT NULL,
  `smtp_port` int(6) DEFAULT NULL,
  `smtp_secure` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_auth` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_spoofing` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_email`
--

INSERT INTO `helpdesk_email` (`email_id`, `noautoresp`, `priority_id`, `dept_id`, `topic_id`, `email`, `name`, `userid`, `userpass`, `mail_active`, `mail_host`, `mail_protocol`, `mail_encryption`, `mail_port`, `mail_fetchfreq`, `mail_fetchmax`, `mail_archivefolder`, `mail_delete`, `mail_errors`, `mail_lasterror`, `mail_lastfetch`, `smtp_active`, `smtp_host`, `smtp_port`, `smtp_secure`, `smtp_auth`, `smtp_spoofing`, `notes`, `created`, `updated`) VALUES
(1, 0, 2, 1, 0, 'helpdesk@diazmorones.com', 'Support', '', '', 0, '', 'POP', 'NONE', NULL, 5, 30, NULL, 0, 0, NULL, NULL, 0, '', NULL, 1, 1, 0, NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(2, 0, 2, 1, 0, 'alerts@diazmorones.com', 'osTicket Alerts', '', '', 0, '', 'POP', 'NONE', NULL, 5, 30, NULL, 0, 0, NULL, NULL, 0, '', NULL, 1, 1, 0, NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(3, 0, 2, 1, 0, 'noreply@diazmorones.com', '', '', '', 0, '', 'POP', 'NONE', NULL, 5, 30, NULL, 0, 0, NULL, NULL, 0, '', NULL, 1, 1, 0, NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_email_account`
--

CREATE TABLE `helpdesk_email_account` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `protocol` varchar(64) NOT NULL DEFAULT '',
  `host` varchar(128) NOT NULL DEFAULT '',
  `port` int(11) NOT NULL,
  `username` varchar(128) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `options` varchar(512) DEFAULT NULL,
  `errors` int(11) UNSIGNED DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `lastconnect` timestamp NULL DEFAULT NULL,
  `lasterror` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_email_template`
--

CREATE TABLE `helpdesk_email_template` (
  `id` int(11) UNSIGNED NOT NULL,
  `tpl_id` int(11) UNSIGNED NOT NULL,
  `code_name` varchar(32) NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_email_template`
--

INSERT INTO `helpdesk_email_template` (`id`, `tpl_id`, `code_name`, `subject`, `body`, `notes`, `created`, `updated`) VALUES
(1, 1, 'ticket.autoresp', 'Support Ticket Opened [#%{ticket.number}]', ' <h3><strong>Dear %{recipient.name.first},</strong></h3> <p> A request for support has been created and assigned #%{ticket.number}. A representative will follow-up with you as soon as possible. You can <a href="%%7Brecipient.ticket_link%7D">view this ticket''s progress online</a>. </p> <br /><div style="color:rgb(127, 127, 127)"> Your %{company.name} Team, <br /> %{signature} </div> <hr /> <div style="color:rgb(127, 127, 127);font-size:small"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href="%%7Brecipient.ticket_link%7D"><span style="color:rgb(84, 141, 212)">login to your account</span></a> for a complete archive of your support requests.</em></div> ', NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(2, 1, 'ticket.autoreply', 'Re: %{ticket.subject} [#%{ticket.number}]', ' <h3><strong>Dear %{recipient.name.first},</strong></h3> A request for support has been created and assigned ticket <a href="%%7Brecipient.ticket_link%7D">#%{ticket.number}</a> with the following automatic reply <br /><br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /><br /> %{response} <br /><br /><div style="color:rgb(127, 127, 127)">Your %{company.name} Team,<br /> %{signature}</div> <hr /> <div style="color:rgb(127, 127, 127);font-size:small"><em>We hope this response has sufficiently answered your questions. If you wish to provide additional comments or informatione, please reply to this email or <a href="%%7Brecipient.ticket_link%7D"><span style="color:rgb(84, 141, 212)">login to your account</span></a> for a complete archive of your support requests.</em></div> ', NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(3, 1, 'message.autoresp', 'Message Confirmation', ' <h3><strong>Dear %{recipient.name.first},</strong></h3> Your reply to support request <a href="%%7Brecipient.ticket_link%7D">#%{ticket.number}</a> has been noted <br /><br /><div style="color:rgb(127, 127, 127)"> Your %{company.name} Team,<br /> %{signature} </div> <hr /> <div style="color:rgb(127, 127, 127);font-size:small;text-align:center"> <em>You can view the support request progress <a href="%%7Brecipient.ticket_link%7D">online here</a></em> </div> ', NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(4, 1, 'ticket.notice', '%{ticket.subject} [#%{ticket.number}]', ' <h3><strong>Dear %{recipient.name.first},</strong></h3> Our customer care team has created a ticket, <a href="%%7Brecipient.ticket_link%7D">#%{ticket.number}</a> on your behalf, with the following details and summary: <br /><br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /><br /> %{message} <br /><br /> If need be, a representative will follow-up with you as soon as possible. You can also <a href="%%7Brecipient.ticket_link%7D">view this ticket''s progress online</a>. <br /><br /><div style="color:rgb(127, 127, 127)"> Your %{company.name} Team,<br /> %{signature}</div> <hr /> <div style="color:rgb(127, 127, 127);font-size:small"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href="%%7Brecipient.ticket_link%7D"><span style="color:rgb(84, 141, 212)">login to your account</span></a> for a complete archive of your support requests.</em></div> ', NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(5, 1, 'ticket.overlimit', 'Open Tickets Limit Reached', ' <h3><strong>Dear %{ticket.name.first},</strong></h3> You have reached the maximum number of open tickets allowed. To be able to open another ticket, one of your pending tickets must be closed. To update or add comments to an open ticket simply <a href="%%7Burl%7D/tickets.php?e=%%7Bticket.email%7D">login to our helpdesk</a>. <br /><br /> Thank you,<br /> Support Ticket System', NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(6, 1, 'ticket.reply', 'Re: %{ticket.subject} [#%{ticket.number}]', ' <h3><strong>Dear %{recipient.name},</strong></h3> %{response} <br /><br /><div style="color:rgb(127, 127, 127)"> Your %{company.name} Team,<br /> %{signature} </div> <hr /> <div style="color:rgb(127, 127, 127);font-size:small;text-align:center"><em>We hope this response has sufficiently answered your questions. If not, please do not send another email. Instead, reply to this email or <a href="%%7Brecipient.ticket_link%7D" style="color:rgb(84, 141, 212)">login to your account</a> for a complete archive of all your support requests and responses.</em></div> ', NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(7, 1, 'ticket.activity.notice', 'Re: %{ticket.subject} [#%{ticket.number}]', ' <h3><strong>Dear %{recipient.name.first},</strong></h3> <div> <em>%{poster.name}</em> just logged a message to a ticket in which you participate. </div> <br /> %{message} <br /><br /><hr /> <div style="color:rgb(127, 127, 127);font-size:small;text-align:center"> <em>You''re getting this email because you are a collaborator on ticket <a href="%%7Brecipient.ticket_link%7D" style="color:rgb(84, 141, 212)">#%{ticket.number}</a>. To participate, simply reply to this email or <a href="%%7Brecipient.ticket_link%7D" style="color:rgb(84, 141, 212)">click here</a> for a complete archive of the ticket thread.</em> </div> ', NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(8, 1, 'ticket.alert', 'New Ticket Alert', ' <h2>Hi %{recipient.name},</h2> New ticket #%{ticket.number} created <br /><br /><table><tbody> <tr> <td> <strong>From</strong>: </td> <td> %{ticket.name} </td> </tr> <tr> <td> <strong>Department</strong>: </td> <td> %{ticket.dept.name} </td> </tr> </tbody></table> <br /> %{message} <br /><br /><hr /> <div>To view or respond to the ticket, please <a href="%%7Bticket.staff_link%7D">login</a> to the support ticket system</div> <em style="font-size:small">Your friendly Customer Support System</em> <br /><a href="http://osticket.com/"><img width="126" height="19" style="width:126px" alt="Powered By osTicket" src="cid:b56944cb4722cc5cda9d1e23a3ea7fbc" /></a> ', NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(9, 1, 'message.alert', 'New Message Alert', ' <h3><strong>Hi %{recipient.name},</strong></h3> New message appended to ticket <a href="%%7Bticket.staff_link%7D">#%{ticket.number}</a> <br /><br /><table><tbody> <tr> <td> <strong>From</strong>: </td> <td> %{ticket.name} </td> </tr> <tr> <td> <strong>Department</strong>: </td> <td> %{ticket.dept.name} </td> </tr> </tbody></table> <br /> %{message} <br /><br /><hr /> <div>To view or respond to the ticket, please <a href="%%7Bticket.staff_link%7D"><span style="color:rgb(84, 141, 212)">login</span></a> to the support ticket system</div> <em style="color:rgb(127,127,127);font-size:small">Your friendly Customer Support System</em><br /><img src="cid:b56944cb4722cc5cda9d1e23a3ea7fbc" alt="Powered by osTicket" width="126" height="19" style="width:126px" /> ', NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(10, 1, 'note.alert', 'New Internal Activity Alert', ' <h3><strong>Hi %{recipient.name},</strong></h3> An agent has logged activity on ticket <a href="%%7Bticket.staff_link%7D">#%{ticket.number}</a> <br /><br /><table><tbody> <tr> <td> <strong>From</strong>: </td> <td> %{note.poster} </td> </tr> <tr> <td> <strong>Title</strong>: </td> <td> %{note.title} </td> </tr> </tbody></table> <br /> %{note.message} <br /><br /><hr /> To view/respond to the ticket, please <a href="%%7Bticket.staff_link%7D">login</a> to the support ticket system <br /><br /><em style="font-size:small">Your friendly Customer Support System</em> <br /><img src="cid:b56944cb4722cc5cda9d1e23a3ea7fbc" alt="Powered by osTicket" width="126" height="19" style="width:126px" /> ', NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(11, 1, 'assigned.alert', 'Ticket Assigned to you', ' <h3><strong>Hi %{assignee.name.first},</strong></h3> Ticket <a href="%%7Bticket.staff_link%7D">#%{ticket.number}</a> has been assigned to you by %{assigner.name.short} <br /><br /><table><tbody> <tr> <td> <strong>From</strong>: </td> <td> %{ticket.name} </td> </tr> <tr> <td> <strong>Subject</strong>: </td> <td> %{ticket.subject} </td> </tr> </tbody></table> <br /> %{comments} <br /><br /><hr /> <div>To view/respond to the ticket, please <a href="%%7Bticket.staff_link%7D"><span style="color:rgb(84, 141, 212)">login</span></a> to the support ticket system</div> <em style="font-size:small">Your friendly Customer Support System</em> <br /><img src="cid:b56944cb4722cc5cda9d1e23a3ea7fbc" alt="Powered by osTicket" width="126" height="19" style="width:126px" /> ', NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(12, 1, 'transfer.alert', 'Ticket #%{ticket.number} transfer - %{ticket.dept.name}', ' <h3>Hi %{recipient.name},</h3> Ticket <a href="%%7Bticket.staff_link%7D">#%{ticket.number}</a> has been transferred to the %{ticket.dept.name} department by <strong>%{staff.name.short}</strong> <br /><br /><blockquote> %{comments} </blockquote> <hr /> <div>To view or respond to the ticket, please <a href="%%7Bticket.staff_link%7D">login</a> to the support ticket system. </div> <em style="font-size:small">Your friendly Customer Support System</em> <br /><a href="http://osticket.com/"><img width="126" height="19" alt="Powered By osTicket" style="width:126px" src="cid:b56944cb4722cc5cda9d1e23a3ea7fbc" /></a> ', NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(13, 1, 'ticket.overdue', 'Stale Ticket Alert', ' <h3> <strong>Hi %{recipient.name}</strong>,</h3> A ticket, <a href="%%7Bticket.staff_link%7D">#%{ticket.number}</a> is seriously overdue. <br /><br /> We should all work hard to guarantee that all tickets are being addressed in a timely manner. <br /><br /> Signed,<br /> %{ticket.dept.manager.name} <hr /> <div>To view or respond to the ticket, please <a href="%%7Bticket.staff_link%7D"><span style="color:rgb(84, 141, 212)">login</span></a> to the support ticket system. You''re receiving this notice because the ticket is assigned directly to you or to a team or department of which you''re a member.</div> <em style="font-size:small">Your friendly <span style="font-size:smaller">(although with limited patience)</span> Customer Support System</em><br /><img src="cid:b56944cb4722cc5cda9d1e23a3ea7fbc" height="19" alt="Powered by osTicket" width="126" style="width:126px" /> ', NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_email_template_group`
--

CREATE TABLE `helpdesk_email_template_group` (
  `tpl_id` int(11) NOT NULL,
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_email_template_group`
--

INSERT INTO `helpdesk_email_template_group` (`tpl_id`, `isactive`, `name`, `lang`, `notes`, `created`, `updated`) VALUES
(1, 1, 'osTicket Default Template (HTML)', 'en_US', 'Default osTicket templates', '2016-08-09 17:54:53', '2016-08-09 22:54:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_faq`
--

CREATE TABLE `helpdesk_faq` (
  `faq_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ispublished` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `keywords` tinytext,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_faq_category`
--

CREATE TABLE `helpdesk_faq_category` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `ispublic` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(125) DEFAULT NULL,
  `description` text NOT NULL,
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_faq_topic`
--

CREATE TABLE `helpdesk_faq_topic` (
  `faq_id` int(10) UNSIGNED NOT NULL,
  `topic_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_file`
--

CREATE TABLE `helpdesk_file` (
  `id` int(11) NOT NULL,
  `ft` char(1) NOT NULL DEFAULT 'T',
  `bk` char(1) NOT NULL DEFAULT 'D',
  `type` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `key` varchar(86) CHARACTER SET ascii NOT NULL,
  `signature` varchar(86) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `attrs` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_file`
--

INSERT INTO `helpdesk_file` (`id`, `ft`, `bk`, `type`, `size`, `key`, `signature`, `name`, `attrs`, `created`) VALUES
(1, 'T', 'D', 'image/png', 9452, 'b56944cb4722cc5cda9d1e23a3ea7fbc', 'gjMyblHhAxCQvzLfPBW3EjMUY1AmQQmz', 'powered-by-osticket.png', NULL, '2016-08-09 17:54:53'),
(2, 'T', 'D', 'text/plain', 24, 'S-MLzMWtx86n3ccfeGGNagoRoTDtol7o', 'MWtx86n3ccfeGGNafaacpitTxmJ4h3Ls', 'osTicket.txt', NULL, '2016-08-09 17:54:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_file_chunk`
--

CREATE TABLE `helpdesk_file_chunk` (
  `file_id` int(11) NOT NULL,
  `chunk_id` int(11) NOT NULL,
  `filedata` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_file_chunk`
--

INSERT INTO `helpdesk_file_chunk` (`file_id`, `chunk_id`, `filedata`) VALUES
(1, 0, 0x89504e470d0a1a0a0000000d49484452000000da0000002808060000009847e4c900000a43694343504943432070726f66696c65000078da9d53775893f7163edff7650f5642d8f0b1976c81002223ac08c81059a21092006184101240c585880a561415119c4855c482d50a489d88e2a028b867418a885a8b555c38ee1fdca7b57d7aefededfbd7fbbce79ce7fcce79cf0f8011122691e6a26a003952853c3ad81f8f4f48c4c9bd80021548e0042010e6cbc26705c50000f00379787e74b03ffc01af6f00020070d52e2412c7e1ff83ba50265700209100e02212e70b01905200c82e54c81400c81800b053b3640a009400006c797c422200aa0d00ecf4493e0500d8a993dc1700d8a21ca908008d0100992847240240bb00605581522c02c0c200a0ac40222e04c0ae018059b632470280bd0500768e58900f4060008099422ccc0020380200431e13cd03204c03a030d2bfe0a95f7085b8480100c0cb95cd974bd23314b895d01a77f2f0e0e221e2c26cb142611729106609e4229c979b231348e7034cce0c00001af9d1c1fe383f90e7e6e4e1e666e76ceff4c5a2fe6bf06f223e21f1dffebc8c020400104ecfefda5fe5e5d60370c701b075bf6ba95b00da560068dff95d33db09a05a0ad07af98b7938fc401e9ea150c83c1d1c0a0b0bed2562a1bd30e38b3eff33e16fe08b7ef6fc401efedb7af000719a4099adc0a383fd71616e76ae528ee7cb0442316ef7e723fec7857ffd8e29d1e234b15c2c158af15889b850224dc779b952914421c995e212e97f32f11f96fd0993770d00ac864fc04eb607b5cb6cc07eee01028b0e58d27600407ef32d8c1a0b91001067343279f7000093bff98f402b0100cd97a4e30000bce8185ca894174cc608000044a0812ab041070cc114acc00e9cc11dbcc01702610644400c24c03c104206e4801c0aa11896411954c03ad804b5b0031aa0119ae110b4c131380de7e0125c81eb70170660189ec218bc86090441c8081361213a8811628ed822ce0817998e04226148349280a420e988145122c5c872a402a9426a915d4823f22d7214398d5c40fa90dbc820328afc8abc47319481b25103d4027540b9a81f1a8ac6a073d174340f5d8096a26bd11ab41e3d80b6a2a7d14be87574007d8a8e6380d1310e668cd9615c8c87456089581a26c71663e55835568f35631d583776151bc09e61ef0824028b8013ec085e8410c26c82909047584c5843a825ec23b412ba085709838431c2272293a84fb4257a12f9c478623ab1905846ac26ee211e219e255e270e135f9348240ec992e44e0a21259032490b496b48db482da453a43ed210699c4c26eb906dc9dee408b280ac209791b7900f904f92fbc9c3e4b7143ac588e24c09a22452a494124a35653fe504a59f324299a0aa51cda99ed408aa883a9f5a496da076502f5387a91334759a25cd9b1643cba42da3d5d09a696769f7682fe974ba09dd831e4597d097d26be807e9e7e983f4770c0d860d83c7486228196b197b19a718b7192f994ca605d39799c85430d7321b9967980f986f55582af62a7c1591ca12953a9556957e95e7aa545573553fd579aa0b54ab550fab5e567da64655b350e3a909d416abd5a91d55bba936aece5277528f50cf515fa3be5ffd82fa630db2868546a08648a35463b7c6198d2116c63265f15842d6725603eb2c6b984d625bb2f9ec4c7605fb1b762f7b4c534373aa66ac6691669de671cd010ec6b1e0f039d99c4ace21ce0dce7b2d032d3f2db1d66aad66ad7ead37da7adabeda62ed72ed16edebdaef75709d409d2c9df53a6d3af77509ba36ba51ba85badb75cfea3ed363eb79e909f5caf50ee9ddd147f56df4a3f517eaefd6efd11f373034083690196c313863f0cc9063e86b9869b8d1f084e1a811cb68ba91c468a3d149a327b826ee8767e33578173e66ac6f1c62ac34de65dc6b3c61626932dba4c4a4c5e4be29cd946b9a66bad1b4d374ccccc82cdcacd8acc9ec8e39d59c6b9e61bed9bcdbfc8d85a5459cc54a8b368bc796da967ccb05964d96f7ac98563e567956f556d7ac49d65ceb2ceb6dd6576c501b579b0c9b3a9bcbb6a8ad9badc4769b6ddf14e2148f29d229f5536eda31ecfcec0aec9aec06ed39f661f625f66df6cf1dcc1c121dd63b743b7c727475cc766c70bceba4e134c3a9c4a9c3e957671b67a1739df33517a64b90cb1297769717536da78aa76e9f7acb95e51aeebad2b5d3f5a39bbb9bdcadd96dd4ddcc3dc57dabfb4d2e9b1bc95dc33def41f4f0f758e271cce39da79ba7c2f390e72f5e765e595efbbd1e4fb39c269ed6306dc8dbc45be0bdcb7b603a3e3d65facee9033ec63e029f7a9f87bea6be22df3dbe237ed67e997e07fc9efb3bfacbfd8ff8bfe179f216f14e056001c101e501bd811a81b3036b031f049904a50735058d05bb062f0c3e15420c090d591f72936fc017f21bf96333dc672c9ad115ca089d155a1bfa30cc264c1ed6118e86cf08df107e6fa6f94ce9ccb60888e0476c88b81f69199917f97d14292a32aa2eea51b453747174f72cd6ace459fb67bd8ef18fa98cb93bdb6ab6727667ac6a6c526c63ec9bb880b8aab8817887f845f1971274132409ed89e4c4d8c43d89e37302e76c9a339ce49a54967463aee5dca2b917e6e9cecb9e773c593559907c3885981297b23fe5832042502f184fe5a76e4d1d13f2849b854f45bea28da251b1b7b84a3c92e69d5695f638dd3b7d43fa68864f4675c633094f522b79911992b923f34d5644d6deaccfd971d92d39949c949ca3520d6996b42bd730b728b74f662b2b930de479e66dca1b9387caf7e423f973f3db156c854cd1a3b452ae500e164c2fa82b785b185b78b848bd485ad433df66feeaf9230b82167cbd90b050b8b0b3d8b87859f1e022bf45bb16238b5317772e315d52ba647869f0d27dcb68cbb296fd50e2585255f26a79dcf28e5283d2a5a5432b82573495a994c9cb6eaef45ab9631561956455ef6a97d55b567f2a17955fac70aca8aef8b046b8e6e2574e5fd57cf5796ddadade4ab7caedeb48eba4eb6eacf759bfaf4abd6a41d5d086f00dad1bf18de51b5f6d4ade74a17a6af58ecdb4cdcacd03356135ed5bccb6acdbf2a136a3f67a9d7f5dcb56fdadabb7bed926dad6bfdd777bf30e831d153bdeef94ecbcb52b78576bbd457df56ed2ee82dd8f1a621bbabfe67eddb847774fc59e8f7ba57b07f645efeb6a746f6cdcafbfbfb2096d52368d1e483a70e59b806fda9bed9a77b5705a2a0ec241e5c127dfa67c7be350e8a1cec3dcc3cddf997fb7f508eb48792bd23abf75ac2da36da03da1bdefe88ca39d1d5e1d47beb7ff7eef31e36375c7358f579ea09d283df1f9e48293e3a764a79e9d4e3f3dd499dc79f74cfc996b5d515dbd6743cf9e3f1774ee4cb75ff7c9f3dee78f5df0bc70f422f762db25b74bad3dae3d477e70fde148af5b6feb65f7cbed573cae74f44deb3bd1efd37ffa6ac0d573d7f8d72e5d9f79bdefc6ec1bb76e26dd1cb825baf5f876f6ed17770aee4cdc5d7a8f78affcbedafdea07fa0fea7fb4feb165c06de0f860c060cfc3590fef0e09879efe94ffd387e1d247cc47d52346238d8f9d1f1f1b0d1abdf264ce93e1a7b2a713cfca7e56ff79eb73abe7dffde2fb4bcf58fcd8f00bf98bcfbfae79a9f372efaba9af3ac723c71fbcce793df1a6fcadcedb7defb8efbadfc7bd1f9928fc40fe50f3d1fa63c7a7d04ff73ee77cfefc2ff784f3fb803925110000001974455874536f6674776172650041646f626520496d616765526561647971c9653c0000032869545874584d4c3a636f6d2e61646f62652e786d7000000000003c3f787061636b657420626567696e3d22efbbbf222069643d2257354d304d7043656869487a7265537a4e54637a6b633964223f3e203c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f2220783a786d70746b3d2241646f626520584d5020436f726520352e362d633031342037392e3135363739372c20323031342f30382f32302d30393a35333a30322020202020202020223e203c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e203c7264663a4465736372697074696f6e207264663a61626f75743d222220786d6c6e733a786d703d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f2220786d6c6e733a786d704d4d3d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f6d6d2f2220786d6c6e733a73745265663d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f73547970652f5265736f75726365526566232220786d703a43726561746f72546f6f6c3d2241646f62652050686f746f73686f70204343203230313420284d6163696e746f7368292220786d704d4d3a496e7374616e636549443d22786d702e6969643a36453243393544454136373331314534424443444446393146414639344441352220786d704d4d3a446f63756d656e7449443d22786d702e6469643a3645324339354446413637333131453442444344444639314641463934444135223e203c786d704d4d3a4465726976656446726f6d2073745265663a696e7374616e636549443d22786d702e6969643a4346413734453446413637313131453442444344444639314641463934444135222073745265663a646f63756d656e7449443d22786d702e6469643a4346413734453530413637313131453442444344444639314641463934444135222f3e203c2f7264663a4465736372697074696f6e3e203c2f7264663a5244463e203c2f783a786d706d6574613e203c3f787061636b657420656e643d2272223f3e8bfef6ca0000170b4944415478daec5d099c53d5d53f2f7b32c9646680617118905d3637d0cfad282aa82d0af6f3b3b62ef52bd6d685ba206eb54a15c1adf6538b52b4d53a564454a42c0565d132a86c82a0ac82ec8b0233ccc24c9297f7dd9bfc6f73e64e92c90c5071ccf9fd0e249397f7eebbf7fccff99f73efbb31860f1f4e593936a4da74d2d8eeef53b17f2f51c4fd5d6b7e4ba19385ee177a9bd0ed8d3e832534dfa4d2351ebafaad3cb2d92cb219cd636c6d59f3ceca11920b849e27f4c742af68f4b7a342f34c5ab8de4d3f9b12a4b0005d7301991447d63ebed7e2125a283457a85d680d22d2be26463405995d8dfeb63f4a4b44241bfa463e5902642d7d518a5a59a065e5bb29ad849e2a7480d0d384b617ea05e024bb89080d093d287495d0e94267093d90c1b9edf85f82b4a2d19451006dc65617ed2bb3538f76618a449b57c76781f6fd908e42af14fabf42bb65f89dde42af12ba4ce848a10bd21c9b23741803f3bb42c709fd6d4657921015003b74c8205f8ed9ec4096cdd19abf7884de2e74210cbf5b13ce2123e05ca1f7e37cc9e45788921c3af703d80d47b3a049b3b739e989d21c2aca8d36cb81c802adf94a6ba15385fe41e87147c04e1e018dbc00399da49b4542ef4d13b97e2d343fed999d16d57ee3a0498b7dd426b779e56559ead8fce504a16f0aed7584cf7b2e72bbbd426b01b8d6691c763f8a97fa1f4c471bb71db4d194b51e6a17c8022d2bdf1d9151e695a30032253ee47c99caef285ecd1c9b92df0aea58e88fc672b3e654d2cf52c7e62d922af6ff96ae2de3d152a1cb8556b1bfcb4249cb3a47ca54cc23fec93569fe1a0f4522061946f31d946c443be65c5fe470befd736aca64f19193f5427f227487d00e427f29f432e477dfc4efcf8abbf76094e6adf4d0a4955e9ab6d14d6e41218de63cac59cb3e86bc9e11a592eda79019f60aab6b74f54de64a7725f9bb9c3c2eff0fddc2c342bf04555c47f142493f11e7a6935d00cc6fc6d0f4e55e07fdf4a502ba654690262ef791d76191c76135efb1cd9af7b123d2a36f3e14a4903d4c5eabd1fe5d468e9edadf4a854e04008347b9f9e385be56871afaa22171232119c50e96dbe9c036173d58eaa7399b5c541532c8efb2a87bab08990263d1e68db32cd08e297a61086bb36cb4fa4031f5cfdf127b9da104845ea3fd4d4694a1145f62d5e62837fd39a1a312ad11912b274aabd67b68f1976eea901fa1055b5cf468690eb5f34763343127271eb14debfb31b68eb3cf3e3b6be1c7904c9bbf8cdedcdd8bfab7d824dc7cc67ef02c8a97dd95940178df20b66c10dae22834572ed31a416ad58808c2729de2e37372c914579db5c94d0b05d00c579472dd227ab5689eab3eb211ed3b99a75994e7aa8a17452c8f30de8c5cbe5c31ef62ef1f12ba04afe522e12784be91c178cbfcea75d04c59ccc8a37839df29b412f95e5b009b50f45856e70c820e4e58e1a5cdbb9d542822598fb689758bdf57906581760c8add885255d843353541f2d84399d04759363f91bdff40e8abda316b8456537c82399dc849ee0758cae8a3c42a907244ca2280f64ca18384ce8e013d2a401834e9ab3d4eca775a146a19891539be2570c9f6ca2561edf17e8fd079420f6581969598f8edb5b4a2a20d95ecec4bc33b7f4854eb6fe82b8329be1e51c95f11c5b874a1d4eb1489196349ec559ec8b142229456daaac856673e4cca761457a653e2319b7cf258bbb6ee70d1b0c979b4eda09d5a78a37252ad1dc527b723a0b029fd0bc5579a48aa5b20d48df6ca08bab109dd2823f23d4207328afb43a1dbb240cb4a4c2c11481c24cbddb528f11b149f074e29329aa9b027170fbf9be498ae1ab5d42f2acff027725a9f4b44dcfb561e9d2828dfd567098c1db2c59b107b80c650935d6159c720b96adf8a3d42b39d0a22347e6e80566e7752f7b691588e46f155ff72517315ce904a64e4dc041a7abef437147f22e079a13765a963568e8a14b8aae9fdbddde8e4e00eea259442fe5460cb038553f24fd03b5d4e4e79b15819de7a37e2b61e731cb4d17df302f4e4877e6a2fa8dfac0d6eaa0e1bb4b7d246c37ad7d0c80b2a880ec46696db89e6b48c3529d7dc459ee8a1454b7cf4d66a0f15b73415c808f91c01340d492ef2c2969478b6cddbc42e8c6ac0361b88a8474a8e475ff786d39891055a7a31601c4e78e3508ae33c38a6065efec82418369376d40468555911f50aec8d47b6e4f36a72deac2f5eef448ea58ba461dd539aa3db9a496dc2b74c9c951b1afb5e20669d9d5acb0286413336ba636b0f0f08a0e57b2c1a39a052dcb14057b55125a0b05ae464f3b7d718e3576df6866f9e9627724b8a1dc74af68af65530c33759dea7447e26172aaf07d8f2d1ff9587317effe985263d50483a09efc76581d6b0c8817e01b98f7cd46434c59f3ae6d287e2eb0adbe3987b8ed4c5a30254c7b92b68b22cf38b88d6397777aacd7ae4fc5800afbf04fdd2e5062d874b80cc4e2f52dbf0cdcfcccc0ddd332d488581682b9f61150b70796d762bd2ca67c9a7a537b7f24523f3b63ae9ea92022ab9f28004db12ea5a3b78f906d7ce817715c92a89af4b71a83857e05180cc0580c8b63c04f07b589e269dd2a39478505452cf3b50c49120fc239c979b9ab225c2b727ed19c8482fbc648196a22641f179a90ef83f999517a0b2e54c6ac8870b36e1903d22b2391ca174391a5fa8bb32491e24dbf500e94bed2cda2d22d96801b2179ef9672eddfe76b0b038dfbcc9618b3da8d99e5d4d562a17442d7ab263303a7ff27a3779dfc9a347cfaf282f793dbf7cd2a75e5bb9d3bab66361e41671813ed1ba516a8bd0c729be624497afd96b79839f4a40e3fdd66398e5a44b96b7a1a0a36c657f16680d4b84d1c50329a8e341786e19fd761f8d46380d934ab69d4277772a25476c5ecd96cc8b2af944fb4c56dcfe86aa20972951d378c0e631d74e1054f1376fe69dd12edf7cce65a753a256ec3e5e84d1c8fce807422f911a8ed2bdc707cd715345def6c53e3b2ddeee143431fa74aff6a111a66944c5e7938d3855947d271fd11922f44f42cf107a9d9623f19ccdc5de77a2f8960b76383bb984ec1f49ba463ec83a18d4b91011b312e3b080e24f103444e5e5b3729782d606e18cc653dd6df22ea6f814462125a638e48a9b49ac827922faba9386a78be18465db2a1c48e04e45c366a3027435c5e74b1623c1ae4c929b0c42e2e7c54517c13311e3d936500895a0cbfd248a1156373203f6e33b1edce81e50221931fac393c8b9a0f9e0f2c40ca115dab91e83d4055c7913a8d520e42816aa72ff22aa57b23e139d9583aadd7a16fa53f17d1b8b14ea7c3f419fc8364ea3f88a0c79ce8b700e3948ab9200a2ad8a1ec436c2310c8b361fcaa750d41e075a7d69cd220fa78db2523706c512259206de4fdee8c48dfbedd18b1f6b4355216a2f403631e0b27a09ca27f3895b847ea5e577d7a3fa375600715fae2bf67dea986f5e651834221436b6898ebdc2a80ff47384fe1db6f421c5d75c72e2ca6b9e4a4e02ad54f29724409351f74eaabfae53c9f9a0a5e9e6cc241b795a285f16f53aeb7be9c0e4130757012c94a40db7012f8310b975b9041a73d60e7886e7d1b07168e80fd817e682e7abd02e9fde7d099e8a8b1cec6728be625b1ad673f04c37e3fc5246a1e42baf251fa128c1df47c33822f03412a47281ea29da3556c218168236498fd91946f50d3aef200658523e39b1da513b4729dab412efefa6f813c05e96d34cc8b052c6238bccd32e637f1b05e02fc2a0f5c0352f64d4497a6639b92ce79be6087d4f672b3e7b38be06b2be7871ef2aeaeec06bb9825edf5a6035a2ca72b975c0dc751efabacaa016bee81d22924990cd455b7507548b5cb50ad1718cc8df66e5ba2de90ccfb5e2cdba2f49342538b47b30c63722572b6ba01fab01bc54858c47615fe9641302433ab6f6a80632d9c6e1b8df7600dd59ecf3b5c82dbba3df7bc0b6fa30c79f4eec3656fdf1c2e0fb2131fd9a798817019a020040814c469979e8401f3af63a78e6103aac2f2b459fc3ae752e5e0710663d300809b25718c85622628510a64bd01935ac3347a0ed8468741e0cb823c02bc1f5193e3f0bf7e0c7bd3d82f698308e7d309ece1974a0c9bcd710b4750dfe5688b6ca39ac298c6674d1bc7e3bbc9e579f395874c874c68a23290a364578fd3972a2f3e138b8bc1feb5f4b80cc1fa5671704e80e919715e644fb8a9cec06ac9abf2b09c8b8bc0a1b90ece15aadf4fe759aef2d40df47f0dd4ccaf2a9a2dd4d1ac8c2601fd2f15e4ef10d825e461008a5c8ab09c7ddc8decf60202314b8ce624ce54644da7e9478d68e40379f84d31f053ac9dbfe216cf23119c06c1a979527fe394070298b6203e1010650624ee65550aef371ace2acf701040bf1fe7480e838189d92229627aa0d5c2621c2aa05b2b7e3264f4747d78262de0b6e1d66605d0bca3012e7e8064e3d1c6d3f9112cf6bf5c2ebdb1958ef46243f1714b5b1320614fc62500a15b106c1d89570b6309819eb7bf5124541196f68bf8c7caeea64f9591eebb7452cc7716a51659830d7ed5460d2cb4b7c3462662e15e444c9668bf5878cda6fb3e89e4ed444f87fc381aad2fd3d6c2c75d98131b95ca3a48d957614df558b8bbcee50b09a77c042ae475ffb293117a700bb034e9f6fa9b00481a196a51043d8e712c47fc6e726d281fbd8e79781cd3c0150717eff36aaaeb29d636d5a989ec0e6623ec609945c04a35586f104a302ff82272018f879f83e21dcb646bee447b42c0705cd47e408b2ca4d4f16c966200fca017551e7ec0bc0d5e0fd6e78aaa9888aaa48f019724c173cdc348a3f662fe517a07152a683ea124acabf078dc9a41225650522a389c8328e1d73211cd6a78c21a81caf27f37ecbeb700d234a65110fe5b92b523d759dcbfa6d03a35e4abe821155927ca8b2ca46ef6f709343bcf60bfa28685f6f16493399cc5d0e70754234fb2bae712ea2d6431897028db6495bd9494d9b6754116d288bfc0446f287469c672f22ea5896b7ae41fff05d99af003323b0a82949ce3507e3ad72d801acc063d3a87dcaaae347dafb8540a90340511bbe7c00bac2450128884e919ee57794d8cca5150cfe7544ce4b0096fe68d42ae459aa43a5112e8331dbe0557258343c9e79a2c5cc903bb2c8f95f42bf40874431707e166d78de56cbdeaf03e8bb6708b4355a65f22b78d0e3e048b602cc27c3500d44e9beac9feb806c77ad9ffa04f6500719cdcc64f978ec3e5d68f716fcad428bb09bd50f47bcbed447afadf052b7c2887cc8d260fd9ce98f51ec8113ea0276f011a2dbd3a0c00f42bf86432c45eeb688524ff8672a03b5f72f36f2fb39a070aa382103c4ad8ce613ec94afa07122425a0c3435781d4832c5a2072d473aa09949383325a9bed524f1827c998b1b615919db190015013c1edcb4a45abd19c857b39bd80f301bec26aad1e6cf61546ecde055b9d8c3a2d35a749a9d1213a6657008aa1ad8d4690e2345bf998c46a836ce06fde90c2adb07ed5c0be7f36f17bead26482709903dd06336b96d2210c4b636a85710e9c61cdc4a561451530f712aeab2a862a793a62cf3519ba0a99e64b6b17bce34d2f07b72b2b11c08ca7521c6b21fe8d71046a16ea3a62de8b592cc17963761aeed4cadb89183ea376940e37b509e4ce996ae252490c206281dd0f42771fbb063b6800214c31b77609e946040f90c8835180809b40b1065f6c0b0d4e31a97b2c8f239c01566d5a3a19a975625f508aeafa2939d4d2896c3abfa71ce61f0faea7307bedf17f75180e8a8775ecb0c9377d20a1c525a30c7b28b45cd4fe0746e60c587c5e897b86559063dde6d2e15f9f7922706325faafd434e60c6ae8a2821966bc7fb4dd0c48dfb1d34759d9bba251ebc3429b18f48a65b1cf8d02f11aa3b191b01f5fd107d5c8cfe389b152ae458fc8cd4063d4d77680d1a740ad1135c2722dc0ac684ec5a7e1b4d33b513812d39d938da523889a41f0e67865f4075574e7fc0e634bab2ea939acfb99b356235cbf3545e520c63530f10560268a762e03e62002318e48fd8353aa12cfb77cc6354a7a8506d619dd70ff9a2fabc27a620fe0f45096530c35815d48e42498b46785c791dbe95c055ecf522ad38a1728e1fe3f55bfc8445de723a217f0b051d358864494196c768ed275a345774b0b681b6af67ce3413e986b2f676e43cc751fd5d882df4ff5c140706e2d8412812351560116d0e2caf09e79a8cc2899256a81afa5864afd12aa6e750628ef53ca61742252bfb23632e562aa0e911ed14508e1994982c56d59979283a8c00b04623227c4675378699c1aa6c2b0028bf96b4efc580f462f3149fb282cc6078da975052fd1237d59d150f2a29f92e5e5528e85c8ece9c8af73b0186b6e884ab50d0990083790305971e1ac01b0299eac7f1e8fc001c886acb1bec3899a7fd1ac704d01f1ff393dedd7901d9648551e665a99fae1e0c5af309c6454fc0b7fddb68c206752988d0d0eeb5b468bb33b6210e9b5b5355c427a8e15f8c198871fc1ba2f5c7282efd94524f0eaf42d1621cf2ba579b18d1b668efafd48b470dc84e14abd6c0299eceeee90e7c56a61546fc68ffc126445deef4ea453413206b8f12797f366877e2f517a03ddfe0c43f44a9bd279bb3b99575fc622de1547310fb984795b29479ad7988ac07603897a20cdf1dc73c850a612b56c20d68f73209f31f11789aab31d7d1964d41bc817997296cde6b24b8fcb3ac1c1d4891c3799937fc1cfd740da2956acb48f4012f362dd34ac075263c7d22a251c4956e407bb36af04b1ab52e60112d4eb1420605da86e99ad3ab687fb54d2f5e95829d5cdf80111531765302c32f474a509421bd360f23a2bda339b611193a4362fdb10bf6f080e6181e44c48d52dd5fcc398df886430d8bfe53555d5345343bbcf218d0421faa6faf22a228f907f8f7507829278ce503ccb570cab20f03d409de9dd39c7b01885012ef340509fee5302c17403a15d14c958d7f815c6a13d55ff0f96718f930388230ee63068b2221dceb2c783737aef11a0a149df09d64fb227e8168e083e793e7ba19f9de7e50953949b8fd2c4653e7d43b6b6d4046323f0a25fb357a7c3afab83568d044eddb43d87447c254455493e57d2dfecb717a1ce77b0aa5fb6949eeb31051bf330cfe23e6cc6474fe2dc621d91c4457440cd223772365261cb09a1af1c0514e44fb7781950c80dd946aed71b2a2d47b70a4a318061e076b9b08a7a3162bdc8f7b180f675a0bc7ab72d0a56c0cabc122fc6c8e6d246cdb702449123f8031bb603cc9f8cb3a2493ea07ec4269e6629642939d635d9acedd806b38718db0768d43946492579315e87855de0f27b91f799ebfc0a118aca0f05192e90e2e07883d6f0419858133b581568598202596fe7c46f5d73d8a56ca072bad9e18248b45275e391b4ff5374bed01cf4cf51c83e8bdb25a1b850e19e4c8abb349ce3478f88761b0cfc24195e13ecec4679dd08fb7b3b3be00605f0b631c073a1ac1980d46b42844e49d7e184033d1b73329b1be533ab8df205f3f08f0b580935ca84d29e8b4ee1938d67e782f03c6efc1c64621d5506ee97f702f07d8bde502d8250c685b70dd8b5865732cdabec491a20a6965904cd311981fc9440ef7814a4b4b728fd675944198294ac0772202f664b4b1fef2a5785eb618cce257c8fb0a700fd310c9e624b9c60044f728a22d8b5d069d5d14a2d33a86686bb99de76984fc6433febf15aa8ff12bf0ee3bd8df556efe340a4bc9b650280350c768fdebd70a3b5e061ebbc6b2942c075d7c9e018458becbabb105547709569ec6de760004bc10750baabf8fe0be9e625328c114d5d9965a3f3d0c6718607892dad1a135c04d59391a92835c53816c33a8653a59096ae6426ea976a14a3597730306fb7ad27f9d53d0c62e27d4d2259b6a68cc9c80005a3d5ff01aa2f3a598f66801606f06655b9ae2bacb29f123f132a76907b0ec039d9f4dc937d7998e625618f7f515ab844e4074f253fd5f195d8aebfd08ff7766154875cd994865a6e37f0b6dd0e9ffdb486b06205ab544dbbdf8ee2728989d838ab91f4e541ebb15e77c5f3be722b4eb564a4c8dc99469bef1f2cb2ff742688ca0911bb3b838e222a9c62fe12177c2fb7f9aecc0ebca4635e5fc7654212b51c1ad2f4193464f0fd298d21cea10349b439f1a70306a43950a4acc2736b8a3519a7ed40b377644332fd84235a8aad540db5a2070c9e3cbfe5f800100b3e0af98735d4afd0000000049454e44ae426082),
(2, 0, 0x43616e6e6564204174746163686d656e747320526f636b21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_filter`
--

CREATE TABLE `helpdesk_filter` (
  `id` int(11) UNSIGNED NOT NULL,
  `execorder` int(10) UNSIGNED NOT NULL DEFAULT '99',
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `match_all_rules` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `stop_onmatch` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `reject_ticket` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `use_replyto_email` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `disable_autoresponder` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `canned_response_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `email_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `priority_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sla_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `form_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `topic_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `ext_id` varchar(11) DEFAULT NULL,
  `target` enum('Any','Web','Email','API') NOT NULL DEFAULT 'Any',
  `name` varchar(32) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_filter`
--

INSERT INTO `helpdesk_filter` (`id`, `execorder`, `isactive`, `status`, `match_all_rules`, `stop_onmatch`, `reject_ticket`, `use_replyto_email`, `disable_autoresponder`, `canned_response_id`, `email_id`, `status_id`, `priority_id`, `dept_id`, `staff_id`, `team_id`, `sla_id`, `form_id`, `topic_id`, `ext_id`, `target`, `name`, `notes`, `created`, `updated`) VALUES
(1, 99, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Email', 'SYSTEM BAN LIST', 'Internal list for email banning. Do not remove', '2016-08-09 17:54:53', '2016-08-09 17:54:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_filter_rule`
--

CREATE TABLE `helpdesk_filter_rule` (
  `id` int(11) UNSIGNED NOT NULL,
  `filter_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `what` varchar(32) NOT NULL,
  `how` enum('equal','not_equal','contains','dn_contain','starts','ends','match','not_match') NOT NULL,
  `val` varchar(255) NOT NULL,
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_filter_rule`
--

INSERT INTO `helpdesk_filter_rule` (`id`, `filter_id`, `what`, `how`, `val`, `isactive`, `notes`, `created`, `updated`) VALUES
(1, 1, 'email', 'equal', 'test@example.com', 1, '', '2016-08-09 17:54:53', '2016-08-09 17:54:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_form`
--

CREATE TABLE `helpdesk_form` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` varchar(8) NOT NULL DEFAULT 'G',
  `deletable` tinyint(1) NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `instructions` varchar(512) DEFAULT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_form`
--

INSERT INTO `helpdesk_form` (`id`, `type`, `deletable`, `title`, `instructions`, `notes`, `created`, `updated`) VALUES
(1, 'U', 1, 'Contact Information', NULL, NULL, '2016-08-09 17:54:52', '2016-08-09 17:54:52'),
(2, 'T', 1, 'Ticket Details', 'Please Describe Your Issue', 'This form will be attached to every ticket, regardless of its source.\nYou can add any fields to this form and they will be available to all\ntickets, and will be searchable with advanced search and filterable.', '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(3, 'C', 1, 'Company Information', 'Details available in email templates', NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(4, 'O', 1, 'Organization Information', 'Details on user organization', NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(5, 'L1', 1, 'Ticket Status Properties', 'Properties that can be set on a ticket status.', NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_form_entry`
--

CREATE TABLE `helpdesk_form_entry` (
  `id` int(11) UNSIGNED NOT NULL,
  `form_id` int(11) UNSIGNED NOT NULL,
  `object_id` int(11) UNSIGNED DEFAULT NULL,
  `object_type` char(1) NOT NULL DEFAULT 'T',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_form_entry`
--

INSERT INTO `helpdesk_form_entry` (`id`, `form_id`, `object_id`, `object_type`, `sort`, `created`, `updated`) VALUES
(1, 4, 1, 'O', 1, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(2, 3, NULL, 'C', 1, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(3, 1, 1, 'U', 1, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(4, 2, 1, 'T', 1, '2016-08-09 17:54:53', '2016-08-09 17:54:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_form_entry_values`
--

CREATE TABLE `helpdesk_form_entry_values` (
  `entry_id` int(11) UNSIGNED NOT NULL,
  `field_id` int(11) UNSIGNED NOT NULL,
  `value` text,
  `value_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_form_entry_values`
--

INSERT INTO `helpdesk_form_entry_values` (`entry_id`, `field_id`, `value`, `value_id`) VALUES
(1, 28, '420 Desoto Street\nAlexandria, LA 71301', NULL),
(1, 29, '3182903674', NULL),
(1, 30, 'http://osticket.com', NULL),
(1, 31, 'Not only do we develop the software, we also use it to manage support for osTicket. Let us help you quickly implement and leverage the full potential of osTicket''s features and functionality. Contact us for professional support or visit our website for documentation and community support.', NULL),
(2, 23, 'DM Helpdesk', NULL),
(2, 24, NULL, NULL),
(2, 25, NULL, NULL),
(2, 26, NULL, NULL),
(3, 3, NULL, NULL),
(3, 4, NULL, NULL),
(4, 20, 'osTicket Installed!', NULL),
(4, 22, NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_form_field`
--

CREATE TABLE `helpdesk_form_field` (
  `id` int(11) UNSIGNED NOT NULL,
  `form_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'text',
  `label` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `edit_mask` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `configuration` text,
  `sort` int(11) UNSIGNED NOT NULL,
  `hint` varchar(512) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_form_field`
--

INSERT INTO `helpdesk_form_field` (`id`, `form_id`, `type`, `label`, `required`, `private`, `edit_mask`, `name`, `configuration`, `sort`, `hint`, `created`, `updated`) VALUES
(1, 1, 'text', 'Email Address', 1, 0, 15, 'email', '{"size":40,"length":64,"validator":"email"}', 1, NULL, '2016-08-09 17:54:52', '2016-08-09 17:54:52'),
(2, 1, 'text', 'Full Name', 1, 0, 15, 'name', '{"size":40,"length":64}', 2, NULL, '2016-08-09 17:54:52', '2016-08-09 17:54:52'),
(3, 1, 'phone', 'Phone Number', 0, 0, 0, 'phone', NULL, 3, NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(4, 1, 'memo', 'Internal Notes', 0, 1, 0, 'notes', '{"rows":4,"cols":40}', 4, NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(20, 2, 'text', 'Issue Summary', 1, 0, 15, 'subject', '{"size":40,"length":50}', 1, NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(21, 2, 'thread', 'Issue Details', 1, 0, 15, 'message', NULL, 2, 'Details on the reason(s) for opening the ticket.', '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(22, 2, 'priority', 'Priority Level', 0, 1, 3, 'priority', NULL, 3, NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(23, 3, 'text', 'Company Name', 1, 0, 3, 'name', '{"size":40,"length":64}', 1, NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(24, 3, 'text', 'Website', 0, 0, 0, 'website', '{"size":40,"length":64}', 2, NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(25, 3, 'phone', 'Phone Number', 0, 0, 0, 'phone', '{"ext":false}', 3, NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(26, 3, 'memo', 'Address', 0, 0, 0, 'address', '{"rows":2,"cols":40,"html":false,"length":100}', 4, NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(27, 4, 'text', 'Name', 1, 0, 15, 'name', '{"size":40,"length":64}', 1, NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(28, 4, 'memo', 'Address', 0, 0, 0, 'address', '{"rows":2,"cols":40,"length":100,"html":false}', 2, NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(29, 4, 'phone', 'Phone', 0, 0, 0, 'phone', NULL, 3, NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(30, 4, 'text', 'Website', 0, 0, 0, 'website', '{"size":40,"length":0}', 4, NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(31, 4, 'memo', 'Internal Notes', 0, 0, 0, 'notes', '{"rows":4,"cols":40}', 5, NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(32, 5, 'state', 'State', 1, 0, 63, 'state', '{"prompt":"State of a ticket"}', 1, NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(33, 5, 'memo', 'Description', 0, 0, 15, 'description', '{"rows":2,"cols":40,"html":false,"length":100}', 3, NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_groups`
--

CREATE TABLE `helpdesk_groups` (
  `group_id` int(10) UNSIGNED NOT NULL,
  `group_enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL DEFAULT '',
  `can_create_tickets` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `can_edit_tickets` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `can_post_ticket_reply` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `can_delete_tickets` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `can_close_tickets` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `can_assign_tickets` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `can_transfer_tickets` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `can_ban_emails` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `can_manage_premade` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `can_manage_faq` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `can_view_staff_stats` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_groups`
--

INSERT INTO `helpdesk_groups` (`group_id`, `group_enabled`, `group_name`, `can_create_tickets`, `can_edit_tickets`, `can_post_ticket_reply`, `can_delete_tickets`, `can_close_tickets`, `can_assign_tickets`, `can_transfer_tickets`, `can_ban_emails`, `can_manage_premade`, `can_manage_faq`, `can_view_staff_stats`, `notes`, `created`, `updated`) VALUES
(1, 1, 'Lion Tamers', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 'System overlords. These folks (initially) have full control to all the departments they have access to.', '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(2, 1, 'Elephant Walkers', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 'Inhabitants of the ivory tower', '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(3, 1, 'Flea Trainers', 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 'Lowly staff members', '2016-08-09 17:54:53', '2016-08-09 17:54:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_group_dept_access`
--

CREATE TABLE `helpdesk_group_dept_access` (
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_group_dept_access`
--

INSERT INTO `helpdesk_group_dept_access` (`group_id`, `dept_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_help_topic`
--

CREATE TABLE `helpdesk_help_topic` (
  `topic_id` int(11) UNSIGNED NOT NULL,
  `topic_pid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `ispublic` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `noautoresp` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED DEFAULT '0',
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `priority_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sla_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `page_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sequence_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `topic` varchar(32) NOT NULL DEFAULT '',
  `number_format` varchar(32) DEFAULT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_help_topic`
--

INSERT INTO `helpdesk_help_topic` (`topic_id`, `topic_pid`, `isactive`, `ispublic`, `noautoresp`, `flags`, `status_id`, `priority_id`, `dept_id`, `staff_id`, `team_id`, `sla_id`, `page_id`, `form_id`, `sequence_id`, `sort`, `topic`, `number_format`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 1, 0, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 1, 'General Inquiry', '', 'Questions about products or services', '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(2, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 'Feedback', '', 'Tickets that primarily concern the sales and billing departments', '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(10, 0, 1, 1, 0, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, 'Report a Problem', '', 'Product, service, or equipment related issues', '2016-08-09 17:54:53', '2016-08-09 17:54:53'),
(11, 10, 1, 1, 0, 0, 0, 3, 1, 0, 0, 1, 0, 0, 0, 0, 'Access Issue', '', 'Report an inability access a physical or virtual asset', '2016-08-09 17:54:53', '2016-08-09 17:54:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_list`
--

CREATE TABLE `helpdesk_list` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_plural` varchar(255) DEFAULT NULL,
  `sort_mode` enum('Alpha','-Alpha','SortCol') NOT NULL DEFAULT 'Alpha',
  `masks` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(16) DEFAULT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_list`
--

INSERT INTO `helpdesk_list` (`id`, `name`, `name_plural`, `sort_mode`, `masks`, `type`, `notes`, `created`, `updated`) VALUES
(1, 'Ticket Status', 'Ticket Statuses', 'SortCol', 13, 'ticket-status', 'Ticket statuses', '2016-08-09 17:54:53', '2016-08-09 17:54:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_list_items`
--

CREATE TABLE `helpdesk_list_items` (
  `id` int(11) UNSIGNED NOT NULL,
  `list_id` int(11) DEFAULT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `value` varchar(255) NOT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '1',
  `properties` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_note`
--

CREATE TABLE `helpdesk_note` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED DEFAULT NULL,
  `staff_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `ext_id` varchar(10) DEFAULT NULL,
  `body` text,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_organization`
--

CREATE TABLE `helpdesk_organization` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `manager` varchar(16) NOT NULL DEFAULT '',
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `domain` varchar(256) NOT NULL DEFAULT '',
  `extra` text,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_organization`
--

INSERT INTO `helpdesk_organization` (`id`, `name`, `manager`, `status`, `domain`, `extra`, `created`, `updated`) VALUES
(1, 'osTicket', '', 0, '', NULL, '2016-08-09 22:54:53', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_plugin`
--

CREATE TABLE `helpdesk_plugin` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `install_path` varchar(60) NOT NULL,
  `isphar` tinyint(1) NOT NULL DEFAULT '0',
  `isactive` tinyint(1) NOT NULL DEFAULT '0',
  `version` varchar(64) DEFAULT NULL,
  `installed` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_sequence`
--

CREATE TABLE `helpdesk_sequence` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `flags` int(10) UNSIGNED DEFAULT NULL,
  `next` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `increment` int(11) DEFAULT '1',
  `padding` char(1) DEFAULT '0',
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_sequence`
--

INSERT INTO `helpdesk_sequence` (`id`, `name`, `flags`, `next`, `increment`, `padding`, `updated`) VALUES
(1, 'General Tickets', 1, 1, 1, '0', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_session`
--

CREATE TABLE `helpdesk_session` (
  `session_id` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
  `session_data` blob,
  `session_expire` datetime DEFAULT NULL,
  `session_updated` datetime DEFAULT NULL,
  `user_id` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT 'osTicket staff/client ID',
  `user_ip` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `helpdesk_session`
--

INSERT INTO `helpdesk_session` (`session_id`, `session_data`, `session_expire`, `session_updated`, `user_id`, `user_ip`, `user_agent`) VALUES
('b3k7amvm3dq47mr6abgctrjpf3', 0x6366673a636f72657c613a323a7b733a393a22747a5f6f6666736574223b733a343a222d352e30223b733a31323a2264625f747a5f6f6666736574223b733a373a222d352e30303030223b7d637372667c613a323a7b733a353a22746f6b656e223b733a34303a2232313537663964663935383134306230363235313031346166646137643332383934663731643463223b733a343a2274696d65223b693a313437303738333436343b7d545a5f4f46465345547c733a343a222d352e30223b545a5f4453547c623a303b6366673a6d7973716c7365617263687c613a303a7b7d6366673a6c6973742e317c613a303a7b7d5f617574687c613a323a7b733a343a2275736572223b613a313a7b733a373a22737472696b6573223b693a323b7d733a353a227374616666223b613a323a7b733a323a226964223b733a313a2231223b733a333a226b6579223b733a31323a226c6f63616c3a746179726f6e223b7d7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31333a222f7469636b6574732f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d6366673a73746166662e317c613a303a7b7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2265386562396237633061633333346436616536363564316163646435366335393a313437303738333434383a3833376563353735346635303363666161656530393239666434383937346537223b7d73746166663a6c616e677c623a303b3a3a517c733a343a226f70656e223b7365617263685f65343933346531376131386438643730623761386663343966346330393034617c733a323133363a2253454c454354207469636b65742e7469636b65745f69642c746c6f636b2e6c6f636b5f69642c7469636b65742e606e756d626572602c7469636b65742e646570745f69642c7469636b65742e73746166665f69642c7469636b65742e7465616d5f696420202c757365722e6e616d65202c656d61696c2e6164647265737320617320656d61696c2c20646570742e646570745f6e616d652c207374617475732e737461746520202c7374617475732e6e616d65206173207374617475732c7469636b65742e736f757263652c7469636b65742e69736f7665726475652c7469636b65742e6973616e7377657265642c7469636b65742e6372656174656420202c4946287469636b65742e64756564617465204953204e554c4c2c494628736c612e6964204953204e554c4c2c204e554c4c2c20444154455f414444287469636b65742e637265617465642c20494e54455256414c20736c612e67726163655f706572696f6420484f555229292c207469636b65742e6475656461746529206173206475656461746520202c434153542847524541544553542849464e554c4c287469636b65742e6c6173746d6573736167652c2030292c2049464e554c4c287469636b65742e636c6f7365642c2030292c2049464e554c4c287469636b65742e72656f70656e65642c2030292c207469636b65742e6372656174656429206173206461746574696d6529206173206566666563746976655f6461746520202c7469636b65742e63726561746564206173207469636b65745f637265617465642c20434f4e4341545f5753282220222c2073746166662e66697273746e616d652c2073746166662e6c6173746e616d65292061732073746166662c207465616d2e6e616d65206173207465616d20202c49462873746166662e73746166665f6964204953204e554c4c2c7465616d2e6e616d652c434f4e4341545f5753282220222c2073746166662e6c6173746e616d652c2073746166662e66697273746e616d6529292061732061737369676e656420202c49462870746f7069632e746f7069635f706964204953204e554c4c2c20746f7069632e746f7069632c20434f4e4341545f57532822202f20222c2070746f7069632e746f7069632c20746f7069632e746f70696329292061732068656c70746f70696320202c63646174612e7072696f72697479206173207072696f726974795f69642c2063646174612e7375626a6563742c207072692e7072696f726974795f646573632c207072692e7072696f726974795f636f6c6f72202046524f4d2068656c706465736b5f7469636b6574207469636b657420204c454654204a4f494e2068656c706465736b5f7469636b65745f737461747573207374617475730a2020202020202020202020204f4e20287374617475732e6964203d207469636b65742e7374617475735f69642920204c454654204a4f494e2068656c706465736b5f757365722075736572204f4e20757365722e6964203d207469636b65742e757365725f6964204c454654204a4f494e2068656c706465736b5f757365725f656d61696c20656d61696c204f4e20757365722e6964203d20656d61696c2e757365725f6964204c454654204a4f494e2068656c706465736b5f6465706172746d656e742064657074204f4e207469636b65742e646570745f69643d646570742e646570745f696420204c454654204a4f494e2068656c706465736b5f7469636b65745f6c6f636b20746c6f636b204f4e20287469636b65742e7469636b65745f69643d746c6f636b2e7469636b65745f696420414e4420746c6f636b2e6578706972653e4e4f5728290a202020202020202020202020202020414e4420746c6f636b2e73746166665f6964213d312920204c454654204a4f494e2068656c706465736b5f7374616666207374616666204f4e20287469636b65742e73746166665f69643d73746166662e73746166665f69642920204c454654204a4f494e2068656c706465736b5f7465616d207465616d204f4e20287469636b65742e7465616d5f69643d7465616d2e7465616d5f69642920204c454654204a4f494e2068656c706465736b5f736c6120736c61204f4e20287469636b65742e736c615f69643d736c612e696420414e4420736c612e69736163746976653d312920204c454654204a4f494e2068656c706465736b5f68656c705f746f70696320746f706963204f4e20287469636b65742e746f7069635f69643d746f7069632e746f7069635f69642920204c454654204a4f494e2068656c706465736b5f68656c705f746f7069632070746f706963204f4e202870746f7069632e746f7069635f69643d746f7069632e746f7069635f7069642920204c454654204a4f494e2068656c706465736b5f7469636b65745f5f6364617461206364617461204f4e202863646174612e7469636b65745f6964203d207469636b65742e7469636b65745f69642920204c454654204a4f494e2068656c706465736b5f7469636b65745f7072696f7269747920707269204f4e20287072692e7072696f726974795f6964203d2063646174612e7072696f726974792920205748455245202820202028207469636b65742e73746166665f69643d3120414e44207374617475732e73746174653d226f70656e222920204f52207469636b65742e646570745f696420494e2028312c322c3329202920414e44207374617475732e737461746520494e20280a20202020202020202020202020202020276f70656e2720292020414e44207469636b65742e6973616e7377657265643d3020204f52444552204259207072692e7072696f726974795f757267656e6379204153432c206566666563746976655f6461746520444553432c207469636b65742e637265617465642044455343204c494d495420302c3235223b6c61737463726f6e63616c6c7c693a313437303738333434393b6366673a646570742e317c613a303a7b7d, '2016-08-10 17:57:44', '2016-08-09 17:57:44', '1', '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36'),
('nvhi87331eul2vu3jslf0pfg80', 0x6366673a636f72657c613a313a7b733a393a22747a5f6f6666736574223b733a343a222d352e30223b7d637372667c613a323a7b733a353a22746f6b656e223b733a34303a2265346431663032343530656665633166613431373062643562623630363566363033663437393236223b733a343a2274696d65223b693a313437303834373832303b7d545a5f4f46465345547c733a343a222d352e30223b545a5f4453547c733a313a2230223b6366673a6d7973716c7365617263687c613a303a7b7d6366673a6c6973742e317c613a303a7b7d, '2016-08-11 11:50:20', '2016-08-10 11:50:20', '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_sla`
--

CREATE TABLE `helpdesk_sla` (
  `id` int(11) UNSIGNED NOT NULL,
  `isactive` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `enable_priority_escalation` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `disable_overdue_alerts` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `grace_period` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_sla`
--

INSERT INTO `helpdesk_sla` (`id`, `isactive`, `enable_priority_escalation`, `disable_overdue_alerts`, `grace_period`, `name`, `notes`, `created`, `updated`) VALUES
(1, 1, 1, 0, 48, 'Default SLA', '', '2016-08-09 17:54:52', '2016-08-09 17:54:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_staff`
--

CREATE TABLE `helpdesk_staff` (
  `staff_id` int(11) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `timezone_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(32) NOT NULL DEFAULT '',
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `passwd` varchar(128) DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `phone` varchar(24) NOT NULL DEFAULT '',
  `phone_ext` varchar(6) DEFAULT NULL,
  `mobile` varchar(24) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `notes` text,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `isvisible` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `onvacation` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `assigned_only` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `show_assigned_tickets` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `daylight_saving` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `change_passwd` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `max_page_size` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `auto_refresh_rate` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `default_signature_type` enum('none','mine','dept') NOT NULL DEFAULT 'none',
  `default_paper_size` enum('Letter','Legal','Ledger','A4','A3') NOT NULL DEFAULT 'Letter',
  `created` datetime NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `passwdreset` datetime DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_staff`
--

INSERT INTO `helpdesk_staff` (`staff_id`, `group_id`, `dept_id`, `timezone_id`, `username`, `firstname`, `lastname`, `passwd`, `backend`, `email`, `phone`, `phone_ext`, `mobile`, `signature`, `notes`, `isactive`, `isadmin`, `isvisible`, `onvacation`, `assigned_only`, `show_assigned_tickets`, `daylight_saving`, `change_passwd`, `max_page_size`, `auto_refresh_rate`, `default_signature_type`, `default_paper_size`, `created`, `lastlogin`, `passwdreset`, `updated`) VALUES
(1, 1, 1, 8, 'tayron', 'tayron', 'jimenez', '$2a$08$Tt2RrhqxoMhMJea9lSJ.mOg1pfJzVoaia5Kts5uDt7.J4S1HgA7WC', NULL, 'it@diazmorones.com', '', NULL, '', '', NULL, 1, 1, 1, 0, 0, 0, 0, 0, 25, 0, 'none', 'Letter', '2016-08-09 17:54:53', '2016-08-09 17:57:28', NULL, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_syslog`
--

CREATE TABLE `helpdesk_syslog` (
  `log_id` int(11) UNSIGNED NOT NULL,
  `log_type` enum('Debug','Warning','Error') NOT NULL,
  `title` varchar(255) NOT NULL,
  `log` text NOT NULL,
  `logger` varchar(64) NOT NULL,
  `ip_address` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_syslog`
--

INSERT INTO `helpdesk_syslog` (`log_id`, `log_type`, `title`, `log`, `logger`, `ip_address`, `created`, `updated`) VALUES
(1, 'Debug', 'osTicket installed!', 'Congratulations osTicket basic installation completed!\n\nThank you for choosing osTicket!', '', '::1', '2016-08-09 17:54:53', '2016-08-09 17:54:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_team`
--

CREATE TABLE `helpdesk_team` (
  `team_id` int(10) UNSIGNED NOT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `isenabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `noalerts` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(125) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_team`
--

INSERT INTO `helpdesk_team` (`team_id`, `lead_id`, `isenabled`, `noalerts`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 0, 'Level I Support', 'Tier 1 support, responsible for the initial iteraction with customers', '2016-08-09 17:54:53', '2016-08-09 17:54:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_team_member`
--

CREATE TABLE `helpdesk_team_member` (
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(10) UNSIGNED NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_ticket`
--

CREATE TABLE `helpdesk_ticket` (
  `ticket_id` int(11) UNSIGNED NOT NULL,
  `number` varchar(20) DEFAULT NULL,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_email_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dept_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sla_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `topic_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `team_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `email_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `source` enum('Web','Email','Phone','API','Other') NOT NULL DEFAULT 'Other',
  `isoverdue` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `isanswered` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `duedate` datetime DEFAULT NULL,
  `reopened` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `lastmessage` datetime DEFAULT NULL,
  `lastresponse` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_ticket`
--

INSERT INTO `helpdesk_ticket` (`ticket_id`, `number`, `user_id`, `user_email_id`, `status_id`, `dept_id`, `sla_id`, `topic_id`, `staff_id`, `team_id`, `email_id`, `flags`, `ip_address`, `source`, `isoverdue`, `isanswered`, `duedate`, `reopened`, `closed`, `lastmessage`, `lastresponse`, `created`, `updated`) VALUES
(1, '449366', 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, '::1', 'Web', 0, 0, NULL, NULL, NULL, '2016-08-09 17:54:53', NULL, '2016-08-09 17:54:53', '2016-08-09 17:54:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_ticket_attachment`
--

CREATE TABLE `helpdesk_ticket_attachment` (
  `attach_id` int(11) UNSIGNED NOT NULL,
  `ticket_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `file_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ref_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `inline` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_ticket_collaborator`
--

CREATE TABLE `helpdesk_ticket_collaborator` (
  `id` int(11) UNSIGNED NOT NULL,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `ticket_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `role` char(1) NOT NULL DEFAULT 'M',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_ticket_email_info`
--

CREATE TABLE `helpdesk_ticket_email_info` (
  `id` int(11) UNSIGNED NOT NULL,
  `thread_id` int(11) UNSIGNED NOT NULL,
  `email_mid` varchar(255) NOT NULL,
  `headers` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_ticket_event`
--

CREATE TABLE `helpdesk_ticket_event` (
  `ticket_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(11) UNSIGNED NOT NULL,
  `team_id` int(11) UNSIGNED NOT NULL,
  `dept_id` int(11) UNSIGNED NOT NULL,
  `topic_id` int(11) UNSIGNED NOT NULL,
  `state` enum('created','closed','reopened','assigned','transferred','overdue') NOT NULL,
  `staff` varchar(255) NOT NULL DEFAULT 'SYSTEM',
  `annulled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_ticket_event`
--

INSERT INTO `helpdesk_ticket_event` (`ticket_id`, `staff_id`, `team_id`, `dept_id`, `topic_id`, `state`, `staff`, `annulled`, `timestamp`) VALUES
(1, 0, 0, 1, 1, 'created', 'SYSTEM', 0, '2016-08-09 17:54:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_ticket_lock`
--

CREATE TABLE `helpdesk_ticket_lock` (
  `lock_id` int(11) UNSIGNED NOT NULL,
  `ticket_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `expire` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_ticket_lock`
--

INSERT INTO `helpdesk_ticket_lock` (`lock_id`, `ticket_id`, `staff_id`, `expire`, `created`) VALUES
(1, 1, 1, '2016-08-09 18:00:34', '2016-08-09 17:57:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_ticket_priority`
--

CREATE TABLE `helpdesk_ticket_priority` (
  `priority_id` tinyint(4) NOT NULL,
  `priority` varchar(60) NOT NULL DEFAULT '',
  `priority_desc` varchar(30) NOT NULL DEFAULT '',
  `priority_color` varchar(7) NOT NULL DEFAULT '',
  `priority_urgency` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_ticket_priority`
--

INSERT INTO `helpdesk_ticket_priority` (`priority_id`, `priority`, `priority_desc`, `priority_color`, `priority_urgency`, `ispublic`) VALUES
(1, 'low', 'Low', '#DDFFDD', 4, 1),
(2, 'normal', 'Normal', '#FFFFF0', 3, 1),
(3, 'high', 'High', '#FEE7E7', 2, 1),
(4, 'emergency', 'Emergency', '#FEE7E7', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_ticket_status`
--

CREATE TABLE `helpdesk_ticket_status` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL DEFAULT '',
  `state` varchar(16) DEFAULT NULL,
  `mode` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `properties` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_ticket_status`
--

INSERT INTO `helpdesk_ticket_status` (`id`, `name`, `state`, `mode`, `flags`, `sort`, `properties`, `created`, `updated`) VALUES
(1, 'Open', 'open', 3, 0, 1, '{"description":"Open tickets."}', '2016-08-09 17:54:53', '0000-00-00 00:00:00'),
(2, 'Resolved', 'closed', 1, 0, 2, '{"allowreopen":true,"reopenstatus":0,"description":"Resolved tickets"}', '2016-08-09 17:54:53', '0000-00-00 00:00:00'),
(3, 'Closed', 'closed', 3, 0, 3, '{"allowreopen":true,"reopenstatus":0,"description":"Closed tickets. Tickets will still be accessible on client and staff panels."}', '2016-08-09 17:54:53', '0000-00-00 00:00:00'),
(4, 'Archived', 'archived', 3, 0, 4, '{"description":"Tickets only adminstratively available but no longer accessible on ticket queues and client panel."}', '2016-08-09 17:54:53', '0000-00-00 00:00:00'),
(5, 'Deleted', 'deleted', 3, 0, 5, '{"description":"Tickets queued for deletion. Not accessible on ticket queues."}', '2016-08-09 17:54:53', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_ticket_thread`
--

CREATE TABLE `helpdesk_ticket_thread` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `ticket_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `thread_type` enum('M','R','N') NOT NULL,
  `poster` varchar(128) NOT NULL DEFAULT '',
  `source` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `body` mediumtext NOT NULL,
  `format` varchar(16) NOT NULL DEFAULT 'html',
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_ticket_thread`
--

INSERT INTO `helpdesk_ticket_thread` (`id`, `pid`, `ticket_id`, `staff_id`, `user_id`, `thread_type`, `poster`, `source`, `title`, `body`, `format`, `ip_address`, `created`, `updated`) VALUES
(1, 0, 1, 0, 1, 'M', 'osTicket Support', 'Web', 'osTicket Installed!', ' <p> Thank you for choosing osTicket. </p> <p> Please make sure you join the <a href="http://osticket.com/forums">osTicket forums</a> and our <a href="http://osticket.com/updates">mailing list</a> to stay up to date on the latest news, security alerts and updates. The osTicket forums are also a great place to get assistance, guidance, tips, and help from other osTicket users. In addition to the forums, the osTicket wiki provides a useful collection of educational materials, documentation, and notes from the community. We welcome your contributions to the osTicket community. </p> <p> If you are looking for a greater level of support, we provide professional services and commercial support with guaranteed response times, and access to the core development team. We can also help customize osTicket or even add new features to the system to meet your unique needs. </p> <p> If the idea of managing and upgrading this osTicket installation is daunting, you can try osTicket as a hosted service at <a href="http://www.supportsystem.com">http://www.supportsystem.com/</a> -- no installation required and we can import your data! With SupportSystem''s turnkey infrastructure, you get osTicket at its best, leaving you free to focus on your customers without the burden of making sure the application is stable, maintained, and secure. </p> <p> Cheers, </p> <p> -<br /> osTicket Team http://osticket.com/ </p> <p> <strong>PS.</strong> Don''t just make customers happy, make happy customers! </p> ', 'html', '::1', '2016-08-09 17:54:53', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_ticket__cdata`
--

CREATE TABLE `helpdesk_ticket__cdata` (
  `ticket_id` int(11) UNSIGNED NOT NULL,
  `subject` mediumtext,
  `priority` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_ticket__cdata`
--

INSERT INTO `helpdesk_ticket__cdata` (`ticket_id`, `subject`, `priority`) VALUES
(1, 'osTicket Installed!', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_timezone`
--

CREATE TABLE `helpdesk_timezone` (
  `id` int(11) UNSIGNED NOT NULL,
  `offset` float(3,1) NOT NULL DEFAULT '0.0',
  `timezone` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_timezone`
--

INSERT INTO `helpdesk_timezone` (`id`, `offset`, `timezone`) VALUES
(1, -12.0, 'Eniwetok, Kwajalein'),
(2, -11.0, 'Midway Island, Samoa'),
(3, -10.0, 'Hawaii'),
(4, -9.0, 'Alaska'),
(5, -8.0, 'Pacific Time (US & Canada)'),
(6, -7.0, 'Mountain Time (US & Canada)'),
(7, -6.0, 'Central Time (US & Canada), Mexico City'),
(8, -5.0, 'Eastern Time (US & Canada), Bogota, Lima'),
(9, -4.0, 'Atlantic Time (Canada), Caracas, La Paz'),
(10, -3.5, 'Newfoundland'),
(11, -3.0, 'Brazil, Buenos Aires, Georgetown'),
(12, -2.0, 'Mid-Atlantic'),
(13, -1.0, 'Azores, Cape Verde Islands'),
(14, 0.0, 'Western Europe Time, London, Lisbon, Casablanca'),
(15, 1.0, 'Brussels, Copenhagen, Madrid, Paris'),
(16, 2.0, 'Kaliningrad, South Africa'),
(17, 3.0, 'Baghdad, Riyadh, Moscow, St. Petersburg'),
(18, 3.5, 'Tehran'),
(19, 4.0, 'Abu Dhabi, Muscat, Baku, Tbilisi'),
(20, 4.5, 'Kabul'),
(21, 5.0, 'Ekaterinburg, Islamabad, Karachi, Tashkent'),
(22, 5.5, 'Bombay, Calcutta, Madras, New Delhi'),
(23, 6.0, 'Almaty, Dhaka, Colombo'),
(24, 7.0, 'Bangkok, Hanoi, Jakarta'),
(25, 8.0, 'Beijing, Perth, Singapore, Hong Kong'),
(26, 9.0, 'Tokyo, Seoul, Osaka, Sapporo, Yakutsk'),
(27, 9.5, 'Adelaide, Darwin'),
(28, 10.0, 'Eastern Australia, Guam, Vladivostok'),
(29, 11.0, 'Magadan, Solomon Islands, New Caledonia'),
(30, 12.0, 'Auckland, Wellington, Fiji, Kamchatka');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_user`
--

CREATE TABLE `helpdesk_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `org_id` int(10) UNSIGNED NOT NULL,
  `default_email_id` int(10) NOT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_user`
--

INSERT INTO `helpdesk_user` (`id`, `org_id`, `default_email_id`, `status`, `name`, `created`, `updated`) VALUES
(1, 1, 1, 0, 'osTicket Support', '2016-08-09 17:54:53', '2016-08-09 17:54:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_user_account`
--

CREATE TABLE `helpdesk_user_account` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `timezone_id` int(11) NOT NULL DEFAULT '0',
  `dst` tinyint(1) NOT NULL DEFAULT '1',
  `lang` varchar(16) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `passwd` varchar(128) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `registered` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk_user_email`
--

CREATE TABLE `helpdesk_user_email` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `address` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk_user_email`
--

INSERT INTO `helpdesk_user_email` (`id`, `user_id`, `address`) VALUES
(1, 1, 'support@osticket.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk__search`
--

CREATE TABLE `helpdesk__search` (
  `object_type` varchar(8) NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `title` text,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `helpdesk__search`
--

INSERT INTO `helpdesk__search` (`object_type`, `object_id`, `title`, `content`) VALUES
('H', 1, 'osTicket Installed!', 'Thank you for choosing osTicket. Please make sure you join the osTicket forums and our mailing list to stay up to date on the latest news, security alerts and updates. The osTicket forums are also a great place to get assistance, guidance, tips, and help from other osTicket users. In addition to the forums, the osTicket wiki provides a useful collection of educational materials, documentation, and notes from the community. We welcome your contributions to the osTicket community. If you are looking for a greater level of support, we provide professional services and commercial support with guaranteed response times, and access to the core development team. We can also help customize osTicket or even add new features to the system to meet your unique needs. If the idea of managing and upgrading this osTicket installation is daunting, you can try osTicket as a hosted service at http://www.supportsystem.com/ -- no installation required and we can import your data! With SupportSystem''s turnkey infrastructure, you get osTicket at its best, leaving you free to focus on your customers without the burden of making sure the application is stable, maintained, and secure. Cheers, - osTicket Team http://osticket.com/ PS. Don''t just make customers happy, make happy customers!'),
('O', 1, 'osTicket', '420 Desoto Street\nAlexandria, LA 71301\n(318) 290-3674\nhttp://osticket.com\nNot only do we develop the software, we also use it to manage support for osTicket. Let us help you quickly implement and leverage the full potential of osTicket''s features and functionality. Contact us for professional support or visit our website for documentation and community support.'),
('T', 1, '449366 osTicket Installed!', ''),
('U', 1, 'osTicket Support', 'support@osticket.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `helpdesk_api_key`
--
ALTER TABLE `helpdesk_api_key`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apikey` (`apikey`),
  ADD KEY `ipaddr` (`ipaddr`);

--
-- Indices de la tabla `helpdesk_attachment`
--
ALTER TABLE `helpdesk_attachment`
  ADD PRIMARY KEY (`object_id`,`file_id`,`type`);

--
-- Indices de la tabla `helpdesk_canned_response`
--
ALTER TABLE `helpdesk_canned_response`
  ADD PRIMARY KEY (`canned_id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `active` (`isenabled`);

--
-- Indices de la tabla `helpdesk_config`
--
ALTER TABLE `helpdesk_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `namespace` (`namespace`,`key`);

--
-- Indices de la tabla `helpdesk_content`
--
ALTER TABLE `helpdesk_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `helpdesk_department`
--
ALTER TABLE `helpdesk_department`
  ADD PRIMARY KEY (`dept_id`),
  ADD UNIQUE KEY `dept_name` (`dept_name`),
  ADD KEY `manager_id` (`manager_id`),
  ADD KEY `autoresp_email_id` (`autoresp_email_id`),
  ADD KEY `tpl_id` (`tpl_id`);

--
-- Indices de la tabla `helpdesk_draft`
--
ALTER TABLE `helpdesk_draft`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `helpdesk_email`
--
ALTER TABLE `helpdesk_email`
  ADD PRIMARY KEY (`email_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `priority_id` (`priority_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indices de la tabla `helpdesk_email_account`
--
ALTER TABLE `helpdesk_email_account`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `helpdesk_email_template`
--
ALTER TABLE `helpdesk_email_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `template_lookup` (`tpl_id`,`code_name`);

--
-- Indices de la tabla `helpdesk_email_template_group`
--
ALTER TABLE `helpdesk_email_template_group`
  ADD PRIMARY KEY (`tpl_id`);

--
-- Indices de la tabla `helpdesk_faq`
--
ALTER TABLE `helpdesk_faq`
  ADD PRIMARY KEY (`faq_id`),
  ADD UNIQUE KEY `question` (`question`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `ispublished` (`ispublished`);

--
-- Indices de la tabla `helpdesk_faq_category`
--
ALTER TABLE `helpdesk_faq_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `ispublic` (`ispublic`);

--
-- Indices de la tabla `helpdesk_faq_topic`
--
ALTER TABLE `helpdesk_faq_topic`
  ADD PRIMARY KEY (`faq_id`,`topic_id`);

--
-- Indices de la tabla `helpdesk_file`
--
ALTER TABLE `helpdesk_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ft` (`ft`),
  ADD KEY `key` (`key`),
  ADD KEY `signature` (`signature`);

--
-- Indices de la tabla `helpdesk_file_chunk`
--
ALTER TABLE `helpdesk_file_chunk`
  ADD PRIMARY KEY (`file_id`,`chunk_id`);

--
-- Indices de la tabla `helpdesk_filter`
--
ALTER TABLE `helpdesk_filter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `email_id` (`email_id`);

--
-- Indices de la tabla `helpdesk_filter_rule`
--
ALTER TABLE `helpdesk_filter_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `filter` (`filter_id`,`what`,`how`,`val`),
  ADD KEY `filter_id` (`filter_id`);

--
-- Indices de la tabla `helpdesk_form`
--
ALTER TABLE `helpdesk_form`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `helpdesk_form_entry`
--
ALTER TABLE `helpdesk_form_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_lookup` (`object_type`,`object_id`);

--
-- Indices de la tabla `helpdesk_form_entry_values`
--
ALTER TABLE `helpdesk_form_entry_values`
  ADD PRIMARY KEY (`entry_id`,`field_id`);

--
-- Indices de la tabla `helpdesk_form_field`
--
ALTER TABLE `helpdesk_form_field`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `helpdesk_groups`
--
ALTER TABLE `helpdesk_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `group_active` (`group_enabled`);

--
-- Indices de la tabla `helpdesk_group_dept_access`
--
ALTER TABLE `helpdesk_group_dept_access`
  ADD UNIQUE KEY `group_dept` (`group_id`,`dept_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indices de la tabla `helpdesk_help_topic`
--
ALTER TABLE `helpdesk_help_topic`
  ADD PRIMARY KEY (`topic_id`),
  ADD UNIQUE KEY `topic` (`topic`,`topic_pid`),
  ADD KEY `topic_pid` (`topic_pid`),
  ADD KEY `priority_id` (`priority_id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `staff_id` (`staff_id`,`team_id`),
  ADD KEY `sla_id` (`sla_id`),
  ADD KEY `page_id` (`page_id`);

--
-- Indices de la tabla `helpdesk_list`
--
ALTER TABLE `helpdesk_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indices de la tabla `helpdesk_list_items`
--
ALTER TABLE `helpdesk_list_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `list_item_lookup` (`list_id`);

--
-- Indices de la tabla `helpdesk_note`
--
ALTER TABLE `helpdesk_note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ext_id` (`ext_id`);

--
-- Indices de la tabla `helpdesk_organization`
--
ALTER TABLE `helpdesk_organization`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `helpdesk_plugin`
--
ALTER TABLE `helpdesk_plugin`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `helpdesk_sequence`
--
ALTER TABLE `helpdesk_sequence`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `helpdesk_session`
--
ALTER TABLE `helpdesk_session`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `updated` (`session_updated`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `helpdesk_sla`
--
ALTER TABLE `helpdesk_sla`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `helpdesk_staff`
--
ALTER TABLE `helpdesk_staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `issuperuser` (`isadmin`),
  ADD KEY `group_id` (`group_id`,`staff_id`);

--
-- Indices de la tabla `helpdesk_syslog`
--
ALTER TABLE `helpdesk_syslog`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `log_type` (`log_type`);

--
-- Indices de la tabla `helpdesk_team`
--
ALTER TABLE `helpdesk_team`
  ADD PRIMARY KEY (`team_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `isnabled` (`isenabled`),
  ADD KEY `lead_id` (`lead_id`);

--
-- Indices de la tabla `helpdesk_team_member`
--
ALTER TABLE `helpdesk_team_member`
  ADD PRIMARY KEY (`team_id`,`staff_id`);

--
-- Indices de la tabla `helpdesk_ticket`
--
ALTER TABLE `helpdesk_ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `created` (`created`),
  ADD KEY `closed` (`closed`),
  ADD KEY `duedate` (`duedate`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `sla_id` (`sla_id`);

--
-- Indices de la tabla `helpdesk_ticket_attachment`
--
ALTER TABLE `helpdesk_ticket_attachment`
  ADD PRIMARY KEY (`attach_id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `ref_id` (`ref_id`),
  ADD KEY `file_id` (`file_id`);

--
-- Indices de la tabla `helpdesk_ticket_collaborator`
--
ALTER TABLE `helpdesk_ticket_collaborator`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `collab` (`ticket_id`,`user_id`);

--
-- Indices de la tabla `helpdesk_ticket_email_info`
--
ALTER TABLE `helpdesk_ticket_email_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_mid` (`email_mid`);

--
-- Indices de la tabla `helpdesk_ticket_event`
--
ALTER TABLE `helpdesk_ticket_event`
  ADD KEY `ticket_state` (`ticket_id`,`state`,`timestamp`),
  ADD KEY `ticket_stats` (`timestamp`,`state`);

--
-- Indices de la tabla `helpdesk_ticket_lock`
--
ALTER TABLE `helpdesk_ticket_lock`
  ADD PRIMARY KEY (`lock_id`),
  ADD UNIQUE KEY `ticket_id` (`ticket_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indices de la tabla `helpdesk_ticket_priority`
--
ALTER TABLE `helpdesk_ticket_priority`
  ADD PRIMARY KEY (`priority_id`),
  ADD UNIQUE KEY `priority` (`priority`),
  ADD KEY `priority_urgency` (`priority_urgency`),
  ADD KEY `ispublic` (`ispublic`);

--
-- Indices de la tabla `helpdesk_ticket_status`
--
ALTER TABLE `helpdesk_ticket_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `state` (`state`);

--
-- Indices de la tabla `helpdesk_ticket_thread`
--
ALTER TABLE `helpdesk_ticket_thread`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `pid` (`pid`);

--
-- Indices de la tabla `helpdesk_ticket__cdata`
--
ALTER TABLE `helpdesk_ticket__cdata`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indices de la tabla `helpdesk_timezone`
--
ALTER TABLE `helpdesk_timezone`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `helpdesk_user`
--
ALTER TABLE `helpdesk_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `org_id` (`org_id`);

--
-- Indices de la tabla `helpdesk_user_account`
--
ALTER TABLE `helpdesk_user_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `helpdesk_user_email`
--
ALTER TABLE `helpdesk_user_email`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `address` (`address`),
  ADD KEY `user_email_lookup` (`user_id`);

--
-- Indices de la tabla `helpdesk__search`
--
ALTER TABLE `helpdesk__search`
  ADD PRIMARY KEY (`object_type`,`object_id`);
ALTER TABLE `helpdesk__search` ADD FULLTEXT KEY `search` (`title`,`content`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `helpdesk_api_key`
--
ALTER TABLE `helpdesk_api_key`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `helpdesk_canned_response`
--
ALTER TABLE `helpdesk_canned_response`
  MODIFY `canned_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `helpdesk_config`
--
ALTER TABLE `helpdesk_config`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT de la tabla `helpdesk_content`
--
ALTER TABLE `helpdesk_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `helpdesk_department`
--
ALTER TABLE `helpdesk_department`
  MODIFY `dept_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `helpdesk_draft`
--
ALTER TABLE `helpdesk_draft`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `helpdesk_email`
--
ALTER TABLE `helpdesk_email`
  MODIFY `email_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `helpdesk_email_account`
--
ALTER TABLE `helpdesk_email_account`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `helpdesk_email_template`
--
ALTER TABLE `helpdesk_email_template`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `helpdesk_email_template_group`
--
ALTER TABLE `helpdesk_email_template_group`
  MODIFY `tpl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `helpdesk_faq`
--
ALTER TABLE `helpdesk_faq`
  MODIFY `faq_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `helpdesk_faq_category`
--
ALTER TABLE `helpdesk_faq_category`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `helpdesk_file`
--
ALTER TABLE `helpdesk_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `helpdesk_filter`
--
ALTER TABLE `helpdesk_filter`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `helpdesk_filter_rule`
--
ALTER TABLE `helpdesk_filter_rule`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `helpdesk_form`
--
ALTER TABLE `helpdesk_form`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `helpdesk_form_entry`
--
ALTER TABLE `helpdesk_form_entry`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `helpdesk_form_field`
--
ALTER TABLE `helpdesk_form_field`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT de la tabla `helpdesk_groups`
--
ALTER TABLE `helpdesk_groups`
  MODIFY `group_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `helpdesk_help_topic`
--
ALTER TABLE `helpdesk_help_topic`
  MODIFY `topic_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `helpdesk_list`
--
ALTER TABLE `helpdesk_list`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `helpdesk_list_items`
--
ALTER TABLE `helpdesk_list_items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `helpdesk_note`
--
ALTER TABLE `helpdesk_note`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `helpdesk_organization`
--
ALTER TABLE `helpdesk_organization`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `helpdesk_plugin`
--
ALTER TABLE `helpdesk_plugin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `helpdesk_sequence`
--
ALTER TABLE `helpdesk_sequence`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `helpdesk_sla`
--
ALTER TABLE `helpdesk_sla`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `helpdesk_staff`
--
ALTER TABLE `helpdesk_staff`
  MODIFY `staff_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `helpdesk_syslog`
--
ALTER TABLE `helpdesk_syslog`
  MODIFY `log_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `helpdesk_team`
--
ALTER TABLE `helpdesk_team`
  MODIFY `team_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `helpdesk_ticket`
--
ALTER TABLE `helpdesk_ticket`
  MODIFY `ticket_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `helpdesk_ticket_attachment`
--
ALTER TABLE `helpdesk_ticket_attachment`
  MODIFY `attach_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `helpdesk_ticket_collaborator`
--
ALTER TABLE `helpdesk_ticket_collaborator`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `helpdesk_ticket_email_info`
--
ALTER TABLE `helpdesk_ticket_email_info`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `helpdesk_ticket_lock`
--
ALTER TABLE `helpdesk_ticket_lock`
  MODIFY `lock_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `helpdesk_ticket_priority`
--
ALTER TABLE `helpdesk_ticket_priority`
  MODIFY `priority_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `helpdesk_ticket_status`
--
ALTER TABLE `helpdesk_ticket_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `helpdesk_ticket_thread`
--
ALTER TABLE `helpdesk_ticket_thread`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `helpdesk_timezone`
--
ALTER TABLE `helpdesk_timezone`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT de la tabla `helpdesk_user`
--
ALTER TABLE `helpdesk_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `helpdesk_user_account`
--
ALTER TABLE `helpdesk_user_account`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `helpdesk_user_email`
--
ALTER TABLE `helpdesk_user_email`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
