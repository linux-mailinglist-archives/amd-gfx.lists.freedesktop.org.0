Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A09624C4
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Jul 2019 17:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A028B89E2B;
	Mon,  8 Jul 2019 15:45:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAB389E2B
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jul 2019 15:45:54 +0000 (UTC)
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3377.namprd12.prod.outlook.com (20.178.211.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Mon, 8 Jul 2019 15:45:53 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::8d31:f3d2:a080:9a9c]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::8d31:f3d2:a080:9a9c%5]) with mapi id 15.20.2052.020; Mon, 8 Jul 2019
 15:45:53 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdgpu: enable IP discovery by default on navi
Thread-Topic: [PATCH 2/2] drm/amdgpu: enable IP discovery by default on navi
Thread-Index: AQHVMbHuvmy66w4KPUSTEx2XBe+5kqbA3wnIgAAD9ICAAAHHWw==
Date: Mon, 8 Jul 2019 15:45:53 +0000
Message-ID: <BN8PR12MB36023928F4E9E4EDFB0E93DF89F60@BN8PR12MB3602.namprd12.prod.outlook.com>
References: <20190703151341.5916-1-alexander.deucher@amd.com>,
 <20190703151341.5916-2-alexander.deucher@amd.com>,
 <BN8PR12MB36027C3FF20B1FAD06119E2D89F60@BN8PR12MB3602.namprd12.prod.outlook.com>,
 <BN6PR12MB180928A19CDDBF2845F07BA7F7F60@BN6PR12MB1809.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB180928A19CDDBF2845F07BA7F7F60@BN6PR12MB1809.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9a46509-cf8f-437c-3849-08d703bb5be0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3377; 
