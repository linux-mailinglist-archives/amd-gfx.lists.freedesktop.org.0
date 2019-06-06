Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6B5374CA
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 15:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053298926C;
	Thu,  6 Jun 2019 13:03:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690080.outbound.protection.outlook.com [40.107.69.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4510E8926C
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 13:03:04 +0000 (UTC)
Received: from CY4PR1201CA0017.namprd12.prod.outlook.com
 (2603:10b6:910:16::27) by BN6PR1201MB0051.namprd12.prod.outlook.com
 (2603:10b6:405:54::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.12; Thu, 6 Jun
 2019 13:03:02 +0000
Received: from DM3NAM03FT013.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by CY4PR1201CA0017.outlook.office365.com
 (2603:10b6:910:16::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.14 via Frontend
 Transport; Thu, 6 Jun 2019 13:03:02 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT013.mail.protection.outlook.com (10.152.82.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Thu, 6 Jun 2019 13:03:01 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 6 Jun 2019
 08:03:01 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amd/amdgpu: Add module parameter for specifying
 default ABM level
Date: Thu, 6 Jun 2019 09:02:12 -0400
Message-ID: <20190606130213.29249-1-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(136003)(396003)(39850400004)(346002)(2980300002)(428003)(199004)(189003)(336012)(6916009)(14444005)(5660300002)(426003)(50466002)(356004)(16586007)(47776003)(70586007)(48376002)(6666004)(72206003)(2616005)(476003)(44832011)(53416004)(186003)(486006)(81166006)(86362001)(51416003)(36756003)(1076003)(126002)(2906002)(478600001)(68736007)(316002)(4326008)(70206006)(8936002)(26005)(50226002)(7696005)(53936002)(2351001)(77096007)(81156014)(305945005)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0051; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d532fd32-9d0b-4e74-297c-08d6ea7f4eb3
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR1201MB0051; 
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0051:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB00518BD6C0027803AAB1488FEC170@BN6PR1201MB0051.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 00603B7EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 8YsSv0VzN9Jo9yExCb+qs0eAO/BMNqgeBE8kZRYQWcvfOsfACerfqcEd2jKvOc8T4V+Q/krH23sDQ5YZpv3W5UB6yZ7jI/rcOsee3ct7Fj7rI78PFKw4nYvGsJtPs+V0xLCzDRh9XPbUinChV6lnj2a5JKbSCFx1E6AQLqrOFryeGZ2ESHsQ9+QyRL2Gq2//gosf2Xs6hWQhErpr35XWOdK/oJmImdHyIwu1PbZ967RmEiXUFYdesgJ9sPQt7Oc/ipDgyNSgc0ccLfclJQnGtBw7lVKX++mUvJ2fGXX5+tUAvJYRizz86I/UwaWRjNq9jN5Sacfv1qwUZ676lHq3ZUt8QXcWWSIUG0a70RIisN6E3QJuTl4kPWuNdgnnjwOCGnt8rypAqaj1ZfwltXOdNbz0z2uxXVevQ1rcArSKcZA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2019 13:03:01.9482 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d532fd32-9d0b-4e74-297c-08d6ea7f4eb3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0051
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3MRS3vpgNtllv1bBQNJLMG9vmWFpcMfo3O2tCzGmEE=;
 b=GItD741HW8u4/+/oUi13yBrjhdyAVAWxFiSFDtBjnfTSPaR09GQ9EC1RUkApAR+XDM7x+3M39kJ4gG8qX/YqrhtDj8HLKcmpMeWX0yWoUV9DZ6N8Jbj08UmdnwJz/FkNvrI59aFjrI+MvYTU5O5xgUqPpSFIhWWre7pSeQLYGr0=
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
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KSXQncyBub24gdHJpdmlhbCB0byBjb25maWd1cmUgb3Igc3BlY2lmeSBhbiBBQk0gcmVk
dWN0aW9uIGxldmVsIGZvcgp1c2Vyc3BhY2Ugb3V0c2lkZSBvZiBYLiBUaGVyZSBpcyBhbHNvIG5v
IG1ldGhvZCB0byBzcGVjaWZ5IHRoZSBkZWZhdWx0CkFCTSB2YWx1ZSBhdCBib290IHRpbWUuCgpB
IHBhcmFtZXRlciBzaG91bGQgYmUgYWRkZWQgdG8gY29uZmlndXJlIHRoaXMuCgpbSG93XQpFeHBv
c2UgYSBtb2R1bGUgcGFyYW1ldGVyIHRoYXQgY2FuIHNwZWNpZnkgdGhlIGRlZmF1bHQgQUJNIGxl
dmVsIHRvCnVzZSBmb3IgZURQIGNvbm5lY3RvcnMgb24gREMgZW5hYmxlZCBoYXJkd2FyZSB0aGF0
IGxvYWRzIHRoZSBETUNVCmZpcm13YXJlLgoKVGhlIGRlZmF1bHQgaXMgc3RpbGwgZGlzYWJsZWQg
KDApLCBidXQgbGV2ZWxzIGNhbiByYW5nZSBmcm9tIDEtNC4gTGV2ZWxzCmNvbnRyb2wgaG93IG11
Y2ggdGhlIGJhY2tsaWdodCBjYW4gYmUgcmVkdWNlZCwgd2l0aCBiZWluZyB0aGUgbGVhc3QKYW1v
dW50IG9mIHJlZHVjdGlvbiBhbmQgZm91ciBiZWluZyB0aGUgbW9zdCByZWR1Y3Rpb24uCgpTaWdu
ZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggICAgIHwgIDEgKwog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgMTYgKysrKysrKysrKysr
KysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHUuaAppbmRleCAxOWEwMDI4MmUzNGMuLjRiZWIyNjczOGUxZSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKQEAgLTE1NSw2ICsxNTUsNyBAQCBleHRlcm4gaW50IGFt
ZGdwdV9ncHVfcmVjb3Zlcnk7CiBleHRlcm4gaW50IGFtZGdwdV9lbXVfbW9kZTsKIGV4dGVybiB1
aW50IGFtZGdwdV9zbXVfbWVtb3J5X3Bvb2xfc2l6ZTsKIGV4dGVybiB1aW50IGFtZGdwdV9kY19m
ZWF0dXJlX21hc2s7CitleHRlcm4gdWludCBhbWRncHVfZG1fYWJtX2xldmVsOwogZXh0ZXJuIHN0
cnVjdCBhbWRncHVfbWdwdV9pbmZvIG1ncHVfaW5mbzsKIGV4dGVybiBpbnQgYW1kZ3B1X3Jhc19l
bmFibGU7CiBleHRlcm4gdWludCBhbWRncHVfcmFzX21hc2s7CmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZHJ2LmMKaW5kZXggMWYzOGQ2ZmMxZmUzLi5kZGU1M2Y4ZTIzMGIgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKQEAgLTY4Niw2ICs2ODYsMjIgQEAg
TU9EVUxFX1BBUk1fREVTQyhod3NfZ3dzX3N1cHBvcnQsICJNRUMgRlcgc3VwcG9ydCBnd3MgYmFy
cmllcnMgKGZhbHNlID0gbm90IHN1cHAKIE1PRFVMRV9QQVJNX0RFU0MoZGNmZWF0dXJlbWFzaywg
ImFsbCBzdGFibGUgREMgZmVhdHVyZXMgZW5hYmxlZCAoZGVmYXVsdCkpIik7CiBtb2R1bGVfcGFy
YW1fbmFtZWQoZGNmZWF0dXJlbWFzaywgYW1kZ3B1X2RjX2ZlYXR1cmVfbWFzaywgdWludCwgMDQ0
NCk7CiAKKy8qKgorICogRE9DOiBhYm1sZXZlbCAodWludCkKKyAqIE92ZXJyaWRlIHRoZSBkZWZh
dWx0IEFCTSAoQWRhcHRpdmUgQmFja2xpZ2h0IE1hbmFnZW1lbnQpIGxldmVsIHVzZWQgZm9yIERD
CisgKiBlbmFibGVkIGhhcmR3YXJlLiBSZXF1aXJlcyBETUNVIHRvIGJlIHN1cHBvcnRlZCBhbmQg
bG9hZGVkLgorICogVmFsaWQgbGV2ZWxzIGFyZSAwLTQuIEEgdmFsdWUgb2YgMCBpbmRpY2F0ZXMg
dGhhdCBBQk0gc2hvdWxkIGJlIGRpc2FibGVkIGJ5CisgKiBkZWZhdWx0LiBWYWx1ZXMgMS00IGNv
bnRyb2wgdGhlIG1heGltdW0gYWxsb3dhYmxlIGJyaWdodG5lc3MgcmVkdWN0aW9uIHZpYQorICog
dGhlIEFCTSBhbGdvcml0aG0sIHdpdGggMSBiZWluZyB0aGUgbGVhc3QgcmVkdWN0aW9uIGFuZCA0
IGJlaW5nIHRoZSBtb3N0CisgKiByZWR1Y3Rpb24uCisgKgorICogRGVmYXVsdHMgdG8gMCwgb3Ig
ZGlzYWJsZWQuIFVzZXJzcGFjZSBjYW4gc3RpbGwgb3ZlcnJpZGUgdGhpcyBsZXZlbCBsYXRlcgor
ICogYWZ0ZXIgYm9vdC4KKyAqLwordWludCBhbWRncHVfZG1fYWJtX2xldmVsID0gMDsKK01PRFVM
RV9QQVJNX0RFU0MoYWJtbGV2ZWwsICJBQk0gbGV2ZWwgKDAgPSBvZmYgKGRlZmF1bHQpLCAxLTQg
PSBiYWNrbGlnaHQgcmVkdWN0aW9uIGxldmVsKSAiKTsKK21vZHVsZV9wYXJhbV9uYW1lZChhYm1s
ZXZlbCwgYW1kZ3B1X2RtX2FibV9sZXZlbCwgdWludCwgMDQ0NCk7CisKIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgcGNpX2RldmljZV9pZCBwY2lpZGxpc3RbXSA9IHsKICNpZmRlZiAgQ09ORklHX0RSTV9B
TURHUFVfU0kKIAl7MHgxMDAyLCAweDY3ODAsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAs
IENISVBfVEFISVRJfSwKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
