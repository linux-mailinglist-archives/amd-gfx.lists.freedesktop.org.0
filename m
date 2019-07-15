Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8AE69DAE
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58DBD89C25;
	Mon, 15 Jul 2019 21:21:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680066.outbound.protection.outlook.com [40.107.68.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC2C89BFD
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=luh8MRuc3AkL2Vb7j4J7FjM+WZoC0MsqpsdKyFgrmCCoGraZtgKcIBc2LyV6ZY20IR8gG+8hZZoyd/coaV4V5GtzRqv60KYSXN4+7DYCbiCKXV/jO9z3ktkR76kthyENJjQ+QQ3MeN+XsbjUxj/yziFrsl0SOhf1t6qKpJRLdg+nEJz4wrCOLSpbylYx5vLH9durJAaIi5LCTLPx7F0e450cnoxK/wnI9osnOl+HedtNbywv75+kMtUfbaYSFUu1Siv87Ma8CVeKQlDPt2YfOU+rgbQSC02lveoWAx405j6dRX5Qk8rEsyneRra0XZfCDC+pBJt0Kuh2aK4ARVm/Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hv+KuZ0FHOVDGOCCpwqZEgKcA0tTIO3l9xcZ3GLFS20=;
 b=Dtb6fzsRO99CMyYah8WKur0GHHfiEF2bENKcZsvyBb3HdOG0Cq9eto09pxSTzUy+0cH4ClwpCmoGVQbhProFULGWRhvGrIADuzqg2ZQd+BmvPUfBxbwyvzOOo3S01Csz4Mz6odMlsss3UDudRp7HhkXESFxc+iTuyo2CDnxyZ+QXiAs603VfJkXKF+dOBcSwPSYAom73kEL+9aIwUgg0+TiqTj7Wt4fyIkkc2wl242FQeW6omRPJiK9eIFw1R0wPTvo66ajIJikenACOK+kFu8HsOrJNYAmcRiHMAeqGtcM7BPDcSMVn++p2c5LNYg9lCC35MoeP2Cj69hWZ0nptHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM5PR12CA0004.namprd12.prod.outlook.com (2603:10b6:4:1::14) by
 BN6PR12MB1921.namprd12.prod.outlook.com (2603:10b6:404:fe::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.13; Mon, 15 Jul 2019 21:21:26 +0000
Received: from CO1NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by DM5PR12CA0004.outlook.office365.com
 (2603:10b6:4:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:25 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT028.mail.protection.outlook.com (10.152.80.189) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:25 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:15 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 19/87] drm/amd/display: Incorrect Read Interval Time For CR
 Sequence
Date: Mon, 15 Jul 2019 17:19:41 -0400
Message-ID: <20190715212049.4584-20-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(2980300002)(428003)(189003)(199004)(53936002)(70586007)(6916009)(2876002)(76176011)(70206006)(51416003)(316002)(86362001)(486006)(54906003)(5660300002)(305945005)(68736007)(478600001)(1076003)(11346002)(446003)(50466002)(14444005)(47776003)(2870700001)(6666004)(50226002)(356004)(49486002)(81156014)(81166006)(36756003)(186003)(426003)(2906002)(48376002)(8676002)(2616005)(336012)(4326008)(126002)(2351001)(476003)(8936002)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1921; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff4a9d8e-39ff-41cf-c2fc-08d7096a64a3
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1921; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1921:
X-Microsoft-Antispam-PRVS: <BN6PR12MB19212E13F4C27156E6B04B7C82CF0@BN6PR12MB1921.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: DF2VSRecgMG7b2bruasnho9KYl+fZ6ZiqdfYu7wZ09cYITap6yvTSADgBBjEIw6LBjnn6LF+UduBW/l9EmdGucMdy8tigIxxCJX5lHT3CzsSFswXlb9U/uXKs5FB1i+BQOaWiitlhHOlBbgFO92DgDoy7ZI07bYQyK1kU400s7rBRH1abB9Uq3qoh/YypiAqLDDPdMxDNJwmT0qitp5umbciqtNa77zK4kQlrI3+d04EbAXyghjMsKRCweTtunZ/RwonOw2RESF3B5jkNskwgYVIchmqYhofdoiBdlsX8mW0oobZJV5TabCllUJCPJR8R8q62+CSotqPXve08D/yq+9T2nsLXm1Nasdt65OgEsfKmTsniCqv3fXuFMos+tyDYYZlsTvDCr1ojsuj4U+ib1mduasSyByGAzOR8UjO7ws=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:25.3892 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff4a9d8e-39ff-41cf-c2fc-08d7096a64a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1921
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hv+KuZ0FHOVDGOCCpwqZEgKcA0tTIO3l9xcZ3GLFS20=;
 b=fWWmQ+8jQHXR5/xJ4gavX1UZ4hL8njWCuvT6gPabFRmkjO0qE1PrFFTce1t0NPCDfe6EwWcKczqqeJgpd7z0rqGcqWdwVdZqhvuZnujQ5LUEFbtdm2MmW2FH7cVBSmbaEpKcAuGFX4o2sqaAZVJhg5ElfpUUqXlq8GjUKgl7MQQ=
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
Cc: Leo Li <sunpeng.li@amd.com>, Tony Cheng <Tony.Cheng@amd.com>,
 David Galiffi <David.Galiffi@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgR2FsaWZmaSA8ZGF2aWQuZ2FsaWZmaUBhbWQuY29tPgoKW1dIWV0KVFJBSU5J
TkdfQVVYX1JEX0lOVEVSVkFMIChEUENEIDAwMEVoKSBtb2RpZmllcyB0aGUgcmVhZCBpbnRlcnZh
bApmb3IgdGhlIEVRIHRyYWluaW5nIHNlcXVlbmNlLiBDUiByZWFkIGludGVydmFsIHNob3VsZCBy
ZW1haW4gMTAwIHVzLgpDdXJyZW50bHksIHRoZSBDUiBpbnRlcnZhbCBpcyBhbHNvIGJlaW5nIG1v
ZGlmaWVkLgoKW0hPV10KbHRfc2V0dGluZ3MtPmNyX3BhdHRlcm5fdGltZSBzaG91bGQgYWx3YXlz
IGJlIDEwMCB1cy4KClNpZ25lZC1vZmYtYnk6IERhdmlkIEdhbGlmZmkgPERhdmlkLkdhbGlmZmlA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IFRvbnkgQ2hlbmcgPFRvbnkuQ2hlbmdAYW1kLmNvbT4KQWNr
ZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYwppbmRleCBmY2ExYmZjOTAxYjYuLjQ0NDJlN2Ix
ZTViNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNf
bGlua19kcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xp
bmtfZHAuYwpAQCAtMTAzNSw3ICsxMDM1LDcgQEAgc3RhdGljIHZvaWQgaW5pdGlhbGl6ZV90cmFp
bmluZ19zZXR0aW5ncygKIAlpZiAobGluay0+cHJlZmVycmVkX3RyYWluaW5nX3NldHRpbmdzLmNy
X3BhdHRlcm5fdGltZSAhPSBOVUxMKQogCQlsdF9zZXR0aW5ncy0+Y3JfcGF0dGVybl90aW1lID0g
KmxpbmstPnByZWZlcnJlZF90cmFpbmluZ19zZXR0aW5ncy5jcl9wYXR0ZXJuX3RpbWU7CiAJZWxz
ZQotCQlsdF9zZXR0aW5ncy0+Y3JfcGF0dGVybl90aW1lID0gZ2V0X3RyYWluaW5nX2F1eF9yZF9p
bnRlcnZhbChsaW5rLCAxMDApOworCQlsdF9zZXR0aW5ncy0+Y3JfcGF0dGVybl90aW1lID0gMTAw
OwogCiAJaWYgKGxpbmstPnByZWZlcnJlZF90cmFpbmluZ19zZXR0aW5ncy5lcV9wYXR0ZXJuX3Rp
bWUgIT0gTlVMTCkKIAkJbHRfc2V0dGluZ3MtPmVxX3BhdHRlcm5fdGltZSA9ICpsaW5rLT5wcmVm
ZXJyZWRfdHJhaW5pbmdfc2V0dGluZ3MuZXFfcGF0dGVybl90aW1lOwotLSAKMi4yMi4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