x-ms-traffictypediagnostic: BN8PR12MB3377:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR12MB33779B4FEE7EB64E5C486ED089F60@BN8PR12MB3377.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(39860400002)(136003)(396003)(376002)(51914003)(199004)(189003)(186003)(86362001)(3846002)(102836004)(53936002)(6246003)(316002)(2501003)(26005)(110136005)(6116002)(33656002)(53546011)(229853002)(7696005)(76176011)(71190400001)(71200400001)(99286004)(256004)(68736007)(6506007)(66066001)(14444005)(476003)(6306002)(7736002)(5660300002)(52536014)(305945005)(9686003)(478600001)(2906002)(486006)(8676002)(72206003)(6436002)(966005)(81166006)(81156014)(55016002)(66556008)(64756008)(66446008)(66946007)(66476007)(76116006)(73956011)(11346002)(25786009)(14454004)(8936002)(446003)(74316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3377;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: O4hQRTfeY+T2Ciu2z6ByzMUMmMFs81OHVMMAmyvJdQPV1JDHe1scEbUys3YqXEZe4nHNJHac1vL7ruF0w2O8NXsohyDaAY9XM80rKFlne82G3rYmmhtQto9pD7Bhbueuu+NERR2VaKAxoDYE/rjKTlXnrhDRF8uRjq1tTZXetUZOIXj/5UO7sMfyyH66dLOfW9sTcFogkOZqypfNbaJPdKZ3/30b6rVO+Dwx4hkWK9GsPF4AZJXwZYEvo8De3gyo9mc90W1bVPlwJkSCZUSdl9qLp0JNklI/5VDA/4jVG0XYgtpBqG5JwHwRNsiCd9oF7EZp4MPQUStxu0hhgqylI6f8VD37zCh2MFwOsSfXavu1frM0QAGNlpkeGE7BZ/F1/WZGdyVmAvEUrhEbIHUHEXj1PTeY9IQbsXNw11pgRWo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a46509-cf8f-437c-3849-08d703bb5be0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 15:45:53.0353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3377
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WB4NRWECXwcHBCxW5ReUkDSZ10nA9NHdik8YJAJ/oQ=;
 b=iSQVIBBIgCj2xflSkqCKS0Hpt83CsU7qHNWCW/RLz8Yzgt6g1x/Dg63f78gksyKRoUEJ9CNoofuod6KY5fNNPMRd3P+PS0/+eU7OH2v27T7LlC7ndGixYg1hO149EGzRUdEF94WAXfiQ+3Lx/CAIRVVyj6IG+drbmSX8q6T72yU=
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

R290IGl0LiBUaGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbi4KUGF0Y2ggaXMgUmV2aWV3ZWQtYnk6
IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+CgpCUiwKWGlhb2ppZQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcm9tOiBEZXVjaGVyLCBBbGV4YW5k
ZXIKU2VudDogTW9uZGF5LCBKdWx5IDgsIDIwMTkgMTE6MzggUE0KVG86IFl1YW4sIFhpYW9qaWU7
IEFsZXggRGV1Y2hlcjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU3ViamVjdDogUmU6
IFtQQVRDSCAyLzJdIGRybS9hbWRncHU6IGVuYWJsZSBJUCBkaXNjb3ZlcnkgYnkgZGVmYXVsdCBv
biBuYXZpCgphdXRvIGp1c3QgbWVhbnMgZG8gdGhlIHJpZ2h0IHRoaW5nIGZvciBlYWNoIGFzaWMu
ICBGb3IgZXhhbXBsZSwgaWYgdGhlcmUgaXMgYSBuZXcgYXNpYyBwcm9ncmFtIGFuZCB0aGUgZGlz
Y292ZXJ5IHRhYmxlcyBhcmUgbm90IGF2YWlsYWJsZSB5ZXQsIGZvciB0aGF0IHByb2dyYW0sIGF1
dG8gbWVhbnMgZG9uJ3QgdXNlIHRoZSBkaXNjb3ZlcnkgdGFibGUuICBGb3Igb3RoZXIgcHJvZ3Jh
bXMgd2hlcmUgdGhlIHRhYmxlIGlzIGF2YWlsYWJsZSAoZS5nLiwgbmF2aTEwIGFuZCAxNCksIHRo
ZW4gYXV0byBtZWFucyB1c2UgdGhlIHRhYmxlLgoKQWxleApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpGcm9tOiBZdWFuLCBYaWFvamllClNlbnQ6IE1vbmRheSwgSnVseSA4LCAyMDE5
IDExOjMxIEFNClRvOiBBbGV4IERldWNoZXI7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
CkNjOiBEZXVjaGVyLCBBbGV4YW5kZXIKU3ViamVjdDogUmU6IFtQQVRDSCAyLzJdIGRybS9hbWRn
cHU6IGVuYWJsZSBJUCBkaXNjb3ZlcnkgYnkgZGVmYXVsdCBvbiBuYXZpCgpIaSBBbGV4LAoKSSBz
ZWUgdGhlcmUgYXJlIG1hbnkgJ2F1dG8nIG1vZHVsZSBwYXJhbXMgZm9yIGFtZGdwdSwgY291bGQg
eW91IHBsZWFzZSBleHBsYWluIGFib3V0IHRoZSBoaXN0b3JpY2FsIGludGVudGlvbiBvZiB1c2lu
ZyB2YWx1ZSAnLTEnPwphbmQgc2hhbGwgd2UgY2hlY2sgJ2FtZGdwdV9kaXNjb3ZlcnknIGFnYWlu
c3QgJy0xJyBmb3IgYWxsIHRoZSBjb2RlIHBhdGhzIGluIGFtZGdwdV9kZXZpY2UuYyBhbmQgbmF2
aTEwX3JlZ19pbml0LmM/CgpCUiwKWGlhb2ppZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnPiBvbiBiZWhhbGYgb2YgQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5j
b20+ClNlbnQ6IFdlZG5lc2RheSwgSnVseSAzLCAyMDE5IDExOjEzIFBNClRvOiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogRGV1Y2hlciwgQWxleGFuZGVyClN1YmplY3Q6IFtQQVRD
SCAyLzJdIGRybS9hbWRncHU6IGVuYWJsZSBJUCBkaXNjb3ZlcnkgYnkgZGVmYXVsdCBvbiBuYXZp
CgpVc2UgdGhlIElQIGRpc2NvdmVyeSB0YWJsZSByYXRoZXIgdGhhbiBoYXJkY29kaW5nIHRoZQpz
ZXR0aW5ncyBpbiB0aGUgZHJpdmVyLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kcnYuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCmluZGV4IDc5
NDFhNTM2OGZiNS4uNmY3NzcyZWVlYjc4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2Rydi5jCkBAIC0xNDAsNyArMTQwLDcgQEAgdWludCBhbWRncHVfc211X21lbW9yeV9wb29s
X3NpemUgPSAwOwogdWludCBhbWRncHVfZGNfZmVhdHVyZV9tYXNrID0gMDsKIGludCBhbWRncHVf
YXN5bmNfZ2Z4X3JpbmcgPSAxOwogaW50IGFtZGdwdV9tY2JwID0gMDsKLWludCBhbWRncHVfZGlz
Y292ZXJ5ID0gMDsKK2ludCBhbWRncHVfZGlzY292ZXJ5ID0gLTE7CiBpbnQgYW1kZ3B1X21lcyA9
IDA7Cgogc3RydWN0IGFtZGdwdV9tZ3B1X2luZm8gbWdwdV9pbmZvID0gewpAQCAtNTkyLDYgKzU5
Miw3IEBAIG1vZHVsZV9wYXJhbV9uYW1lZChtY2JwLCBhbWRncHVfbWNicCwgaW50LCAwNDQ0KTsK
IC8qKgogICogRE9DOiBkaXNjb3ZlcnkgKGludCkKICAqIEFsbG93IGRyaXZlciB0byBkaXNjb3Zl
ciBoYXJkd2FyZSBJUCBpbmZvcm1hdGlvbiBmcm9tIElQIERpc2NvdmVyeSB0YWJsZSBhdCB0aGUg
dG9wIG9mIFZSQU0uCisgKiAoLTEgPSBhdXRvIChkZWZhdWx0KSwgMCA9IGRpc2FibGVkLCAxID0g
ZW5hYmxlZCkKICAqLwogTU9EVUxFX1BBUk1fREVTQyhkaXNjb3ZlcnksCiAgICAgICAgIkFsbG93
IGRyaXZlciB0byBkaXNjb3ZlciBoYXJkd2FyZSBJUHMgZnJvbSBJUCBEaXNjb3ZlcnkgdGFibGUg
YXQgdGhlIHRvcCBvZiBWUkFNIik7Ci0tCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
