Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DED2BAEE
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 21:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C82889B03;
	Mon, 27 May 2019 19:52:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710080.outbound.protection.outlook.com [40.107.71.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B6589B03
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 19:52:23 +0000 (UTC)
Received: from DM5PR12CA0003.namprd12.prod.outlook.com (2603:10b6:4:1::13) by
 MWHPR1201MB0064.namprd12.prod.outlook.com (2603:10b6:301:54::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.16; Mon, 27 May
 2019 19:52:21 +0000
Received: from CO1NAM03FT022.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM5PR12CA0003.outlook.office365.com
 (2603:10b6:4:1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.16 via Frontend
 Transport; Mon, 27 May 2019 19:52:20 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT022.mail.protection.outlook.com (10.152.80.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Mon, 27 May 2019 19:52:20 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 27 May 2019
 14:52:02 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 23/26] drm/amd/display: Increase Backlight Gain Step Size
Date: Mon, 27 May 2019 15:51:02 -0400
Message-ID: <1558986665-12964-24-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
References: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(346002)(396003)(376002)(2980300002)(428003)(199004)(189003)(36756003)(76176011)(7696005)(51416003)(4326008)(5660300002)(305945005)(86362001)(8936002)(16586007)(77096007)(26005)(316002)(81166006)(81156014)(70206006)(2351001)(70586007)(8676002)(186003)(2906002)(50466002)(426003)(446003)(14444005)(11346002)(2616005)(68736007)(47776003)(6916009)(336012)(72206003)(86152003)(356004)(126002)(50226002)(2876002)(53936002)(53416004)(478600001)(486006)(476003)(48376002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB0064; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bdd26f4-b651-477c-ae5a-08d6e2dcd493
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR1201MB0064; 
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0064:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0064761B3615DE1F4C5F4A70821D0@MWHPR1201MB0064.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-Forefront-PRVS: 0050CEFE70
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: t0Zw2NmNSYIoKtOTIfmXQd9P38Eiq8/3LKtZAczOM8A7vBbYEsMzrUzl7faHa/MsYqr3SMdS4rLwa5UZx6Dmzz60WeJnsyOblIz3st5Razpzdj1NdJtEMUCzQ5Jz3Z3zMECIw5d02VQVN6sdFKpFBY1VhH3fSCo+rdFJ/2jDTfSFbXh5+WaX5XBWna2eAFDaw4eqVkbU//swCkffKwtMcEDdH68I3j6s4wwNMAaBPTQV0tFIyNgp4UZkF8UR/6lvw6PYLMw/1ePcKOYdDVQnn/F4U4HxMpFA413MEnqhLeM0tM66dkh8ClKRpsTRpIJ1NW2M1OphJZic+Zv0sFz38k2pkzI67Bh5CajfM6pwxucc8U4HQ+ecljEgCrZNbtF77nzE0lxazOFXI9wgj9OX94NtrPu7gPj/31AhoJGyRZk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2019 19:52:20.4743 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bdd26f4-b651-477c-ae5a-08d6e2dcd493
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0064
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6LvX25hCV/V6/mEf+bnTrFk6F7RAmJebL6u55Jkg+k=;
 b=Tediz0fh7xf7NbyxP7duMM0MWjV0eYr4aspiULQvguV/ix54Pzcizv7Y/omByWr0hgQZc+rwbatj8veV5dQzxppm+qmO01d+CGbQ6Gh8wzb8vtJLydMwzdpfZY7Dz/5afG4wySHlkTyxsIlfds2ONXrurrj5rsDZNp1JAia9ItI=
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
Cc: Eryk Brol <eryk.brol@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXJ5ayBCcm9sIDxlcnlrLmJyb2xAYW1kLmNvbT4KCltXaHldClNvbWUgYmFja2xpZ2h0
IHRlc3RzIGZhaWwgZHVlIHRvIGJhY2tsaWdodCBzZXR0bGluZwp0YWtpbmcgdG9vIGxvbmcuIFRo
aXMgaGFwcGVucyBiZWNhdXNlIHRoZSBzdGVwCnNpemUgdXNlZCB0byBjaGFuZ2UgYmFja2xpZ2h0
IGxldmVscyBpcyB0b28gc21hbGwuCgpbSG93XQoxLiBDaGFuZ2UgdGhlIHNpemUgb2YgdGhlIGJh
Y2tsaWdodCBnYWluIHN0ZXAgc2l6ZQoyLiBDaGFuZ2UgaG93IERNQ1UgZmlybXdhcmUgZ2V0cyB0
aGUgc3RlcCBzaXplIHZhbHVlCiAgIHNvIHRoYXQgaXQgaXMgcGFzc2VkIGluIGJ5IGRyaXZlciBk
dXJpbmcgRE1DVSBpbml0bgoKU2lnbmVkLW9mZi1ieTogRXJ5ayBCcm9sIDxlcnlrLmJyb2xAYW1k
LmNvbT4KUmV2aWV3ZWQtYnk6IEp1biBMZWkgPEp1bi5MZWlAYW1kLmNvbT4KQWNrZWQtYnk6IExl
byBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY2UvZGNlX2RtY3UuYyB8IDMgKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNlL2RjZV9kbWN1LmggfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2Rt
Y3UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2RtY3UuYwppbmRl
eCA2NTA0MjI3Li5jMmJjMzZmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNlL2RjZV9kbWN1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjZS9kY2VfZG1jdS5jCkBAIC0zODgsNiArMzg4LDkgQEAgc3RhdGljIGJvb2wgZGNuMTBfZG1j
dV9pbml0KHN0cnVjdCBkbWN1ICpkbWN1KQogCQkvKiBTZXQgaW5pdGlhbGl6ZWQgcmFtcGluZyBi
b3VuZGFyeSB2YWx1ZSAqLwogCQlSRUdfV1JJVEUoTUFTVEVSX0NPTU1fREFUQV9SRUcxLCAweEZG
RkYpOwogCisJCS8qIFNldCBiYWNrbGlnaHQgcmFtcGluZyBzdGVwc2l6ZSAqLworCQlSRUdfV1JJ
VEUoTUFTVEVSX0NPTU1fREFUQV9SRUcyLCBhYm1fZ2Fpbl9zdGVwc2l6ZSk7CisKIAkJLyogU2V0
IGNvbW1hbmQgdG8gaW5pdGlhbGl6ZSBtaWNyb2NvbnRyb2xsZXIgKi8KIAkJUkVHX1VQREFURShN
QVNURVJfQ09NTV9DTURfUkVHLCBNQVNURVJfQ09NTV9DTURfUkVHX0JZVEUwLAogCQkJTUNQX0lO
SVRfRE1DVSk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNl
L2RjZV9kbWN1LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9kbWN1
LmgKaW5kZXggNjBjZTU2Zi4uNWJkMGRmNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjZS9kY2VfZG1jdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY2UvZGNlX2RtY3UuaApAQCAtMjYzLDQgKzI2Myw2IEBAIHN0cnVjdCBkbWN1ICpk
Y24xMF9kbWN1X2NyZWF0ZSgKIAogdm9pZCBkY2VfZG1jdV9kZXN0cm95KHN0cnVjdCBkbWN1ICoq
ZG1jdSk7CiAKK3N0YXRpYyBjb25zdCB1aW50MzJfdCBhYm1fZ2Fpbl9zdGVwc2l6ZSA9IDB4MDA2
MDsKKwogI2VuZGlmIC8qIF9EQ0VfQUJNX0hfICovCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
