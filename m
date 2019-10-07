Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E072CED8F
	for <lists+amd-gfx@lfdr.de>; Mon,  7 Oct 2019 22:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B286E0D4;
	Mon,  7 Oct 2019 20:34:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750057.outbound.protection.outlook.com [40.107.75.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104C46E0D4
 for <amd-gfx@lists.freedesktop.org>; Mon,  7 Oct 2019 20:34:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PgBciJ+JzCEpshn/1Cp/4YMXNAMz0A6MNVydDsNVHkFnb1fMjRRtDFpp/mcgzE7/FMOO/5KnOJJR0/Sj6qb1PMaJ14DX/7xoBc30A+vNU4oWdbzVachVCautS32zlc/000fzGv9wUGhBr6j0sPIx7nX2hPX1FsLN0W9gzgMMF5IX/9nVheGPEUxzy1EedfIP6BSIjhJQojE1zNwOEdntj4C47XQZpkyfkwrP6vpdTHr0c2BhNyysrptWMeBtwZiO6/CvfB8+N1vVYzPMGKiEti0rSGPBSgmKvfpVv17neTLh0mmu5fSjzNlpXCiwdwmSfCt7ZZrgMtbvMsAOCbaOuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7VwtZfuuFlgXKJh/AsIh2HLcgzf8vdvK3Kb6zezO34=;
 b=aK+W4GBRo9Ng09teSy0kg1JhLnxjD+6pPKVugbkENZtJP3ZwBk/Qw/6J64DnUcYlVaS2vKyBcVoP0Upq88OOuweFVODQg1ylpQrqZyfuEu1ldCKCjWUlFOw0e9Tmh3NRfgzqBQiUcUG+oE9O3fjvuHFiKGIHdEQ9gI6rvEddXhRgq4RAimQM2PayJxPXt2SBXotuhAceecKSvOd7uy9eXx8FqJZLKliFdO/bRkCbJ2e7A5jPAf2bfr45eSad1/1fxcGgABA71X2toB6VF4HDuwdfrUQX9q4h7VA5KaXsKViXHfClP6s2cHm4BuoW5009JYQ0aGwsnbFjsGH5NkDZ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2515.namprd12.prod.outlook.com (52.132.28.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 20:34:15 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::145c:4149:8b99:c3b4]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::145c:4149:8b99:c3b4%6]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 20:34:15 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu: Clean up gmc_v9_0_gart_enable
Thread-Topic: [PATCH 1/2] drm/amdgpu: Clean up gmc_v9_0_gart_enable
Thread-Index: AQHVfU6W6w/6gucWDEW6yQGGkh9WkQ==
Date: Mon, 7 Oct 2019 20:34:15 +0000
Message-ID: <1570480448-29861-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::38) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7241a1b9-ca4e-4599-0af0-08d74b65b871
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BL0PR12MB2515:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR12MB25159C1CAF2845E908D7C44C809B0@BL0PR12MB2515.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(189003)(199004)(102836004)(6486002)(54906003)(386003)(2501003)(71190400001)(2616005)(4326008)(71200400001)(6506007)(5660300002)(256004)(6916009)(14454004)(8936002)(5640700003)(305945005)(186003)(6116002)(2906002)(50226002)(14444005)(26005)(3846002)(478600001)(6512007)(486006)(476003)(6436002)(66066001)(36756003)(316002)(66946007)(86362001)(2351001)(25786009)(52116002)(99286004)(8676002)(64756008)(66556008)(66446008)(7736002)(81166006)(81156014)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2515;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p1VJANBzj4CfLRTOfMRQDksER0nEOreu576K/aU0JB07V6uCd2kJL94SmBqVwH1bwOSf6tuI60Zi3Y1OVOYlJTf0cum2RnLT3Dx1jrVq7WaPh/mkeoDDKp2JbtecLWQmIaL2EVHy1nFMZ0emFmbvRHkFmX1lnWGBnP3GG2kBo4ZgL/x98elRgRwJLB5eltsRa/cewg8cN4fVePfDbIsAoo0SJJRutsQzKHKtOXcLoJMbHLclTtKPK6Phoh8NNdhH/g/4zKgTAHUG4UOWbwg0aj05+XHQaIwgOKe0XY8vKAH0qHagTpDfGUXNK+x45aD4kN0ADJpUbsCWFLDv9A1fwATX/b9UlyaqSxa2kX0ges5Q0eissFM2cyZcARXQbadskDZmVA4MWEqWmcncjQg8PfDtzZ+yyb2IpicU/w95SYM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7241a1b9-ca4e-4599-0af0-08d74b65b871
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 20:34:15.6829 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vkaSMDlEtXyoBr1uXJAa/25cQH7y/LSrLV4EkcUepqTIz761jMUrBodoXmRAANqA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2515
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7VwtZfuuFlgXKJh/AsIh2HLcgzf8vdvK3Kb6zezO34=;
 b=dGBtBY9f+TiBc65e8PoqVTK5ZI/GY24aCd0609MGvZTvdUjQlAmwi9EjXcCkTElfELUvjvq8+MM7N19EkxEsomBIm2a2HdXbJmwrf9MgmaKSDNtpS/K6ALrbJbxThk6bQWHjvImiXtEz7UGofR4OEfLKaOOqeHpkcZ5+KTv3ghc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TWFueSBsb2dpYyBpbiB0aGlzIGZ1bmN0aW9uIGFyZSBIRFAgc2V0IHVwLApub3QgZ2FydCBzZXQg
