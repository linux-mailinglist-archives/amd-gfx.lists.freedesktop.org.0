Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F12898A3
	for <lists+amd-gfx@lfdr.de>; Mon, 12 Aug 2019 10:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BDB6E4AA;
	Mon, 12 Aug 2019 08:22:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720078.outbound.protection.outlook.com [40.107.72.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890A36E4AA
 for <amd-gfx@lists.freedesktop.org>; Mon, 12 Aug 2019 08:22:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJNd9j6NUwqDS0Mkw3VXJJdMV5NxjZd2e2EnmViAeLwTaAkOdPUGLjsxT/YcS/xRCa/AzrUSraSSJDBDNinQyctcp5Mgv+rg5wj7pB23Wy+Pw6YggFvmbb8MaMtR1OIEi0DcQMq6ydpcu11wCUbO0ZubJ1YAWrdQf0m0i4WzPXJOnWeTfmiDcWsjv2EqYZtW3AW4HjB4hgfzT/9woc1t3ks5vQIAbS8DFuUJ1kqjkqnpgjYk7IrPvGbTP5CpPNoGMi/SGZ76JqrqRKZcanqwxi0CHE8q05z5nyVaP0I+VkXz1bxg2OH0C7Jm6vFEao/ZYTXsNSPmMjEC4p3c3KucYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s11goIN8mvYiiGh4vd6u4oNmFZT0S/gV7xYu+TNzn5Y=;
 b=f0lQMIEatQ8RAQXCTGpUiyNXJkic+WA3pV2gNjYcxOQegiNuLtR62e7qOU7Hsm/41yBXRFYqzX1V1NkERfjEurxYRwiBdTG1Po8OjfHR4yPGGqp+yqh8z1rmmB1MrbhLoRyWQWbPvjaeMy+v9Af1F7l7WrzuOJNMMSJWPc52BsFvH39XrxkFeqAtBXQ0wTvPXPFMgjlSUr/Z6NLF5xj6rPmllEFst0t4fs4EHVSzSPwxKP5W/yB84RiOBbPXlIVL4YJoXgUe/c/8mRXO2/jonwgeSqPwGPYeiX7PFu3uVaFjWWm6QmWFAy3MycrEZz88cisM+WLA2TfCZRb8QCbEaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR12CA0025.namprd12.prod.outlook.com (2603:10b6:903:129::11)
 by MWHPR12MB1536.namprd12.prod.outlook.com (2603:10b6:301:6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.20; Mon, 12 Aug
 2019 08:22:40 +0000
Received: from CO1NAM03FT033.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by CY4PR12CA0025.outlook.office365.com
 (2603:10b6:903:129::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.14 via Frontend
 Transport; Mon, 12 Aug 2019 08:22:40 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT033.mail.protection.outlook.com (10.152.80.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Mon, 12 Aug 2019 08:22:39 +0000
Received: from gc-System-Product-Name.amd.com (10.34.1.3) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Mon, 12 Aug 2019 03:22:37 -0500
From: Chengming Gui <Jack.Gui@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/powerplay: add arcturus_is_dpm_running function
 for arcturus
Date: Mon, 12 Aug 2019 16:22:18 +0800
Message-ID: <1565598138-13844-2-git-send-email-Jack.Gui@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565598138-13844-1-git-send-email-Jack.Gui@amd.com>
References: <1565598138-13844-1-git-send-email-Jack.Gui@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(396003)(136003)(2980300002)(428003)(199004)(189003)(26005)(16586007)(50226002)(316002)(70586007)(70206006)(48376002)(6666004)(8936002)(356004)(36756003)(5660300002)(305945005)(81166006)(81156014)(8676002)(336012)(4326008)(53416004)(47776003)(2906002)(2351001)(50466002)(6916009)(478600001)(53936002)(126002)(476003)(2616005)(7696005)(51416003)(76176011)(186003)(86362001)(14444005)(426003)(446003)(11346002)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1536; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdd74e87-7b82-4dcc-07a6-08d71efe3da8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1536; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1536:
X-Microsoft-Antispam-PRVS: <MWHPR12MB15361693E3AE572321840E668BD30@MWHPR12MB1536.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 012792EC17
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: fS0a9TWL+WEXqUYNc6GYJ063hiNPtd1PMgU8ZO0Xm/6SXM3GkCT6O4OZn8Fg4wjEQX0ShbK5VNwJbmWsQvdA3A1pj31KbQd8HWkAs1JxkV8pq7/rJXjPkiiJI2qD3MQ7TbuNRX3BLbhEa2BQyu0TFaL4TiChDGsI2fzWHeg9sdjxoVEB0WtpxJ+f3QmG/RcGZvZ0CPAo7mvkapEW9RuRtgo8x60938w5PVWDzDM5PvVjsvrTQaNtyPqDhV2uwRFohwKdlBF/qm0Qhq8TJXXK2ju/hx0AKd7+xaWISlTKNaXMKJCf1rwpkN/Kllu7/+D1rXyudM29Rb+Pr0s0MT2VZc5TQ1X5wbbXY/ZFMHuW+pTXo9hyiT6c1q37ANFyTJlV/GDWlD4zNnobmWlMQoqPz+yddabPJyYBJYhFyMhsk0s=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2019 08:22:39.8380 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd74e87-7b82-4dcc-07a6-08d71efe3da8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1536
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s11goIN8mvYiiGh4vd6u4oNmFZT0S/gV7xYu+TNzn5Y=;
 b=px5abyAFYfK0Y2uIcO3c6I0m+703nKQl+ye+gXjNR8ouRy3+tC0g+sBMie+wS3dwTK6uz6l1SYe16B+i+oAv1WsF6s3wCTCHWQgMLYRaQoNkLvz3vLwnRqOw8xED7i6ArRzo+AdxVmNmcyHqaLdGV/Es3IjeajDIM0c5OvCm518=
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
Cc: Chengming Gui <Jack.Gui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YWRkIGFyY3R1cnVzX2lzX2RwbV9ydW5uaW5nIGZ1bmN0aW9uCgpTaWduZWQtb2ZmLWJ5OiBDaGVu
Z21pbmcgR3VpIDxKYWNrLkd1aUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2FyY3R1cnVzX3BwdC5jIHwgMjEgKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvYXJjdHVydXNfcHB0LmMKaW5kZXggMDNjZTg3MS4uOTEwN2JlYiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMKQEAgLTUxLDYgKzUxLDE1IEBACiAj
ZGVmaW5lIFNNVV9GRUFUVVJFU19ISUdIX01BU0sgICAgICAgMHhGRkZGRkZGRjAwMDAwMDAwCiAj
ZGVmaW5lIFNNVV9GRUFUVVJFU19ISUdIX1NISUZUICAgICAgMzIKIAorI2RlZmluZSBTTUNfRFBN
X0ZFQVRVUkUgKCBcCisJRkVBVFVSRV9EUE1fUFJFRkVUQ0hFUl9NQVNLIHwgXAorCUZFQVRVUkVf
RFBNX0dGWENMS19NQVNLIHwgXAorCUZFQVRVUkVfRFBNX1VDTEtfTUFTSyB8IFwKKwlGRUFUVVJF
X0RQTV9TT0NDTEtfTUFTSyB8IFwKKwlGRUFUVVJFX0RQTV9NUDBDTEtfTUFTSyB8IFwKKwlGRUFU
VVJFX0RQTV9GQ0xLX01BU0sgfCBcCisJRkVBVFVSRV9EUE1fWEdNSV9NQVNLKQorCiAvKiBwb3Nz
aWJsZSBmcmVxdWVuY3kgZHJpZnQgKDFNaHopICovCiAjZGVmaW5lIEVQU0lMT04JCQkJMQogCkBA
IC0xODczLDYgKzE4ODIsMTcgQEAgc3RhdGljIHZvaWQgYXJjdHVydXNfZHVtcF9wcHRhYmxlKHN0
cnVjdCBzbXVfY29udGV4dCAqc211KQogCiB9CiAKK3N0YXRpYyBib29sIGFyY3R1cnVzX2lzX2Rw
bV9ydW5uaW5nKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQoreworCWludCByZXQgPSAwOworCXVp
bnQzMl90IGZlYXR1cmVfbWFza1syXTsKKwl1bnNpZ25lZCBsb25nIGZlYXR1cmVfZW5hYmxlZDsK
KwlyZXQgPSBzbXVfZmVhdHVyZV9nZXRfZW5hYmxlZF9tYXNrKHNtdSwgZmVhdHVyZV9tYXNrLCAy
KTsKKwlmZWF0dXJlX2VuYWJsZWQgPSAodW5zaWduZWQgbG9uZykoKHVpbnQ2NF90KWZlYXR1cmVf
bWFza1swXSB8CisJCQkgICAoKHVpbnQ2NF90KWZlYXR1cmVfbWFza1sxXSA8PCAzMikpOworCXJl
dHVybiAhIShmZWF0dXJlX2VuYWJsZWQgJiBTTUNfRFBNX0ZFQVRVUkUpOworfQorCiBzdGF0aWMg
Y29uc3Qgc3RydWN0IHBwdGFibGVfZnVuY3MgYXJjdHVydXNfcHB0X2Z1bmNzID0gewogCS8qIHRy
YW5zbGF0ZSBzbXUgaW5kZXggaW50byBhcmN0dXJ1cyBzcGVjaWZpYyBpbmRleCAqLwogCS5nZXRf
c211X21zZ19pbmRleCA9IGFyY3R1cnVzX2dldF9zbXVfbXNnX2luZGV4LApAQCAtMTkxMCw2ICsx
OTMwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIGFyY3R1cnVzX3BwdF9m
dW5jcyA9IHsKIAkvKiBkZWJ1ZyAoaW50ZXJuYWwgdXNlZCkgKi8KIAkuZHVtcF9wcHRhYmxlID0g
YXJjdHVydXNfZHVtcF9wcHRhYmxlLAogCS5nZXRfcG93ZXJfbGltaXQgPSBhcmN0dXJ1c19nZXRf
cG93ZXJfbGltaXQsCisJLmlzX2RwbV9ydW5uaW5nID0gYXJjdHVydXNfaXNfZHBtX3J1bm5pbmcs
CiB9OwogCiB2b2lkIGFyY3R1cnVzX3NldF9wcHRfZnVuY3Moc3RydWN0IHNtdV9jb250ZXh0ICpz
bXUpCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
