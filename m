Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC58A6524D
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jul 2019 09:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9A4890EA;
	Thu, 11 Jul 2019 07:14:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680056.outbound.protection.outlook.com [40.107.68.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA17888D9
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jul 2019 07:14:45 +0000 (UTC)
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB2868.namprd12.prod.outlook.com (20.179.66.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Thu, 11 Jul 2019 07:14:42 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::8d31:f3d2:a080:9a9c]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::8d31:f3d2:a080:9a9c%5]) with mapi id 15.20.2052.020; Thu, 11 Jul 2019
 07:14:42 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Clements, John" <John.Clements@amd.com>, 
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH 1/2] drm/amdgpu: switch to macro for psp bootloader command
Thread-Topic: [PATCH 1/2] drm/amdgpu: switch to macro for psp bootloader
 command
Thread-Index: AQHVNzhuthc+eO5Sj0C1EafmVQuuTqbFAh5s
Date: Thu, 11 Jul 2019 07:14:42 +0000
Message-ID: <BN8PR12MB3602C72372C4C4134F886B1389F30@BN8PR12MB3602.namprd12.prod.outlook.com>
References: <1562774338-4457-1-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1562774338-4457-1-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9455233b-d6d5-45a4-9193-08d705cf7236
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB2868; 
x-ms-traffictypediagnostic: BN8PR12MB2868:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR12MB28683A7F66CAA8915BBE9C2489F30@BN8PR12MB2868.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(199004)(189003)(66946007)(76116006)(52536014)(76176011)(66476007)(11346002)(476003)(66556008)(26005)(66446008)(7696005)(6246003)(64756008)(66066001)(478600001)(446003)(9686003)(53936002)(6306002)(5660300002)(186003)(102836004)(25786009)(55016002)(99286004)(6436002)(81156014)(3846002)(2906002)(14454004)(2501003)(6116002)(68736007)(966005)(8936002)(33656002)(6636002)(81166006)(8676002)(110136005)(486006)(256004)(74316002)(53546011)(6506007)(86362001)(316002)(305945005)(71190400001)(229853002)(7736002)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2868;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MyC0345Rk55Ema1HKuhDnvNkq3N0e0fB2GO+WordG+QstRQzEsE1cUotbVqey6QfHYqfzrNlgp18bTdJ+Kb0Njd7hP1tvNUPMl2WLu7x7D5k/pyTe4NHL3eZGZZaUmBcN8VOSKx1uiSpUwH7WZb+NJ+XDD5jVqkpn7glOIqsqR/NT7KfTckV8MwNcG54zVQX/KA0cQDiXBy5dzoVn/J3rTpJBD9zqM/DmUN4/mVwaJoRFArANOKPehOROyPN1kwdknc4FZ69AAmTf5v7Khrvz1vVkWElDs0FaTbiApMAXsJ9mhDwW740tkVw4tJ9rAnqczxsV/equ51p8EGBQwjMsX+PXY7IUfbQ2vUmKYXXR/rmxmbNt6ap7k3gBW/N+6pcahkhtDGdzqWnjgZ81yPsWxtwLp/8BN5xxh2QVqE+MMs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9455233b-d6d5-45a4-9193-08d705cf7236
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 07:14:42.7863 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2868
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doyxJaV3LrX8BNpporaWujukqpwi+WJ98J6zQwAAJsY=;
 b=W4Y3m+UjTSQkqJgg2XM0A/jhBMRS57kIHvZBzvqEfadIFPPDFPxRnUssFYKGGrRL0yYdSlQ5mxQcoPH6NnIerMOL1e/5hDA57xoq8yWsWoRanr8OrCSri1GG7zbDbOdcHlIhquR/OCUOVez4Ju4nqL05fIdDKbjmL0teELdL23I=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+CgpCUiwKWGlh