dXAuIE1vdmVkIHRob3NlIGxvZ2ljIHRvIGdtY192OV8wX2h3X2luaXQuCk5vIGZ1bmN0aW9uYWwg
Y2hhbmdlLgoKQ2hhbmdlLUlkOiBJYjAwY2MxZmZkMWU0ODZlNzc1NzE3OTZkY2U1M2FhNzUwNmMw
YzU1ZgpTaWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIHwgODIgKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCA0MSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwppbmRleCA0YjEx
ZjdlLi5jN2UwN2YxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKQEAgLTEx
MzUsMTMgKzExMzUsNyBAQCBzdGF0aWMgdm9pZCBnbWNfdjlfMF9pbml0X2dvbGRlbl9yZWdpc3Rl
cnMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAgKi8KIHN0YXRpYyBpbnQgZ21jX3Y5XzBf
Z2FydF9lbmFibGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7Ci0JaW50IHIsIGk7Ci0J
Ym9vbCB2YWx1ZTsKLQl1MzIgdG1wOwotCi0JYW1kZ3B1X2RldmljZV9wcm9ncmFtX3JlZ2lzdGVy
X3NlcXVlbmNlKGFkZXYsCi0JCQkJCQlnb2xkZW5fc2V0dGluZ3NfdmVnYTEwX2hkcCwKLQkJCQkJ
CUFSUkFZX1NJWkUoZ29sZGVuX3NldHRpbmdzX3ZlZ2ExMF9oZHApKTsKKwlpbnQgcjsKIAogCWlm
IChhZGV2LT5nYXJ0LmJvID09IE5VTEwpIHsKIAkJZGV2X2VycihhZGV2LT5kZXYsICJObyBWUkFN
IG9iamVjdCBmb3IgUENJRSBHQVJULlxuIik7CkBAIC0xMTUxLDE1ICsxMTQ1LDYgQEAgc3RhdGlj
IGludCBnbWNfdjlfMF9nYXJ0X2VuYWJsZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlp
ZiAocikKIAkJcmV0dXJuIHI7CiAKLQlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgewotCWNhc2Ug
Q0hJUF9SQVZFTjoKLQkJLyogVE9ETyBmb3IgcmVub2lyICovCi0JCW1taHViX3YxXzBfdXBkYXRl
X3Bvd2VyX2dhdGluZyhhZGV2LCB0cnVlKTsKLQkJYnJlYWs7Ci0JZGVmYXVsdDoKLQkJYnJlYWs7
Ci0JfQotCiAJciA9IGdmeGh1Yl92MV8wX2dhcnRfZW5hYmxlKGFkZXYpOwogCWlmIChyKQogCQly
ZXR1cm4gcjsKQEAgLTExNzEsNiArMTE1Niw0NiBAQCBzdGF0aWMgaW50IGdtY192OV8wX2dhcnRf
ZW5hYmxlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWlmIChyKQogCQlyZXR1cm4gcjsK
IAorCURSTV9JTkZPKCJQQ0lFIEdBUlQgb2YgJXVNIGVuYWJsZWQgKHRhYmxlIGF0IDB4JTAxNmxs
WCkuXG4iLAorCQkgKHVuc2lnbmVkKShhZGV2LT5nbWMuZ2FydF9zaXplID4+IDIwKSwKKwkJICh1
bnNpZ25lZCBsb25nIGxvbmcpYW1kZ3B1X2JvX2dwdV9vZmZzZXQoYWRldi0+Z2FydC5ibykpOwor
CWFkZXYtPmdhcnQucmVhZHkgPSB0cnVlOworCXJldHVybiAwOworfQorCitzdGF0aWMgaW50IGdt
Y192OV8wX2h3X2luaXQodm9pZCAqaGFuZGxlKQoreworCWludCByLCBpOworCWJvb2wgdmFsdWU7
CisJdTMyIHRtcDsKKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqKWhhbmRsZTsKKworCS8qIFRoZSBzZXF1ZW5jZSBvZiB0aGVzZSB0d28gZnVuY3Rp
b24gY2FsbHMgbWF0dGVycy4qLworCWdtY192OV8wX2luaXRfZ29sZGVuX3JlZ2lzdGVycyhhZGV2
KTsKKworCWlmIChhZGV2LT5tb2RlX2luZm8ubnVtX2NydGMpIHsKKwkJaWYgKGFkZXYtPmFzaWNf
dHlwZSAhPSBDSElQX0FSQ1RVUlVTKSB7CisJCQkvKiBMb2Nrb3V0IGFjY2VzcyB0aHJvdWdoIFZH
QSBhcGVydHVyZSovCisJCQlXUkVHMzJfRklFTEQxNShEQ0UsIDAsIFZHQV9IRFBfQ09OVFJPTCwg
VkdBX01FTU9SWV9ESVNBQkxFLCAxKTsKKworCQkJLyogZGlzYWJsZSBWR0EgcmVuZGVyICovCisJ
CQlXUkVHMzJfRklFTEQxNShEQ0UsIDAsIFZHQV9SRU5ERVJfQ09OVFJPTCwgVkdBX1ZTVEFUVVNf
Q05UTCwgMCk7CisJCX0KKwl9CisKKwlhbWRncHVfZGV2aWNlX3Byb2dyYW1fcmVnaXN0ZXJfc2Vx
dWVuY2UoYWRldiwKKwkJCQkJCWdvbGRlbl9zZXR0aW5nc192ZWdhMTBfaGRwLAorCQkJCQkJQVJS
QVlfU0laRShnb2xkZW5fc2V0dGluZ3NfdmVnYTEwX2hkcCkpOworCisJc3dpdGNoIChhZGV2LT5h
c2ljX3R5cGUpIHsKKwljYXNlIENISVBfUkFWRU46CisJCS8qIFRPRE8gZm9yIHJlbm9pciAqLwor
CQltbWh1Yl92MV8wX3VwZGF0ZV9wb3dlcl9nYXRpbmcoYWRldiwgdHJ1ZSk7CisJCWJyZWFrOwor
CWRlZmF1bHQ6CisJCWJyZWFrOworCX0KKwogCVdSRUczMl9GSUVMRDE1KEhEUCwgMCwgSERQX01J
U0NfQ05UTCwgRkxVU0hfSU5WQUxJREFURV9DQUNIRSwgMSk7CiAKIAl0bXAgPSBSUkVHMzJfU09D
MTUoSERQLCAwLCBtbUhEUF9IT1NUX1BBVEhfQ05UTCk7CkBAIC0xMTk5LDMxICsxMjI0LDYgQEAg
c3RhdGljIGludCBnbWNfdjlfMF9nYXJ0X2VuYWJsZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dikKIAlpZiAoYWRldi0+dW1jLmZ1bmNzICYmIGFkZXYtPnVtYy5mdW5jcy0+aW5pdF9yZWdpc3Rl
cnMpCiAJCWFkZXYtPnVtYy5mdW5jcy0+aW5pdF9yZWdpc3RlcnMoYWRldik7CiAKLQlEUk1fSU5G
TygiUENJRSBHQVJUIG9mICV1TSBlbmFibGVkICh0YWJsZSBhdCAweCUwMTZsbFgpLlxuIiwKLQkJ
ICh1bnNpZ25lZCkoYWRldi0+Z21jLmdhcnRfc2l6ZSA+PiAyMCksCi0JCSAodW5zaWduZWQgbG9u
ZyBsb25nKWFtZGdwdV9ib19ncHVfb2Zmc2V0KGFkZXYtPmdhcnQuYm8pKTsKLQlhZGV2LT5nYXJ0
LnJlYWR5ID0gdHJ1ZTsKLQlyZXR1cm4gMDsKLX0KLQotc3RhdGljIGludCBnbWNfdjlfMF9od19p
bml0KHZvaWQgKmhhbmRsZSkKLXsKLQlpbnQgcjsKLQlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsKLQotCS8qIFRoZSBzZXF1ZW5jZSBv
ZiB0aGVzZSB0d28gZnVuY3Rpb24gY2FsbHMgbWF0dGVycy4qLwotCWdtY192OV8wX2luaXRfZ29s
ZGVuX3JlZ2lzdGVycyhhZGV2KTsKLQotCWlmIChhZGV2LT5tb2RlX2luZm8ubnVtX2NydGMpIHsK
LQkJaWYgKGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX0FSQ1RVUlVTKSB7Ci0JCQkvKiBMb2Nrb3V0
IGFjY2VzcyB0aHJvdWdoIFZHQSBhcGVydHVyZSovCi0JCQlXUkVHMzJfRklFTEQxNShEQ0UsIDAs
IFZHQV9IRFBfQ09OVFJPTCwgVkdBX01FTU9SWV9ESVNBQkxFLCAxKTsKLQotCQkJLyogZGlzYWJs
ZSBWR0EgcmVuZGVyICovCi0JCQlXUkVHMzJfRklFTEQxNShEQ0UsIDAsIFZHQV9SRU5ERVJfQ09O
VFJPTCwgVkdBX1ZTVEFUVVNfQ05UTCwgMCk7Ci0JCX0KLQl9Ci0KIAlyID0gZ21jX3Y5XzBfZ2Fy
dF9lbmFibGUoYWRldik7CiAKIAlyZXR1cm4gcjsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
