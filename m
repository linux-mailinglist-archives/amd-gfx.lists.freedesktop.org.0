Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA79724B6
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 04:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB6EF6E424;
	Wed, 24 Jul 2019 02:34:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800045.outbound.protection.outlook.com [40.107.80.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95BD6E424
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 02:34:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wc/YhjqO0z4sSGzjsLeLQ+y0MjUb0tKD8V6lEG39rrkSms8Hsd/3sA7wrNp9pXO6Po4UhWw03hOlDDKR42AH3xVn+x80wN5UDcaRuVZY0jyrh4ytjC9L7BpOIWSmYcvVqnvCjqSLYS+W+ICV7fcm8pllCyVyB+w/GksVOlwYa4zJrHZv94x5c4L74udn6G1yXvWfODTVtQuYIgfoNT1+GIeKJFQRbwwvywvoxL8qcEd1fmEt5HW82CfTFMgQDTfkHU1HFEiB4xMrgZoz5ipRfFOphnXKrZP/QaojEX12y7jm3kUv9CKPKd4PzZHPs0UEyCKgguQGd0Hv1XZ+lsV3Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUTK5RHoBuPYxNRk25kB31qoqSrxxCSFuiTXG/e6WMw=;
 b=jyY/aqFdDNZ8F85fqlW/BhcbYWo2ZzrIvR3O7CbYif5sJXTOvHlc+ud3++9FawJABHGIwhyy7ITQCet7zogO6j7hbyZBzw3t4aIcgbjxOuDlT6PTAntE8G+IEy1ivB3mVryqzNIh8VtKnrT16p5ZDGhgetFcZiVKZu1OnMExORRnnUbsJIzfncyWSv4wCf85XAYRR7XmtG8q4tOt9MBHAThFEGxwFe2zlOHUka+Dn5UZirJjWYwmERUAijT7l7GWP6YK65l6acsW0PPz+GlrCN/b64lCeZ0pqXpa0J+SvMRDYLCyE0I2kkfTp+tziUn4XghmLrJjT1HjESuB+zgYDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB4253.namprd12.prod.outlook.com (52.135.51.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Wed, 24 Jul 2019 02:34:08 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26%7]) with mapi id 15.20.2115.005; Wed, 24 Jul 2019
 02:34:08 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: fix temperature granularity error in
 smu11
Thread-Topic: [PATCH] drm/amd/powerplay: fix temperature granularity error in
 smu11
Thread-Index: AQHVQU9OHIipvp+bC0yHsFNY2j2yu6bZDQzQ
Date: Wed, 24 Jul 2019 02:34:08 +0000
Message-ID: <MN2PR12MB33442FF3B6EB92F3040F6692E4C60@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190723120756.27823-1-kevin1.wang@amd.com>
In-Reply-To: <20190723120756.27823-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 830253e7-ad5f-4284-12b5-08d70fdf675f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4253; 
x-ms-traffictypediagnostic: MN2PR12MB4253:
x-microsoft-antispam-prvs: <MN2PR12MB42535A91A20110BD2E2CA8C5E4C60@MN2PR12MB4253.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(189003)(199004)(13464003)(66446008)(66476007)(66946007)(66556008)(76116006)(53936002)(66066001)(55016002)(71190400001)(52536014)(64756008)(71200400001)(6246003)(99286004)(25786009)(6436002)(229853002)(86362001)(81166006)(2501003)(478600001)(6506007)(305945005)(102836004)(8676002)(74316002)(9686003)(8936002)(81156014)(316002)(7736002)(14454004)(486006)(76176011)(3846002)(33656002)(186003)(7696005)(68736007)(11346002)(54906003)(4326008)(446003)(26005)(110136005)(2906002)(6116002)(256004)(53546011)(5660300002)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4253;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Drr73oJoXDjggOLYG9iodOgduH6gOJvb0qlsxySzx7vX9jMaTLdzyvbkQaxFPUg2WdTvRC3Z2nNJvsvkS1Ma1SQfTD7JefHkLUgj+v+uSr0VCE0cE0f28LUKiikaFU7xT5sw4Gl6m1s+f4WogInpIaJGHkZD+vlk/Gw1Mn8EGwQ3f98uD29XT3Xl6tvDjX5fRYaoGDY3UPXoU0dvs/dalJMCQ4AUnW9qeWotpk7d9Pns0g0fw/R2EwEeoq6PnhmlGwZZWhniespI7ErWg5AKP5CTeW32rbOofifmUDe4j1DHqgtZFvhBQfFZ4LVdabXuWAZBOYdtyvurUnYXE6Q/hPJmEaqW0XrldgtqN6Zboltg2RBAH6EUfRoQ8T0VZRRUyhCB/knd4YRpjzK2/KUqPQKVNVtYYlb8f3kNzCtGYiY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 830253e7-ad5f-4284-12b5-08d70fdf675f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 02:34:08.0983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4253
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUTK5RHoBuPYxNRk25kB31qoqSrxxCSFuiTXG/e6WMw=;
 b=bJGA+7wYGGTp5vsJeYVWGWa+R5DBE3FHvn0DiyJlx2JZevnNPNJVAqro9+vKnz7SlYi9MBCFDo0yvY6a/yyBA6gGQtNEpxY1Qixuwyrgmec6ZUZZWt82+z8F2Hvs7u1kTIx/ym0M1/rH+4Bma9ye9UIXYS88yHCHDATAG/vkC3Q=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QmV0dGVyIHRvIGNvbWJpbmUgdGhpcyB3aXRoIHByZXZpb3VzIHB0YWNoKGRybS9hbWQvcG93ZXJw