b2ppZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcm9tOiBhbWQt
Z2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBvbiBiZWhhbGYgb2Yg
SGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpTZW50OiBXZWRuZXNkYXksIEp1
bHkgMTAsIDIwMTkgMTE6NTggUE0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBZ
dWFuLCBYaWFvamllOyBDbGVtZW50cywgSm9objsgRGV1Y2hlciwgQWxleGFuZGVyCkNjOiBaaGFu
ZywgSGF3a2luZwpTdWJqZWN0OiBbUEFUQ0ggMS8yXSBkcm0vYW1kZ3B1OiBzd2l0Y2ggdG8gbWFj
cm8gZm9yIHBzcCBib290bG9hZGVyIGNvbW1hbmQKCkNoYW5nZS1JZDogSWVmNGMxZTVjYTAxZGYw
YTAyOGE3ODRjMGZhZjM3NTQ0OTM5NzMzYTMKU2lnbmVkLW9mZi1ieTogSGF3a2luZyBaaGFuZyA8
SGF3a2luZy5aaGFuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9wc3AuaCB8IDkgKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3Bf
djExXzAuYyAgfCA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92M18xLmMg
ICB8IDQgKystLQogMyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3Au
aCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuaAppbmRleCBlMjhjZjVl
Li44ZGRjZWMxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cHNwLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5oCkBAIC00
Miw2ICs0MiwxNSBAQCBzdHJ1Y3QgcHNwX2NvbnRleHQ7CiBzdHJ1Y3QgcHNwX3hnbWlfbm9kZV9p
bmZvOwogc3RydWN0IHBzcF94Z21pX3RvcG9sb2d5X2luZm87CgorZW51bSBwc3BfYm9vdGxvYWRl
cl9jbWQgeworICAgICAgIFBTUF9CTF9fTE9BRF9TWVNEUlYgICAgICAgICAgICAgPSAweDEwMDAw
LAorICAgICAgIFBTUF9CTF9fTE9BRF9TT1NEUlYgICAgICAgICAgICAgPSAweDIwMDAwLAorICAg
ICAgIFBTUF9CTF9fTk9fRUNDICAgICAgICAgICAgICAgICAgPSAweDQwMDAwLAorICAgICAgIFBT
UF9CTF9fUEFSVElBTF9FQ0MgICAgICAgICAgICAgPSAweDUwMDAwLAorICAgICAgIFBTUF9CTF9f
RlVMTF9FQ0MgICAgICAgICAgICAgICAgPSAweDYwMDAwLAorICAgICAgIFBTUF9CTF9fTE9BRF9L
RVlfREFUQUJBU0UgICAgICAgPSAweDgwMDAwLAorfTsKKwogZW51bSBwc3BfcmluZ190eXBlCiB7
CiAgICAgICAgUFNQX1JJTkdfVFlQRV9fSU5WQUxJRCA9IDAsCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3BzcF92MTFfMC5jCmluZGV4IDFiNmMyMGMuLmU3ODQwOTEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3BzcF92MTFfMC5jCkBAIC0yMTIsNyArMjEyLDcgQEAgc3RhdGljIGludCBwc3Bf
djExXzBfYm9vdGxvYWRlcl9sb2FkX3N5c2RydihzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCkKICAg
ICAgICAvKiBQcm92aWRlIHRoZSBzeXMgZHJpdmVyIHRvIGJvb3Rsb2FkZXIgKi8KICAgICAgICBX
UkVHMzJfU09DMTUoTVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNHXzM2LAogICAgICAgICAgICAgICAo
dWludDMyX3QpKHBzcC0+ZndfcHJpX21jX2FkZHIgPj4gMjApKTsKLSAgICAgICBwc3BfZ2Z4ZHJ2
X2NvbW1hbmRfcmVnID0gMSA8PCAxNjsKKyAgICAgICBwc3BfZ2Z4ZHJ2X2NvbW1hbmRfcmVnID0g
UFNQX0JMX19MT0FEX1NZU0RSVjsKICAgICAgICBXUkVHMzJfU09DMTUoTVAwLCAwLCBtbU1QMF9T
TU5fQzJQTVNHXzM1LAogICAgICAgICAgICAgICBwc3BfZ2Z4ZHJ2X2NvbW1hbmRfcmVnKTsKCkBA
IC0yNTMsNyArMjUzLDcgQEAgc3RhdGljIGludCBwc3BfdjExXzBfYm9vdGxvYWRlcl9sb2FkX3Nv
cyhzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCkKICAgICAgICAvKiBQcm92aWRlIHRoZSBQU1Agc2Vj
dXJlIE9TIHRvIGJvb3Rsb2FkZXIgKi8KICAgICAgICBXUkVHMzJfU09DMTUoTVAwLCAwLCBtbU1Q
MF9TTU5fQzJQTVNHXzM2LAogICAgICAgICAgICAgICAodWludDMyX3QpKHBzcC0+ZndfcHJpX21j
X2FkZHIgPj4gMjApKTsKLSAgICAgICBwc3BfZ2Z4ZHJ2X2NvbW1hbmRfcmVnID0gMiA8PCAxNjsK
KyAgICAgICBwc3BfZ2Z4ZHJ2X2NvbW1hbmRfcmVnID0gUFNQX0JMX19MT0FEX1NPU0RSVjsKICAg
ICAgICBXUkVHMzJfU09DMTUoTVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNHXzM1LAogICAgICAgICAg
ICAgICBwc3BfZ2Z4ZHJ2X2NvbW1hbmRfcmVnKTsKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9wc3BfdjNfMS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNw
X3YzXzEuYwppbmRleCAzZjU4Mjc3Li5lYzNhMDU2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9wc3BfdjNfMS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3BzcF92M18xLmMKQEAgLTE1Myw3ICsxNTMsNyBAQCBzdGF0aWMgaW50IHBzcF92M18xX2Jvb3Rs
b2FkZXJfbG9hZF9zeXNkcnYoc3RydWN0IHBzcF9jb250ZXh0ICpwc3ApCiAgICAgICAgLyogUHJv
dmlkZSB0aGUgc3lzIGRyaXZlciB0byBib290bG9hZGVyICovCiAgICAgICAgV1JFRzMyX1NPQzE1
KE1QMCwgMCwgbW1NUDBfU01OX0MyUE1TR18zNiwKICAgICAgICAgICAgICAgKHVpbnQzMl90KShw
c3AtPmZ3X3ByaV9tY19hZGRyID4+IDIwKSk7Ci0gICAgICAgcHNwX2dmeGRydl9jb21tYW5kX3Jl
ZyA9IDEgPDwgMTY7CisgICAgICAgcHNwX2dmeGRydl9jb21tYW5kX3JlZyA9IFBTUF9CTF9fTE9B
RF9TWVNEUlY7CiAgICAgICAgV1JFRzMyX1NPQzE1KE1QMCwgMCwgbW1NUDBfU01OX0MyUE1TR18z
NSwKICAgICAgICAgICAgICAgcHNwX2dmeGRydl9jb21tYW5kX3JlZyk7CgpAQCAtMjE2LDcgKzIx
Niw3IEBAIHN0YXRpYyBpbnQgcHNwX3YzXzFfYm9vdGxvYWRlcl9sb2FkX3NvcyhzdHJ1Y3QgcHNw
X2NvbnRleHQgKnBzcCkKICAgICAgICAvKiBQcm92aWRlIHRoZSBQU1Agc2VjdXJlIE9TIHRvIGJv
b3Rsb2FkZXIgKi8KICAgICAgICBXUkVHMzJfU09DMTUoTVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNH
XzM2LAogICAgICAgICAgICAgICAodWludDMyX3QpKHBzcC0+ZndfcHJpX21jX2FkZHIgPj4gMjAp
KTsKLSAgICAgICBwc3BfZ2Z4ZHJ2X2NvbW1hbmRfcmVnID0gMiA8PCAxNjsKKyAgICAgICBwc3Bf
Z2Z4ZHJ2X2NvbW1hbmRfcmVnID0gUFNQX0JMX19MT0FEX1NPU0RSVjsKICAgICAgICBXUkVHMzJf
U09DMTUoTVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNHXzM1LAogICAgICAgICAgICAgICBwc3BfZ2Z4
ZHJ2X2NvbW1hbmRfcmVnKTsKCi0tCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
