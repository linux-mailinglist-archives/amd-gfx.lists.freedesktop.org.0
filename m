Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 911D0CAF7A
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2019 21:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E376EA70;
	Thu,  3 Oct 2019 19:44:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760078.outbound.protection.outlook.com [40.107.76.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96AC6EA70
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 19:44:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyj4Wy2bTTig8spTETbjVZXErk63bz3ekZ8F4hULFZsZvNO0yKB7wuyhrLC21AOHC+pJ4Deg04kVAKcEY2CRks0faZXOFysPFvzroJ5C/p6XdSNRp/+6PKETKQr9peas/nNQHCfTmKYnLMXgE8t4S4AmARvhYJSr6bLuLAQu3i/uv/XL667n8vhp6VzpBClPfMAwHacuKY9TUzOXpZNosekVnvCh4OGkhsmKUNkjtl/LXUU8PSqBwoBGir9s3Y+yGla6Yu2NsMegsmJKI42eHr2HFVf9lb+SsjyENLuG6f1CXMCW/b02IkDfvUgHJMnRSutHVAa8522HaTV0FCa9nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxMe8aQrzreX7RzNLo3WJVLTBmaeQQE5NGdFPnWYaf4=;
 b=Lo3w8aOlM/uojliHtE7Mimh5viVz5W2R+pOax2ALx3qEPAXYhmpUHwe0TclK2vfrq235kncQ88elha+kp6+MEB50WgQu7gwRvXE1aXX0TavyvvvDG9RwksPVPCRuefoupPl9EhiRN0WjO1sMZppsuwlJUDe2eoiP/uHb7eKa71clpMIKliA+V5eGcA6rk9cN4LttvNNtz8T27A9w7Ej/KEy3MKAT7UXLJ1uyDieAf113yUPQrCh3nHpU0BaKtvslveoe2ySQVgx7OAdrA0G4cDYZ2qNyD/G/hydjK2AmCkbki49NmgJf5xc53hCshEq+qnXp6EUSXxFBm4tfekm6Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1374.namprd12.prod.outlook.com (10.169.206.9) by
 MWHPR12MB1661.namprd12.prod.outlook.com (10.172.49.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 3 Oct 2019 19:44:38 +0000
Received: from MWHPR12MB1374.namprd12.prod.outlook.com
 ([fe80::b99b:3d36:80fa:1192]) by MWHPR12MB1374.namprd12.prod.outlook.com
 ([fe80::b99b:3d36:80fa:1192%7]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 19:44:38 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "thej^C@gmail.com" <thej^C@gmail.com>
Subject: [PATCH] drm/amdgpu: user pages array memory leak fix
Thread-Topic: [PATCH] drm/amdgpu: user pages array memory leak fix
Thread-Index: AQHVeiL9DA79jEoNj0W1Xmdl96gb6Q==
Date: Thu, 3 Oct 2019 19:44:37 +0000
Message-ID: <20191003194423.14468-1-Philip.Yang@amd.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::29) To MWHPR12MB1374.namprd12.prod.outlook.com
 (2603:10b6:300:12::9)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8368449-e590-4180-c55d-08d7483a1fef
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MWHPR12MB1661:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1661E12524E86ED9394F0512E69F0@MWHPR12MB1661.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:137;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(189003)(199004)(5660300002)(486006)(86362001)(476003)(81166006)(2501003)(81156014)(4326008)(8936002)(966005)(66066001)(25786009)(8676002)(7736002)(50226002)(2616005)(14454004)(6512007)(386003)(6506007)(1076003)(6116002)(36756003)(305945005)(316002)(110136005)(478600001)(99286004)(3846002)(66476007)(6486002)(186003)(6436002)(256004)(52116002)(66556008)(64756008)(66446008)(6306002)(14444005)(26005)(102836004)(66946007)(71200400001)(2906002)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1661;
 H:MWHPR12MB1374.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JVjmfoG6Vx8VVjsEsEzEP2NQmN6MW9xfUGWNOo6iWEWB3RHRxUlBSAinVnblGVDPPDMwdIshQcp9+Jc2B7Rf446hL+m4QJSxsrMt3OAqRfaiQoRd5gYbREkJ4hXI30IpkPKj1/V9s7UN+WJmV0Xkebtpr9QICfvpBPZ9hCRdnbDwD/tYBTG28Qw3+KSZ5brdCo8aRXFGPFM7vVlJjTQXLceiI+UNFGsGzpG3HL0GdBkxYbQjhhSn65nDUaHVEgGpDzAuIOUJunOzLNGlmQqimDc9x2tN7dothH/egEPD+wfKR0k9dnEACHM7VcYuMt01S3M9C8Z/AhEqul/AlaR2yRqDZ0TTSqvX+51rQJz5KNHCEsdaxZ3H5ya8jbqDZAYWysdRsLRDcHjkz6asLFbI1R8pc2xQBCFQn9leCVZ5VkDwMjncLLMaTIgkHStCS8BU/s2ZBYN+HTO7MvHUgOM81Q==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8368449-e590-4180-c55d-08d7483a1fef
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 19:44:38.0083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vStqKAyFv2Ct28ltlZMZAhjEveISyGf20LKHnpRbXVpgNQRBusO8SfEFO8GdyUoJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1661
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxMe8aQrzreX7RzNLo3WJVLTBmaeQQE5NGdFPnWYaf4=;
 b=z9tt9yxLUCzyxTlfGHmnsRQx83wgS2NMFh9MBio4bkTZoRGSqgjG18UdQBySkisJJFx5ouWrGL/GTjaU2CysUqT8bXpwYUlwRnN0ipv+bZTnBjjdw+MXNVWe6+L+ZckHAWUBcPHaFzJnQJggUNrmK8z63ciFOnJP8autWB/ZIvY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dXNlcl9wYWdlcyBhcnJheSBzaG91bGQgYWx3YXlzIGJlIGZyZWVkIGFmdGVyIHZhbGlkYXRpb24g
cmVnYXJkbGVzcyBpZgp1c2VyIHBhZ2VzIGFyZSBjaGFuZ2VkIGFmdGVyIGJvIGlzIGNyZWF0ZWQg
YmVjYXVzZSB3aXRoIEhNTSBjaGFuZ2UgcGFyc2UKYm8gYWx3YXlzIGFsbG9jYXRlIHVzZXIgcGFn
ZXMgYXJyYXkgdG8gZ2V0IHVzZXIgcGFnZXMgZm9yIHVzZXJwdHIgYm8uCgpEb24ndCBuZWVkIHRv
IGdldCB1c2VyIHBhZ2VzIHdoaWxlIGNyZWF0aW5nIHVlcnB0ciBibyBiZWNhdXNlIHVzZXIgcGFn
ZXMKd2lsbCBvbmx5IGJlIHVzZWQgd2hpbGUgdmFsaWRhdGluZyBhZnRlciBwYXJzaW5nIHVzZXJw
dHIgYm8uCgpCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvdWJ1bnR1Lytzb3Vy
Y2UvbGludXgvK2J1Zy8xODQ0OTYyCgp2MjogcmVtb3ZlIHVudXNlZCBsb2NhbCB2YXJpYWJsZSBh
bmQgYW1lbmQgY29tbWl0CgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXAgWWFuZyA8UGhpbGlwLllhbmdA
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyAgfCAg
NCArLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMgfCAyMyArLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDI1
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9jcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMKaW5kZXgg
NDliNzY3YjcyMzhmLi45NjExODZlNzExM2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9jcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9jcy5jCkBAIC00NzQsNyArNDc0LDYgQEAgc3RhdGljIGludCBhbWRncHVfY3NfbGlzdF92
YWxpZGF0ZShzdHJ1Y3QgYW1kZ3B1X2NzX3BhcnNlciAqcCwKIAogCWxpc3RfZm9yX2VhY2hfZW50
cnkobG9iaiwgdmFsaWRhdGVkLCB0di5oZWFkKSB7CiAJCXN0cnVjdCBhbWRncHVfYm8gKmJvID0g
dHRtX3RvX2FtZGdwdV9ibyhsb2JqLT50di5ibyk7Ci0JCWJvb2wgYmluZGluZ191c2VycHRyID0g
ZmFsc2U7CiAJCXN0cnVjdCBtbV9zdHJ1Y3QgKnVzZXJtbTsKIAogCQl1c2VybW0gPSBhbWRncHVf
dHRtX3R0X2dldF91c2VybW0oYm8tPnRiby50dG0pOwpAQCAtNDkxLDE0ICs0OTAsMTMgQEAgc3Rh
dGljIGludCBhbWRncHVfY3NfbGlzdF92YWxpZGF0ZShzdHJ1Y3QgYW1kZ3B1X2NzX3BhcnNlciAq
cCwKIAogCQkJYW1kZ3B1X3R0bV90dF9zZXRfdXNlcl9wYWdlcyhiby0+dGJvLnR0bSwKIAkJCQkJ
CSAgICAgbG9iai0+dXNlcl9wYWdlcyk7Ci0JCQliaW5kaW5nX3VzZXJwdHIgPSB0cnVlOwogCQl9
CiAKIAkJciA9IGFtZGdwdV9jc192YWxpZGF0ZShwLCBibyk7CiAJCWlmIChyKQogCQkJcmV0dXJu
IHI7CiAKLQkJaWYgKGJpbmRpbmdfdXNlcnB0cikgeworCQlpZiAobG9iai0+dXNlcl9wYWdlcykg
ewogCQkJa3ZmcmVlKGxvYmotPnVzZXJfcGFnZXMpOwogCQkJbG9iai0+dXNlcl9wYWdlcyA9IE5V
TEw7CiAJCX0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9n
ZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYwppbmRleCBhODI4
ZTNkMGJmYmQuLjNjY2Q2MWQ2OTk2NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9nZW0uYwpAQCAtMjgzLDcgKzI4Myw2IEBAIGludCBhbWRncHVfZ2VtX2NyZWF0ZV9pb2N0bChz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogaW50IGFtZGdwdV9nZW1fdXNlcnB0
cl9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCQkJICAgICBzdHJ1
Y3QgZHJtX2ZpbGUgKmZpbHApCiB7Ci0Jc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4IGN0eCA9IHsg
dHJ1ZSwgZmFsc2UgfTsKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGRldi0+ZGV2X3By
aXZhdGU7CiAJc3RydWN0IGRybV9hbWRncHVfZ2VtX3VzZXJwdHIgKmFyZ3MgPSBkYXRhOwogCXN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqZ29iajsKQEAgLTMyNiwzMiArMzI1LDEyIEBAIGludCBhbWRn
cHVfZ2VtX3VzZXJwdHJfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwK
IAkJCWdvdG8gcmVsZWFzZV9vYmplY3Q7CiAJfQogCi0JaWYgKGFyZ3MtPmZsYWdzICYgQU1ER1BV
X0dFTV9VU0VSUFRSX1ZBTElEQVRFKSB7Ci0JCXIgPSBhbWRncHVfdHRtX3R0X2dldF91c2VyX3Bh
Z2VzKGJvLCBiby0+dGJvLnR0bS0+cGFnZXMpOwotCQlpZiAocikKLQkJCWdvdG8gcmVsZWFzZV9v
YmplY3Q7Ci0KLQkJciA9IGFtZGdwdV9ib19yZXNlcnZlKGJvLCB0cnVlKTsKLQkJaWYgKHIpCi0J
CQlnb3RvIHVzZXJfcGFnZXNfZG9uZTsKLQotCQlhbWRncHVfYm9fcGxhY2VtZW50X2Zyb21fZG9t
YWluKGJvLCBBTURHUFVfR0VNX0RPTUFJTl9HVFQpOwotCQlyID0gdHRtX2JvX3ZhbGlkYXRlKCZi
by0+dGJvLCAmYm8tPnBsYWNlbWVudCwgJmN0eCk7Ci0JCWFtZGdwdV9ib191bnJlc2VydmUoYm8p
OwotCQlpZiAocikKLQkJCWdvdG8gdXNlcl9wYWdlc19kb25lOwotCX0KLQogCXIgPSBkcm1fZ2Vt
X2hhbmRsZV9jcmVhdGUoZmlscCwgZ29iaiwgJmhhbmRsZSk7CiAJaWYgKHIpCi0JCWdvdG8gdXNl
cl9wYWdlc19kb25lOworCQlnb3RvIHJlbGVhc2Vfb2JqZWN0OwogCiAJYXJncy0+aGFuZGxlID0g
aGFuZGxlOwogCi11c2VyX3BhZ2VzX2RvbmU6Ci0JaWYgKGFyZ3MtPmZsYWdzICYgQU1ER1BVX0dF
TV9VU0VSUFRSX1ZBTElEQVRFKQotCQlhbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzX2RvbmUo
Ym8tPnRiby50dG0pOwotCiByZWxlYXNlX29iamVjdDoKIAlkcm1fZ2VtX29iamVjdF9wdXRfdW5s
b2NrZWQoZ29iaik7CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
