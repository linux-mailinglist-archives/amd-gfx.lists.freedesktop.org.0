Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2671C62566
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Jul 2019 17:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E1089E69;
	Mon,  8 Jul 2019 15:54:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700044.outbound.protection.outlook.com [40.107.70.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF01789E69
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jul 2019 15:54:34 +0000 (UTC)
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3409.namprd12.prod.outlook.com (20.178.211.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Mon, 8 Jul 2019 15:54:33 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::8d31:f3d2:a080:9a9c]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::8d31:f3d2:a080:9a9c%5]) with mapi id 15.20.2052.020; Mon, 8 Jul 2019
 15:54:32 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdgpu: enable IP discovery by default on navi
Thread-Topic: [PATCH 2/2] drm/amdgpu: enable IP discovery by default on navi
Thread-Index: AQHVMbHuvmy66w4KPUSTEx2XBe+5kqbA3wnIgAAD9ICAAAHHW4AAAkZ0
Date: Mon, 8 Jul 2019 15:54:32 +0000
Message-ID: <BN8PR12MB360283CA7D6765301708CF0389F60@BN8PR12MB3602.namprd12.prod.outlook.com>
References: <20190703151341.5916-1-alexander.deucher@amd.com>,
 <20190703151341.5916-2-alexander.deucher@amd.com>,
 <BN8PR12MB36027C3FF20B1FAD06119E2D89F60@BN8PR12MB3602.namprd12.prod.outlook.com>,
 <BN6PR12MB180928A19CDDBF2845F07BA7F7F60@BN6PR12MB1809.namprd12.prod.outlook.com>,
 <BN8PR12MB36023928F4E9E4EDFB0E93DF89F60@BN8PR12MB3602.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB36023928F4E9E4EDFB0E93DF89F60@BN8PR12MB3602.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a381f15a-f7a0-4fcc-598b-08d703bc91bb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3409; 
x-ms-traffictypediagnostic: BN8PR12MB3409:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR12MB34093E0EF5A5E5FD9B8DBCDB89F60@BN8PR12MB3409.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(51914003)(189003)(199004)(52536014)(5660300002)(81156014)(2501003)(305945005)(102836004)(74316002)(186003)(6506007)(26005)(76176011)(64756008)(66446008)(66556008)(8676002)(66476007)(66946007)(73956011)(66066001)(53546011)(71190400001)(71200400001)(53936002)(76116006)(55016002)(6306002)(8936002)(99286004)(81166006)(9686003)(6246003)(966005)(229853002)(72206003)(7736002)(2940100002)(478600001)(316002)(476003)(6436002)(486006)(3846002)(6116002)(68736007)(7696005)(86362001)(25786009)(2906002)(446003)(33656002)(11346002)(256004)(14454004)(14444005)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3409;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JnMm0iRSk2uUdcmbyOxEbukIXTHuvT3w0Xm1N9PnSrvrywqCqUowKY4ig2WS+qxM01iTpTQJwhhBTewslx54Vo/gkjHqnys8g1e3zUGBGv6x5SVyLyzYjAUI9scxYUABYlOmV3vT7T9WcYxbshNmmxDwvrrPuB90tZ2m5T0jlApx42WoAVV6ElbLcRcfoPFGzf5RQAWnyCAYQW2ReeP5fG6BgqrcZIVxKMCMTURVJyMVRwV8yceMIdSfBt2CdlN7RSyJmSkTnAH0ZjNgdZd/BVWsku4g+mOfvt1ryLVzoCnnzAHKTYOFIBN8jqKFOjYKuZBeFFGmG26kbB2P7ru3SltJtnL3oxn4XnDdash842gyBA/NFjjXWKy2tJr4A4AAHCRczfYgUOHs/OYj81e9lH5vSwed47VH1JgKMSanYP0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a381f15a-f7a0-4fcc-598b-08d703bc91bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 15:54:32.8414 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3409
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4lKyKHgBWfJUKYLuVctFKik5WQj/+nJmnGm1b3c1vg=;
 b=A4r044sVGtkPIlDiRyKSf1BNGvmcZzOYuDuebEznJBXXSAjPV1kmpmzMIiClCQNEEfPuf6aJKXRzRs7yEjKTUI7Y4OwXgSTWKHVUJkrxECrOKcHOc2RAOG0Lq8d81Hn/26Flcj8bqtkRy48PVu/AnBE1qgks266wgpjm9pHn0to=
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

