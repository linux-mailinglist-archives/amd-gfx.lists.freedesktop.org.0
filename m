Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A6369DC2
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9635A89C9B;
	Mon, 15 Jul 2019 21:21:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690062.outbound.protection.outlook.com [40.107.69.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA4489C6B
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+JG+P+5gBJQFZIBk8aJ2CYEHCibYN5IEyQp7rrK13kV+3tmV2l3Gizf0a3ef78K6DoF6/BRswhNB+J5/hYwPOCtPLV0EsuHN/MMY1opyTPabgWRl9Li2ame4ACyO43bwddBJYVEkpUcdR051T5bR4fhlpdSCrUVlOSrZg03pcH9/yhiBtPamABN4tkq+vLzXGOWPAe+lRrHJiXLhOIilHRt/pi0V/DZtKvDu3BAdA5qE//rlJqul5rePml7JKpP2grsscTftY4YuZgDQq59Kc13wNEzAYOa8O7vnWIIWIonKWGwU7gMnaK9sphfZJOrSHP5Ri6F8CS6q1WHlpM2gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hE3drdwcpkiKrnrV4wSiWdx43wdzJQoFWyuVb3noa8=;
 b=Lld+JCQJNQ/A6LYBQpZJ8l/Ms6CDfcaiAmZMXu0BHS8XPMOst1o113ICoeWL3vqQ1P8S9DoXrFTAa1Y+yLWHYSwuqUvzyUDaz6jnvfWgOO3B80FLG9q/Q7pmOYd2SXtjHm2Fg7occPohzyMELt+FZJqqfyJRpe9/Gdv+qdJ31FTnbmu79XtGfZKCzw6hkLk68knPI5PA4NDW/Z0UQ2HmGSJZRZ6n/kxK9uDJrXFZHml4vrS7rtywA57c7yeGMrObldKV5y3351F6UPTROQLQsZ3xfMIH293djYSvceOEEF7tHi61IP8NNqHgXB+MriKBHsJYwjhZ/6KTNlWJIopjyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MN2PR12CA0006.namprd12.prod.outlook.com (2603:10b6:208:a8::19)
 by CH2PR12MB3926.namprd12.prod.outlook.com (2603:10b6:610:2d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:21:39 +0000
Received: from CO1NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by MN2PR12CA0006.outlook.office365.com
 (2603:10b6:208:a8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.20 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:39 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT049.mail.protection.outlook.com (10.152.81.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:38 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:24 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 40/87] drm/amd/display: Do not fill Null packet in the blank
 period
Date: Mon, 15 Jul 2019 17:20:02 -0400
Message-ID: <20190715212049.4584-41-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(2980300002)(428003)(199004)(189003)(6916009)(14444005)(86362001)(478600001)(2906002)(36756003)(2876002)(4326008)(53936002)(1076003)(126002)(2870700001)(476003)(6666004)(356004)(5660300002)(76176011)(49486002)(50466002)(8676002)(51416003)(336012)(446003)(26005)(426003)(11346002)(186003)(2616005)(305945005)(316002)(8936002)(50226002)(68736007)(54906003)(47776003)(81156014)(81166006)(70586007)(70206006)(486006)(48376002)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3926; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13a71bb5-ddb3-442c-5463-08d7096a6c91
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CH2PR12MB3926; 
X-MS-TrafficTypeDiagnostic: CH2PR12MB3926:
X-Microsoft-Antispam-PRVS: <CH2PR12MB39265374E3F4AE6A5DC2F19382CF0@CH2PR12MB3926.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: BFY5Ns6TQ+2qsUG1nC1pbTLJk+wEAz+Ghjk7fSwi7BPH/nqcRr30J1a81e1aMvCsUp5c5HmY+jHe04u/72Ll8twVKCrSH7Np8gcpNWqb1M3dpTA6rI6VM3YppgvtBoCErPnz6XMgTHxIWFCti9oTanJaKHuHsKzZEL7Q8Hqh/kL5lC2kN9BhTdME0hGA5pdt0JNZLOkve1PSQhxWtkgy1s9sAAl+6Z7mFwSLqNirJSvwoiilBU+Sdp29wpPH9oNXjrBt7ZAyDmxc2LiMVsfwFTbOf39hvj5sQoSuK4QufNMaasCL9E87ZqHw7BgoD98gfUGB40IJYBJMCyIrbmfLEIEdneNOWuCPY1KUYQYZ3fJYN+ayxfj79m/sivQpIUmIGgRl0vkCoqEfZLNf9DrGPa5aGbxJ3Sxdie9Sp+OTHdI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:38.6849 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a71bb5-ddb3-442c-5463-08d7096a6c91
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3926
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hE3drdwcpkiKrnrV4wSiWdx43wdzJQoFWyuVb3noa8=;
 b=oGGVztSPnlHBfTczuS+SWRnIwSlusoPZg+A3Q+PlmTHTIdLwEDoTTQL6MqptuyoH07nRXpX4REaXYmkQXyQLqb7JqvjcnrprgAagVCVSySr99roWl3+Kdgd3XPCQAh8z/SxCN/npYF86Ef58RPtiJZs3+OJpIYkT7HqXHP1K2VU=
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
Cc: Leo Li <sunpeng.li@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hhcmxlbmUgTGl1IDxjaGFybGVuZS5saXVAYW1kLmNvbT4KCltEZXNjcmlwdGlvbl0K
RG8gbm90IGZpbGwgTnVsbCBwYWNrZXQgaW4gdGhlIGJsYW5rIHBlcmlvZCBmb3IgbmV3IHBhY2tl
dCBnZW4KVGhpcyBpcyBiYXNlZCBvbiBIVyBJUCB0ZWFtIHJlY29tbWVuZGVkIGRlZmF1bHQgc2V0
dGluZyBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBDaGFybGVuZSBMaXUgPGNoYXJsZW5lLmxpdUBh
bWQuY29tPgpSZXZpZXdlZC1ieTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hr
aW5AYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9zdHJlYW1fZW5jb2Rlci5j
IHwgMyArKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9zdHJl
YW1fZW5jb2Rlci5oIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMTAvZGNuMTBfc3RyZWFtX2VuY29kZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24xMC9kY24xMF9zdHJlYW1fZW5jb2Rlci5jCmluZGV4IDY0YWRiOWZiMzAwYy4uYTA5
ODI4N2Q3MWFlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MTAvZGNuMTBfc3RyZWFtX2VuY29kZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMTAvZGNuMTBfc3RyZWFtX2VuY29kZXIuYwpAQCAtNTExLDExICs1MTEsMTIgQEAg
dm9pZCBlbmMxX3N0cmVhbV9lbmNvZGVyX2hkbWlfc2V0X3N0cmVhbV9hdHRyaWJ1dGUoCiAJZW5j
MV9zdHJlYW1fZW5jb2Rlcl9zZXRfc3RyZWFtX2F0dHJpYnV0ZV9oZWxwZXIoZW5jMSwgY3J0Y190
aW1pbmcpOwogCiAJLyogc2V0dXAgSERNSSBlbmdpbmUgKi8KLQlSRUdfVVBEQVRFXzUoSERNSV9D
T05UUk9MLAorCVJFR19VUERBVEVfNihIRE1JX0NPTlRST0wsCiAJCUhETUlfUEFDS0VUX0dFTl9W
RVJTSU9OLCAxLAogCQlIRE1JX0tFRVBPVVRfTU9ERSwgMSwKIAkJSERNSV9ERUVQX0NPTE9SX0VO
QUJMRSwgMCwKIAkJSERNSV9EQVRBX1NDUkFNQkxFX0VOLCAwLAorCQlIRE1JX05PX0VYVFJBX05V
TExfUEFDS0VUX0ZJTExFRCwgMSwKIAkJSERNSV9DTE9DS19DSEFOTkVMX1JBVEUsIDApOwogCiAK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9z
dHJlYW1fZW5jb2Rlci5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2Rj
bjEwX3N0cmVhbV9lbmNvZGVyLmgKaW5kZXggMDc1ZTQ5YzEyODNhLi5hYjBlYWQzYzNmNDYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9zdHJl
YW1fZW5jb2Rlci5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9k
Y24xMF9zdHJlYW1fZW5jb2Rlci5oCkBAIC0xODksNiArMTg5LDcgQEAgc3RydWN0IGRjbjEwX3N0
cmVhbV9lbmNfcmVnaXN0ZXJzIHsKIAlTRV9TRihESUcwX0hETUlfQ09OVFJPTCwgSERNSV9ERUVQ
X0NPTE9SX0VOQUJMRSwgbWFza19zaCksXAogCVNFX1NGKERJRzBfSERNSV9DT05UUk9MLCBIRE1J
X0RFRVBfQ09MT1JfREVQVEgsIG1hc2tfc2gpLFwKIAlTRV9TRihESUcwX0hETUlfQ09OVFJPTCwg
SERNSV9EQVRBX1NDUkFNQkxFX0VOLCBtYXNrX3NoKSxcCisJU0VfU0YoRElHMF9IRE1JX0NPTlRS
T0wsIEhETUlfTk9fRVhUUkFfTlVMTF9QQUNLRVRfRklMTEVELCBtYXNrX3NoKSxcCiAJU0VfU0Yo
RElHMF9IRE1JX1ZCSV9QQUNLRVRfQ09OVFJPTCwgSERNSV9HQ19DT05ULCBtYXNrX3NoKSxcCiAJ
U0VfU0YoRElHMF9IRE1JX1ZCSV9QQUNLRVRfQ09OVFJPTCwgSERNSV9HQ19TRU5ELCBtYXNrX3No
KSxcCiAJU0VfU0YoRElHMF9IRE1JX1ZCSV9QQUNLRVRfQ09OVFJPTCwgSERNSV9OVUxMX1NFTkQs
IG1hc2tfc2gpLFwKQEAgLTM3NCw2ICszNzUsNyBAQCBzdHJ1Y3QgZGNuMTBfc3RyZWFtX2VuY19y
ZWdpc3RlcnMgewogCXR5cGUgSERNSV9HQ19TRU5EO1wKIAl0eXBlIEhETUlfTlVMTF9TRU5EO1wK
IAl0eXBlIEhETUlfREFUQV9TQ1JBTUJMRV9FTjtcCisJdHlwZSBIRE1JX05PX0VYVFJBX05VTExf
UEFDS0VUX0ZJTExFRDtcCiAJdHlwZSBIRE1JX0FVRElPX0lORk9fU0VORDtcCiAJdHlwZSBBRk1U
X0FVRElPX0lORk9fVVBEQVRFO1wKIAl0eXBlIEhETUlfQVVESU9fSU5GT19MSU5FO1wKLS0gCjIu
MjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
