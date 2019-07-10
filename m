Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F7463F49
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jul 2019 04:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3502B899A3;
	Wed, 10 Jul 2019 02:28:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680054.outbound.protection.outlook.com [40.107.68.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431CE899A3
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2019 02:28:37 +0000 (UTC)
Received: from BN8PR12CA0024.namprd12.prod.outlook.com (2603:10b6:408:60::37)
 by BYAPR12MB2854.namprd12.prod.outlook.com (2603:10b6:a03:12c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18; Wed, 10 Jul
 2019 02:28:35 +0000
Received: from DM3NAM03FT026.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by BN8PR12CA0024.outlook.office365.com
 (2603:10b6:408:60::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2008.16 via Frontend
 Transport; Wed, 10 Jul 2019 02:28:34 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT026.mail.protection.outlook.com (10.152.82.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Wed, 10 Jul 2019 02:28:34 +0000
Received: from Build-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 9 Jul 2019
 21:28:33 -0500
From: Jesse Zhang <zhexi.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] SWDEV-187506: [Gibraltar][v320]VM-destroy3 (case 29) failed
 5/5
Date: Wed, 10 Jul 2019 10:28:17 +0800
Message-ID: <1562725697-1147-1-git-send-email-zhexi.zhang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(346002)(136003)(2980300002)(428003)(189003)(199004)(53416004)(81166006)(81156014)(5660300002)(305945005)(26005)(36756003)(70586007)(14444005)(8936002)(2906002)(47776003)(8676002)(426003)(70206006)(53936002)(6666004)(356004)(48376002)(86362001)(126002)(476003)(16586007)(486006)(2351001)(68736007)(7696005)(6916009)(51416003)(50466002)(336012)(50226002)(4326008)(478600001)(316002)(2616005)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2854; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c887499-a491-4a30-edc8-08d704de4e85
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BYAPR12MB2854; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2854:
X-Microsoft-Antispam-PRVS: <BYAPR12MB28542796BAC6208E5B30DF28EFF00@BYAPR12MB2854.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0094E3478A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: uiOXhOIqbM+EZKsYT2xrY1P6R3lO1usUh1fh6xtzRi07uWrXcRwCarqAW6b8j6uUvLCwfk5YK5xAEm5f6eP+FTSNZi3pA88JXsOBqtznWrHFd9Dk5iZdP0E7XZ+zdKJf8BRAgikgweO3V4T42zf+MN3P7iELbW/gHnv0a2BL3ds8Wt2i5vLiQXve0Gks3PLYjf8PNbWavagHcZe3jxj/16YEA1TzdFKnTcti3w0e9CsgibKoa4a5F8DpDOgCdgEGZGuFJEPgvH3Bld/gDzOAE1An6v9cM9B8Y/Ya1gopshzfDfWFuNbSUBVj3tpuncPKXfwZb8M4sv06+KMw0Vw2O0VJYyocqqROcxNATYBtX9cU0g9gvOJERoU1m9iTMZPweV4sN5U2OfLEprH9ZdEKFkMZnlNnngfYdqxkqYfRcVo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2019 02:28:34.1884 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c887499-a491-4a30-edc8-08d704de4e85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2854
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ASSyD+cZOy++JglXCFyaO4FMgjYd6PB+ZBZ4Q5gs+Q=;
 b=CONdaf7h13GKknldUdi3SqRmHFk84CzCrNENYQSEca/XvyU9AkS+RppnJJklGZ0D0y5u/e5tN8s/cTWeiDCjxcNnC+lKIuI1BffWajQOl0Y8DK4E/UCzTqm6fKnwY9vzSEMCJQ2b8YngFkYPXBKc1Eg+oBjwmRgLhiwk1y2Bf10=
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
Cc: Jesse Zhang <zhexi.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SXNzdWU6IE9uIGhvc3QgUDUyMCB3aXRoIFMwM0ozMjI2QSBTQklPUyBwbGF0Zm9ybSwgcGFzc3Ro
cm91Z2ggYm90aApnZnggYW5kIGF1ZGlvIGRldmljZSB0byBWTSwgdGhlIGZpcnN0IHRpbWUgc3Rh
cnQgVk0gYWZ0ZXIgaG9zdCBib290dXAsCmRyaXZlciB3b3VsZSBsb2FkIGZhaWwuCgpSb290IGNh
dXNlOiBQYXNzdGhyb3VnaCBib3RoIGRldmljZXMgYWxsb3dzIFZGSU8gdG8gZG8gaG90IHJlc2V0
Cm9uIGJyaWRnZSwgdGhpcyByZXNldCBjbGVhcnMgcmVnaXN0ZXIgQklPU19TQ1JBVENIXzcgd2hp
Y2ggaXMgdXNlZApmb3IganVkZ2luZyBpZiBWQklPUyBoYXMgYmVlbiBwb3N0LiBTaW5jZSBpbiB0
aGUgZmlyc3QgdGltZSBkcml2ZXIKZG9lcyBub3QgZG8gQkFDTyByZXNldCB3aGVuIGxvYWRpbmcs
IFZCSU9TIHdvdWxkIGJlIHBvc3QgdHdpY2UuCgpTb2x1dGlvbjogV2hlbiBydW5uaW5nIGluIHBh
c3N0aHJvdWdoIG1vZGUsIGZvcmNlIGVuYWJsZSBCQUNPIHJlc2V0CmluIGV2ZXJ5IHRpbWUgbG9h
ZGluZyBkcml2ZXIuCgpOb3RpY2U6IFRoaXMgaXMgYSB3b3JrYXJvdW5kIGZvciBTV0RFVi0xODc1
MDYgaXNzdWUsIHBhc3N0aHJvdWdoIHR3bwpkZXZpY2VzIHRvIFZNIGlzIHJlcXVpcmVkLgoKU2ln
bmVkLW9mZi1ieTogSmVzc2UgWmhhbmcgPHpoZXhpLnpoYW5nQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyB8IDcgKysrKy0tLQogMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29j
MTUuYwppbmRleCA5ZDMzYmE0Li43OTAwOTlkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9zb2MxNS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1
LmMKQEAgLTczOCwxNSArNzM4LDE2IEBAIHN0YXRpYyBib29sIHNvYzE1X25lZWRfcmVzZXRfb25f
aW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKIAl1MzIgc29sX3JlZzsKIAotCWlm
ICghYW1kZ3B1X3Bhc3N0aHJvdWdoKGFkZXYpKQotCQlyZXR1cm4gZmFsc2U7Ci0KIAlpZiAoYWRl
di0+ZmxhZ3MgJiBBTURfSVNfQVBVKQogCQlyZXR1cm4gZmFsc2U7CiAKIAkvKiBDaGVjayBzT1Mg
c2lnbiBvZiBsaWZlIHJlZ2lzdGVyIHRvIGNvbmZpcm0gc3lzIGRyaXZlciBhbmQgc09TCiAJICog
YXJlIGFscmVhZHkgYmVlbiBsb2FkZWQuCiAJICovCisKKwlpZiAoYW1kZ3B1X3Bhc3N0aHJvdWdo
KGFkZXYpKQorCQlyZXR1cm4gdHJ1ZTsKKwogCXNvbF9yZWcgPSBSUkVHMzJfU09DMTUoTVAwLCAw
LCBtbU1QMF9TTU5fQzJQTVNHXzgxKTsKIAlpZiAoc29sX3JlZykKIAkJcmV0dXJuIHRydWU7Ci0t
IAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
