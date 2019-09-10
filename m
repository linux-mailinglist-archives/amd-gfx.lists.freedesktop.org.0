Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 268C4AE4F1
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 09:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EAA6E84C;
	Tue, 10 Sep 2019 07:53:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740084.outbound.protection.outlook.com [40.107.74.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1096E84C
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 07:53:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbT+3tM4U9onWRdFMYz3ne9Zb4dKfgzHPSTWEgdvVaDLrfXOXobWz2uI88rtFdyvx5MId+SCOtJ7sp25Zb6mwCgYW2hTgZiDxf6iyvKIJ470nJk+7fwfJSlHuvgZYkP6BVXxovdSocRJ/6J1I27Uz4jVHcRwqFpONOTdvNAic4iiiGqps4mFmo5+Ubgic0hFBgGjWqy9Q55xx3WF/yaqcF4s5FdrAwmCgAhf04R0a2MjH+1PbhmUWEqT4ChNdxzVcW6h98HdxTVQhcdj/QFOjazSmMrwxNtn0vHvt7VQV1Fd4SnFeQfGvGgIO3xaI2qSxu9UckmxuUIh2m45TIApbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZUojQmOi3e6TQJPhrjKp0mWXFQSTXHye7d4K1sEEWbo=;
 b=OygVhwy/IKCkUbyV8eKgrDMmFCbD8KhnUXvDnVnQPk9bam6zFautdSKxfyigMcA/9ouXHIF2wIQJqX5jX60YdlEnIWw2CRZtocWEuydZlP8JrpGHE4vVI8hLoPwmewkRsKL1C8uIvMXIe1pXtQ11aPdo0gWZY//0qHW/VuudwO8dVmCgl9+YHUu3L0s1VlryZUEXpfvcVOg1/s05r85jt8pu9jImBpSgB5MpcJK/KdbGUTkC/MXRPRFX13bBhiITPgDyr3XPZA/w4AQ6sw8oS0+LRGKuhG5Cum/7VHr+m5LhC1iRwAnDqUeO4LTRt5IpLvUthexQWFjuNZON7VGGqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3248.namprd12.prod.outlook.com (20.179.80.74) by
 MN2PR12MB2878.namprd12.prod.outlook.com (20.179.80.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.19; Tue, 10 Sep 2019 07:53:35 +0000
Received: from MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::ad48:9c35:d74d:8e20]) by MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::ad48:9c35:d74d:8e20%6]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 07:53:35 +0000
From: "S, Shirish" <Shirish.S@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>
Subject: [PATCH] drm/amdgpu: fix build error without CONFIG_HSA_AMD
Thread-Topic: [PATCH] drm/amdgpu: fix build error without CONFIG_HSA_AMD
Thread-Index: AQHVZ6zZSGP4wbr8DUmv4JsslOgvOw==
Date: Tue, 10 Sep 2019 07:53:35 +0000
Message-ID: <20190910075312.17108-1-shirish.s@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR0101CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::27) To MN2PR12MB3248.namprd12.prod.outlook.com
 (2603:10b6:208:a9::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [165.204.156.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 512261cc-fdfc-40f9-925f-08d735c3fbab
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2878; 
x-ms-traffictypediagnostic: MN2PR12MB2878:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2878E43521789CB601AB82A4F2B60@MN2PR12MB2878.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(189003)(199004)(6116002)(3846002)(14454004)(2616005)(2906002)(486006)(6636002)(6486002)(6436002)(36756003)(71200400001)(5660300002)(66066001)(476003)(316002)(110136005)(54906003)(25786009)(81156014)(6506007)(102836004)(53936002)(186003)(386003)(478600001)(71190400001)(14444005)(26005)(50226002)(8936002)(52116002)(6512007)(81166006)(66946007)(66446008)(64756008)(66556008)(66476007)(8676002)(1076003)(86362001)(305945005)(7736002)(4326008)(99286004)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2878;
 H:MN2PR12MB3248.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7UtsB+j0VnYjVY/gah8Bz4q3D+twPLLopnJUUjZgfzZBpi3Z821XBZKk4XtnKFLsJ/WiIZQWkCNPLUmlU9IpIQDwbSbIbo5SLOEbS7xMW60vwgH7PEsVSBWEAoXafuKbGZNXZz8o1M91+YPbvhwtF2TW5DGAXyorNNo+wZtu6oeYyPKhi3KfLrQC5QTCJ+cWV+GL6Gj2sjh344l5+7K+79JHht29rWizsH6KAPKM7rtqpM4DGfuGuRRKIxoOw+cdQKIowZAVFfV2IcY3JsHciLZ/wLDc9wC5hDOk9zSsk+NZXfz/7zIIJwxKHnr/vqQNRhVH1s9QYrVqmCZp5I9Bsu8Rz3+FY6TENSwjWS3q3PLEE6nnjc/8W3UrrFF9SvffYAvlI0EY128nCP60WtFw5WQos5CMnfMRICN+PsfwsPI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 512261cc-fdfc-40f9-925f-08d735c3fbab
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 07:53:35.7052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MW3mc6ehnmOGvt9atRSCyXLuDc1Oc4lH8Xkh18DGhIPOgqr5/F5MVtkZxmGpqTr49syg4n1Tch4UXuwrpNgFVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2878
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZUojQmOi3e6TQJPhrjKp0mWXFQSTXHye7d4K1sEEWbo=;
 b=TgSzgTYN/g44BatGHU2idR7+iOpkvHGYF607mtpCix0Guz6iNwDP7e5IzO0zO8oDGtOp0gj8VIVl91GuqLB9pV4AdZDS50iik8F/hZmrep422Dpn0nfAa5r2UGP6Ex+ZB3UctQnYf+Lv0iFwkrR3tDxS+T+hhuqKBTlTokiT2ig=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Shirish.S@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "S,
 Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SWYgQ09ORklHX0hTQV9BTUQgaXMgbm90IHNldCwgYnVpbGQgZmFpbHM6Cgpkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLm86IEluIGZ1bmN0aW9uIGBhbWRncHVfZGV2aWNl
X2lwX2Vhcmx5X2luaXQnOgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNl
LmM6MTYyNjogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgc2NoZWRfcG9saWN5JwoKVXNlIENPTkZJ
R19IU0FfQU1EIHRvIGd1YXJkIHRoaXMuCgpGaXhlczogMWFiYjY4MGFkMzcxICgiZHJtL2FtZGdw
dTogZGlzYWJsZSBnZnhvZmYgd2hpbGUgdXNlIG5vIEgvVyBzY2hlZHVsaW5nIHBvbGljeSIpCgpT
aWduZWQtb2ZmLWJ5OiBTaGlyaXNoIFMgPHNoaXJpc2guc0BhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oICAgICAgICB8IDIgKysKIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDYgKysrKystCiAyIGZpbGVzIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1LmgKaW5kZXggMTAzMGNiMzA3MjBjLi5hMTUxNmEzYWU5YTggMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdS5oCkBAIC0xNjksNyArMTY5LDkgQEAgZXh0ZXJuIGludCBhbWRncHVfZGlz
Y292ZXJ5OwogZXh0ZXJuIGludCBhbWRncHVfbWVzOwogZXh0ZXJuIGludCBhbWRncHVfbm9yZXRy
eTsKIGV4dGVybiBpbnQgYW1kZ3B1X2ZvcmNlX2FzaWNfdHlwZTsKKyNpZmRlZiBDT05GSUdfSFNB
X0FNRAogZXh0ZXJuIGludCBzY2hlZF9wb2xpY3k7CisjZW5kaWYKIAogI2lmZGVmIENPTkZJR19E
Uk1fQU1ER1BVX1NJCiBleHRlcm4gaW50IGFtZGdwdV9zaV9zdXBwb3J0OwpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCmluZGV4IGJkNDIzZGQ2NGUxOC4uMjUzNWRi
MjdmODIxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2
aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCkBA
IC0xNjIzLDcgKzE2MjMsMTEgQEAgc3RhdGljIGludCBhbWRncHVfZGV2aWNlX2lwX2Vhcmx5X2lu
aXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJfQogCiAJYWRldi0+cG0ucHBfZmVhdHVy
ZSA9IGFtZGdwdV9wcF9mZWF0dXJlX21hc2s7Ci0JaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSB8
fCBzY2hlZF9wb2xpY3kgPT0gS0ZEX1NDSEVEX1BPTElDWV9OT19IV1MpCisJaWYgKGFtZGdwdV9z
cmlvdl92ZihhZGV2KQorCSAgICAjaWZkZWYgQ09ORklHX0hTQV9BTUQKKwkgICAgfHwgc2NoZWRf
cG9saWN5ID09IEtGRF9TQ0hFRF9QT0xJQ1lfTk9fSFdTCisJICAgICNlbmRpZgorCSAgICApCiAJ
CWFkZXYtPnBtLnBwX2ZlYXR1cmUgJj0gflBQX0dGWE9GRl9NQVNLOwogCiAJZm9yIChpID0gMDsg
aSA8IGFkZXYtPm51bV9pcF9ibG9ja3M7IGkrKykgewotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
