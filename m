Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA43B844DB
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 08:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B006E611;
	Wed,  7 Aug 2019 06:52:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750084.outbound.protection.outlook.com [40.107.75.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF706E611
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 06:52:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbkBAoKmqPMyTjAib0PAWjqVWsJ5tpXo7IAHw/WPe3rYI31AO+87xh8y1FgerikhB2tSdBXnGfQ4OqfJu6alQHZ/3X98mbjsL2ugt0vUitG+6C602/vWTDvd0CwTkQwqIYR751GmdSmx2LsRG5IuJZMo8R6zKeG0oY2GImLe/qrJFd/M5LQEJN/VYxMDzYeWGrim9xpR+60Awk/yKp5Y/194yi29YxYWGFQzkeyRXaNGxxa/haDzZkag1Gn0nRW/VklPYdzuG+GUeV0hRQK6cOx7E8FcFNqucSWyFhrlsisXN3gLsggMVcSwZkyaVFaQ9VjukDJOmsmcRDus3T5/4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uka6/e8Teryl7T5vVESNTwJNSYt6G7zBiRu9DGv3cuA=;
 b=UQrW3dTqb6D2u24H/P/oKoMfTZbtpPHqRLeAWCKfNlIXcXnMWEBWEKPTjTmM8JvJdLThCBxyGcGHS2BKGUi6wqDGX7TYdOiueHC3hqcIlAjWj6/3EzYDig0I8uTsn34hEiO8nNRG54ldHgGg6GL/cjoKeZxeV4lJ3XDf9UGjaUA1NQAxlVd0G8+pYUW4fOvS+SMxiOz6Y5gN/ffICgc0CzbPdcjbsph5eKdhW46MVFNs2iQpLimgT8cOX0xNVy2d6PX7hxKVBmZJ/8KhF6CFY0QI9db2ux7pe24AimMfP+icEojbM3MFNmteFknqSpurBHjIq1elNQJR/QZlzVXcXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM5PR12CA0052.namprd12.prod.outlook.com (2603:10b6:3:103::14)
 by CY4PR12MB1525.namprd12.prod.outlook.com (2603:10b6:910:11::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.20; Wed, 7 Aug
 2019 06:52:50 +0000
Received: from DM3NAM03FT054.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by DM5PR12CA0052.outlook.office365.com
 (2603:10b6:3:103::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.17 via Frontend
 Transport; Wed, 7 Aug 2019 06:52:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT054.mail.protection.outlook.com (10.152.83.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Wed, 7 Aug 2019 06:52:50 +0000
Received: from guchchen-System-Product-Name.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server (TLS) id
 14.3.389.1; Wed, 7 Aug 2019 01:52:48 -0500
From: Guchun Chen <guchun.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Hawking.Zhang@amd.com>,
 <Dennis.Li@amd.com>, <Xinhui.Pan@amd.com>, <Tao.Zhou1@amd.com>
Subject: [PATCH v2 libdrm 3/3] amdgpu: add umc ras inject test configuration
Date: Wed, 7 Aug 2019 14:52:02 +0800
Message-ID: <20190807065202.30023-4-guchun.chen@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190807065202.30023-1-guchun.chen@amd.com>
References: <20190807065202.30023-1-guchun.chen@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(136003)(376002)(2980300002)(428003)(199004)(189003)(54906003)(316002)(356004)(6666004)(336012)(86362001)(16586007)(44832011)(446003)(110136005)(486006)(305945005)(2616005)(50226002)(476003)(2906002)(126002)(186003)(426003)(478600001)(2201001)(11346002)(4744005)(70586007)(26005)(48376002)(6636002)(81156014)(81166006)(4326008)(36756003)(68736007)(70206006)(50466002)(76176011)(47776003)(53416004)(7696005)(8676002)(5660300002)(8936002)(1076003)(51416003)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1525; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11622b6f-d6ab-46b6-086a-08d71b03dd2e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1525; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1525:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1525C3AC5D9CE019B5B345F2F1D40@CY4PR12MB1525.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:167;
X-Forefront-PRVS: 01221E3973
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: BKqW0PPajbbNz8CgNVIBffn4LLwW5i4JMmKUeHwhgNpl5xsJpKP+9DMilmK5Qe5oYZSlheyKimHc4p2OLr9XCdT4zwhX0BLbiT1F5Ko24OOdBfNJaEdolW8q5fXWsz98Bgcz2kq4wO7SsfDusaAFguVbp91qXo4zHO71nr2tlbUN3pJMTeCaUCxTF3Qbel1NxpK+LI7H51iRCiPZRm/phRWub7O2V96IJIo31IBDZJZ+G8eEqe4LXQQ8jDco0NA3oZeDnsBp4m84BcFaXXrl8cfgazIXzKsFGgJTWe6d7bakYs8lnJKNItNIWm3/h3NfSkV6eD9ul2Pv3VM9p5hu07ywXmWx+y7j+BR+VOZR/ZV/6gldTH5EqYwsKEbo++7itXR787my1axoFv/6n6gv9Hrt1VZTvfZLn9/strygevE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2019 06:52:50.4707 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11622b6f-d6ab-46b6-086a-08d71b03dd2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1525
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uka6/e8Teryl7T5vVESNTwJNSYt6G7zBiRu9DGv3cuA=;
 b=PFczil/fmbkUMGo9F+/6d2RqymVVmGgUYK9qljVWIxEcmbDPJzsQPxodWXvR4ZsZ9utmuU3fXY440YMPxpz/8mXd2i22UGT0NC4MgMRIoG5p8LMdVkK30ZzZqKPiWHEEZePjZFeVpPQfBd0HYqZdPDw+GjhRSfOTAQzw+LfLhdU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Dennis Li <dennis.li@amd.com>, Guchun Chen <guchun.chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Qm90aCB1bWMgc2luZ2xlX2NvcnJlY3RhYmxlIGFuZCBtdWx0aV91bmNvcnJlY3RhYmxlCmluamVj
dCB0eXBlcyBhcmUgYWRkZWQuCgpDaGFuZ2UtSWQ6IEk3NzlmMmY0ZjU5YzY5ZmIwOGZkYzA5Yjdh
ZGJhNWIzNmUzYWYyMGNlClNpZ25lZC1vZmYtYnk6IERlbm5pcyBMaSA8ZGVubmlzLmxpQGFtZC5j
b20+ClNpZ25lZC1vZmYtYnk6IEd1Y2h1biBDaGVuIDxndWNodW4uY2hlbkBhbWQuY29tPgotLS0K
IGRhdGEvYW1kZ3B1X3Jhcy5qc29uIHwgMTcgKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCAxNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZGF0YS9hbWRncHVfcmFzLmpzb24g
Yi9kYXRhL2FtZGdwdV9yYXMuanNvbgppbmRleCAwODYzYTE4Mi4uMjZmZDk0NjUgMTAwNjQ0Ci0t
LSBhL2RhdGEvYW1kZ3B1X3Jhcy5qc29uCisrKyBiL2RhdGEvYW1kZ3B1X3Jhcy5qc29uCkBAIC0x
LDYgKzEsOSBAQAogewogICAgICJ2ZXJzaW9uIjogIjAuMC4xIiwKICAgICAiYmxvY2siOiB7Cisg
ICAgICAgICJ1bWMiOiB7CisgICAgICAgICAgICAiaW5kZXgiOiAwCisgICAgICAgIH0sCiAgICAg
ICAgICJnZngiOiB7CiAgICAgICAgICAgICAiaW5kZXgiOiAyLAogICAgICAgICAgICAgInN1YmJs
b2NrIjogewpAQCAtMTI2LDYgKzEyOSwyMCBAQAogICAgICAgICAicG9pc29uIjogOAogICAgIH0s
CiAgICAgInRlc3RzIjogWworICAgICAgICB7CisgICAgICAgICAgICAibmFtZSI6ICJyYXNfdW1j
LjEuMCIsCisgICAgICAgICAgICAiYmxvY2siOiAidW1jIiwKKyAgICAgICAgICAgICJ0eXBlIjog
InNpbmdsZV9jb3JyZWN0YWJsZSIsCisgICAgICAgICAgICAiYWRkcmVzcyI6IDAsCisgICAgICAg
ICAgICAidmFsdWUiOiAwCisgICAgICAgIH0sCisgICAgICAgIHsKKyAgICAgICAgICAgICJuYW1l
IjogInJhc191bWMuMS4wIiwKKyAgICAgICAgICAgICJibG9jayI6ICJ1bWMiLAorICAgICAgICAg
ICAgInR5cGUiOiAibXVsdGlfdW5jb3JyZWN0YWJsZSIsCisgICAgICAgICAgICAiYWRkcmVzcyI6
IDAsCisgICAgICAgICAgICAidmFsdWUiOiAwCisgICAgICAgIH0sCiAgICAgICAgIHsKICAgICAg
ICAgICAgICJuYW1lIjogInJhc19nZnguMi4xIiwKICAgICAgICAgICAgICJibG9jayI6ICJnZngi
LAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
