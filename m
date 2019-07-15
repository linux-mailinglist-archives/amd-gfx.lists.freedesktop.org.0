Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 142F769D9B
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5072C89BCD;
	Mon, 15 Jul 2019 21:21:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800072.outbound.protection.outlook.com [40.107.80.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F051489BBE
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpHBUqItG6fX5dDjs1VxNrJCskNhiEsUDbmtDzC3Ac5JuFp6a1KZ5j8JVA0v+s+qbYmZojkv7ecBqYnRz621+NNoBlpOuHJlrbj1CP7BofJ3livq/wihJrfpYefJeqUKUT4UJiWzkqQ8f6uygvW7siMieR97rVz8f2/jfFVCB7YTAlp9JOtMOyhNBABkRWeuWtFqVorfsv4zDGfBjVSK39+UsYmkrQRzv03wYPgBZiVu2Surly7DH/KZBYCT1Reve0HVY664XBG1n1jq09M85NN9rJIUqqYg6z8/d7OtE3YjKnqvyH1gZjESayB3VYI65ADOIMeCK7lFmm+g0TIo/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2i1rf1rbts1LcgWKkqaVBNLCQGrXg9/JmVH7FByGDI=;
 b=kl31+4CjaUnKvgCUQLojCwi4W6a1k3nuLfi0P9O79JOLXMZe8rKjvT9YdltNoSIJrFieQeUkS0jG4ZmfCcAdCsqsmuxOrGO++vePnXOyqVeU0Hcbeqfk6vVkzta8hhZaRzvaa6orsh4i1O9XWsXjrZmqqaRDBE4ZWw/HfWLSZJRfBIQjwAIGylJaWRy+wI0haa+v5d6+qep4uNtn5TYnA8IbdVGKohaJ2mwPn3A/SfRtaXfLZI/TVYUKomkG9+cU0fqtx10JeQ7SySPPUheSygSeRTzJLxpJqWHnB4Nm/aqnVEIocCn3Q8CBQd+aRwxllPkje0NXbkodhS0nxvwUiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0041.namprd12.prod.outlook.com (2603:10b6:301:2::27)
 by DM5PR12MB1932.namprd12.prod.outlook.com (2603:10b6:3:10e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:21:17 +0000
Received: from CO1NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by MWHPR12CA0041.outlook.office365.com
 (2603:10b6:301:2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:17 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT009.mail.protection.outlook.com (10.152.80.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:17 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:06 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 10/87] drm/amd/display: Add aux tracing log in dce
Date: Mon, 15 Jul 2019 17:19:32 -0400
Message-ID: <20190715212049.4584-11-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(2980300002)(428003)(189003)(199004)(70586007)(70206006)(8936002)(486006)(36756003)(54906003)(316002)(305945005)(47776003)(426003)(53936002)(11346002)(126002)(356004)(446003)(2616005)(6666004)(8676002)(476003)(81156014)(81166006)(68736007)(50466002)(2351001)(336012)(6916009)(1076003)(50226002)(478600001)(14444005)(2906002)(86362001)(2876002)(2870700001)(48376002)(4326008)(5660300002)(51416003)(186003)(26005)(49486002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1932; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7804130-6f0f-46ad-33e7-08d7096a5faa
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1932; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1932:
X-Microsoft-Antispam-PRVS: <DM5PR12MB193256D79A261464C5A3044082CF0@DM5PR12MB1932.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:250;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: WUD+pWZX0MTsMOzIUkoKGXUeVRJn8X+9KRJw5GQ+kiEKEFQ1+Wd6a/t7xM69cZ+WiH02jFEuGLo0q0Jkxy+WB6Yz//KQsV1mgzhPdqPgK9c/U30D66cwc8vSbduIo5ckhpVmdv3+XcxardECLZjJScKDASnrNThChHWZnTNQlJB+o2XzrnUmosz7y2fRlEBkV6pmpyRKmIoNAP4t8xwa9tEu+OpKyNSlm+/1JU3gOZDCOtDK977Dtvhofto+KjMU3Sl4lhMaiUeozQzWa/Whe3R6UmwAWOSzTlyT6vUzq0zEd+Unj9yk1r5C+X+tDMfm0RXQB5b9SMzX+hdYzFHLvcnMP3nyF8tH+N6Wrr77jm4CMY5MXUL6+dwRY+POsQkTCEfpDB5KDoYcslQz+T3kPY3qdYjjFfKLb5awPCrLgkc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:17.0446 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7804130-6f0f-46ad-33e7-08d7096a5faa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1932
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2i1rf1rbts1LcgWKkqaVBNLCQGrXg9/JmVH7FByGDI=;
 b=wVZwe6LQhxHgGz5ETPtiisTMXO4zWAAWsejbmgYEcCrjVpbHYCMNkR2d7x1nmBpfBIg/a9aIIULa98X2iWHZO/FvDwL1JDF7OZSdpt5345V7zksxDKj5ptmLhxZnfM9crcY9JhVrsjgCkaHQrAob1tbGOf6a8E0LFpkHOFuCzIY=
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
Cc: Leo Li <sunpeng.li@amd.com>, Tony Cheng <tong.cheng@amd.com>,
 Chiawen Huang <chiawen.huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hpYXdlbiBIdWFuZyA8Y2hpYXdlbi5odWFuZ0BhbWQuY29tPgoKW1doeV0KZGNlIHdh
cyByZS1hcmNoJ2QsIHRoZXJlZm9yZSBhZGRpbmcgYXV4IHRyYWNpbmcgbG9nIGludG8gbmV3IGRj
ZQoKW0hvd10KVGhlIHBvcnRpbmcgZnJvbSBzdWJtaXRfY2hhbm5lbF9yZXF1ZXN0L3Byb2Nlc3Nf
Y2hhbm5lbF9yZXBseSBvZiBhdXhfZW5naW5lX2RjZTExMC5jCgpTaWduZWQtb2ZmLWJ5OiBDaGlh
d2VuIEh1YW5nIDxjaGlhd2VuLmh1YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBUb255IENoZW5n
IDx0b25nLmNoZW5nQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguYyB8IDkg
KysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYXV4
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguYwppbmRleCBi
ZDMzYzQ3MTgzZmMuLjc5YTE2OTQyY2U5OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjZS9kY2VfYXV4LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjZS9kY2VfYXV4LmMKQEAgLTI3LDYgKzI3LDcgQEAKICNpbmNsdWRlICJjb3JlX3R5
cGVzLmgiCiAjaW5jbHVkZSAiZGNlX2F1eC5oIgogI2luY2x1ZGUgImRjZS9kY2VfMTFfMF9zaF9t
YXNrLmgiCisjaW5jbHVkZSAiZG1fZXZlbnRfbG9nLmgiCiAKICNkZWZpbmUgQ1RYIFwKIAlhdXgx
MTAtPmJhc2UuY3R4CkBAIC0yNDksNiArMjUwLDggQEAgc3RhdGljIHZvaWQgc3VibWl0X2NoYW5u
ZWxfcmVxdWVzdCgKIAl9CiAKIAlSRUdfVVBEQVRFKEFVWF9TV19DT05UUk9MLCBBVVhfU1dfR08s
IDEpOworCUVWRU5UX0xPR19BVVhfUkVRKGVuZ2luZS0+ZGRjLT5waW5fZGF0YS0+ZW4sIEVWRU5U
X0xPR19BVVhfT1JJR0lOX05BVElWRSwKKwkJCQkJcmVxdWVzdC0+YWN0aW9uLCByZXF1ZXN0LT5h
ZGRyZXNzLCByZXF1ZXN0LT5sZW5ndGgsIHJlcXVlc3QtPmRhdGEpOwogfQogCiBzdGF0aWMgaW50
IHJlYWRfY2hhbm5lbF9yZXBseShzdHJ1Y3QgZGNlX2F1eCAqZW5naW5lLCB1aW50MzJfdCBzaXpl
LApAQCAtNDc3LDkgKzQ4MCwxMyBAQCBpbnQgZGNlX2F1eF90cmFuc2Zlcl9yYXcoc3RydWN0IGRk
Y19zZXJ2aWNlICpkZGMsCiAJKm9wZXJhdGlvbl9yZXN1bHQgPSBnZXRfY2hhbm5lbF9zdGF0dXMo
YXV4X2VuZ2luZSwgJnJldHVybmVkX2J5dGVzKTsKIAogCWlmICgqb3BlcmF0aW9uX3Jlc3VsdCA9
PSBBVVhfQ0hBTk5FTF9PUEVSQVRJT05fU1VDQ0VFREVEKSB7Ci0JCXJlYWRfY2hhbm5lbF9yZXBs
eShhdXhfZW5naW5lLCBwYXlsb2FkLT5sZW5ndGgsCisJCWludCBieXRlc19yZXBsaWVkID0gMDsK
KwkJYnl0ZXNfcmVwbGllZCA9IHJlYWRfY2hhbm5lbF9yZXBseShhdXhfZW5naW5lLCBwYXlsb2Fk
LT5sZW5ndGgsCiAJCQkJCSBwYXlsb2FkLT5kYXRhLCBwYXlsb2FkLT5yZXBseSwKIAkJCQkJICZz
dGF0dXMpOworCQlFVkVOVF9MT0dfQVVYX1JFUChhdXhfZW5naW5lLT5kZGMtPnBpbl9kYXRhLT5l
biwKKwkJCQkJRVZFTlRfTE9HX0FVWF9PUklHSU5fTkFUSVZFLCAqcGF5bG9hZC0+cmVwbHksCisJ
CQkJCWJ5dGVzX3JlcGxpZWQsIHBheWxvYWQtPmRhdGEpOwogCQlyZXMgPSByZXR1cm5lZF9ieXRl
czsKIAl9IGVsc2UgewogCQlyZXMgPSAtMTsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
