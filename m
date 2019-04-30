Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 150A61018D
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE49892B9;
	Tue, 30 Apr 2019 21:10:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700082.outbound.protection.outlook.com [40.107.70.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236A989264
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:10:16 +0000 (UTC)
Received: from DM3PR12CA0107.namprd12.prod.outlook.com (2603:10b6:0:55::27) by
 BL0PR12MB2372.namprd12.prod.outlook.com (2603:10b6:207:4d::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Tue, 30 Apr 2019 21:10:14 +0000
Received: from BY2NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by DM3PR12CA0107.outlook.office365.com
 (2603:10b6:0:55::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 30 Apr 2019 21:10:14 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT009.mail.protection.outlook.com (10.152.84.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:10:13 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:56 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 18/20] drm/amd/display: Relax requirements for CRTCs to be
 enabled
Date: Tue, 30 Apr 2019 17:09:34 -0400
Message-ID: <20190430210938.32335-37-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(136003)(39860400002)(396003)(346002)(2980300002)(428003)(189003)(199004)(336012)(426003)(476003)(50226002)(126002)(2616005)(11346002)(81156014)(47776003)(446003)(8676002)(8936002)(53416004)(81166006)(14444005)(486006)(70206006)(86362001)(4326008)(186003)(5660300002)(70586007)(356004)(48376002)(7696005)(305945005)(50466002)(2906002)(53936002)(6666004)(1076003)(26005)(316002)(478600001)(6916009)(36756003)(16586007)(77096007)(2351001)(68736007)(72206003)(76176011)(51416003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2372; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64e1d4a6-e489-4e15-f916-08d6cdb03cf0
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BL0PR12MB2372; 
X-MS-TrafficTypeDiagnostic: BL0PR12MB2372:
X-Microsoft-Antispam-PRVS: <BL0PR12MB237298D391AED4B436875587F93A0@BL0PR12MB2372.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: CAqq0elxhg5glFjsDxnXUaq7fN+zFle5DWd8u0bMRS+unmJp1vgJQ4IErwBYionLAe7n0PJ2f/TWZx7i9n/P4MXYhu0qmvGNIX26fGOLDmAjzjLpSMA8JOKs7VYwYwU/7qgzTDV8FFkPAlmLGuAlQWrOMe6+atuZX+Yj5eQCPjsNipg3gA7FMraFbwYHRxUuKkIXSz/pDVSwk58zkSh+3kpUnsUU0K2G+VbPN3UKK0DR+Ak9dMP3LKnI880WX7UnEtLR++dBS9qttvO+qoMopgWDD14UqA3oypvmxH9MyUrCL/2gA8mHpdzBo3XWSVE5i6mU4GW5aMuoYoWNlMPxKpRZRBut8/TVT4W0d2fqp9W1gKx4FB0iwNDmp4CQii51jYYGGAXRY5mvS6EEQLXySz66dZczyY1IzdHjRyaMVsM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:10:13.8106 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e1d4a6-e489-4e15-f916-08d6cdb03cf0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2372
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5Yc0uc3YKvAg287nPJW7iyqrRCDCsFAEkd3rv68HAw=;
 b=JqYEh+7/jfPX5BqPX6fKiKSBaIAKH+MgZEEvWBa2y2snVv5PX0RRamWDHwJBpr8xQIHazD3WDa2lxoo2DRk4b+/zYPvWRR8J9WObAglUG15fhmRStSi427b36LMl2RISG58h/kUz3xbARi9UVyt+CcmBbsuzZ2m7/eVKVCIvSmM=
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

RnJvbTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoK
W1doeV0KQXMgbG9uZyBhcyB3ZSBoYXZlIGF0IGxlYXN0IG9uZSBub24tY3Vyc29yIHBsYW5lIGVu
YWJsZWQgb24gYSBDUlRDIHRoZW4KdGhlIENSVEMgaXRzZWxmIGNhbiByZW1haW4gZW5hYmxlZC4K
ClRoaXMgd2lsbCBhbGxvdyBmb3IgY29tbWl0cyB3aGVyZSB0aGVyZSdzIGFuIG92ZXJsYXkgcGxh
bmUgZW5hYmxlZCBidXQKbm8gcHJpbWFyeSBwbGFuZSBlbmFibGVkLgoKW0hvd10KUmVtb3ZlIGV4
aXN0aW5nIHByaW1hcnkgcGxhbmUgZmIgIT0gTlVMTCBjaGVja3MgYW5kIHJlcGxhY2UgdGhlbSB3
aXRoCnRoZSBuZXcgZG9lc19jcnRjX2hhdmVfYWN0aXZlX3BsYW5lIGhlbHBlci4KClRoaXMgd2ls
bCBiZSBjYWxsZWQgZnJvbSBhdG9taWMgY2hlY2sgd2hlbiB2YWxpZGF0aW5nIHRoZSBDUlRDLgoK
U2luY2UgdGhlIHByaW1hcnkgcGxhbmUgc3RhdGUgY2FuIG5vdyBwb3RlbnRpYWxseSBiZSBOVUxM
IHdlJ2xsIG5lZWQKdG8gZ3VhcmQgZm9yIHRoYXQgd2hlbiBhY2Nlc3NpbmcgaXQgaW4gc29tZSBv
ZiB0aGUgY3Vyc29yIGxvZ2ljLgoKQ2hhbmdlLUlkOiBJMjVmMzJmZjEzZDFlODFlMjBlZWEyMzNm
ZmRkZGFkZjcwNGVjZDhkMgpTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNo
b2xhcy5rYXpsYXVza2FzQGFtZC5jb20+ClJldmlld2VkLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZp
ZC5GcmFuY2lzQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJl
ZXQgTGFraGFAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMgfCA1NiArKysrKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNDQg
aW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5kZXggM2ZmODdiYzMxYThkLi42YWVm
NGEzNTc0ZGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG0uYwpAQCAtMzk0OCw2ICszOTQ4LDM4IEBAIHN0YXRpYyB2b2lkIGRtX2NydGNf
aGVscGVyX2Rpc2FibGUoc3RydWN0IGRybV9jcnRjICpjcnRjKQogewogfQogCitzdGF0aWMgYm9v
bCBkb2VzX2NydGNfaGF2ZV9hY3RpdmVfcGxhbmUoc3RydWN0IGRybV9jcnRjX3N0YXRlICpuZXdf
Y3J0Y19zdGF0ZSkKK3sKKwlzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUgPSBuZXdfY3J0
Y19zdGF0ZS0+c3RhdGU7CisJc3RydWN0IGRybV9wbGFuZSAqcGxhbmU7CisJaW50IG51bV9hY3Rp
dmUgPSAwOworCisJZHJtX2Zvcl9lYWNoX3BsYW5lX21hc2socGxhbmUsIHN0YXRlLT5kZXYsIG5l
d19jcnRjX3N0YXRlLT5wbGFuZV9tYXNrKSB7CisJCXN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm5l
d19wbGFuZV9zdGF0ZTsKKworCQkvKiBDdXJzb3IgcGxhbmVzIGFyZSAiZmFrZSIuICovCisJCWlm
IChwbGFuZS0+dHlwZSA9PSBEUk1fUExBTkVfVFlQRV9DVVJTT1IpCisJCQljb250aW51ZTsKKwor
CQluZXdfcGxhbmVfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9uZXdfcGxhbmVfc3RhdGUoc3RhdGUs
IHBsYW5lKTsKKworCQlpZiAoIW5ld19wbGFuZV9zdGF0ZSkgeworCQkJLyoKKwkJCSAqIFRoZSBw
bGFuZSBpcyBlbmFibGUgb24gdGhlIENSVEMgYW5kIGhhc24ndCBjaGFuZ2VkCisJCQkgKiBzdGF0
ZS4gVGhpcyBtZWFucyB0aGF0IGl0IHByZXZpb3VzbHkgcGFzc2VkCisJCQkgKiB2YWxpZGF0aW9u
IGFuZCBpcyB0aGVyZWZvcmUgZW5hYmxlZC4KKwkJCSAqLworCQkJbnVtX2FjdGl2ZSArPSAxOwor
CQkJY29udGludWU7CisJCX0KKworCQkvKiBXZSBuZWVkIGEgZnJhbWVidWZmZXIgdG8gYmUgY29u
c2lkZXJlZCBlbmFibGVkLiAqLworCQludW1fYWN0aXZlICs9IChuZXdfcGxhbmVfc3RhdGUtPmZi
ICE9IE5VTEwpOworCX0KKworCXJldHVybiBudW1fYWN0aXZlID4gMDsKK30KKwogc3RhdGljIGlu
dCBkbV9jcnRjX2hlbHBlcl9hdG9taWNfY2hlY2soc3RydWN0IGRybV9jcnRjICpjcnRjLAogCQkJ
CSAgICAgICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKnN0YXRlKQogewpAQCAtMzk2Niw2ICszOTk4
LDExIEBAIHN0YXRpYyBpbnQgZG1fY3J0Y19oZWxwZXJfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1f
Y3J0YyAqY3J0YywKIAlpZiAoIWRtX2NydGNfc3RhdGUtPnN0cmVhbSkKIAkJcmV0dXJuIDA7CiAK
KwkvKiBXZSB3YW50IGF0IGxlYXN0IG9uZSBoYXJkd2FyZSBwbGFuZSBlbmFibGVkIHRvIHVzZSB0
aGUgc3RyZWFtLiAqLworCWlmIChzdGF0ZS0+ZW5hYmxlICYmIHN0YXRlLT5hY3RpdmUgJiYKKwkg
ICAgIWRvZXNfY3J0Y19oYXZlX2FjdGl2ZV9wbGFuZShzdGF0ZSkpCisJCXJldHVybiAtRUlOVkFM
OworCiAJaWYgKGRjX3ZhbGlkYXRlX3N0cmVhbShkYywgZG1fY3J0Y19zdGF0ZS0+c3RyZWFtKSA9
PSBEQ19PSykKIAkJcmV0dXJuIDA7CiAKQEAgLTQ5MzksOSArNDk3NiwxMyBAQCBzdGF0aWMgaW50
IGdldF9jdXJzb3JfcG9zaXRpb24oc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsIHN0cnVjdCBkcm1f
Y3J0YyAqY3J0YywKIAogCXggPSBwbGFuZS0+c3RhdGUtPmNydGNfeDsKIAl5ID0gcGxhbmUtPnN0
YXRlLT5jcnRjX3k7Ci0JLyogYXZpdm8gY3Vyc29yIGFyZSBvZmZzZXQgaW50byB0aGUgdG90YWwg
c3VyZmFjZSAqLwotCXggKz0gY3J0Yy0+cHJpbWFyeS0+c3RhdGUtPnNyY194ID4+IDE2OwotCXkg
Kz0gY3J0Yy0+cHJpbWFyeS0+c3RhdGUtPnNyY195ID4+IDE2OworCisJaWYgKGNydGMtPnByaW1h
cnktPnN0YXRlKSB7CisJCS8qIGF2aXZvIGN1cnNvciBhcmUgb2Zmc2V0IGludG8gdGhlIHRvdGFs
IHN1cmZhY2UgKi8KKwkJeCArPSBjcnRjLT5wcmltYXJ5LT5zdGF0ZS0+c3JjX3ggPj4gMTY7CisJ
CXkgKz0gY3J0Yy0+cHJpbWFyeS0+c3RhdGUtPnNyY195ID4+IDE2OworCX0KKwogCWlmICh4IDwg
MCkgewogCQl4b3JpZ2luID0gbWluKC14LCBhbWRncHVfY3J0Yy0+bWF4X2N1cnNvcl93aWR0aCAt
IDEpOwogCQl4ID0gMDsKQEAgLTU5NjUsMjEgKzYwMDYsMTIgQEAgc3RhdGljIGludCBkbV91cGRh
dGVfY3J0Y19zdGF0ZShzdHJ1Y3QgYW1kZ3B1X2Rpc3BsYXlfbWFuYWdlciAqZG0sCiAJc3RydWN0
IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0b3IgPSBOVUxMOwogCXN0cnVjdCBkcm1fY29u
bmVjdG9yX3N0YXRlICpkcm1fbmV3X2Nvbm5fc3RhdGUgPSBOVUxMLCAqZHJtX29sZF9jb25uX3N0
YXRlID0gTlVMTDsKIAlzdHJ1Y3QgZG1fY29ubmVjdG9yX3N0YXRlICpkbV9uZXdfY29ubl9zdGF0
ZSA9IE5VTEwsICpkbV9vbGRfY29ubl9zdGF0ZSA9IE5VTEw7Ci0Jc3RydWN0IGRybV9wbGFuZV9z
dGF0ZSAqbmV3X3BsYW5lX3N0YXRlID0gTlVMTDsKIAogCW5ld19zdHJlYW0gPSBOVUxMOwogCiAJ
ZG1fb2xkX2NydGNfc3RhdGUgPSB0b19kbV9jcnRjX3N0YXRlKG9sZF9jcnRjX3N0YXRlKTsKIAlk
bV9uZXdfY3J0Y19zdGF0ZSA9IHRvX2RtX2NydGNfc3RhdGUobmV3X2NydGNfc3RhdGUpOwogCWFj
cnRjID0gdG9fYW1kZ3B1X2NydGMoY3J0Yyk7Ci0KLQluZXdfcGxhbmVfc3RhdGUgPSBkcm1fYXRv
bWljX2dldF9uZXdfcGxhbmVfc3RhdGUoc3RhdGUsIG5ld19jcnRjX3N0YXRlLT5jcnRjLT5wcmlt
YXJ5KTsKLQotCWlmIChuZXdfY3J0Y19zdGF0ZS0+ZW5hYmxlICYmIG5ld19wbGFuZV9zdGF0ZSAm
JiAhbmV3X3BsYW5lX3N0YXRlLT5mYikgewotCQlyZXQgPSAtRUlOVkFMOwotCQlnb3RvIGZhaWw7
Ci0JfQotCiAJYWNvbm5lY3RvciA9IGFtZGdwdV9kbV9maW5kX2ZpcnN0X2NydGNfbWF0Y2hpbmdf
Y29ubmVjdG9yKHN0YXRlLCBjcnRjKTsKIAogCS8qIFRPRE8gVGhpcyBoYWNrIHNob3VsZCBnbyBh
d2F5ICovCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
