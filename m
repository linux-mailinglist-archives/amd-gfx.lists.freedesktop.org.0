Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F5B9C816
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 05:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1576E16D;
	Mon, 26 Aug 2019 03:55:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710073.outbound.protection.outlook.com [40.107.71.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D176E16D
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 03:55:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdfsl2292quXpowEj+viJ9b+/Zwsraup0vdPa7HGKni64+ya2X5x4ahOPxxMDhn9N1sr6T3d3ZehapQWm4b467NsFdE3hg0+7TZG9vtH0JLgATr4W6vC+YAzsHjn19PVx6zoBkf9T46yB7ECwPVy3WQb80LAoHmgClM16GaXpNB83LEkaCiOG7D3PWoGMa4cWbZWaqzdjdx6Vu5HJ2SkRqXn16OGjpnDILcdf30zyi7InoNDPh7nFm4iU6sPVlADfbshRmAWSRGKbMjQ5LWKgoYoE+tZa+mPrZi8eKt1a491osOdzKI1V6ctPGh9S2HhPbgevbtJBEZvd5hlIWFEmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VC0MNn3wVQ3mWS6rzNaUj0N6rIxcrOjmGEc8Yl8zPtA=;
 b=eK7szEE4l7sBlkhl0h5fdGJI857Q8B9M5RQk+PKcA9an7n8XmU+4dsF3xj5b+zTl3gWa/svnmpaR3x0SJgqCwmJwEIUixF185VHXNh+mpWs26GLqhdvDy/s1Ln46fxFVyYErVuBhZFf74NOqAYpeBiOnMWpgoy4l3MQiutn8osC9vFpANP81SK6KfPG0ABKKiMjQ+JoxeKb9Ub1Dc2BSwuqo+/JFkpyCIN7tgnAQsORI9p6XHHdxTxG7hsetryFvVTpkMgJxrIULCwOslxwAd12urCs0LJAq4kLBMXX79beSN/kalQTr1GwqRauHJOsUBpbPmlQM0Yfrf2Epo535UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0029.namprd12.prod.outlook.com (2603:10b6:301:2::15)
 by BN7PR12MB2708.namprd12.prod.outlook.com (2603:10b6:408:21::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.20; Mon, 26 Aug
 2019 03:55:42 +0000
Received: from DM3NAM03FT042.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by MWHPR12CA0029.outlook.office365.com
 (2603:10b6:301:2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Mon, 26 Aug 2019 03:55:41 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT042.mail.protection.outlook.com (10.152.83.174) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 26 Aug 2019 03:55:41 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Sun, 25 Aug 2019 22:55:39 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 8/8] drm/amdgpu: poll ras_controller_irq and
 err_event_athub_irq status
Date: Mon, 26 Aug 2019 11:55:00 +0800
Message-ID: <1566791700-1912-9-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566791700-1912-1-git-send-email-Hawking.Zhang@amd.com>
References: <1566791700-1912-1-git-send-email-Hawking.Zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(136003)(376002)(2980300002)(428003)(199004)(189003)(16586007)(51416003)(110136005)(48376002)(76176011)(4326008)(86362001)(50466002)(36756003)(7696005)(486006)(316002)(70206006)(70586007)(478600001)(47776003)(305945005)(2906002)(426003)(336012)(2616005)(26005)(186003)(476003)(126002)(53416004)(5660300002)(81166006)(356004)(6666004)(11346002)(81156014)(8936002)(50226002)(53936002)(446003)(8676002)(6636002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2708; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 033dbb4f-270a-4e9f-6b6a-08d729d9439d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN7PR12MB2708; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2708:
X-Microsoft-Antispam-PRVS: <BN7PR12MB27082901DDFDF4D63D08C80CFCA10@BN7PR12MB2708.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 01415BB535
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: hILBRS7A5I3Nnw11mF8KfJLTBwIvMIqgkVRr3K6MHaWZNRB8AisWeeV7RWbNT5+ae5xPG58875N3dNjITEsyMNV3Kevx8JwRiPCJzdzr8phI1DdGnayyBJ3FbASUcSNuJ3F2GRxLYh4oRCOEnrjWDVPWwMUh/mz2nFCnPmAvgN2h16TkmTNm5FQnft711JRQE6SJJ71kf0rRTaRE0zA0hAv8KfUytKotfp0YuO+LGOp9OGpN8XHT+R7pK/84WPk3cxRTQlIKEy08Mm+/tb1Zo5O3xWqTO1/heafBpGRtmpqpuJgV/i+SOwf1jeEP1XPPZdj33j1qP7dtWxlj0LLDQgm7Tn+yHd3xKmLbzyRrUERp0ks2Plye7saT2VCcd32HENOoXBR5psACp+i4VT4+oy9jcOuY2kBXjhF6W6ebyNI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2019 03:55:41.4265 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 033dbb4f-270a-4e9f-6b6a-08d729d9439d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2708
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VC0MNn3wVQ3mWS6rzNaUj0N6rIxcrOjmGEc8Yl8zPtA=;
 b=okqI2czejymiq/iDNPDwQdXFev+RJnydIi7mDSEE4S3YndAashq7OROxcTHu7t0IDeYKE4rkJCAZ1hFq6zEfE3qwQGU3eLKAdL+/W9XnzXnMPWsAW3eNSb9eKNegDyDJ1FAqLEVbvcQoQFDFHN5FRVZwjwSjJDoTNvJj6dBBOxs=
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
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9yIHRoZSBoYXJkd2FyZSB0aGF0IGNhbiBub3QgZW5hYmxlIEJJRiByaW5nIGZvciBJSCBjb29r
aWVzIGZvciBib3RoCnJhc19jb250cm9sbGVyX2lycSBhbmQgZXJyX2V2ZW50X2F0aHViX2lycSwg
dGhlIGRyaXZlciBoYXMgdG8gcG9sbCB0aGUKc3RhdHVzIHJlZ2lzdGVyIGluIGlycSBoYW5kbGlu
ZyBhbmQgYWNrIHRoZSBoYXJkd2FyZSBwcm9wZXJseSB3aGVuIHRoZXJlCmlzIGludGVycnVwdCB0
cmlnZ2VyZWQKClNpZ25lZC1vZmYtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1k
LmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaXJxLmMgfCAxMiArKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lycS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2lycS5jCmluZGV4IGFmNGMzYjEuLjNlNDlhYTEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pcnEuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaXJxLmMKQEAgLTE1MCw2ICsxNTAsMTggQEAgaXJx
cmV0dXJuX3QgYW1kZ3B1X2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmFyZykKIAlyZXQgPSBh
bWRncHVfaWhfcHJvY2VzcyhhZGV2LCAmYWRldi0+aXJxLmloKTsKIAlpZiAocmV0ID09IElSUV9I
QU5ETEVEKQogCQlwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KGRldi0+ZGV2KTsKKworCS8qIEZv
ciB0aGUgaGFyZHdhcmUgdGhhdCBjYW5ub3QgZW5hYmxlIGJpZiByaW5nIGZvciBib3RoIHJhc19j
b250cm9sbGVyX2lycQorICAgICAgICAgKiBhbmQgcmFzX2Vycl9ldm5ldF9hdGh1Yl9pcnEgaWgg
Y29va2llcywgdGhlIGRyaXZlciBoYXMgdG8gcG9sbCBzdGF0dXMKKwkgKiByZWdpc3RlciB0byBj
aGVjayB3aGV0aGVyIHRoZSBpbnRlcnJ1cHQgaXMgdHJpZ2dlcmVkIG9yIG5vdCwgYW5kIHByb3Bl
cmx5CisJICogYWNrIHRoZSBpbnRlcnJ1cHQgaWYgaXQgaXMgdGhlcmUKKwkgKi8KKwlpZiAoYWRl
di0+bmJpby5mdW5jcy0+aGFuZGxlX3Jhc19jb250cm9sbGVyX2ludHJfbm9fYmlmcmluZykKKwkJ
YWRldi0+bmJpby5mdW5jcy0+aGFuZGxlX3Jhc19jb250cm9sbGVyX2ludHJfbm9fYmlmcmluZyhh
ZGV2KTsKKworCWlmIChhZGV2LT5uYmlvLmZ1bmNzLT5oYW5kbGVfcmFzX2Vycl9ldmVudF9hdGh1
Yl9pbnRyX25vX2JpZnJpbmcpCisJCWFkZXYtPm5iaW8uZnVuY3MtPmhhbmRsZV9yYXNfZXJyX2V2
ZW50X2F0aHViX2ludHJfbm9fYmlmcmluZyhhZGV2KTsKKwogCXJldHVybiByZXQ7CiB9CiAKLS0g
CjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
