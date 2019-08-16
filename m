Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB558FFA7
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 12:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135576E2CD;
	Fri, 16 Aug 2019 10:03:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710088.outbound.protection.outlook.com [40.107.71.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEF06E2CD
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 10:03:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5jtMYO3pX6wrojH6FkpYOaU/cWaKGD5Ar39jhQ++dtfTMhK+1k8pVhtmEXrsPLy2cechvZ7b4uZTykmDQyPYOmGrAw0GqQ6FN6HwbHuRYDyw42enq52+45sO6vuoiCirHLX5+KbjagiI0C5Qc6VDEcqm9CnMzmrZyMF9VjqSctCmJkshVCu9L2w5ZNXyUdnRMmojYSYJwqLbHt64XLaUlswMkydteBoYK6rXN6/f1KBmEofXp7APFguQgXAYet0z1Rzra647J26sQUnLsDwCbLZml07qwZeUt7WUnx6EMMVromAQ2hsp4TVOTsRZJwaOBPEML4fl7B0SUyJHZO3RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Z+k8OhtnycA76BY1+MelSCytTYypbJrk0VLzmpGTgU=;
 b=U2Xa3+sQMoNv3ZXp/lLgYqlBP3G1viSeSR6qNHHCkPEJVk5jQl4xppX5BULdQplMs2lAWnZ3B6znuIjBIVsPo2saSKRX6XOWDD9+//qrz3fVA0s271siQjGnNL7/KDpZ0uapEwV4HUdTrJy5gncdTWspnmfHu7rtNJ6cOsZ0e+BFAiZ5bbiqoGA2iFYlmjs2b24OtnZQUYKLQIQTYCf3sey94H7wbvfhUYx5N+NTzqJhMi86jbsdxYO5Bwqz2jQwfN5VYFAU77NrmDmhe7sJrwZZsNvkGmNnt/asglcLu5wkvvtf70znUuUC3RRVA2P6uU6Mc4KLNzwZKtjD+DjESA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3172.namprd12.prod.outlook.com (20.179.66.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 16 Aug 2019 10:03:37 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2178.016; Fri, 16 Aug 2019
 10:03:37 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: remove redundant argument for
 psp_funcs::cmd_submit callback
Thread-Topic: [PATCH] drm/amdgpu: remove redundant argument for
 psp_funcs::cmd_submit callback
Thread-Index: AQHVVBnf/mdcUYz1rUiY7mDu7F5c9Q==
Date: Fri, 16 Aug 2019 10:03:37 +0000
Message-ID: <20190816100311.25834-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0168.apcprd02.prod.outlook.com
 (2603:1096:201:1f::28) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5409ef2-4927-4ed2-218b-08d72231019d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3172; 
x-ms-traffictypediagnostic: BN8PR12MB3172:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB317285A2232D30A16C06180189AF0@BN8PR12MB3172.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39850400004)(136003)(366004)(346002)(199004)(189003)(2501003)(2351001)(6116002)(66446008)(64756008)(66476007)(66556008)(50226002)(6916009)(8936002)(3846002)(305945005)(5660300002)(7736002)(5640700003)(6436002)(6486002)(66066001)(316002)(102836004)(26005)(478600001)(6512007)(6506007)(186003)(386003)(99286004)(476003)(66946007)(36756003)(486006)(2616005)(86362001)(14454004)(4326008)(256004)(53936002)(71190400001)(25786009)(71200400001)(81166006)(1076003)(52116002)(81156014)(8676002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3172;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IwS59Gxevqj0lgMkr0w3dmfXu7ANfY/igULT/8t5PmvcNogJNOApbR5cZsaSlcvEPZw0GBytTJAxFFK0b0mC+xxymLvvXR+QKCPmKDUF+SmEgQOnw9a6e/tzKgX0KN4fYSaAqkBKeCJrMcURf/8DNCul3FxM0o3BxYqRYRilGe6+pwkJFgE315jGIeYHL3ZTADwU+iEybTqbgDVDXZhWjOQ69XgzyFq5GXOg283uCslo0KuXa/mBDzkxhzmXfBkFZKqI0rDoJGzWI6kLaI08LI73yqzaHW3BxCGiVEWBy5hzfh6FZJ5Z12jdtRaAZxLpaa9s9jVr+VNBPLdhMqvfmgCklAen5FjZW3IKKEA5/SsF4jNUXMjzWEX2rFlH4aLF0ck3MgpmNCBWuxoTrkx0iN1QReJLwcagNv5lgETuQH4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5409ef2-4927-4ed2-218b-08d72231019d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 10:03:37.5899 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mxAHzumpjQvLspHpMmig9YBEGHvL80ebuzMrBLcvSK6Kj7FjkCIaWDCAunYM9hUk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3172
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Z+k8OhtnycA76BY1+MelSCytTYypbJrk0VLzmpGTgU=;
 b=CUI8RmqDcB6V+n6Ph9ZpzfPiTG/94CTvORLO4OyVFjHlRqN42/nJFmpFThwp6DMtk/RP9a5zWFcAanTt7Hh1UQLsAzkgMawv49/zdxT+9qsvpdZCzE20E8nt0tNq2KdySU5bpyNteuYkvD/BXrLxyq+Z9ucLoiSIo8kL9HB7mNQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMgfCAzICstLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5oIHwgNSArKy0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvcHNwX3YxMF8wLmMgIHwgMSAtCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9wc3BfdjExXzAuYyAgfCAxIC0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTJf
MC5jICB8IDEgLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YzXzEuYyAgIHwgMSAt
CiA2IGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMKaW5kZXggNzcxNWMwZGE1MjI5Li41MmRi
ZGI0ZWJlMGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9w
c3AuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMKQEAgLTE0
NCw4ICsxNDQsNyBAQCBwc3BfY21kX3N1Ym1pdF9idWYoc3RydWN0IHBzcF9jb250ZXh0ICpwc3As
CiAJbWVtY3B5KHBzcC0+Y21kX2J1Zl9tZW0sIGNtZCwgc2l6ZW9mKHN0cnVjdCBwc3BfZ2Z4X2Nt
ZF9yZXNwKSk7CiAKIAlpbmRleCA9IGF0b21pY19pbmNfcmV0dXJuKCZwc3AtPmZlbmNlX3ZhbHVl
KTsKLQlyZXQgPSBwc3BfY21kX3N1Ym1pdChwc3AsIHVjb2RlLCBwc3AtPmNtZF9idWZfbWNfYWRk
ciwKLQkJCSAgICAgZmVuY2VfbWNfYWRkciwgaW5kZXgpOworCXJldCA9IHBzcF9jbWRfc3VibWl0
KHBzcCwgcHNwLT5jbWRfYnVmX21jX2FkZHIsIGZlbmNlX21jX2FkZHIsIGluZGV4KTsKIAlpZiAo
cmV0KSB7CiAJCWF0b21pY19kZWMoJnBzcC0+ZmVuY2VfdmFsdWUpOwogCQltdXRleF91bmxvY2so
JnBzcC0+bXV0ZXgpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3BzcC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5oCmluZGV4
IDAwMjlmYTJiMmZmOS4uYjczZDRhYTI4ZmJhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcHNwLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3BzcC5oCkBAIC05MCw3ICs5MCw2IEBAIHN0cnVjdCBwc3BfZnVuY3MKIAlpbnQgKCpy
aW5nX2Rlc3Ryb3kpKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwLAogCQkJICAgIGVudW0gcHNwX3Jp
bmdfdHlwZSByaW5nX3R5cGUpOwogCWludCAoKmNtZF9zdWJtaXQpKHN0cnVjdCBwc3BfY29udGV4
dCAqcHNwLAotCQkJICBzdHJ1Y3QgYW1kZ3B1X2Zpcm13YXJlX2luZm8gKnVjb2RlLAogCQkJICB1
aW50NjRfdCBjbWRfYnVmX21jX2FkZHIsIHVpbnQ2NF90IGZlbmNlX21jX2FkZHIsCiAJCQkgIGlu
dCBpbmRleCk7CiAJYm9vbCAoKmNvbXBhcmVfc3JhbV9kYXRhKShzdHJ1Y3QgcHNwX2NvbnRleHQg
KnBzcCwKQEAgLTIyMyw4ICsyMjIsOCBAQCBzdHJ1Y3QgYW1kZ3B1X3BzcF9mdW5jcyB7CiAjZGVm
aW5lIHBzcF9yaW5nX2NyZWF0ZShwc3AsIHR5cGUpIChwc3ApLT5mdW5jcy0+cmluZ19jcmVhdGUo
KHBzcCksICh0eXBlKSkKICNkZWZpbmUgcHNwX3Jpbmdfc3RvcChwc3AsIHR5cGUpIChwc3ApLT5m
dW5jcy0+cmluZ19zdG9wKChwc3ApLCAodHlwZSkpCiAjZGVmaW5lIHBzcF9yaW5nX2Rlc3Ryb3ko
cHNwLCB0eXBlKSAoKHBzcCktPmZ1bmNzLT5yaW5nX2Rlc3Ryb3koKHBzcCksICh0eXBlKSkpCi0j
ZGVmaW5lIHBzcF9jbWRfc3VibWl0KHBzcCwgdWNvZGUsIGNtZF9tYywgZmVuY2VfbWMsIGluZGV4
KSBcCi0JCShwc3ApLT5mdW5jcy0+Y21kX3N1Ym1pdCgocHNwKSwgKHVjb2RlKSwgKGNtZF9tYyks
IChmZW5jZV9tYyksIChpbmRleCkpCisjZGVmaW5lIHBzcF9jbWRfc3VibWl0KHBzcCwgY21kX21j
LCBmZW5jZV9tYywgaW5kZXgpIFwKKwkJKHBzcCktPmZ1bmNzLT5jbWRfc3VibWl0KChwc3ApLCAo
Y21kX21jKSwgKGZlbmNlX21jKSwgKGluZGV4KSkKICNkZWZpbmUgcHNwX2NvbXBhcmVfc3JhbV9k
YXRhKHBzcCwgdWNvZGUsIHR5cGUpIFwKIAkJKHBzcCktPmZ1bmNzLT5jb21wYXJlX3NyYW1fZGF0
YSgocHNwKSwgKHVjb2RlKSwgKHR5cGUpKQogI2RlZmluZSBwc3BfaW5pdF9taWNyb2NvZGUocHNw
KSBcCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjEwXzAuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTBfMC5jCmluZGV4IDc3YzJiYzM0NGRm
Yy4uZTVmZmY2YjMwMTM3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9w
c3BfdjEwXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjEwXzAuYwpA
QCAtMTg3LDcgKzE4Nyw2IEBAIHN0YXRpYyBpbnQgcHNwX3YxMF8wX3JpbmdfZGVzdHJveShzdHJ1
Y3QgcHNwX2NvbnRleHQgKnBzcCwKIH0KIAogc3RhdGljIGludCBwc3BfdjEwXzBfY21kX3N1Ym1p
dChzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCwKLQkJCQlzdHJ1Y3QgYW1kZ3B1X2Zpcm13YXJlX2lu
Zm8gKnVjb2RlLAogCQkJCXVpbnQ2NF90IGNtZF9idWZfbWNfYWRkciwgdWludDY0X3QgZmVuY2Vf
bWNfYWRkciwKIAkJCQlpbnQgaW5kZXgpCiB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9wc3BfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92
MTFfMC5jCmluZGV4IGUzZmQ5MWU2YTMxNC4uNzI3Nzg5MDgzOGNjIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9wc3BfdjExXzAuYwpAQCAtNDk2LDcgKzQ5Niw2IEBAIHN0YXRpYyBpbnQgcHNw
X3YxMV8wX3JpbmdfZGVzdHJveShzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCwKIH0KIAogc3RhdGlj
IGludCBwc3BfdjExXzBfY21kX3N1Ym1pdChzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCwKLQkJCSAg
ICAgICBzdHJ1Y3QgYW1kZ3B1X2Zpcm13YXJlX2luZm8gKnVjb2RlLAogCQkJICAgICAgIHVpbnQ2
NF90IGNtZF9idWZfbWNfYWRkciwgdWludDY0X3QgZmVuY2VfbWNfYWRkciwKIAkJCSAgICAgICBp
bnQgaW5kZXgpCiB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3Bf
djEyXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTJfMC5jCmluZGV4IGYz
N2I4YWY0Yjk4Ni4uZmQ1NWJhYTZlYTMxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9wc3BfdjEyXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3Bf
djEyXzAuYwpAQCAtMzM0LDcgKzMzNCw2IEBAIHN0YXRpYyBpbnQgcHNwX3YxMl8wX3JpbmdfZGVz
dHJveShzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCwKIH0KIAogc3RhdGljIGludCBwc3BfdjEyXzBf
Y21kX3N1Ym1pdChzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCwKLQkJCSAgICAgICBzdHJ1Y3QgYW1k
Z3B1X2Zpcm13YXJlX2luZm8gKnVjb2RlLAogCQkJICAgICAgIHVpbnQ2NF90IGNtZF9idWZfbWNf
YWRkciwgdWludDY0X3QgZmVuY2VfbWNfYWRkciwKIAkJCSAgICAgICBpbnQgaW5kZXgpCiB7CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjNfMS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YzXzEuYwppbmRleCBiYTMyNzU4MWYzMDEuLjRhMDIw
NTg2ODJmNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YzXzEu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjNfMS5jCkBAIC00MDksNyAr
NDA5LDYgQEAgc3RhdGljIGludCBwc3BfdjNfMV9yaW5nX2Rlc3Ryb3koc3RydWN0IHBzcF9jb250
ZXh0ICpwc3AsCiB9CiAKIHN0YXRpYyBpbnQgcHNwX3YzXzFfY21kX3N1Ym1pdChzdHJ1Y3QgcHNw
X2NvbnRleHQgKnBzcCwKLQkJCSAgICAgICBzdHJ1Y3QgYW1kZ3B1X2Zpcm13YXJlX2luZm8gKnVj
b2RlLAogCQkJICAgICAgIHVpbnQ2NF90IGNtZF9idWZfbWNfYWRkciwgdWludDY0X3QgZmVuY2Vf
bWNfYWRkciwKIAkJCSAgICAgICBpbnQgaW5kZXgpCiB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