YW5kIHdlIG1pZ2h0IG5lZWQgYSBmb2xsb3ctdXAgcGF0Y2ggdG8gY2hlY2sgaWYgKGFtZGdwdV9k
aXNjb3ZlcnkgJiYgYXNpY190eXBlID49IENISVBfTkFWSTEwKSBpbiBhbWRncHVfZGV2aWNlLmMu
CgpCUiwKWGlhb2ppZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpG
cm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBvbiBi
ZWhhbGYgb2YgWXVhbiwgWGlhb2ppZSA8WGlhb2ppZS5ZdWFuQGFtZC5jb20+ClNlbnQ6IE1vbmRh
eSwgSnVseSA4LCAyMDE5IDExOjQ1IFBNClRvOiBEZXVjaGVyLCBBbGV4YW5kZXI7IEFsZXggRGV1
Y2hlcjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU3ViamVjdDogUmU6IFtQQVRDSCAy
LzJdIGRybS9hbWRncHU6IGVuYWJsZSBJUCBkaXNjb3ZlcnkgYnkgZGVmYXVsdCBvbiBuYXZpCgpH
b3QgaXQuIFRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uLgpQYXRjaCBpcyBSZXZpZXdlZC1ieTog
WGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCkJSLApYaWFvamllCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyb206IERldWNoZXIsIEFsZXhhbmRl
cgpTZW50OiBNb25kYXksIEp1bHkgOCwgMjAxOSAxMTozOCBQTQpUbzogWXVhbiwgWGlhb2ppZTsg
QWxleCBEZXVjaGVyOyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTdWJqZWN0OiBSZTog
W1BBVENIIDIvMl0gZHJtL2FtZGdwdTogZW5hYmxlIElQIGRpc2NvdmVyeSBieSBkZWZhdWx0IG9u
IG5hdmkKCmF1dG8ganVzdCBtZWFucyBkbyB0aGUgcmlnaHQgdGhpbmcgZm9yIGVhY2ggYXNpYy4g
IEZvciBleGFtcGxlLCBpZiB0aGVyZSBpcyBhIG5ldyBhc2ljIHByb2dyYW0gYW5kIHRoZSBkaXNj
b3ZlcnkgdGFibGVzIGFyZSBub3QgYXZhaWxhYmxlIHlldCwgZm9yIHRoYXQgcHJvZ3JhbSwgYXV0
byBtZWFucyBkb24ndCB1c2UgdGhlIGRpc2NvdmVyeSB0YWJsZS4gIEZvciBvdGhlciBwcm9ncmFt
cyB3aGVyZSB0aGUgdGFibGUgaXMgYXZhaWxhYmxlIChlLmcuLCBuYXZpMTAgYW5kIDE0KSwgdGhl
biBhdXRvIG1lYW5zIHVzZSB0aGUgdGFibGUuCgpBbGV4Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkZyb206IFl1YW4sIFhpYW9qaWUKU2VudDogTW9uZGF5LCBKdWx5IDgsIDIwMTkg
MTE6MzEgQU0KVG86IEFsZXggRGV1Y2hlcjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
Q2M6IERldWNoZXIsIEFsZXhhbmRlcgpTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gZHJtL2FtZGdw
dTogZW5hYmxlIElQIGRpc2NvdmVyeSBieSBkZWZhdWx0IG9uIG5hdmkKCkhpIEFsZXgsCgpJIHNl
ZSB0aGVyZSBhcmUgbWFueSAnYXV0bycgbW9kdWxlIHBhcmFtcyBmb3IgYW1kZ3B1LCBjb3VsZCB5
b3UgcGxlYXNlIGV4cGxhaW4gYWJvdXQgdGhlIGhpc3RvcmljYWwgaW50ZW50aW9uIG9mIHVzaW5n
IHZhbHVlICctMSc/CmFuZCBzaGFsbCB3ZSBjaGVjayAnYW1kZ3B1X2Rpc2NvdmVyeScgYWdhaW5z
dCAnLTEnIGZvciBhbGwgdGhlIGNvZGUgcGF0aHMgaW4gYW1kZ3B1X2RldmljZS5jIGFuZCBuYXZp
MTBfcmVnX2luaXQuYz8KCkJSLApYaWFvamllCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVz
a3RvcC5vcmc+IG9uIGJlaGFsZiBvZiBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNv
bT4KU2VudDogV2VkbmVzZGF5LCBKdWx5IDMsIDIwMTkgMTE6MTMgUE0KVG86IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBEZXVjaGVyLCBBbGV4YW5kZXIKU3ViamVjdDogW1BBVENI
IDIvMl0gZHJtL2FtZGdwdTogZW5hYmxlIElQIGRpc2NvdmVyeSBieSBkZWZhdWx0IG9uIG5hdmkK
ClVzZSB0aGUgSVAgZGlzY292ZXJ5IHRhYmxlIHJhdGhlciB0aGFuIGhhcmRjb2RpbmcgdGhlCnNl
dHRpbmdzIGluIHRoZSBkcml2ZXIuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2Rydi5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKaW5kZXggNzk0
MWE1MzY4ZmI1Li42Zjc3NzJlZWViNzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZHJ2LmMKQEAgLTE0MCw3ICsxNDAsNyBAQCB1aW50IGFtZGdwdV9zbXVfbWVtb3J5X3Bvb2xf
c2l6ZSA9IDA7CiB1aW50IGFtZGdwdV9kY19mZWF0dXJlX21hc2sgPSAwOwogaW50IGFtZGdwdV9h
c3luY19nZnhfcmluZyA9IDE7CiBpbnQgYW1kZ3B1X21jYnAgPSAwOwotaW50IGFtZGdwdV9kaXNj
b3ZlcnkgPSAwOworaW50IGFtZGdwdV9kaXNjb3ZlcnkgPSAtMTsKIGludCBhbWRncHVfbWVzID0g
MDsKCiBzdHJ1Y3QgYW1kZ3B1X21ncHVfaW5mbyBtZ3B1X2luZm8gPSB7CkBAIC01OTIsNiArNTky
LDcgQEAgbW9kdWxlX3BhcmFtX25hbWVkKG1jYnAsIGFtZGdwdV9tY2JwLCBpbnQsIDA0NDQpOwog
LyoqCiAgKiBET0M6IGRpc2NvdmVyeSAoaW50KQogICogQWxsb3cgZHJpdmVyIHRvIGRpc2NvdmVy
IGhhcmR3YXJlIElQIGluZm9ybWF0aW9uIGZyb20gSVAgRGlzY292ZXJ5IHRhYmxlIGF0IHRoZSB0
b3Agb2YgVlJBTS4KKyAqICgtMSA9IGF1dG8gKGRlZmF1bHQpLCAwID0gZGlzYWJsZWQsIDEgPSBl
bmFibGVkKQogICovCiBNT0RVTEVfUEFSTV9ERVNDKGRpc2NvdmVyeSwKICAgICAgICAiQWxsb3cg
ZHJpdmVyIHRvIGRpc2NvdmVyIGhhcmR3YXJlIElQcyBmcm9tIElQIERpc2NvdmVyeSB0YWJsZSBh
dCB0aGUgdG9wIG9mIFZSQU0iKTsKLS0KMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
