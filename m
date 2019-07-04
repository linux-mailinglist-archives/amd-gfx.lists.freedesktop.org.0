Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F58F5FB78
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 18:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3676E377;
	Thu,  4 Jul 2019 16:06:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750040.outbound.protection.outlook.com [40.107.75.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1506E378
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jul 2019 16:06:19 +0000 (UTC)
Received: from SN1PR12CA0065.namprd12.prod.outlook.com (2603:10b6:802:20::36)
 by MWHPR12MB1856.namprd12.prod.outlook.com (2603:10b6:300:108::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.17; Thu, 4 Jul
 2019 16:06:17 +0000
Received: from BY2NAM03FT052.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by SN1PR12CA0065.outlook.office365.com
 (2603:10b6:802:20::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via Frontend
 Transport; Thu, 4 Jul 2019 16:06:17 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT052.mail.protection.outlook.com (10.152.85.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 16:06:16 +0000
Received: from navi10-uefi.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Thu, 4 Jul
 2019 11:05:58 -0500
From: <boyuan.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 11/17] drm/amdgpu: add vcn jpeg enc ring test
Date: Thu, 4 Jul 2019 12:04:23 -0400
Message-ID: <20190704160429.14758-11-boyuan.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190704160429.14758-1-boyuan.zhang@amd.com>
References: <20190704160429.14758-1-boyuan.zhang@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(396003)(346002)(2980300002)(428003)(189003)(199004)(486006)(36756003)(16526019)(186003)(76176011)(53936002)(50466002)(2876002)(48376002)(6916009)(126002)(8936002)(476003)(356004)(6666004)(14444005)(2906002)(478600001)(68736007)(2351001)(426003)(2616005)(11346002)(72206003)(446003)(53416004)(3846002)(6116002)(70206006)(1076003)(50226002)(5660300002)(7696005)(4326008)(51416003)(86362001)(16586007)(336012)(26005)(77096007)(8676002)(81166006)(81156014)(305945005)(70586007)(47776003)(316002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1856; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 181c25f5-041e-4f26-1975-08d700998bba
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR12MB1856; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1856:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1856538D8889E015A3CBD15A87FA0@MWHPR12MB1856.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:140;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /kwON9XR+OTG09hrHPoXBTUIqmQEuzu1vufP/kMAfRkV5TpNeAQmN3fNtvdutyLfjXOaeildYPA+Wk9fZ+9CYj6vpDu1zdms1eCrLeYm29zLmkhH8Ivlsjw3+aEwsJLuHL+sjPP2cCJRV4HmYaDltZNIRjCYKVssNinjDKG//HHD5hsWJ0PXKUHI2tzo54GnFLdaWNrOlaFygueVUGM9m/ntEzqWVOFcKmOJo/ZeBAyaWLC+/7eCf0ANHtFXRCc6FjZqT0WBEgYheiAebfA/e9iettK6wUi7xIvyDx9+57wS7qNhpx0SpsnRE7UptN1BtkqAFEtxcHwivMtgDfr3FOw1TpIWHBqEwPMofaI8RmFAh2yAzZ42T+Fd1BpXSa1uUeRsh3VgO0euIrDAeeH7p6jMtUu1jeCjzyZawIEEjpE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 16:06:16.8751 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 181c25f5-041e-4f26-1975-08d700998bba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1856
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DrBcJHXMM1RQm27AwFTllGLr3mtY4Y1UKwJ4Q9aXvXs=;
 b=i/RGxiMG2E+BF1RpFwvUqRupJy73igxF+BUEOpw8E7v5omS9/9L7NPBIavrlNNnFCxOcpZw7v6coe7J7MdbYXAGngMZH+Zrybt7eCxk59orwo/K+V/DkMfWvLhxZBqZ/vMvRdeIyOg/C4JuSgzMy6snZSYPtOSpu1KnstZwQfHs=
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

RnJvbTogQm95dWFuIFpoYW5nIDxib3l1YW4uemhhbmdAYW1kLmNvbT4KCkFkZCBhIHJpbmcgdGVz
dCBmb3IganBlZyBlbmNvZGUuCgpTaWduZWQtb2ZmLWJ5OiBCb3l1YW4gWmhhbmcgPGJveXVhbi56
aGFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYyB8
IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92Y24uaCB8ICAyICsrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJf
MC5jICAgfCAgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zj
bi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jCmluZGV4IGY5YWY0
NjVhMDBlMC4uMTU2ODdjYmI3OThiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdmNuLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3Zjbi5jCkBAIC04NTQsMyArODU0LDMyIEBAIGludCBhbWRncHVfdmNuX2pwZWdfcmluZ190ZXN0
X2liKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgbG9uZyB0aW1lb3V0KQogZXJyb3I6CiAJcmV0
dXJuIHI7CiB9CisKK2ludCBhbWRncHVfdmNuX2pwZWdfZW5jX3JpbmdfdGVzdF9yaW5nKHN0cnVj
dCBhbWRncHVfcmluZyAqcmluZykKK3sKKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHJp
bmctPmFkZXY7CisJdWludDMyX3QgdG1wID0gMDsKKwl1bnNpZ25lZCBpOworCWludCByOworCisJ
V1JFRzMyKGFkZXYtPnZjbi5leHRlcm5hbC5qcGVnX2VuY19zY3JhdGNoMCwgMHhDQUZFREVBRCk7
CisJciA9IGFtZGdwdV9yaW5nX2FsbG9jKHJpbmcsIDMpOworCWlmIChyKQorCQlyZXR1cm4gcjsK
KworCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDAoYWRldi0+dmNuLmludGVybmFsLmpw
ZWdfZW5jX3NjcmF0Y2gwLCAwKSk7CisJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgMHhERUFEQkVF
Rik7CisJYW1kZ3B1X3JpbmdfY29tbWl0KHJpbmcpOworCisJZm9yIChpID0gMDsgaSA8IGFkZXYt
PnVzZWNfdGltZW91dDsgaSsrKSB7CisJCXRtcCA9IFJSRUczMihhZGV2LT52Y24uZXh0ZXJuYWwu
anBlZ19lbmNfc2NyYXRjaDApOworCQlpZiAodG1wID09IDB4REVBREJFRUYpCisJCQlicmVhazsK
KwkJRFJNX1VERUxBWSgxKTsKKwl9CisKKwlpZiAoaSA+PSBhZGV2LT51c2VjX3RpbWVvdXQpCisJ
CXIgPSAtRVRJTUVET1VUOworCisJcmV0dXJuIHI7Cit9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdmNuLmgKaW5kZXggOGIzNDRkNmExYWNhLi41MjhkOWQzZmE5MWMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uaAorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmgKQEAgLTExMiw0ICsxMTIsNiBAQCBpbnQg
YW1kZ3B1X3Zjbl9lbmNfcmluZ190ZXN0X2liKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgbG9u
ZyB0aW1lb3V0KTsKIGludCBhbWRncHVfdmNuX2pwZWdfcmluZ190ZXN0X3Jpbmcoc3RydWN0IGFt
ZGdwdV9yaW5nICpyaW5nKTsKIGludCBhbWRncHVfdmNuX2pwZWdfcmluZ190ZXN0X2liKHN0cnVj
dCBhbWRncHVfcmluZyAqcmluZywgbG9uZyB0aW1lb3V0KTsKIAoraW50IGFtZGdwdV92Y25fanBl
Z19lbmNfcmluZ190ZXN0X3Jpbmcoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKTsKKwogI2VuZGlm
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYwppbmRleCA1ZGFiMTdlNDIyYzMuLmFi
ZDcwOGUwZTMwNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3Yy
XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jCkBAIC0yMTky
LDcgKzIxOTIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9yaW5nX2Z1bmNzIHZjbl92
Ml8wX2pwZWdfZW5jX3Jpbmdfdm1fZnVuY3MgPSB7CiAJLmVtaXRfaWIgPSB2Y25fdjJfMF9qcGVn
X2VuY19yaW5nX2VtaXRfaWIsCiAJLmVtaXRfZmVuY2UgPSB2Y25fdjJfMF9qcGVnX2VuY19yaW5n
X2VtaXRfZmVuY2UsCiAJLmVtaXRfdm1fZmx1c2ggPSB2Y25fdjJfMF9qcGVnX2VuY19yaW5nX2Vt
aXRfdm1fZmx1c2gsCi0JLy8udGVzdF9yaW5nCisJLnRlc3RfcmluZyA9IGFtZGdwdV92Y25fanBl
Z19lbmNfcmluZ190ZXN0X3JpbmcsCiAJLy8udGVzdF9pYgogCS5pbnNlcnRfbm9wID0gdmNuX3Yy
XzBfanBlZ19lbmNfcmluZ19ub3AsCiAJLmluc2VydF9zdGFydCA9IHZjbl92Ml8wX2pwZWdfZW5j
X3JpbmdfaW5zZXJ0X3N0YXJ0LAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
