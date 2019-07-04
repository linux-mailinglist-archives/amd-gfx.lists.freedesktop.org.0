Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A12BA5FB74
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 18:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136476E366;
	Thu,  4 Jul 2019 16:06:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700057.outbound.protection.outlook.com [40.107.70.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698C76E36D
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jul 2019 16:06:14 +0000 (UTC)
Received: from CH2PR12CA0010.namprd12.prod.outlook.com (2603:10b6:610:57::20)
 by DM5PR12MB1193.namprd12.prod.outlook.com (2603:10b6:3:70::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Thu, 4 Jul 2019 16:06:13 +0000
Received: from BY2NAM03FT029.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by CH2PR12CA0010.outlook.office365.com
 (2603:10b6:610:57::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via Frontend
 Transport; Thu, 4 Jul 2019 16:06:12 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT029.mail.protection.outlook.com (10.152.84.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 16:06:12 +0000
Received: from navi10-uefi.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Thu, 4 Jul
 2019 11:05:56 -0500
From: <boyuan.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 05/17] drm/amdgpu: set jpeg enc ring functions
Date: Thu, 4 Jul 2019 12:04:17 -0400
Message-ID: <20190704160429.14758-5-boyuan.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190704160429.14758-1-boyuan.zhang@amd.com>
References: <20190704160429.14758-1-boyuan.zhang@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(39860400002)(376002)(2980300002)(428003)(199004)(189003)(53416004)(126002)(70586007)(68736007)(7736002)(5660300002)(305945005)(2351001)(70206006)(478600001)(3846002)(6916009)(426003)(2906002)(6116002)(2616005)(2876002)(50226002)(446003)(47776003)(486006)(476003)(36756003)(53936002)(77096007)(81166006)(356004)(6666004)(48376002)(186003)(16526019)(4326008)(50466002)(16586007)(336012)(11346002)(316002)(26005)(1076003)(8676002)(76176011)(72206003)(51416003)(81156014)(86362001)(8936002)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1193; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b300f2d2-3757-4069-2350-08d700998924
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR12MB1193; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1193:
X-Microsoft-Antispam-PRVS: <DM5PR12MB11932B136B53E67D24B5301C87FA0@DM5PR12MB1193.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 6lnqpNy2Mo3M1s89DRw2q/WIs6g+5blxD3EIxm0Tq9K+dDfS0bwvt/CJzdFrUcOaPJvqq+cEpy8UIOCTsO8p7awLHvJYzzM5OIztYaNHJYzPl+xWWjkiFUOBc5fKc+omsn6bIILPb6SVQ7iRVOIWQeaKxGBdOo5WyodeQnTRLjS8fGFlyQ6h5bJ+ICd7BLtZzkBMAbHZyVxJWLeDxHE8EtoX84f12wQIvWbNRDUePBqHrBtAFRBiF1MCAYJqoicUbisrEpFyPinvjbF/uK8bq5DMdmk6JYyQfz0irIxgx6lTj4Plj+FSVJiV0kAliJCSYz7Mpf3NNqbhHqe74qWVQ4adRIeYmNk/iHQG7XwW0UFLrx7VpTEbcanIWgDu86qacNzxP+TU63jJYo1BrMQM93XAq0aJUWp6t92gfvZr2ZQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 16:06:12.5596 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b300f2d2-3757-4069-2350-08d700998924
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1193
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rufhhbkoweLBA+LQzpV5hz7ZT4TgeGluR+IEMfAPNY=;
 b=1AMSLwLXHis51txt8npOW7pCwSIzgtQywfTP+92aKZTK/3W0XrMBQ7UH2EBo1qedFv0XeO7P4DUXCbYEHnp7u08HOWwtYm3B7d+0l73CZRS4vBKbe48sY4Qg+ECYy9ncvakpkqe6YG4uAInj2iBbfD2CPRgoYpqILMalcOCOxcE=
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
Cc: Boyuan Zhang <boyuan.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQm95dWFuIFpoYW5nIDxib3l1YW4uemhhbmdAYW1kLmNvbT4KClNldCBhbGwganBlZyBl
bmNvZGUgcmluZyBmdW5jdGlvbiBwb2ludGVycy4KClNpZ25lZC1vZmYtYnk6IEJveXVhbiBaaGFu
ZyA8Ym95dWFuLnpoYW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNu
X3YyXzAuYyB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDM4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS92Y25fdjJfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYwppbmRl
eCBiOTUzZjY0MjI1NjAuLjgyYTkxZjczZTE3NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvdmNuX3YyXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92
Y25fdjJfMC5jCkBAIC04OSw2ICs4OSw3IEBAIHN0YXRpYyBpbnQgdmNuX3YyXzBfc3RvcChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiBzdGF0aWMgdm9pZCB2Y25fdjJfMF9zZXRfZGVjX3Jp
bmdfZnVuY3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogc3RhdGljIHZvaWQgdmNuX3Yy
XzBfc2V0X2VuY19yaW5nX2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKIHN0YXRp
YyB2b2lkIHZjbl92Ml8wX3NldF9qcGVnX3JpbmdfZnVuY3Moc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpOworc3RhdGljIHZvaWQgdmNuX3YyXzBfc2V0X2pwZWdfZW5jX3JpbmdfZnVuY3Moc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogc3RhdGljIHZvaWQgdmNuX3YyXzBfc2V0X2lycV9m
dW5jcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiBzdGF0aWMgaW50IHZjbl92Ml8wX3Nl
dF9wb3dlcmdhdGluZ19zdGF0ZSh2b2lkICpoYW5kbGUsCiAJCQkJZW51bSBhbWRfcG93ZXJnYXRp
bmdfc3RhdGUgc3RhdGUpOwpAQCAtMTA5LDYgKzExMCw3IEBAIHN0YXRpYyBpbnQgdmNuX3YyXzBf
ZWFybHlfaW5pdCh2b2lkICpoYW5kbGUpCiAJdmNuX3YyXzBfc2V0X2RlY19yaW5nX2Z1bmNzKGFk
ZXYpOwogCXZjbl92Ml8wX3NldF9lbmNfcmluZ19mdW5jcyhhZGV2KTsKIAl2Y25fdjJfMF9zZXRf
anBlZ19yaW5nX2Z1bmNzKGFkZXYpOworCXZjbl92Ml8wX3NldF9qcGVnX2VuY19yaW5nX2Z1bmNz
KGFkZXYpOwogCXZjbl92Ml8wX3NldF9pcnFfZnVuY3MoYWRldik7CiAKIAlyZXR1cm4gMDsKQEAg
LTIxMDgsNiArMjExMCwzNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9yaW5nX2Z1bmNz
IHZjbl92Ml8wX2pwZWdfcmluZ192bV9mdW5jcyA9IHsKIAkuZW1pdF9yZWdfd3JpdGVfcmVnX3dh
aXQgPSBhbWRncHVfcmluZ19lbWl0X3JlZ193cml0ZV9yZWdfd2FpdF9oZWxwZXIsCiB9OwogCitz
dGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9yaW5nX2Z1bmNzIHZjbl92Ml8wX2pwZWdfZW5jX3Jp
bmdfdm1fZnVuY3MgPSB7CisJLnR5cGUgPSBBTURHUFVfUklOR19UWVBFX1ZDTl9KUEVHX0VOQywK
KwkuYWxpZ25fbWFzayA9IDB4ZiwKKwkudm1odWIgPSBBTURHUFVfTU1IVUIsCisJLmdldF9ycHRy
ID0gdmNuX3YyXzBfanBlZ19lbmNfcmluZ19nZXRfcnB0ciwKKwkuZ2V0X3dwdHIgPSB2Y25fdjJf
MF9qcGVnX2VuY19yaW5nX2dldF93cHRyLAorCS5zZXRfd3B0ciA9IHZjbl92Ml8wX2pwZWdfZW5j
X3Jpbmdfc2V0X3dwdHIsCisJLmVtaXRfZnJhbWVfc2l6ZSA9CisJCVNPQzE1X0ZMVVNIX0dQVV9U
TEJfTlVNX1dSRUcgKiA2ICsKKwkJU09DMTVfRkxVU0hfR1BVX1RMQl9OVU1fUkVHX1dBSVQgKiA4
ICsKKwkJOCArIC8qIHZjbl92Ml8wX2pwZWdfZW5jX3JpbmdfZW1pdF92bV9mbHVzaCAqLworCQkx
OCArIDE4ICsgLyogdmNuX3YyXzBfanBlZ19lbmNfcmluZ19lbWl0X2ZlbmNlIHgyIHZtIGZlbmNl
ICovCisJCTggKyAxNiwKKwkuZW1pdF9pYl9zaXplID0gMjIsIC8qIHZjbl92Ml8wX2pwZWdfZW5j
X3JpbmdfZW1pdF9pYiAqLworCS5lbWl0X2liID0gdmNuX3YyXzBfanBlZ19lbmNfcmluZ19lbWl0
X2liLAorCS5lbWl0X2ZlbmNlID0gdmNuX3YyXzBfanBlZ19lbmNfcmluZ19lbWl0X2ZlbmNlLAor
CS5lbWl0X3ZtX2ZsdXNoID0gdmNuX3YyXzBfanBlZ19lbmNfcmluZ19lbWl0X3ZtX2ZsdXNoLAor
CS8vLnRlc3RfcmluZworCS8vLnRlc3RfaWIKKwkuaW5zZXJ0X25vcCA9IHZjbl92Ml8wX2pwZWdf
ZW5jX3Jpbmdfbm9wLAorCS5pbnNlcnRfc3RhcnQgPSB2Y25fdjJfMF9qcGVnX2VuY19yaW5nX2lu
c2VydF9zdGFydCwKKwkuaW5zZXJ0X2VuZCA9IHZjbl92Ml8wX2pwZWdfZW5jX3JpbmdfaW5zZXJ0
X2VuZCwKKwkucGFkX2liID0gYW1kZ3B1X3JpbmdfZ2VuZXJpY19wYWRfaWIsCisJLmJlZ2luX3Vz
ZSA9IGFtZGdwdV92Y25fcmluZ19iZWdpbl91c2UsCisJLmVuZF91c2UgPSBhbWRncHVfdmNuX3Jp
bmdfZW5kX3VzZSwKKwkuZW1pdF93cmVnID0gdmNuX3YyXzBfanBlZ19lbmNfcmluZ19lbWl0X3dy
ZWcsCisJLmVtaXRfcmVnX3dhaXQgPSB2Y25fdjJfMF9qcGVnX2VuY19yaW5nX2VtaXRfcmVnX3dh
aXQsCisJLmVtaXRfcmVnX3dyaXRlX3JlZ193YWl0ID0gYW1kZ3B1X3JpbmdfZW1pdF9yZWdfd3Jp
dGVfcmVnX3dhaXRfaGVscGVyLAorfTsKKwogc3RhdGljIHZvaWQgdmNuX3YyXzBfc2V0X2RlY19y
aW5nX2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogewogCWFkZXYtPnZjbi5yaW5n
X2RlYy5mdW5jcyA9ICZ2Y25fdjJfMF9kZWNfcmluZ192bV9mdW5jczsKQEAgLTIxMzAsNiArMjE2
MiwxMiBAQCBzdGF0aWMgdm9pZCB2Y25fdjJfMF9zZXRfanBlZ19yaW5nX2Z1bmNzKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQogCURSTV9JTkZPKCJWQ04ganBlZyBkZWNvZGUgaXMgZW5hYmxl
ZCBpbiBWTSBtb2RlXG4iKTsKIH0KIAorc3RhdGljIHZvaWQgdmNuX3YyXzBfc2V0X2pwZWdfZW5j
X3JpbmdfZnVuY3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCit7CisJYWRldi0+dmNuLnJp
bmdfanBlZ19lbmMuZnVuY3MgPSAmdmNuX3YyXzBfanBlZ19lbmNfcmluZ192bV9mdW5jczsKKwlE
Uk1fSU5GTygiVkNOIGpwZWcgZW5jb2RlIGlzIGVuYWJsZWQgaW4gVk0gbW9kZVxuIik7Cit9CisK
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2lycV9zcmNfZnVuY3MgdmNuX3YyXzBfaXJxX2Z1
bmNzID0gewogCS5zZXQgPSB2Y25fdjJfMF9zZXRfaW50ZXJydXB0X3N0YXRlLAogCS5wcm9jZXNz
ID0gdmNuX3YyXzBfcHJvY2Vzc19pbnRlcnJ1cHQsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
