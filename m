Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04762275F9
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2019 08:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4319289C7F;
	Thu, 23 May 2019 06:24:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770040.outbound.protection.outlook.com [40.107.77.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF0B89C7F
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 May 2019 06:24:25 +0000 (UTC)
Received: from DM3PR12CA0080.namprd12.prod.outlook.com (2603:10b6:0:57::24) by
 MWHPR12MB1278.namprd12.prod.outlook.com (2603:10b6:300:10::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Thu, 23 May 2019 06:24:23 +0000
Received: from CO1NAM03FT029.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by DM3PR12CA0080.outlook.office365.com
 (2603:10b6:0:57::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.17 via Frontend
 Transport; Thu, 23 May 2019 06:24:23 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT029.mail.protection.outlook.com (10.152.80.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Thu, 23 May 2019 06:24:23 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 23 May 2019
 01:24:21 -0500
From: Emily Deng <Emily.Deng@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] Revert "drm/amdgpu: Need to set the baco cap before baco
 reset"
Date: Thu, 23 May 2019 14:24:17 +0800
Message-ID: <1558592657-9648-1-git-send-email-Emily.Deng@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(5660300002)(316002)(26005)(6916009)(53936002)(186003)(336012)(70206006)(7696005)(47776003)(51416003)(305945005)(53416004)(36756003)(4326008)(16586007)(70586007)(81156014)(2616005)(476003)(86362001)(81166006)(68736007)(72206003)(478600001)(8676002)(426003)(356004)(48376002)(50466002)(486006)(126002)(50226002)(6666004)(2906002)(8936002)(77096007)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1278; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a807d49-becb-4c78-9e63-08d6df474c20
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:MWHPR12MB1278; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1278:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1278027C756810887436DEAC8F010@MWHPR12MB1278.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:49;
X-Forefront-PRVS: 00462943DE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: sz5Qyi/VK4zBcF2H7M6iGgzjsGKTy9KtcdtTaX+W2Na6U1NQEbUTx6fTBe3x9C10sIizilxojsRgblsg/0jMYT0yyJYnqPL/hfCJ9DFonACVhKJnSuZvJLtudQYN4uzyitnkmPpG6Ph87aDjJeTFPS6MLjyqFki9gk1gFj2ZFzxhM63YsttWu4rXDInMk4g9IzKKVCU/94hWpmCNjHBdJfpjO4TMEJqjHhyJ0VpBBMdxCS4kM+DYgQ+kVyN5WGDYOj8E+v7HGjTyyk27dyYT1bGXJ04ZhcVE3t/eh343Qr19BcUJdmtQLxnuzsVGwGjyY8FWHJilOfy3FpG1r9JAnd5Iv338amBJAoU3v9WrVpLRe2+y+Z++D7d0jFmt2OuB8h1JgDznLvhIEdSSHvdT85W2Vs/fgc2JxGRO2RQJuy4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2019 06:24:23.0540 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a807d49-becb-4c78-9e63-08d6df474c20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1278
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JiUwIRJaogQxUQYhwxfUT6AvFcVlwjGzwUGmYhCGHqM=;
 b=bLyDu0T5m/A74uodxhYLIVHdbgsXN8ZUaSNFvo1JNY84vFYoGMA8akbo0TPLBdhGqVCDd8fb3WRGjexRBuL6bcwS8W95hWaG6qRIKjYeX0JKg0bdRgxNYDkMvde5DUdD9wkCswLbW0XrDvWdQdhxdN292GFWFyV2UMqfPtXScDQ=
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
Cc: Emily Deng <Emily.Deng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCAxM2YyYTM3NWI1ODkxODg3MzgzM2NmNjg1OTMzMmY5NjBjNmNm
OTIyLgoKU2lnbmVkLW9mZi1ieTogRW1pbHkgRGVuZyA8RW1pbHkuRGVuZ0BhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyAgICAgICAgIHwgMTAg
Ky0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2tnZF9wcF9pbnRlcmZhY2Uu
aCAgICAgfCAgMSAtCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRfcG93ZXJwbGF5
LmMgICAgICB8IDE2IC0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jIHwgIDEgLQogLi4uL2FtZC9wb3dlcnBsYXkvaHdtZ3Iv
dmVnYTEwX3Byb2Nlc3NwcHRhYmxlcy5jICAgfCAyMiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAu
Li4vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBfcHJvY2Vzc3BwdGFibGVzLmggICB8ICAxIC0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9od21nci5oICAgICAgICAgIHwgIDEg
LQogNyBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNTEgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCmluZGV4IDI0MmMzOGMuLmJk
ZDFmZTczIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2
aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCkBA
IC0yNjEwLDE1ICsyNjEwLDcgQEAgaW50IGFtZGdwdV9kZXZpY2VfaW5pdChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwKIAkvKiBjaGVjayBpZiB3ZSBuZWVkIHRvIHJlc2V0IHRoZSBhc2ljCiAJ
ICogIEUuZy4sIGRyaXZlciB3YXMgbm90IGNsZWFubHkgdW5sb2FkZWQgcHJldmlvdXNseSwgZXRj
LgogCSAqLwotCWlmIChhbWRncHVfcGFzc3Rocm91Z2goYWRldikgJiYgYW1kZ3B1X2FzaWNfbmVl
ZF9yZXNldF9vbl9pbml0KGFkZXYpKSB7Ci0JCWlmIChhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3Mg
JiYgYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzLT5zZXRfYXNpY19iYWNvX2NhcCkgewotCQkJciA9
IGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+c2V0X2FzaWNfYmFjb19jYXAoYWRldi0+cG93ZXJw
bGF5LnBwX2hhbmRsZSk7Ci0JCQlpZiAocikgewotCQkJCWRldl9lcnIoYWRldi0+ZGV2LCAic2V0
IGJhY28gY2FwYWJpbGl0eSBmYWlsZWRcbiIpOwotCQkJCWdvdG8gZmFpbGVkOwotCQkJfQotCQl9
Ci0KKwlpZiAoIWFtZGdwdV9zcmlvdl92ZihhZGV2KSAmJiBhbWRncHVfYXNpY19uZWVkX3Jlc2V0
X29uX2luaXQoYWRldikpIHsKIAkJciA9IGFtZGdwdV9hc2ljX3Jlc2V0KGFkZXYpOwogCQlpZiAo
cikgewogCQkJZGV2X2VycihhZGV2LT5kZXYsICJhc2ljIHJlc2V0IG9uIGluaXQgZmFpbGVkXG4i
KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9rZ2RfcHBfaW50ZXJm
YWNlLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUva2dkX3BwX2ludGVyZmFjZS5oCmlu
ZGV4IGM2ZTJhNTEuLjlmNjYxYmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5j
bHVkZS9rZ2RfcHBfaW50ZXJmYWNlLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRl
L2tnZF9wcF9pbnRlcmZhY2UuaApAQCAtMjk2LDcgKzI5Niw2IEBAIHN0cnVjdCBhbWRfcG1fZnVu
Y3MgewogCWludCAoKnNldF9oYXJkX21pbl9mY2xrX2J5X2ZyZXEpKHZvaWQgKmhhbmRsZSwgdWlu
dDMyX3QgY2xvY2spOwogCWludCAoKnNldF9taW5fZGVlcF9zbGVlcF9kY2VmY2xrKSh2b2lkICpo
YW5kbGUsIHVpbnQzMl90IGNsb2NrKTsKIAlpbnQgKCpnZXRfYXNpY19iYWNvX2NhcGFiaWxpdHkp
KHZvaWQgKmhhbmRsZSwgYm9vbCAqY2FwKTsKLQlpbnQgKCpzZXRfYXNpY19iYWNvX2NhcCkodm9p
ZCAqaGFuZGxlKTsKIAlpbnQgKCpnZXRfYXNpY19iYWNvX3N0YXRlKSh2b2lkICpoYW5kbGUsIGlu
dCAqc3RhdGUpOwogCWludCAoKnNldF9hc2ljX2JhY29fc3RhdGUpKHZvaWQgKmhhbmRsZSwgaW50
IHN0YXRlKTsKIAlpbnQgKCpnZXRfcHBmZWF0dXJlX3N0YXR1cykodm9pZCAqaGFuZGxlLCBjaGFy
ICpidWYpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kX3Bv
d2VycGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kX3Bvd2VycGxheS5j
CmluZGV4IDk4NTY3NjAuLmJlYTE1ODcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2FtZF9wb3dlcnBsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9hbWRfcG93ZXJwbGF5LmMKQEAgLTE0MDQsMjEgKzE0MDQsNiBAQCBzdGF0aWMgaW50IHBw
X3NldF9hY3RpdmVfZGlzcGxheV9jb3VudCh2b2lkICpoYW5kbGUsIHVpbnQzMl90IGNvdW50KQog
CXJldHVybiByZXQ7CiB9CiAKLXN0YXRpYyBpbnQgcHBfc2V0X2FzaWNfYmFjb19jYXAodm9pZCAq
aGFuZGxlKQotewotCXN0cnVjdCBwcF9od21nciAqaHdtZ3IgPSBoYW5kbGU7Ci0KLQlpZiAoIWh3
bWdyKQotCQlyZXR1cm4gLUVJTlZBTDsKLQotCWlmICghaHdtZ3ItPnBtX2VuIHx8ICFod21nci0+
aHdtZ3JfZnVuYy0+c2V0X2FzaWNfYmFjb19jYXApCi0JCXJldHVybiAwOwotCi0JaHdtZ3ItPmh3
bWdyX2Z1bmMtPnNldF9hc2ljX2JhY29fY2FwKGh3bWdyKTsKLQotCXJldHVybiAwOwotfQotCiBz
dGF0aWMgaW50IHBwX2dldF9hc2ljX2JhY29fY2FwYWJpbGl0eSh2b2lkICpoYW5kbGUsIGJvb2wg
KmNhcCkKIHsKIAlzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyID0gaGFuZGxlOwpAQCAtMTU2MSw3ICsx
NTQ2LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRfcG1fZnVuY3MgcHBfZHBtX2Z1bmNzID0g
ewogCS5zZXRfaGFyZF9taW5fZGNlZmNsa19ieV9mcmVxID0gcHBfc2V0X2hhcmRfbWluX2RjZWZj
bGtfYnlfZnJlcSwKIAkuc2V0X2hhcmRfbWluX2ZjbGtfYnlfZnJlcSA9IHBwX3NldF9oYXJkX21p
bl9mY2xrX2J5X2ZyZXEsCiAJLmdldF9hc2ljX2JhY29fY2FwYWJpbGl0eSA9IHBwX2dldF9hc2lj
X2JhY29fY2FwYWJpbGl0eSwKLQkuc2V0X2FzaWNfYmFjb19jYXAgPSBwcF9zZXRfYXNpY19iYWNv
X2NhcCwKIAkuZ2V0X2FzaWNfYmFjb19zdGF0ZSA9IHBwX2dldF9hc2ljX2JhY29fc3RhdGUsCiAJ
LnNldF9hc2ljX2JhY29fc3RhdGUgPSBwcF9zZXRfYXNpY19iYWNvX3N0YXRlLAogCS5nZXRfcHBm
ZWF0dXJlX3N0YXR1cyA9IHBwX2dldF9wcGZlYXR1cmVfc3RhdHVzLApkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYwppbmRleCBlNWJjYmM4
Li5jZTZhZWI1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21n
ci92ZWdhMTBfaHdtZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21n
ci92ZWdhMTBfaHdtZ3IuYwpAQCAtNTMwMiw3ICs1MzAyLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBwcF9od21ncl9mdW5jIHZlZ2ExMF9od21ncl9mdW5jcyA9IHsKIAkub2RuX2VkaXRfZHBtX3Rh
YmxlID0gdmVnYTEwX29kbl9lZGl0X2RwbV90YWJsZSwKIAkuZ2V0X3BlcmZvcm1hbmNlX2xldmVs
ID0gdmVnYTEwX2dldF9wZXJmb3JtYW5jZV9sZXZlbCwKIAkuZ2V0X2FzaWNfYmFjb19jYXBhYmls
aXR5ID0gc211OV9iYWNvX2dldF9jYXBhYmlsaXR5LAotCS5zZXRfYXNpY19iYWNvX2NhcCA9IHZl
Z2ExMF9iYWNvX3NldF9jYXAsCiAJLmdldF9hc2ljX2JhY29fc3RhdGUgPSBzbXU5X2JhY29fZ2V0
X3N0YXRlLAogCS5zZXRfYXNpY19iYWNvX3N0YXRlID0gdmVnYTEwX2JhY29fc2V0X3N0YXRlLAog
CS5lbmFibGVfbWdwdV9mYW5fYm9vc3QgPSB2ZWdhMTBfZW5hYmxlX21ncHVfZmFuX2Jvb3N0LApk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX3By
b2Nlc3NwcHRhYmxlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVn
YTEwX3Byb2Nlc3NwcHRhYmxlcy5jCmluZGV4IDhmZGViMjMuLmI2NzY3ZDcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9wcm9jZXNzcHB0YWJs
ZXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBfcHJv
Y2Vzc3BwdGFibGVzLmMKQEAgLTEzNzEsMjUgKzEzNzEsMyBAQCBpbnQgdmVnYTEwX2dldF9wb3dl
cnBsYXlfdGFibGVfZW50cnkoc3RydWN0IHBwX2h3bWdyICpod21nciwKIAogCXJldHVybiByZXN1
bHQ7CiB9Ci0KLWludCB2ZWdhMTBfYmFjb19zZXRfY2FwKHN0cnVjdCBwcF9od21nciAqaHdtZ3Ip
Ci17Ci0JaW50IHJlc3VsdCA9IDA7Ci0JY29uc3QgQVRPTV9WZWdhMTBfUE9XRVJQTEFZVEFCTEUg
KnBvd2VycGxheV90YWJsZTsKLQotCXBvd2VycGxheV90YWJsZSA9IGdldF9wb3dlcnBsYXlfdGFi
bGUoaHdtZ3IpOwotCi0JUFBfQVNTRVJUX1dJVEhfQ09ERSgocG93ZXJwbGF5X3RhYmxlICE9IE5V
TEwpLAotCQkiTWlzc2luZyBQb3dlclBsYXkgVGFibGUhIiwgcmV0dXJuIC0xKTsKLQotCXJlc3Vs
dCA9IGNoZWNrX3Bvd2VycGxheV90YWJsZXMoaHdtZ3IsIHBvd2VycGxheV90YWJsZSk7Ci0KLQlQ
UF9BU1NFUlRfV0lUSF9DT0RFKChyZXN1bHQgPT0gMCksCi0JCQkgICAgImNoZWNrX3Bvd2VycGxh
eV90YWJsZXMgZmFpbGVkIiwgcmV0dXJuIHJlc3VsdCk7Ci0KLQlzZXRfaHdfY2FwKAotCQkJaHdt
Z3IsCi0JCQkwICE9IChsZTMyX3RvX2NwdShwb3dlcnBsYXlfdGFibGUtPnVsUGxhdGZvcm1DYXBz
KSAmIEFUT01fVkVHQTEwX1BQX1BMQVRGT1JNX0NBUF9CQUNPKSwKLQkJCVBITV9QbGF0Zm9ybUNh
cHNfQkFDTyk7Ci0JcmV0dXJuIHJlc3VsdDsKLX0KXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxl
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBf
cHJvY2Vzc3BwdGFibGVzLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92
ZWdhMTBfcHJvY2Vzc3BwdGFibGVzLmgKaW5kZXggZGE1ZmJlYy4uZDgzZWQyYSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX3Byb2Nlc3NwcHRh
Ymxlcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9w
cm9jZXNzcHB0YWJsZXMuaApAQCAtNTksNSArNTksNCBAQCBleHRlcm4gaW50IHZlZ2ExMF9nZXRf
bnVtYmVyX29mX3Bvd2VycGxheV90YWJsZV9lbnRyaWVzKHN0cnVjdCBwcF9od21nciAqaHdtZ3Ip
OwogZXh0ZXJuIGludCB2ZWdhMTBfZ2V0X3Bvd2VycGxheV90YWJsZV9lbnRyeShzdHJ1Y3QgcHBf
aHdtZ3IgKmh3bWdyLCB1aW50MzJfdCBlbnRyeV9pbmRleCwKIAkJc3RydWN0IHBwX3Bvd2VyX3N0
YXRlICpwb3dlcl9zdGF0ZSwgaW50ICgqY2FsbF9iYWNrX2Z1bmMpKHN0cnVjdCBwcF9od21nciAq
LCB2b2lkICosCiAJCQkJc3RydWN0IHBwX3Bvd2VyX3N0YXRlICosIHZvaWQgKiwgdWludDMyX3Qp
KTsKLWV4dGVybiBpbnQgdmVnYTEwX2JhY29fc2V0X2NhcChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdy
KTsKICNlbmRpZgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5j
L2h3bWdyLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvaHdtZ3IuaAppbmRl
eCAxNDQ4MGFlLi5iYWMzZDg1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9pbmMvaHdtZ3IuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMv
aHdtZ3IuaApAQCAtMzM5LDcgKzMzOSw2IEBAIHN0cnVjdCBwcF9od21ncl9mdW5jIHsKIAlpbnQg
KCpzZXRfaGFyZF9taW5fZGNlZmNsa19ieV9mcmVxKShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLCB1
aW50MzJfdCBjbG9jayk7CiAJaW50ICgqc2V0X2hhcmRfbWluX2ZjbGtfYnlfZnJlcSkoc3RydWN0
IHBwX2h3bWdyICpod21nciwgdWludDMyX3QgY2xvY2spOwogCWludCAoKmdldF9hc2ljX2JhY29f
Y2FwYWJpbGl0eSkoc3RydWN0IHBwX2h3bWdyICpod21nciwgYm9vbCAqY2FwKTsKLQlpbnQgKCpz
ZXRfYXNpY19iYWNvX2NhcCkoc3RydWN0IHBwX2h3bWdyICpod21ncik7CiAJaW50ICgqZ2V0X2Fz
aWNfYmFjb19zdGF0ZSkoc3RydWN0IHBwX2h3bWdyICpod21nciwgZW51bSBCQUNPX1NUQVRFICpz
dGF0ZSk7CiAJaW50ICgqc2V0X2FzaWNfYmFjb19zdGF0ZSkoc3RydWN0IHBwX2h3bWdyICpod21n
ciwgZW51bSBCQUNPX1NUQVRFIHN0YXRlKTsKIAlpbnQgKCpnZXRfcHBmZWF0dXJlX3N0YXR1cyko
c3RydWN0IHBwX2h3bWdyICpod21nciwgY2hhciAqYnVmKTsKLS0gCjIuNy40CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
