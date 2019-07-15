Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EA569DEB
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:22:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDA689D66;
	Mon, 15 Jul 2019 21:22:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820088.outbound.protection.outlook.com [40.107.82.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DEF89CC9
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNE6PoF8ZKAmeE8P9LmCvbD1FlhLDKycevOP/JwMjdg8Sq4VA5co+ePg52TjDaFuLNaFq2Ng/3JUt/+tETEWcWC3WewaSnlq3qVVNvBctnlrBFH8BhZ9saS2iV/7ph/Ccx1wm8qUzQivhiEdpJTnJFeCo6gpXAkseI+VX1+YY0+IXIHy7KOMpjQJuT2dkH70zDGPukXZY/HkfUuZbGbmBezj4foRBRnIlkoIFTATCv88WyiowLaJvRLY/dpri9nTIMv7bZHsovZWB/iavLCMWqF0y2zzPaRTlFWJJKqOhBxwU8SNGsOkOIpcEgO47eeleaoBc/0MRWaLux2qX+xwsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KO26850jjF3XPU213V6ffQm9ENpabNbkYYR8F3Tt6Ss=;
 b=PnQg5Ay1ctjHROeVGQwiDxoKmxJU++sTUS0JOQifi1TNko8u0hjyBm9PIHIHAs1V0MifrEAa7frtpeMs4YySdh8Wan8+AImmHd2wU7G5fVgHH/Rt2VLA9wwMEJ9QrBT3d3hzerKsSz3Z3xQVlusHA2qgTgNxfFNW13hXjfHRlb6W3hGdjvrkOCIob9FkSWNr2CukmZleybmu6pWlE40TkjG9jfRSEru6i8IFgAty6Uw9Wm7uwmE7GblRpPRx18QEHxpVBH4vU/4bPtZK6UfOcMx/cDDwqT3fY6wzUrI2zkoDCeAnvkgWKY947a2VmgrBvkWjU9VtHrdjWQKQR/v6Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0112.namprd12.prod.outlook.com (2603:10b6:0:55::32) by
 BN8PR12MB3091.namprd12.prod.outlook.com (2603:10b6:408:67::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.13; Mon, 15 Jul 2019 21:21:55 +0000
Received: from CO1NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM3PR12CA0112.outlook.office365.com
 (2603:10b6:0:55::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:55 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT048.mail.protection.outlook.com (10.152.81.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:54 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:35 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 66/87] drm/amd/display: add a option to force the clock at
 every mode change.
Date: Mon, 15 Jul 2019 17:20:28 -0400
Message-ID: <20190715212049.4584-67-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(396003)(2980300002)(428003)(189003)(199004)(50226002)(478600001)(8936002)(2351001)(336012)(86362001)(68736007)(186003)(8676002)(51416003)(2870700001)(76176011)(2876002)(126002)(54906003)(2616005)(11346002)(26005)(2906002)(446003)(305945005)(476003)(426003)(53936002)(49486002)(47776003)(48376002)(316002)(14444005)(1076003)(4326008)(5660300002)(70586007)(356004)(6666004)(486006)(6916009)(36756003)(70206006)(81166006)(81156014)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3091; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f60d607-0018-4160-69ab-08d7096a7630
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN8PR12MB3091; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB3091:
X-Microsoft-Antispam-PRVS: <BN8PR12MB309128D9D014CD99C4689F1982CF0@BN8PR12MB3091.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 8NJ+x/zNz8Qce4uVvpyh7cOPAxc5MOzvXXvDKAgcif9dVYatpf9dUO0/vCElkZBgg4l+IcOAc3Wj5lHpi/UEzA6+8k6V/wgYFiwv3O0wpeFaAh34eRrTatJP0AsCOZStXaD79SbYeNepOiEfUmBlZX5s6AvQdKtiIp0K/LfCb1rV3e685T9Nb1YbfLFRGLEJeXfISUIZXmHQTQEJr8N513YsXN7CyAOtfKZTs0lITqcz4eY9vpUUvnzujgWz2it16PKnsUOWVU5CUbKjql9o770sD/scNwN2SBqB5dgz/JUq+q0RCUArTJ5KeH7vFP5ABOJey/77YmJ9Nfp49+Ko3gy31tiGXhaVuT1bdFgxS0eYQfgdqBPEYh0By5jSHenG9o6SGvpTJsJNHB58s+iKfbuRP9SDkB3EecqvWURJHQ4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:54.8260 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f60d607-0018-4160-69ab-08d7096a7630
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3091
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KO26850jjF3XPU213V6ffQm9ENpabNbkYYR8F3Tt6Ss=;
 b=mnAmKVS8+LKKiFrFPEE2hq1VLHNHSYBjl1AtrMLBN8uihIjIIpPkZ7gAv09jTWrf+fe9qzRDFuPJQx/vbaZSlHuBZTX327QNqPuxqO5xd4ns83hcQoCX4RGtxbm67SVeZP70ZrDLsAt2rxK81+rzGPCmCEXuY236k2X1wtv056U=
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
VGhpcyBpcyBmb3IgSFcgbmVnYXRpdmUgc3RyZXNzIHRlc3RpbmcgdXNlLgpmb3JjZSByZXNldCB0
aGUgZGlzcGNsayBhbmQgZHBwY2xrIGV2ZW4gdGhlIHNhbWUgY2xvY2sgYWxyZWFkeSBzZXQgaW4g
SFcuCgpTaWduZWQtb2ZmLWJ5OiBDaGFybGVuZSBMaXUgPGNoYXJsZW5lLmxpdUBhbWQuY29tPgpS
ZXZpZXdlZC1ieTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNv
bT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjAvZGNuMjBfY2xrX21nci5jIHwgOSArKysrKysr
Ky0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oICAgICAgICAgICAgICAgICAg
ICAgIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2Rj
bjIwL2RjbjIwX2Nsa19tZ3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtf
bWdyL2RjbjIwL2RjbjIwX2Nsa19tZ3IuYwppbmRleCA5YTg3M2UyYjM3MzYuLjNjZmY0ZjA1MThk
MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNu
MjAvZGNuMjBfY2xrX21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9j
bGtfbWdyL2RjbjIwL2RjbjIwX2Nsa19tZ3IuYwpAQCAtMTUxLDcgKzE1MSwxNCBAQCB2b2lkIGRj
bjJfdXBkYXRlX2Nsb2NrcyhzdHJ1Y3QgY2xrX21nciAqY2xrX21ncl9iYXNlLAogCWJvb2wgZW50
ZXJfZGlzcGxheV9vZmYgPSBmYWxzZTsKIAlib29sIGRwcF9jbG9ja19sb3dlcmVkID0gZmFsc2U7
CiAJc3RydWN0IGRtY3UgKmRtY3UgPSBjbGtfbWdyX2Jhc2UtPmN0eC0+ZGMtPnJlc19wb29sLT5k
bWN1OworCWJvb2wgZm9yY2VfcmVzZXQgPSBmYWxzZTsKIAorCWlmIChjbGtfbWdyX2Jhc2UtPmNs
a3MuZGlzcGNsa19raHogPT0gMCB8fAorCQlkYy0+ZGVidWcuZm9yY2VfY2xvY2tfbW9kZSAmIDB4
MSkgeworCQkvL3RoaXMgaXMgZnJvbSByZXN1bWUgb3IgYm9vdCB1cCwgaWYgZm9yY2VkX2Nsb2Nr
IGNmZyBvcHRpb24gdXNlZCwgd2UgYnlwYXNzIHByb2dyYW0gZGlzcGNsayBhbmQgRFBQQ0xLLCBi
dXQgbmVlZCBzZXQgdGhlbSBmb3IgUzMuCisJCWZvcmNlX3Jlc2V0ID0gdHJ1ZTsKKwkJLy9mb3Jj
ZV9jbG9ja19tb2RlIDB4MTogIGZvcmNlIHJlc2V0IHRoZSBjbG9jayBldmVuIGl0IGlzIHRoZSBz
YW1lIGNsb2NrIGFzIGxvbmcgYXMgaXQgaXMgaW4gUGFzc2l2ZSBsZXZlbC4KKwl9CiAJZGlzcGxh
eV9jb3VudCA9IGNsa19tZ3JfaGVscGVyX2dldF9hY3RpdmVfZGlzcGxheV9jbnQoZGMsIGNvbnRl
eHQpOwogCWlmIChkYy0+cmVzX3Bvb2wtPnBwX3NtdSkKIAkJcHBfc211ID0gJmRjLT5yZXNfcG9v
bC0+cHBfc211LT5udl9mdW5jczsKQEAgLTIyMyw3ICsyMzAsNyBAQCB2b2lkIGRjbjJfdXBkYXRl
X2Nsb2NrcyhzdHJ1Y3QgY2xrX21nciAqY2xrX21ncl9iYXNlLAogCiAJCXVwZGF0ZV9kaXNwY2xr
ID0gdHJ1ZTsKIAl9Ci0JaWYgKGRjLT5jb25maWcuZm9yY2VkX2Nsb2NrcyA9PSBmYWxzZSkgewor
CWlmIChkYy0+Y29uZmlnLmZvcmNlZF9jbG9ja3MgPT0gZmFsc2UgfHwgKGZvcmNlX3Jlc2V0ICYm
IHNhZmVfdG9fbG93ZXIpKSB7CiAJCWlmIChkcHBfY2xvY2tfbG93ZXJlZCkgewogCQkJLy8gaWYg
Y2xvY2sgaXMgYmVpbmcgbG93ZXJlZCwgaW5jcmVhc2UgRFRPIGJlZm9yZSBsb3dlcmluZyByZWZj
bGsKIAkJCWRjbjIwX3VwZGF0ZV9jbG9ja3NfdXBkYXRlX2RwcF9kdG8oY2xrX21nciwgY29udGV4
dCk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCmluZGV4IGE1YjVhZmQ0OGE3Yi4uNTg0
ZmFiZjVhOWExIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMu
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaApAQCAtMzg1LDYgKzM4
NSw3IEBAIHN0cnVjdCBkY19kZWJ1Z19vcHRpb25zIHsKICNpZiBkZWZpbmVkKENPTkZJR19EUk1f
QU1EX0RDX0RDTjJfMCkKIAlib29sIGNtX2luX2J5cGFzczsKICNlbmRpZgorCWludCBmb3JjZV9j
bG9ja19tb2RlOy8qZXZlcnkgbW9kZSBjaGFuZ2UuKi8KIH07CiAKIHN0cnVjdCBkY19kZWJ1Z19k
YXRhIHsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
