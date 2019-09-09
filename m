Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E17ADB51
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 16:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F54589B42;
	Mon,  9 Sep 2019 14:38:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680069.outbound.protection.outlook.com [40.107.68.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4CC89B42
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Sep 2019 14:38:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7vl2C9h6pby3lEfpwZJh+i8+6ReU9/HELTjfD5IxrE679G07JgdfIl+5/gKSMIFl/wn/HYQA+SXOc30/Ij+Q6qZ3UffrsKcniJJLmYXgl3GdM6cgOBhrAN6lPLqdRIJoYG7nxe5VrOCj8LomQ3TFzcbrY3na8Y14ejwb0Q5vxXC4xtVThJozph3w1+C4o4EQu8LnyEGvRk5361QqSsQB9PFa0vzrGlApBm77Tr8DBCPPi4/mKH19J8PbXAke5lkYj95RBtPD/IPZseVGUk9rsjaMOqKuCYn7pgg6b2fFWyHuC21eVrUYevOdxUotbw4k1o66393EVhL5iyJAJj8Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7VWymMBupAmp/N7GcWRHarGv+NyJ8vip5GFENgDj/c=;
 b=NhkuLE2v8I5mNbEusupUVrDQhTz+a8pgoJLozgmKhEnPM7nyzd4IzChh9A+F7veOp6EQs2wCY2aqPB03ivsFe2YxMt3J0sb3GTeYDFZBKcoXjaLWuCWwGcqxy6bRNcNS/Xrf7zO0gQF7d0gQme+fJLjfw5FJZAUX5Jfoz4jsJ2S/zQmEpPXo+Sjw6pNULE4QchvS7V1n4JVF00xkeIFiweKIDqUhOuQQ+sTq5BeqtKz8UJ/5rZXThOHCUJ+SKKr9F9GuFYM0fDCN2aY8k5q7+ucDrS0QW/yN3F0fYIbrwz/Rt5NBSyD0S7vaz7rFrpwjfeU3t4W0GNzxTVmJZZ7lbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0054.namprd12.prod.outlook.com (2603:10b6:300:103::16)
 by BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:133::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.13; Mon, 9 Sep
 2019 14:38:33 +0000
Received: from CO1NAM03FT039.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by MWHPR12CA0054.outlook.office365.com
 (2603:10b6:300:103::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.13 via Frontend
 Transport; Mon, 9 Sep 2019 14:38:32 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT039.mail.protection.outlook.com (10.152.81.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Mon, 9 Sep 2019 14:38:31 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 9 Sep 2019
 09:38:29 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amd/display: add Asic ID for Dali
Date: Mon, 9 Sep 2019 10:37:59 -0400
Message-ID: <20190909143800.3850-2-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190909143800.3850-1-Bhawanpreet.Lakha@amd.com>
References: <20190909143800.3850-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(136003)(2980300002)(428003)(189003)(199004)(2616005)(81156014)(8676002)(2351001)(4326008)(53416004)(1076003)(51416003)(5660300002)(48376002)(47776003)(2906002)(478600001)(53936002)(305945005)(476003)(86362001)(6916009)(50466002)(76176011)(81166006)(7696005)(316002)(16586007)(486006)(126002)(356004)(6666004)(70206006)(426003)(70586007)(336012)(50226002)(26005)(8936002)(186003)(446003)(11346002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3176; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23d95378-63a9-47b3-3f4c-08d735336349
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BYAPR12MB3176; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:
X-Microsoft-Antispam-PRVS: <BYAPR12MB317604CA952D50BD42CCF91AF9B70@BYAPR12MB3176.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:220;
X-Forefront-PRVS: 01559F388D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: yViMRWNbQwrW0yN4oQV3m46zCEoCyI8TgOAK2JTYZmnUgeXcLENC9jCpkJ4+YyHAqcsV7rIAoZv7EG4+MRXs9ZtuIyENdgFM5k63CfYA2nI4mBLMYSqH4jCmlTQAZ0WxtZq8G8BNjpufESaa3ewEVQvjvMWXTLcHCzo0LB61R1DDeyStwgOzcD8MX9n9RXlOS8IOteDDdirt06bn7XfPXwaf9fAa4gQ0c+bPeBRb8p+Z0hV0WpwZKYxIUZPjNt+DXKh9Dx7AcweSmNxjkXs1Vv36M3qVQaBJgfsYqrHg/HGo1dLe4HPRdeVZHrjcsZ1ErkWQcOl0kxsKahMtDmKipOhtNwss8A/8gd9PKG0MFApbHs1z9jUOEgkiywQHwBtmilTvVataK/4Ci4fmW/BnJgb1usJhAuUp98WS1SJAlHY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2019 14:38:31.9661 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d95378-63a9-47b3-3f4c-08d735336349
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3176
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7VWymMBupAmp/N7GcWRHarGv+NyJ8vip5GFENgDj/c=;
 b=Fo5OMkICKbny21u87sJ5Jj8Jkkq+oI3xI5xQQh0lOSUXWg7ccDZq0bq3qLAOiLxl2YoAfcwJfPe1UdipmyLp71Ty3a7fEcjeAAjTBqiKwli+FuYzSNO7BdDRIv90I2vOdYXMmtR9rIVT/Kg9/1eCje8XBzfsyWG7SPnXt3TwHsw=
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

RGFsaSBpcyBhIG5ldyBhc2ljIHJldmlzaW9uIGJhc2VkIG9uIHJhdmVuMgoKQWRkIHRoZSBJRCBh
bmQgQVNJQ1JFVl9JU19EQUxJIGRlZmluZQoKU2lnbmVkLW9mZi1ieTogQmhhd2FucHJlZXQgTGFr
aGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJh
eS5odWFuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRl
L2RhbF9hc2ljX2lkLmggfCA3ICsrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2luY2x1ZGUvZGFsX2FzaWNfaWQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9p
bmNsdWRlL2RhbF9hc2ljX2lkLmgKaW5kZXggMWYxNjg5MmYwYWRkLi4xYmU2YzQ0ZmQzMmYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRlL2RhbF9hc2ljX2lk
LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZGFsX2FzaWNfaWQu
aApAQCAtMTM3LDEwICsxMzcsMTMgQEAKICNkZWZpbmUgUkFWRU4xX0YwIDB4RjAKICNkZWZpbmUg
UkFWRU5fVU5LTk9XTiAweEZGCiAKKyNkZWZpbmUgUElDQVNTT18xNUQ4X1JFVl9FMyAweEUzCisj
ZGVmaW5lIFBJQ0FTU09fMTVEOF9SRVZfRTQgMHhFNAorCiAjZGVmaW5lIEFTSUNSRVZfSVNfUkFW
RU4oZUNoaXBSZXYpICgoZUNoaXBSZXYgPj0gUkFWRU5fQTApICYmIGVDaGlwUmV2IDwgUkFWRU5f
VU5LTk9XTikKICNkZWZpbmUgQVNJQ1JFVl9JU19QSUNBU1NPKGVDaGlwUmV2KSAoKGVDaGlwUmV2
ID49IFBJQ0FTU09fQTApICYmIChlQ2hpcFJldiA8IFJBVkVOMl9BMCkpCi0jZGVmaW5lIEFTSUNS
RVZfSVNfUkFWRU4yKGVDaGlwUmV2KSAoKGVDaGlwUmV2ID49IFJBVkVOMl9BMCkgJiYgKGVDaGlw
UmV2IDwgMHhGMCkpCi0KKyNkZWZpbmUgQVNJQ1JFVl9JU19SQVZFTjIoZUNoaXBSZXYpICgoZUNo
aXBSZXYgPj0gUkFWRU4yX0EwKSAmJiAoZUNoaXBSZXYgPCBQSUNBU1NPXzE1RDhfUkVWX0UzKSkK
KyNkZWZpbmUgQVNJQ1JFVl9JU19EQUxJKGVDaGlwUmV2KSAoKGVDaGlwUmV2ID49IFBJQ0FTU09f
MTVEOF9SRVZfRTMpICYmIChlQ2hpcFJldiA8IFJBVkVOMV9GMCkpCiAKICNkZWZpbmUgQVNJQ1JF
Vl9JU19SVjFfRjAoZUNoaXBSZXYpICgoZUNoaXBSZXYgPj0gUkFWRU4xX0YwKSAmJiAoZUNoaXBS
ZXYgPCBSQVZFTl9VTktOT1dOKSkKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
