Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 111BA33D3A
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 04:35:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5AB892D7;
	Tue,  4 Jun 2019 02:35:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690054.outbound.protection.outlook.com [40.107.69.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA478892D7
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 02:34:58 +0000 (UTC)
Received: from DM3PR12CA0110.namprd12.prod.outlook.com (2603:10b6:0:55::30) by
 BYAPR12MB2664.namprd12.prod.outlook.com (2603:10b6:a03:69::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Tue, 4 Jun 2019 02:34:56 +0000
Received: from CO1NAM03FT056.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by DM3PR12CA0110.outlook.office365.com
 (2603:10b6:0:55::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.16 via Frontend
 Transport; Tue, 4 Jun 2019 02:34:55 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT056.mail.protection.outlook.com (10.152.81.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1943.19 via Frontend Transport; Tue, 4 Jun 2019 02:34:55 +0000
Received: from prike.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Mon, 3 Jun
 2019 21:34:53 -0500
From: Prike Liang <Prike.Liang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Ray.Huang@amd.com>, <evan.quan@amd.com>
Subject: [PATCH v2 2/2] drm/amd/amdgpu: add RLC firmware to support raven1
 refresh
Date: Tue, 4 Jun 2019 10:34:38 +0800
Message-ID: <1559615678-11700-1-git-send-email-Prike.Liang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.34.1.3]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(346002)(39860400002)(376002)(136003)(2980300002)(428003)(199004)(189003)(478600001)(3846002)(6116002)(2906002)(14444005)(7696005)(51416003)(26005)(6666004)(81166006)(81156014)(8676002)(5660300002)(356004)(50466002)(8936002)(186003)(16526019)(77096007)(486006)(72206003)(305945005)(7736002)(426003)(336012)(50226002)(126002)(476003)(2616005)(68736007)(70206006)(86362001)(316002)(53416004)(6636002)(48376002)(70586007)(16586007)(53936002)(110136005)(4326008)(2201001)(36756003)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2664; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa031c10-5e5f-4d29-6823-08d6e8953af8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BYAPR12MB2664; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2664:
X-Microsoft-Antispam-PRVS: <BYAPR12MB26645F46EA37B8BE144AD26CFB150@BYAPR12MB2664.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:350;
X-Forefront-PRVS: 0058ABBBC7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ViXttP8omRpc5dxlTpE7JxM9URGICuavAy1vicgXx08/Ka1uZwwB95liPINVcmwfYoMYZUN1M13LVhy1hxHGft7hMAc8L8g2aFhApfqTFvygJ3Oq+izAJRPg7naPhEsDpGRtpjezmzsXuerppKZuetqMVfVIprt8OpUKP5apDmd20XXdBjMjEbQgpJWX4Q2ZmJ9maSQJkDRStoH4FG/LEm4gEsIpkkstgkGVNxsiZZ4fYm5rxt0rMSr/DsG3CY3forRffwQVcNTjJroV8Fnvbbe0xGxF4aNtoVBciJH+3bJirhkmpxzLWkIibMl0tDAmbQonESmU8aE4qOr4Bl62TxrfiREgJEdLobu5ADRLSiEItVMOnmQG+CDHkaRqdXlc/yPHlNWgHXaFaQHm61ug4LfRfXbA/uF34w/tIV1ZATU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2019 02:34:55.4651 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa031c10-5e5f-4d29-6823-08d6e8953af8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2664
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnYfvpprisaLDSjCLSG51gtaPiK7np0Jzn/RICevR6E=;
 b=Khih8/WKgofQkvE75dAEq9PsxNs0BMvkVYZE0TkRnZuJVR26Vy9ViHBjkw9XMxNCr/V+B4nLo5Ra/TapYkqoe0wwZBIeQxf4UTE50NsklubjWqcFNHEm9Lks0z2Eta2YrzbicHbnPegP05z65lOePE+BkB5yO1uHV00leyEj20E=
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
Cc: Prike Liang <Prike.Liang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VXNlIFNNVSBmaXJtd2FyZSB2ZXJzaW9uIHRvIGluZGVudGlmeSB0aGUgcmF2ZW4xIHJlZnJlc2gg
ZGV2aWNlIGFuZAp0aGVuIGxvYWQgaG9tb2xvZ291cyBSTEMgRlcuCgpDaGFuZ2UtSWQ6IEk3YWFh
NjdkOGI1OWNmZWMwMzM1NWQ5MTk5ZjdmYjJjMzBjZTM5ODU2ClNpZ25lZC1vZmYtYnk6IFByaWtl
IExpYW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPgpTdWdnZXN0ZWQtYnk6IEh1YW5nIFJ1aTxSYXku
SHVhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgMTIgKysr
LS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYyAgICAgfCAx
NSArKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5o
ICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgICAgICB8
IDEyICsrKysrKysrKysrLQogNCBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAxMCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMK
aW5kZXggZDAwZmQ1ZC4uMDIxMmM5ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYwpAQCAtMTYzMSw2ICsxNjMxLDcgQEAgc3RhdGljIGludCBhbWRncHVfZGV2
aWNlX2Z3X2xvYWRpbmcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CiAJaW50IHIgPSAw
OwogCWludCBpOworCXVpbnQzMl90IHNtdV92ZXJzaW9uOwogCiAJaWYgKGFkZXYtPmFzaWNfdHlw
ZSA+PSBDSElQX1ZFR0ExMCkgewogCQlmb3IgKGkgPSAwOyBpIDwgYWRldi0+bnVtX2lwX2Jsb2Nr
czsgaSsrKSB7CkBAIC0xNjU2LDE2ICsxNjU3LDkgQEAgc3RhdGljIGludCBhbWRncHVfZGV2aWNl
X2Z3X2xvYWRpbmcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCQl9CiAJCX0KIAl9CisJ
ciA9IGFtZGdwdV9wbV9sb2FkX3NtdV9maXJtd2FyZShhZGV2LCAmc211X3ZlcnNpb24pOwogCi0J
aWYgKGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcyAmJiBhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3Mt
PmxvYWRfZmlybXdhcmUpIHsKLQkJciA9IGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+bG9hZF9m
aXJtd2FyZShhZGV2LT5wb3dlcnBsYXkucHBfaGFuZGxlKTsKLQkJaWYgKHIpIHsKLQkJCXByX2Vy
cigiZmlybXdhcmUgbG9hZGluZyBmYWlsZWRcbiIpOwotCQkJcmV0dXJuIHI7Ci0JCX0KLQl9Ci0K
LQlyZXR1cm4gMDsKKwlyZXR1cm4gcjsKIH0KIAogLyoqCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9wbS5jCmluZGV4IGE3M2UxOTAuLjIxYjViZTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9wbS5jCkBAIC0yNjk4LDYgKzI2OTgsMjEgQEAgdm9pZCBhbWRncHVfcG1f
cHJpbnRfcG93ZXJfc3RhdGVzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCiB9CiAKK2lu
dCBhbWRncHVfcG1fbG9hZF9zbXVfZmlybXdhcmUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
IHVpbnQzMl90ICpzbXVfdmVyc2lvbikKK3sKKwlpbnQgciA9IC1FSU5WQUw7CisKKwlpZiAoYWRl
di0+cG93ZXJwbGF5LnBwX2Z1bmNzICYmIGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+bG9hZF9m
aXJtd2FyZSkgeworCQlyID0gYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzLT5sb2FkX2Zpcm13YXJl
KGFkZXYtPnBvd2VycGxheS5wcF9oYW5kbGUpOworCQlpZiAocikgeworCQkJcHJfZXJyKCJzbXUg
ZmlybXdhcmUgbG9hZGluZyBmYWlsZWRcbiIpOworCQkJcmV0dXJuIHI7CisJCX0KKwkJKnNtdV92
ZXJzaW9uID0gYWRldi0+cG0uZndfdmVyc2lvbjsKKwl9CisJcmV0dXJuIHI7Cit9CisKIGludCBh
bWRncHVfcG1fc3lzZnNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKIAlzdHJ1
Y3QgcHBfaHdtZ3IgKmh3bWdyID0gYWRldi0+cG93ZXJwbGF5LnBwX2hhbmRsZTsKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmgKaW5kZXggZjIxYTc3MS4uN2ZmMGU3NiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmgKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmgKQEAgLTM0LDYgKzM0LDcgQEAgdm9pZCBh
bWRncHVfcG1fYWNwaV9ldmVudF9oYW5kbGVyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsK
IGludCBhbWRncHVfcG1fc3lzZnNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiB2
b2lkIGFtZGdwdV9wbV9zeXNmc19maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKIHZv
aWQgYW1kZ3B1X3BtX3ByaW50X3Bvd2VyX3N0YXRlcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dik7CitpbnQgYW1kZ3B1X3BtX2xvYWRfc211X2Zpcm13YXJlKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LCB1aW50MzJfdCAqc211X3ZlcnNpb24pOwogdm9pZCBhbWRncHVfcG1fY29tcHV0ZV9j
bG9ja3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogdm9pZCBhbWRncHVfZHBtX3RoZXJt
YWxfd29ya19oYW5kbGVyKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yayk7CiB2b2lkIGFtZGdwdV9k
cG1fZW5hYmxlX3V2ZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgYm9vbCBlbmFibGUpOwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKaW5kZXggMmU5Y2FjMS4uNmZlMDNkNyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCkBAIC0yOCw2ICsyOCw3IEBACiAj
aW5jbHVkZSAic29jMTUuaCIKICNpbmNsdWRlICJzb2MxNWQuaCIKICNpbmNsdWRlICJhbWRncHVf
YXRvbWZpcm13YXJlLmgiCisjaW5jbHVkZSAiYW1kZ3B1X3BtLmgiCiAKICNpbmNsdWRlICJnYy9n
Y185XzBfb2Zmc2V0LmgiCiAjaW5jbHVkZSAiZ2MvZ2NfOV8wX3NoX21hc2suaCIKQEAgLTk3LDYg
Kzk4LDcgQEAgTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvcmF2ZW4yX21lLmJpbiIpOwogTU9EVUxF
X0ZJUk1XQVJFKCJhbWRncHUvcmF2ZW4yX21lYy5iaW4iKTsKIE1PRFVMRV9GSVJNV0FSRSgiYW1k
Z3B1L3JhdmVuMl9tZWMyLmJpbiIpOwogTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvcmF2ZW4yX3Js
Yy5iaW4iKTsKK01PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L3JhdmVuX2tpY2tlcl9ybGMuYmluIik7
CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc29jMTVfcmVnX2dvbGRlbiBnb2xkZW5fc2V0dGluZ3Nf
Z2NfOV8wW10gPQogewpAQCAtNTkxLDcgKzU5Myw4IEBAIHN0YXRpYyB2b2lkIGdmeF92OV8wX2No
ZWNrX2lmX25lZWRfZ2Z4b2ZmKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWNhc2UgQ0hJ
UF9SQVZFTjoKIAkJaWYgKGFkZXYtPnJldl9pZCA+PSAweDggfHwgYWRldi0+cGRldi0+ZGV2aWNl
ID09IDB4MTVkOCkKIAkJCWJyZWFrOwotCQlpZiAoKGFkZXYtPmdmeC5ybGNfZndfdmVyc2lvbiA8
IDUzMSkgfHwKKwkJaWYgKChhZGV2LT5nZngucmxjX2Z3X3ZlcnNpb24gIT0gMTA2ICYmCisJCSAg
ICAgYWRldi0+Z2Z4LnJsY19md192ZXJzaW9uIDwgNTMxKSB8fAogCQkgICAgKGFkZXYtPmdmeC5y
bGNfZndfdmVyc2lvbiA9PSA1MzgxNSkgfHwKIAkJICAgIChhZGV2LT5nZngucmxjX2ZlYXR1cmVf
dmVyc2lvbiA8IDEpIHx8CiAJCSAgICAhYWRldi0+Z2Z4LnJsYy5pc19ybGNfdjJfMSkKQEAgLTYx
NSw2ICs2MTgsNyBAQCBzdGF0aWMgaW50IGdmeF92OV8wX2luaXRfbWljcm9jb2RlKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQogCXVuc2lnbmVkIGludCBpID0gMDsKIAl1aW50MTZfdCB2ZXJz
aW9uX21ham9yOwogCXVpbnQxNl90IHZlcnNpb25fbWlub3I7CisJdWludDMyX3Qgc211X3ZlcnNp
b247CiAKIAlEUk1fREVCVUcoIlxuIik7CiAKQEAgLTY4NSw2ICs2ODksMTIgQEAgc3RhdGljIGlu
dCBnZnhfdjlfMF9pbml0X21pY3JvY29kZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJ
KCgoYWRldi0+cGRldi0+cmV2aXNpb24gPj0gMHhDOCkgJiYgKGFkZXYtPnBkZXYtPnJldmlzaW9u
IDw9IDB4Q0YpKSB8fAogCQkoKGFkZXYtPnBkZXYtPnJldmlzaW9uID49IDB4RDgpICYmIChhZGV2
LT5wZGV2LT5yZXZpc2lvbiA8PSAweERGKSkpKQogCQlzbnByaW50Zihmd19uYW1lLCBzaXplb2Yo
ZndfbmFtZSksICJhbWRncHUvJXNfcmxjX2FtNC5iaW4iLCBjaGlwX25hbWUpOworCWVsc2UgaWYg
KCFzdHJjbXAoY2hpcF9uYW1lLCAicmF2ZW4iKSAmJiAoYW1kZ3B1X3BtX2xvYWRfc211X2Zpcm13
YXJlKGFkZXYsICZzbXVfdmVyc2lvbikgPT0gMCkgJiYKKwkJKHNtdV92ZXJzaW9uID49IDB4NDFl
MmIpKQorCQkvKioKKwkJKlNNQyBpcyBsb2FkZWQgYnkgU0JJT1Mgb24gQVBVIGFuZCBpdCdzIGFi
bGUgdG8gZ2V0IHRoZSBTTVUgdmVyc2lvbiBkaXJlY3RseS4KKwkJKi8KKwkJc25wcmludGYoZndf
bmFtZSwgc2l6ZW9mKGZ3X25hbWUpLCAiYW1kZ3B1LyVzX2tpY2tlcl9ybGMuYmluIiwgY2hpcF9u
YW1lKTsKIAllbHNlCiAJCXNucHJpbnRmKGZ3X25hbWUsIHNpemVvZihmd19uYW1lKSwgImFtZGdw
dS8lc19ybGMuYmluIiwgY2hpcF9uYW1lKTsKIAllcnIgPSByZXF1ZXN0X2Zpcm13YXJlKCZhZGV2
LT5nZngucmxjX2Z3LCBmd19uYW1lLCBhZGV2LT5kZXYpOwotLSAKMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