bGF5OiBhZGQgY2FsbGJhY2sgZnVuY3Rpb24gb2YgZ2V0X3RoZXJtYWxfdGVtcGVyYXR1cmVfcmFu
Z2UpIGFzIG9uZS4KU2luY2UgdGhpcyBpc3N1ZSB0byBmaXggd2FzIGFjdHVhbGx5IGludHJvZHVj
ZWQgYnkgdGhhdCBwYXRjaC4KIApCdXQgaWYgdGhlIG9yaWdpbmFsIHBhdGNoIHdhcyBhbHJlYWR5
IHN1Ym1pdHRlZCwgaXQncyBPSyB0byBjb21taXQgdGhpcyBzZXBhcmF0ZWx5LgoKRWl0aGVyIHdh
eSwgdGhpcyB3YXkgaXMgUmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+
CgpSZWdhcmRzLApFdmFuCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBXYW5n
LCBLZXZpbihZYW5nKSA8S2V2aW4xLldhbmdAYW1kLmNvbT4KPiBTZW50OiBUdWVzZGF5LCBKdWx5
IDIzLCAyMDE5IDg6MDggUE0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBD
YzogRmVuZywgS2VubmV0aCA8S2VubmV0aC5GZW5nQGFtZC5jb20+OyBIdWFuZywgUmF5Cj4gPFJh
eS5IdWFuZ0BhbWQuY29tPjsgUXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+OyBXYW5nLAo+
IEtldmluKFlhbmcpIDxLZXZpbjEuV2FuZ0BhbWQuY29tPgo+IFN1YmplY3Q6IFtQQVRDSF0gZHJt
L2FtZC9wb3dlcnBsYXk6IGZpeCB0ZW1wZXJhdHVyZSBncmFudWxhcml0eSBlcnJvciBpbgo+IHNt
dTExCj4gCj4gaW4gdGhpcyBwYXRjaCwKPiBkcm0vYW1kL3Bvd2VycGxheTogYWRkIGNhbGxiYWNr
IGZ1bmN0aW9uIG9mCj4gZ2V0X3RoZXJtYWxfdGVtcGVyYXR1cmVfcmFuZ2UgdGhlIGRyaXZlciBt
aXNzZWQgdGVtcGVyYXR1cmUgZ3JhbnVsYXJpdHkKPiBjaGFuZ2Ugb24gb3RoZXIgdGVtcGVyYXR1
cmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4K
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgfCAxOCAr
KysrKysrKystLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvc211X3YxMV8wLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFf
MC5jCj4gaW5kZXggNzQ1YjM1YTE2MDBkLi43MzU4MDJiYjA3YjkgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwo+IEBAIC0xMjI5LDE1ICsxMjI5LDE1IEBA
IHN0YXRpYyBpbnQKPiBzbXVfdjExXzBfc3RhcnRfdGhlcm1hbF9jb250cm9sKHN0cnVjdCBzbXVf
Y29udGV4dCAqc211KQo+ICAJCQlyZXR1cm4gcmV0Owo+ICAJfQo+IAo+IC0JYWRldi0+cG0uZHBt
LnRoZXJtYWwubWluX3RlbXAgPSByYW5nZS5taW47Cj4gLQlhZGV2LT5wbS5kcG0udGhlcm1hbC5t
YXhfdGVtcCA9IHJhbmdlLm1heDsKPiAtCWFkZXYtPnBtLmRwbS50aGVybWFsLm1heF9lZGdlX2Vt
ZXJnZW5jeV90ZW1wID0KPiByYW5nZS5lZGdlX2VtZXJnZW5jeV9tYXg7Cj4gLQlhZGV2LT5wbS5k
cG0udGhlcm1hbC5taW5faG90c3BvdF90ZW1wID0gcmFuZ2UuaG90c3BvdF9taW47Cj4gLQlhZGV2
LT5wbS5kcG0udGhlcm1hbC5tYXhfaG90c3BvdF9jcml0X3RlbXAgPQo+IHJhbmdlLmhvdHNwb3Rf
Y3JpdF9tYXg7Cj4gLQlhZGV2LT5wbS5kcG0udGhlcm1hbC5tYXhfaG90c3BvdF9lbWVyZ2VuY3lf
dGVtcCA9Cj4gcmFuZ2UuaG90c3BvdF9lbWVyZ2VuY3lfbWF4Owo+IC0JYWRldi0+cG0uZHBtLnRo
ZXJtYWwubWluX21lbV90ZW1wID0gcmFuZ2UubWVtX21pbjsKPiAtCWFkZXYtPnBtLmRwbS50aGVy
bWFsLm1heF9tZW1fY3JpdF90ZW1wID0KPiByYW5nZS5tZW1fY3JpdF9tYXg7Cj4gLQlhZGV2LT5w
bS5kcG0udGhlcm1hbC5tYXhfbWVtX2VtZXJnZW5jeV90ZW1wID0KPiByYW5nZS5tZW1fZW1lcmdl
bmN5X21heDsKPiArCWFkZXYtPnBtLmRwbS50aGVybWFsLm1pbl90ZW1wID0gcmFuZ2UubWluICoK
PiBTTVVfVEVNUEVSQVRVUkVfVU5JVFNfUEVSX0NFTlRJR1JBREVTOwo+ICsJYWRldi0+cG0uZHBt
LnRoZXJtYWwubWF4X3RlbXAgPSByYW5nZS5tYXggKgo+IFNNVV9URU1QRVJBVFVSRV9VTklUU19Q
RVJfQ0VOVElHUkFERVM7Cj4gKwlhZGV2LT5wbS5kcG0udGhlcm1hbC5tYXhfZWRnZV9lbWVyZ2Vu
Y3lfdGVtcCA9Cj4gcmFuZ2UuZWRnZV9lbWVyZ2VuY3lfbWF4ICoKPiBTTVVfVEVNUEVSQVRVUkVf
VU5JVFNfUEVSX0NFTlRJR1JBREVTOwo+ICsJYWRldi0+cG0uZHBtLnRoZXJtYWwubWluX2hvdHNw
b3RfdGVtcCA9IHJhbmdlLmhvdHNwb3RfbWluICoKPiBTTVVfVEVNUEVSQVRVUkVfVU5JVFNfUEVS
X0NFTlRJR1JBREVTOwo+ICsJYWRldi0+cG0uZHBtLnRoZXJtYWwubWF4X2hvdHNwb3RfY3JpdF90
ZW1wID0KPiByYW5nZS5ob3RzcG90X2NyaXRfbWF4ICogU01VX1RFTVBFUkFUVVJFX1VOSVRTX1BF
Ul9DRU5USUdSQURFUzsKPiArCWFkZXYtPnBtLmRwbS50aGVybWFsLm1heF9ob3RzcG90X2VtZXJn
ZW5jeV90ZW1wID0KPiByYW5nZS5ob3RzcG90X2VtZXJnZW5jeV9tYXggKgo+IFNNVV9URU1QRVJB
VFVSRV9VTklUU19QRVJfQ0VOVElHUkFERVM7Cj4gKwlhZGV2LT5wbS5kcG0udGhlcm1hbC5taW5f
bWVtX3RlbXAgPSByYW5nZS5tZW1fbWluICoKPiBTTVVfVEVNUEVSQVRVUkVfVU5JVFNfUEVSX0NF
TlRJR1JBREVTOwo+ICsJYWRldi0+cG0uZHBtLnRoZXJtYWwubWF4X21lbV9jcml0X3RlbXAgPQo+
IHJhbmdlLm1lbV9jcml0X21heCAqIFNNVV9URU1QRVJBVFVSRV9VTklUU19QRVJfQ0VOVElHUkFE
RVM7Cj4gKwlhZGV2LT5wbS5kcG0udGhlcm1hbC5tYXhfbWVtX2VtZXJnZW5jeV90ZW1wID0KPiBy
YW5nZS5tZW1fZW1lcmdlbmN5X21heAo+ICsqIFNNVV9URU1QRVJBVFVSRV9VTklUU19QRVJfQ0VO
VElHUkFERVM7Cj4gIAlhZGV2LT5wbS5kcG0udGhlcm1hbC5taW5fdGVtcCA9IHJhbmdlLm1pbiAq
Cj4gU01VX1RFTVBFUkFUVVJFX1VOSVRTX1BFUl9DRU5USUdSQURFUzsKPiAgCWFkZXYtPnBtLmRw
bS50aGVybWFsLm1heF90ZW1wID0gcmFuZ2UubWF4ICoKPiBTTVVfVEVNUEVSQVRVUkVfVU5JVFNf
UEVSX0NFTlRJR1JBREVTOwo+IAo+IC0tCj4gMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
