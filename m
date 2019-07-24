Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF4E732B5
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 17:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F070B6E5CC;
	Wed, 24 Jul 2019 15:28:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690075.outbound.protection.outlook.com [40.107.69.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C916E5CC
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 15:28:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nc7VXho25TRGkD2lkndKZNPAcS5/mRBPSWQ453euHFKqkHOd/pQayxXT1yEi0nqlaH3NDxfjpTiUqCzrw0+6pnIBW3dQa6+P526trEUFeiYbjDptfouALaCS9KoFziVh+W3ckn730RhRzwPJMaiUKDU0hng0dytff3vi+ScgwdsHh3vsEryHatdgOM2BjoktgDd+66HvtMSPJ0St59o0ELGA5EojPC2q0g6sDGL1mrz/8iAIVjFzAmtpWzpxUIJnhD+85dC3fTKHDUM0yhonpg0mEV0LOwShOSSxURAAlo/xm6s/igWCS8F3GTWuzp8XZkH//kKMpz5F6LsN1bbzOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caZYx07bgAGDEPlvUy5WVCZ5usahaGpkuayt0QLbzic=;
 b=hZHOcLQmv2Uyw4EyVkj17zrvySsB4+wc7/pSJL4TR2TId1No0EDsPtNjvm7w43guKm+ICX1cRTfDJsIi3PV4b/QLq2VOxb0q+WsRS+/4jILWseZ3FiThA9lPHWwlYNR2H4787t4YxcrGQhEOQLCZqGiB9zazuH9surHbTvGb/0YSrpAyhgG/cN15qObT6KdUPRgUKW7YSZEYN0MK0FuWI4D+Ty9Z/UWJ+eW9D8hIRigKMLLQyKYN56Vj0gmJrxkD7nEiDgT2TszFA4N3A0WpUJP8polo2IKmdc+rEBgIbx8CxfmTJV3qaeJD/TT9ll0rBRIDMcGlVLfdaiXp5XUkdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0125.namprd12.prod.outlook.com (2603:10b6:0:51::21) by
 DM5PR12MB1577.namprd12.prod.outlook.com (2603:10b6:4:f::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Wed, 24 Jul 2019 15:28:17 +0000
Received: from DM3NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by DM3PR12CA0125.outlook.office365.com
 (2603:10b6:0:51::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.14 via Frontend
 Transport; Wed, 24 Jul 2019 15:28:17 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT063.mail.protection.outlook.com (10.152.83.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Wed, 24 Jul 2019 15:28:16 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 24 Jul 2019 10:28:15 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4 1/4] drm/amdgpu: Fix hard hang for S/G display BOs.
Date: Wed, 24 Jul 2019 11:27:43 -0400
Message-ID: <1563982066-21793-2-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563982066-21793-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1563982066-21793-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(81166006)(7696005)(6666004)(305945005)(51416003)(426003)(2616005)(26005)(356004)(446003)(5660300002)(76176011)(36756003)(53936002)(81156014)(11346002)(2906002)(336012)(86362001)(8936002)(186003)(4326008)(50226002)(2351001)(70586007)(14444005)(316002)(6916009)(68736007)(476003)(50466002)(47776003)(48376002)(70206006)(53416004)(486006)(54906003)(44832011)(16586007)(8676002)(126002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1577; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7a0f4d8-5513-412b-5826-08d7104b8d03
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1577; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1577:
X-Microsoft-Antispam-PRVS: <DM5PR12MB157768236A15385A4FD400ABEAC60@DM5PR12MB1577.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0108A997B2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: VfXq3Zrzgv8hyDxdYsIqgaT97hhr7S9NfmXnXTzklJNfq6tpDZIxsI4Nx5EzFTrdosT98ab9cjm3tBK4w8b4oseG+u9Xpqj7EPrSGpouu/n0rQTh8wl0vVz/o8c0DNS+VGvLDrx47qSfa86FFeVMfDU+vvCkKE6/SlooOQ7sj89kvgF89388DW7aIvr1iia1dWS0rBqp1mbRp0cdbt/sh5IgV/ZRnbfSIj0GVXMG1K4sj6QNU3Yl5/vWDcB9+jr0IDYzxVqo3B/ST1UcFNlDwe0k1722c2on9wmCi3li07PKBWfXlh5BlYR42KCSEz7ga7yBzc7cdoaZFaRhbC9tNOx5msw0Y2czKlV98BMyyn12C1l/7CDInVqotSvicptujQbfh64RCu/R8XvAtjRl7q3LCdz4Khjzf3gkukmHFg4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2019 15:28:16.9651 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a0f4d8-5513-412b-5826-08d7104b8d03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1577
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caZYx07bgAGDEPlvUy5WVCZ5usahaGpkuayt0QLbzic=;
 b=zcWoCtf1NUB5xdWWFVO2wE36UgI+i7wqVpNcrqw8JwL9RxE0KlPq1fbmi7Llj911oaOMBf1YpDvK9x4K7TbRGcDoGO+8lUoUVsNvVPo5X67VjhOa4II+1HfiRQJi/93wpGz/00c9UwS7k0gH9MsEC46Xma6RePsEMIKZRI7sBE4=
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
Cc: Alexander.Deucher@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 hersenxs.wu@amd.com, Christian.Koenig@amd.com, shirish.s@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SFcgcmVxdWlyZXMgZm9yIGNhY2hpbmcgdG8gYmUgdW5zZXQgZm9yIHNjYW5vdXQgQk8KbWFwcGlu
Z3Mgd2hlbiB0aGUgQk8gcGxhY2VtZW50IGlzIGluIEdUVCBtZW1vcnkuClVzdWFsbHkgdGhlIGZs
YWcgdG8gdW5zZXQgaXMgcGFzc2VkIGZyb20gdXNlciBtb2RlCmJ1dCBmb3IgRkIgbW9kZSB0aGlz
IHdhcyBtaXNzaW5nLgoKdjI6CktlZXAgYWxsIEJPIHBsYWNlbWVudCBsb2dpYyBpbiBhbWRncHVf
ZGlzcGxheV9zdXBwb3J0ZWRfZG9tYWlucwoKU3VnZ2VzdGVkLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5
IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpUZXN0ZWQtYnk6IFNoaXJpc2ggUyA8c2hpcmlzaC5z
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZiLmMgIHwg
NyArKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMgfCAzICsr
LQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZiLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmIuYwppbmRleCBlNDc2MDkyLi5iZjBjNjFiIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmIuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmIuYwpAQCAtMTM3LDE0ICsxMzcsMTQg
QEAgc3RhdGljIGludCBhbWRncHVmYl9jcmVhdGVfcGlubmVkX29iamVjdChzdHJ1Y3QgYW1kZ3B1
X2ZiZGV2ICpyZmJkZXYsCiAJbW9kZV9jbWQtPnBpdGNoZXNbMF0gPSBhbWRncHVfYWxpZ25fcGl0
Y2goYWRldiwgbW9kZV9jbWQtPndpZHRoLCBjcHAsCiAJCQkJCQkgIGZiX3RpbGVkKTsKIAlkb21h
aW4gPSBhbWRncHVfZGlzcGxheV9zdXBwb3J0ZWRfZG9tYWlucyhhZGV2KTsKLQogCWhlaWdodCA9
IEFMSUdOKG1vZGVfY21kLT5oZWlnaHQsIDgpOwogCXNpemUgPSBtb2RlX2NtZC0+cGl0Y2hlc1sw
XSAqIGhlaWdodDsKIAlhbGlnbmVkX3NpemUgPSBBTElHTihzaXplLCBQQUdFX1NJWkUpOwogCXJl
dCA9IGFtZGdwdV9nZW1fb2JqZWN0X2NyZWF0ZShhZGV2LCBhbGlnbmVkX3NpemUsIDAsIGRvbWFp
biwKIAkJCQkgICAgICAgQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0FDQ0VTU19SRVFVSVJFRCB8Ci0J
CQkJICAgICAgIEFNREdQVV9HRU1fQ1JFQVRFX1ZSQU1fQ09OVElHVU9VUyB8Ci0JCQkJICAgICAg
IEFNREdQVV9HRU1fQ1JFQVRFX1ZSQU1fQ0xFQVJFRCwKKwkJCQkgICAgICAgQU1ER1BVX0dFTV9D
UkVBVEVfVlJBTV9DT05USUdVT1VTICAgICB8CisJCQkJICAgICAgIEFNREdQVV9HRU1fQ1JFQVRF
X1ZSQU1fQ0xFQVJFRCAJICAgICB8CisJCQkJICAgICAgIEFNREdQVV9HRU1fQ1JFQVRFX0NQVV9H
VFRfVVNXQywKIAkJCQkgICAgICAgdHRtX2JvX3R5cGVfa2VybmVsLCBOVUxMLCAmZ29iaik7CiAJ
aWYgKHJldCkgewogCQlwcl9lcnIoImZhaWxlZCB0byBhbGxvY2F0ZSBmcmFtZWJ1ZmZlciAoJWQp
XG4iLCBhbGlnbmVkX3NpemUpOwpAQCAtMTY2LDcgKzE2Niw2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1
ZmJfY3JlYXRlX3Bpbm5lZF9vYmplY3Qoc3RydWN0IGFtZGdwdV9mYmRldiAqcmZiZGV2LAogCQkJ
ZGV2X2VycihhZGV2LT5kZXYsICJGQiBmYWlsZWQgdG8gc2V0IHRpbGluZyBmbGFnc1xuIik7CiAJ
fQogCi0KIAlyZXQgPSBhbWRncHVfYm9fcGluKGFibywgZG9tYWluKTsKIAlpZiAocmV0KSB7CiAJ
CWFtZGdwdV9ib191bnJlc2VydmUoYWJvKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9nZW0uYwppbmRleCAyY2VhZDVhLi5lZWVkMDg5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2dlbS5jCkBAIC03NDMsNyArNzQzLDggQEAgaW50IGFtZGdwdV9tb2RlX2R1bWJf
Y3JlYXRlKHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2LAogCXN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2ID0gZGV2LT5kZXZfcHJpdmF0ZTsKIAlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdvYmo7
CiAJdWludDMyX3QgaGFuZGxlOwotCXU2NCBmbGFncyA9IEFNREdQVV9HRU1fQ1JFQVRFX0NQVV9B
Q0NFU1NfUkVRVUlSRUQ7CisJdTY0IGZsYWdzID0gQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0FDQ0VT
U19SRVFVSVJFRCB8CisJCSAgICBBTURHUFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0M7CiAJdTMy
IGRvbWFpbjsKIAlpbnQgcjsKIAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
