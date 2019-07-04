Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 950695FB7A
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 18:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079976E379;
	Thu,  4 Jul 2019 16:06:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770057.outbound.protection.outlook.com [40.107.77.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475E96E377
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jul 2019 16:06:20 +0000 (UTC)
Received: from CH2PR12CA0010.namprd12.prod.outlook.com (2603:10b6:610:57::20)
 by BN6PR12MB1843.namprd12.prod.outlook.com (2603:10b6:404:101::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2032.20; Thu, 4 Jul
 2019 16:06:18 +0000
Received: from BY2NAM03FT029.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by CH2PR12CA0010.outlook.office365.com
 (2603:10b6:610:57::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via Frontend
 Transport; Thu, 4 Jul 2019 16:06:18 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT029.mail.protection.outlook.com (10.152.84.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 16:06:17 +0000
Received: from navi10-uefi.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Thu, 4 Jul
 2019 11:05:59 -0500
From: <boyuan.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 12/17] drm/amdgpu: add vcn jpeg enc ib test
Date: Thu, 4 Jul 2019 12:04:24 -0400
Message-ID: <20190704160429.14758-12-boyuan.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190704160429.14758-1-boyuan.zhang@amd.com>
References: <20190704160429.14758-1-boyuan.zhang@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(136003)(396003)(2980300002)(428003)(189003)(199004)(3846002)(81166006)(8676002)(70586007)(2351001)(6916009)(2906002)(86362001)(47776003)(70206006)(50226002)(2876002)(6116002)(81156014)(478600001)(1076003)(8936002)(426003)(476003)(36756003)(316002)(50466002)(76176011)(53936002)(7736002)(4326008)(53416004)(5660300002)(446003)(356004)(126002)(16586007)(6666004)(7696005)(16526019)(486006)(2616005)(68736007)(11346002)(186003)(14444005)(51416003)(336012)(26005)(305945005)(72206003)(48376002)(77096007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1843; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23c43826-9c36-42f3-524a-08d700998c38
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR12MB1843; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1843:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1843C3CE8E38F62FF59F962887FA0@BN6PR12MB1843.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 6ZEg8vghwKbwPHxVoFO1bKlYJcr97GW3fkzw0WeGG4pDTZmvsHpbTk1sbCZT4W0TekD5OTv7vnwc2ds+g06jIHiQ1y5hmaoI6+P+NUD6SUCt9Sea+CqsHyMgfJYt4FX9omz0eAHLgT4Ex8S2hJnl9wVE7d48vqjuiuDCGavWOCQ6uZAz9SoOwnCX4XLu1FL9KCT/3Gq/baa2G/0vVVeiw3EIICrPNTkNiw7asZtuWML1kq0UWKVZRU0B06C0pMsyH+ojJnzFUq3a8SQ/cRX8MbDpdxpV0OY5l5nwcCeYCaYSa2JGkf50INYKa7/hjLmYxWLXDKlIRBldp7sSRmBe8e9QA4NuHu5dWNApQ1pjn7MDK+x7e34aKc+OXONlSM3LA93EdkfShItW/DegDFWJ84lx/EJguBM5xPUW7NBpaiY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 16:06:17.7070 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c43826-9c36-42f3-524a-08d700998c38
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1843
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhHjB9mudCxQoG8EKtrTySt/yEpb8QAaIq4cprNwPaA=;
 b=Vjx2V5lyV1OAb77G+eP3gph4zgPdIr/Wi8DCKcqxedGk8BYWQGK3UniOl59URQfMAtaU3VanvHuGPNUJ7SLH5OJV534fmorTi+0M6WuxxndD9bqTNraNA21c0ZakDuMAxQBu3w82GJTV8T8JPrr9OODkLsxVaepjBdHFF/UV6lo=
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

RnJvbTogQm95dWFuIFpoYW5nIDxib3l1YW4uemhhbmdAYW1kLmNvbT4KCkFkZCBhbiBJQiB0ZXN0
IGZvciBqcGVnIGVuY29kZS4KClNpZ25lZC1vZmYtYnk6IEJveXVhbiBaaGFuZyA8Ym95dWFuLnpo
YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jIHwg
NzYgKysrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3Zjbi5oIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAu
YyAgIHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNzggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24u
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYwppbmRleCAxNTY4N2Ni
Yjc5OGIuLjAwNzIwN2EyZTc5OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Zjbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
Y24uYwpAQCAtODgzLDMgKzg4Myw3OSBAQCBpbnQgYW1kZ3B1X3Zjbl9qcGVnX2VuY19yaW5nX3Rl
c3RfcmluZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpCiAKIAlyZXR1cm4gcjsKIH0KKworc3Rh
dGljIGludCBhbWRncHVfdmNuX2pwZWdfZW5jX3NldF9yZWcoc3RydWN0IGFtZGdwdV9yaW5nICpy
aW5nLCB1aW50MzJfdCBoYW5kbGUsCisJCQkJCQkJCSAgIHN0cnVjdCBkbWFfZmVuY2UgKipmZW5j
ZSkKK3sKKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHJpbmctPmFkZXY7CisJc3RydWN0
IGFtZGdwdV9qb2IgKmpvYjsKKwlzdHJ1Y3QgYW1kZ3B1X2liICppYjsKKwlzdHJ1Y3QgZG1hX2Zl
bmNlICpmID0gTlVMTDsKKwljb25zdCB1bnNpZ25lZCBpYl9zaXplX2R3ID0gMTY7CisJaW50IGks
IHI7CisKKwlyID0gYW1kZ3B1X2pvYl9hbGxvY193aXRoX2liKHJpbmctPmFkZXYsIGliX3NpemVf
ZHcgKiA0LCAmam9iKTsKKwlpZiAocikKKwkJcmV0dXJuIHI7CisKKwlpYiA9ICZqb2ItPmlic1sw
XTsKKworCWliLT5wdHJbMF0gPSBQQUNLRVRKKGFkZXYtPnZjbi5pbnRlcm5hbC5qcGVnX2VuY19z
Y3JhdGNoMCwgMCwgMCwgUEFDS0VUSl9UWVBFMCk7CisJaWItPnB0clsxXSA9IDB4REVBREJFRUY7
CisJZm9yIChpID0gMjsgaSA8IDE2OyBpICs9IDIpIHsKKwkJaWItPnB0cltpXSA9IFBBQ0tFVEoo
MCwgMCwgMCwgUEFDS0VUSl9UWVBFNik7CisJCWliLT5wdHJbaSsxXSA9IDA7CisJfQorCWliLT5s
ZW5ndGhfZHcgPSAxNjsKKworCXIgPSBhbWRncHVfam9iX3N1Ym1pdF9kaXJlY3Qoam9iLCByaW5n
LCAmZik7CisJaWYgKHIpCisJCWdvdG8gZXJyOworCisJaWYgKGZlbmNlKQorCQkqZmVuY2UgPSBk
bWFfZmVuY2VfZ2V0KGYpOworCWRtYV9mZW5jZV9wdXQoZik7CisKKwlyZXR1cm4gMDsKKworZXJy
OgorCWFtZGdwdV9qb2JfZnJlZShqb2IpOworCXJldHVybiByOworfQorCitpbnQgYW1kZ3B1X3Zj
bl9qcGVnX2VuY19yaW5nX3Rlc3RfaWIoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCBsb25nIHRp
bWVvdXQpCit7CisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSByaW5nLT5hZGV2OworCXVp
bnQzMl90IHRtcCA9IDA7CisJdW5zaWduZWQgaTsKKwlzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSA9
IE5VTEw7CisJbG9uZyByID0gMDsKKworCXIgPSBhbWRncHVfdmNuX2pwZWdfZW5jX3NldF9yZWco
cmluZywgMSwgJmZlbmNlKTsKKwlpZiAocikKKwkJZ290byBlcnJvcjsKKworCXIgPSBkbWFfZmVu
Y2Vfd2FpdF90aW1lb3V0KGZlbmNlLCBmYWxzZSwgdGltZW91dCk7CisJaWYgKHIgPT0gMCkgewor
CQlyID0gLUVUSU1FRE9VVDsKKwkJZ290byBlcnJvcjsKKwl9IGVsc2UgaWYgKHIgPCAwKSB7CisJ
CWdvdG8gZXJyb3I7CisJfSBlbHNlIHsKKwkJciA9IDA7CisJfQorCisJZm9yIChpID0gMDsgaSA8
IGFkZXYtPnVzZWNfdGltZW91dDsgaSsrKSB7CisJCXRtcCA9IFJSRUczMihhZGV2LT52Y24uZXh0
ZXJuYWwuanBlZ19lbmNfc2NyYXRjaDApOworCQlpZiAodG1wID09IDB4REVBREJFRUYpCisJCQli
cmVhazsKKwkJRFJNX1VERUxBWSgxKTsKKwl9CisKKwlpZiAoaSA+PSBhZGV2LT51c2VjX3RpbWVv
dXQpCisJCXIgPSAtRVRJTUVET1VUOworCisJZG1hX2ZlbmNlX3B1dChmZW5jZSk7CitlcnJvcjoK
KwlyZXR1cm4gcjsKK30KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92Y24uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uaAppbmRl
eCA1MjhkOWQzZmE5MWMuLjhhNDA1YmQ0OGU4NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92Y24uaApAQCAtMTEzLDUgKzExMyw2IEBAIGludCBhbWRncHVfdmNuX2pwZWdfcmlu
Z190ZXN0X3Jpbmcoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKTsKIGludCBhbWRncHVfdmNuX2pw
ZWdfcmluZ190ZXN0X2liKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgbG9uZyB0aW1lb3V0KTsK
IAogaW50IGFtZGdwdV92Y25fanBlZ19lbmNfcmluZ190ZXN0X3Jpbmcoc3RydWN0IGFtZGdwdV9y
aW5nICpyaW5nKTsKK2ludCBhbWRncHVfdmNuX2pwZWdfZW5jX3JpbmdfdGVzdF9pYihzdHJ1Y3Qg
YW1kZ3B1X3JpbmcgKnJpbmcsIGxvbmcgdGltZW91dCk7CiAKICNlbmRpZgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3Zjbl92Ml8wLmMKaW5kZXggYWJkNzA4ZTBlMzA0Li5iNWM4MDExZTc4MTggMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYwpAQCAtMjE5Myw3ICsyMTkzLDcgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfcmluZ19mdW5jcyB2Y25fdjJfMF9qcGVnX2VuY19y
aW5nX3ZtX2Z1bmNzID0gewogCS5lbWl0X2ZlbmNlID0gdmNuX3YyXzBfanBlZ19lbmNfcmluZ19l
bWl0X2ZlbmNlLAogCS5lbWl0X3ZtX2ZsdXNoID0gdmNuX3YyXzBfanBlZ19lbmNfcmluZ19lbWl0
X3ZtX2ZsdXNoLAogCS50ZXN0X3JpbmcgPSBhbWRncHVfdmNuX2pwZWdfZW5jX3JpbmdfdGVzdF9y
aW5nLAotCS8vLnRlc3RfaWIKKwkudGVzdF9pYiA9IGFtZGdwdV92Y25fanBlZ19lbmNfcmluZ190
ZXN0X2liLAogCS5pbnNlcnRfbm9wID0gdmNuX3YyXzBfanBlZ19lbmNfcmluZ19ub3AsCiAJLmlu
c2VydF9zdGFydCA9IHZjbl92Ml8wX2pwZWdfZW5jX3JpbmdfaW5zZXJ0X3N0YXJ0LAogCS5pbnNl
cnRfZW5kID0gdmNuX3YyXzBfanBlZ19lbmNfcmluZ19pbnNlcnRfZW5kLAotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
