Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 419D3CA0AD
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2019 16:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E3589D7C;
	Thu,  3 Oct 2019 14:55:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730080.outbound.protection.outlook.com [40.107.73.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA99A89D7C
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 14:55:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NgL4lHIqjfJOkL+S8trG9imvqxH8BRq4BX2TyQdH3w9v0EzxN0+yzU6i/fP1kx91tjFsyReaYer05Tvxg0dZGKYPL2vllmBWuugasxMAgOVu+BL6D1lMhX+4ufb792EDMEkDwYyANk72oDohlaHCHAYgUQOQwXhtT1VqCWDWhTNMA1tZ9r/hzz23bLQW3EvVhyr/pDqipcMkzG8eQpeinwLymOdmZZ17pTF+9NerRqr7dXUHrXMg2nYE15wQpP2Vyn2O9qsxu/1stT+p292dBcWmjKh/CvzkpZmFfp5EHaYYqQBBx/Y4/U6lHgT1UYnVkl7RMAQ+zxKKSv4yJJCrqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/mBWxkm8sQkEnE8rsN4lX4GjFqFXvjnW7e/kbZSSb8=;
 b=XTWNMP18j9rdUnEMxVoimPAV1VWDm4yh3QYaWE2qMVzI92ufEfnFHrQB3JYa9z6GdvTLOjCK5ApUsNOPg6t2FgJSfhco5RNiKBJfcQPyoHQKeuPkVa5CIFG9RQWv0CNyUzAf3sdnH9Umq0NW8eSFRiTh4rjltEzX/f6Wv1z/V4ttOsgIblhM+Q8xLYpJyO0wtQ80luHm6IPqrhlZWI+GTPXEJqkRDXxJsCrhSWdXoDSPOC1aUokMT6Kdy7Sdtfi3qoVbueAdIEiNCtR4BZeJwC0PmDJ1tUy+tlf5is0akN9nhLHr5sQN5KzqnYhyAbBMNDCF2wkIPeLqlzvTOnmfvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0010.namprd12.prod.outlook.com (2603:10b6:610:57::20)
 by CH2PR12MB4152.namprd12.prod.outlook.com (2603:10b6:610:a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.17; Thu, 3 Oct
 2019 14:55:01 +0000
Received: from BY2NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by CH2PR12CA0010.outlook.office365.com
 (2603:10b6:610:57::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.17 via Frontend
 Transport; Thu, 3 Oct 2019 14:55:01 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT048.mail.protection.outlook.com (10.152.85.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Thu, 3 Oct 2019 14:55:01 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 3 Oct 2019
 09:54:58 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <harry.wentland@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/11] drm/amd/display: Enable HDCP 2.2
Date: Thu, 3 Oct 2019 10:54:36 -0400
Message-ID: <20191003145441.28952-7-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191003145441.28952-1-Bhawanpreet.Lakha@amd.com>
References: <20191003145441.28952-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(428003)(54534003)(199004)(189003)(14444005)(48376002)(50466002)(81166006)(4326008)(478600001)(2906002)(70206006)(50226002)(8676002)(47776003)(110136005)(316002)(16586007)(81156014)(8936002)(5660300002)(1076003)(356004)(6666004)(7696005)(76176011)(126002)(476003)(2616005)(11346002)(446003)(51416003)(426003)(486006)(336012)(26005)(186003)(305945005)(86362001)(53416004)(36756003)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4152; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3646b300-1330-4be3-b5fc-08d74811aaf1
X-MS-TrafficTypeDiagnostic: CH2PR12MB4152:
X-Microsoft-Antispam-PRVS: <CH2PR12MB415231091656968904CB8328F99F0@CH2PR12MB4152.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 01792087B6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4JE0asbsryPxPCCbYZvNkEtIXmVoaUlFwKcpZqf6ZbSQfwHl2EcChKWGLPvYZR4QhL0CRxMHnzJfAPLcxwvO80fGfF72IlGIH/40LVoo7fihF4PPequQ/sHqoU8Ffewj1toTG2c260Z8AqaDT11RALiMNfUa7qqGEzpWUbNjXmzIYczKWRJa11PgRMy5ycO/ADr1S9pMTxwsKOw+kpVc92fcllOdErTkvJY9tc0f4nUOQCOmPE/tZ3J6B+8LHaDUechc1l79DCDRff4Qw3N3pf3XbgOAtwZdc4ztFrkqiiMcy9mSqx6Pk9DD8S0qVykvZZHOuukD0HEnXsv/5lP0mtB8l8vNrb440YsWU2wyjqB5m+9mFQkNfWWpyXEFeRBvUlPIi+ujHA4TD/hSoi8fPL7gi2GJ7J3oEfe2wDjRx/I=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2019 14:55:01.4194 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3646b300-1330-4be3-b5fc-08d74811aaf1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4152
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/mBWxkm8sQkEnE8rsN4lX4GjFqFXvjnW7e/kbZSSb8=;
 b=h19Iyy5zcgP992o0o4nDnmQ0/oznuoEkAGNEnVWQGOa1ogwArKdTTjFfHHVxIzt0wd2y4mXHRJnTRauJTfVvY4z1t41dQirWg3JtZwokggM8jm3tqlqrpdwB6ybIa28cx8YT+Kwix9L9shiKZbZgVBfHlCz2djxMOCGZHrSclm4=
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KSERDUCAyLjIgd2FzIGRpc2FibGVkLCB3ZSBuZWVkIHRvIGVuYWJsZSBpdAoKW0hvd10K
LVVwZGF0ZSBkaXNwbGF5IHRvcG9sb2d5IHRvIHN1cHBvcnQgMi4yCi1VbnNldCBoZGNwMi5kaXNh
YmxlIGluIHVwZGF0ZV9jb25maWcKLUNoYW5nZSBsb2dpYyBvZiBldmVudF91cGRhdGVfcHJvcGVy
dHksIG5vdyB3ZSBzZXQgdGhlIHByb3BlcnR5IHRvIGJlCkVOQUJMRUQgZm9yIGFueSBsZXZlbCBv
ZiBlbmNyeXB0aW9uICgyLjIgb3IgMS40KS4KClNpZ25lZC1vZmYtYnk6IEJoYXdhbnByZWV0IExh
a2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hkY3AuYyB8IDMgKy0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3BfcHNwLmMgICAgfCAyICstCiAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNwLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNwLmMKaW5k
ZXggMjQ0M2MyMzhjMTg4Li5mYzc3NWMwNzk1ZDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hkY3AuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNwLmMKQEAgLTE4Niw3ICsx
ODYsNyBAQCBzdGF0aWMgdm9pZCBldmVudF9wcm9wZXJ0eV91cGRhdGUoc3RydWN0IHdvcmtfc3Ry
dWN0ICp3b3JrKQogCQl9CiAJfQogCi0JaWYgKGhkY3Bfd29yay0+ZW5jcnlwdGlvbl9zdGF0dXMg
PT0gTU9EX0hEQ1BfRU5DUllQVElPTl9TVEFUVVNfSERDUDFfT04pCisJaWYgKGhkY3Bfd29yay0+
ZW5jcnlwdGlvbl9zdGF0dXMgIT0gTU9EX0hEQ1BfRU5DUllQVElPTl9TVEFUVVNfSERDUF9PRkYp
CiAJCWRybV9oZGNwX3VwZGF0ZV9jb250ZW50X3Byb3RlY3Rpb24oJmFjb25uZWN0b3ItPmJhc2Us
IERSTV9NT0RFX0NPTlRFTlRfUFJPVEVDVElPTl9FTkFCTEVEKTsKIAllbHNlCiAJCWRybV9oZGNw
X3VwZGF0ZV9jb250ZW50X3Byb3RlY3Rpb24oJmFjb25uZWN0b3ItPmJhc2UsIERSTV9NT0RFX0NP
TlRFTlRfUFJPVEVDVElPTl9ERVNJUkVEKTsKQEAgLTI5MCw3ICsyOTAsNiBAQCBzdGF0aWMgdm9p
ZCB1cGRhdGVfY29uZmlnKHZvaWQgKmhhbmRsZSwgc3RydWN0IGNwX3BzcF9zdHJlYW1fY29uZmln
ICpjb25maWcpCiAJbGluay0+ZGlnX2JlID0gY29uZmlnLT5saW5rX2VuY19pbnN0OwogCWxpbmst
PmRkY19saW5lID0gYWNvbm5lY3Rvci0+ZGNfbGluay0+ZGRjX2h3X2luc3QgKyAxOwogCWxpbmst
PmRwLnJldiA9IGFjb25uZWN0b3ItPmRjX2xpbmstPmRwY2RfY2Fwcy5kcGNkX3Jldi5yYXc7Ci0J
bGluay0+YWRqdXN0LmhkY3AyLmRpc2FibGUgPSAxOwogCiB9CiAKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcF9wc3AuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcF9wc3AuYwppbmRleCA4MjI4M2Mz
ODA0ZGYuLjRhNmI5NWQ3YjQ0ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L21vZHVsZXMvaGRjcC9oZGNwX3BzcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9tb2R1bGVzL2hkY3AvaGRjcF9wc3AuYwpAQCAtMTA5LDcgKzEwOSw3IEBAIGVudW0gbW9k
X2hkY3Bfc3RhdHVzIG1vZF9oZGNwX2FkZF9kaXNwbGF5X3RvcG9sb2d5KHN0cnVjdCBtb2RfaGRj
cCAqaGRjcCkKIAkJCWR0bV9jbWQtPmR0bV9pbl9tZXNzYWdlLnRvcG9sb2d5X3VwZGF0ZV92Mi5k
aWdfZmUgPSBkaXNwbGF5LT5kaWdfZmU7CiAJCQlkdG1fY21kLT5kdG1faW5fbWVzc2FnZS50b3Bv
bG9neV91cGRhdGVfdjIuZHBfbXN0X3ZjaWQgPSBkaXNwbGF5LT52Y19pZDsKIAkJCWR0bV9jbWQt
PmR0bV9pbl9tZXNzYWdlLnRvcG9sb2d5X3VwZGF0ZV92Mi5tYXhfaGRjcF9zdXBwb3J0ZWRfdmVy
c2lvbiA9Ci0JCQkJVEFfRFRNX0hEQ1BfVkVSU0lPTl9NQVhfU1VQUE9SVEVEX18xX3g7CisJCQkJ
VEFfRFRNX0hEQ1BfVkVSU0lPTl9NQVhfU1VQUE9SVEVEX18yXzI7CiAJCQlkdG1fY21kLT5kdG1f
c3RhdHVzID0gVEFfRFRNX1NUQVRVU19fR0VORVJJQ19GQUlMVVJFOwogCiAJCQlwc3BfZHRtX2lu
dm9rZShwc3AsIGR0bV9jbWQtPmNtZF9pZCk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
