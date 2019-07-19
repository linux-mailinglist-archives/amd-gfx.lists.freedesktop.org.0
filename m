Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CCE6E34E
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 11:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BAA06E5DC;
	Fri, 19 Jul 2019 09:20:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680066.outbound.protection.outlook.com [40.107.68.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD346E5DC
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 09:20:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyg1DzhRYiwKMKN2NRT97C9c77o2I85LIELhMiAjIuFpY7lCdxtBQDdQjUnIuM9kDYYSkGeo05eWO/xRUTqH52pLImACCZBAyZurGOfQsT6JSdPPoUu3IiEYzaJT3j9s87Gdi1kXUkUp+81rNqYk1499xyq9UzMp9itmLgdvUgi51ODJKAHCBLdBnYGsnohwWQsbkVWLY+DwkrlUht358qDUkPLJNNXe8x/sB9AvU0CJL5/I/o/vuACVgMOzskqXHJTyLZopx4ka0592jM1qwWwqV1XbNvMzeT8+2O5P0NgRS8knK6ilW44C9dOyNKktqDNRB6djn4thY6nVHB7i8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6lUGl6vR2XHQnMrO8tfaAYBPrYnbuqKVf8C7b1YZpE=;
 b=Ko/j54ppUv3guEHj1Fg86emWENB9WzyJCsBDlbUbUQoFtD7/Wg9y0HjyjX8MOWI10E0P/94XyHkiKYjGU7g5q0nnpQJV1AeWkn+6DGxxCu27tztXW5FBrpjbRisHg+KXc3m47y1JFlknKuFkuxMFehIIY49uG1o8bNvmWXp3+GsMl2KXpx/nY3RoSeQbWAPrvYR2Y071HBs10JGlaq/OUDO2eQZpvqqDZzPn/8HmAXiD5o1z8QmvtnqNVhFKTU0GUU1CpTbz/0I1KrPY9QwsXXeBW8G39/nBxNcJRkdV0UDT4TF5+biP5FlJYpw5UsB0L7B9s4Rh1Eiy+j3WD2BR8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3887.namprd12.prod.outlook.com (10.255.237.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Fri, 19 Jul 2019 09:20:37 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f821:f3f7:3ee3:8c5e]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f821:f3f7:3ee3:8c5e%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 09:20:37 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: correct the bit mask for checking VCN
 power status
Thread-Topic: [PATCH] drm/amd/powerplay: correct the bit mask for checking VCN
 power status
Thread-Index: AQHVPg9DUGJOkVKYIkaYnwQQC6kxcqbRqVig
Date: Fri, 19 Jul 2019 09:20:37 +0000
Message-ID: <MN2PR12MB3309184F93F4EF2E0353AE82ECCB0@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20190719085145.27515-1-evan.quan@amd.com>
In-Reply-To: <20190719085145.27515-1-evan.quan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25e36c83-1d4a-48e7-5313-08d70c2a5c58
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3887; 
x-ms-traffictypediagnostic: MN2PR12MB3887:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB38876B9E9F05BE24D5EC3BE9ECCB0@MN2PR12MB3887.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(52314003)(13464003)(199004)(189003)(256004)(26005)(8936002)(7696005)(68736007)(8676002)(102836004)(76116006)(86362001)(186003)(76176011)(14444005)(6506007)(25786009)(53546011)(33656002)(478600001)(81156014)(74316002)(2501003)(81166006)(476003)(14454004)(7736002)(446003)(486006)(966005)(53936002)(11346002)(3846002)(2906002)(4326008)(316002)(9686003)(55016002)(6306002)(6246003)(6116002)(5660300002)(110136005)(66946007)(66556008)(64756008)(66446008)(66476007)(71190400001)(71200400001)(229853002)(99286004)(305945005)(52536014)(66066001)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3887;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4g2ZMthlAYTr4CvkAfwmv5heHUTcFQKwPRL31DTO9VOV1Ic+rVQGoz/0azrDL7XcIaioQHESuMj4sC8DSajVOmq8rRPAHlpym/97Eq4emLJvdCC9Li+MY9+nxYJlcyyyGqofCxZIeGOO3Zasf+1ywvQI0pTOaaK35oihGoTAY4AWCYZ1cwgmXlNnpDoI8WLx9jgrJR1gnGOmQFvRtEb58znTnwdHFmrou4k3ayas8zyQLJQjX7rqcgmOXNJu+tYQInYxeE+IcwaN+IzVXq4bXKcNW4uGW2D2t0JCJqNjvxqQevIIDazKoqSUBHx53GwY15kNS9Dp3l66q9XSMztR02QZRRMXqscPhjj9HR4xnWVT4rRhN8mcWT8ig2sX3uPt9VxuzT/RaakLAx5VZgAnLDd99cJdSeAhGvUDylCW+MQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e36c83-1d4a-48e7-5313-08d70c2a5c58
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 09:20:37.0978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ruihuang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3887
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6lUGl6vR2XHQnMrO8tfaAYBPrYnbuqKVf8C7b1YZpE=;
 b=MWTFBv+KQ67lBN5so8Cf4gw/+nHUTe8J+RIzq9ljkVaBIEt2+be6+ekCgE4z531cFLVNz623lpO60i7I+BQtrRaOG5JB4RqCKB7lMVOdtiLqGZH6gIvBTQeZi7YzOJUxmzG33c7vb8sBoNsQXvPhH1VPMsb+yQK5SUMxRXYI9MU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgRXZhbg0KPiBRdWFuDQo+
IFNlbnQ6IEZyaWRheSwgSnVseSAxOSwgMjAxOSA0OjUyIFBNDQo+IFRvOiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogUXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+DQo+
IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZC9wb3dlcnBsYXk6IGNvcnJlY3QgdGhlIGJpdCBtYXNr
IGZvciBjaGVja2luZw0KPiBWQ04gcG93ZXIgc3RhdHVzDQo+IA0KPiBGb3IgTmF2aTEwIG9yIGxh
dGVyIEFTSUNzLCBhIGRpZmZlcmVudCBiaXQgbWFzayBpcyB1c2VkIGZvciBjaGVja2luZyBWQ04N
Cj4gcG93ZXIgc3RhdHVzLg0KPiANCj4gQ2hhbmdlLUlkOiBJYWE0OWU1YTMzOWMzOGY0NmUzZTcx
MjRkMjFhZWI2NWY2NjMzMzI1ZQ0KPiBTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVh
bkBhbWQuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdw
dV9zbXUuYyB8IDggKysrKysrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9hbWRncHVfc211LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9h
bWRncHVfc211LmMNCj4gaW5kZXggNmUyZjdkZjgyNmYwLi44ODc1NzdjNDc1NjggMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMNCj4gQEAgLTI3MSw2
ICsyNzEsOCBAQCBpbnQgc211X2dldF9wb3dlcl9udW1fc3RhdGVzKHN0cnVjdCBzbXVfY29udGV4
dA0KPiAqc211LCAgaW50IHNtdV9jb21tb25fcmVhZF9zZW5zb3Ioc3RydWN0IHNtdV9jb250ZXh0
ICpzbXUsIGVudW0NCj4gYW1kX3BwX3NlbnNvcnMgc2Vuc29yLA0KPiAgCQkJICAgdm9pZCAqZGF0
YSwgdWludDMyX3QgKnNpemUpDQo+ICB7DQo+ICsJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYg
PSBzbXUtPmFkZXY7DQo+ICsJdWludDMyX3QgdXZkX2JpdF9tYXNrID0gMHhGRkZGRkZGRjsNCj4g
IAlpbnQgcmV0ID0gMDsNCj4gDQo+ICAJc3dpdGNoIChzZW5zb3IpIHsNCj4gQEAgLTI4Nyw3ICsy
ODksMTEgQEAgaW50IHNtdV9jb21tb25fcmVhZF9zZW5zb3Ioc3RydWN0IHNtdV9jb250ZXh0DQo+
ICpzbXUsIGVudW0gYW1kX3BwX3NlbnNvcnMgc2Vuc29yLA0KPiAgCQkqc2l6ZSA9IDg7DQo+ICAJ
CWJyZWFrOw0KPiAgCWNhc2UgQU1ER1BVX1BQX1NFTlNPUl9VVkRfUE9XRVI6DQo+IC0JCSoodWlu
dDMyX3QgKilkYXRhID0gc211X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUsDQo+IFNNVV9GRUFUVVJF
X0RQTV9VVkRfQklUKSA/IDEgOiAwOw0KPiArCQlpZiAoYWRldi0+YXNpY190eXBlID09IENISVBf
VkVHQTIwKQ0KPiArCQkJdXZkX2JpdF9tYXNrID0gU01VX0ZFQVRVUkVfRFBNX1VWRF9CSVQ7DQo+
ICsJCWVsc2UNCj4gKwkJCXV2ZF9iaXRfbWFzayA9IFNNVV9GRUFUVVJFX1ZDTl9QR19CSVQ7DQoN
CkFmdGVyIHZlZ2EyMCwgd2UgYWN0dWFsbHkgd2lsbCB1c2UgVkNOIGluc3RlYWQgb2YgVVZELiBC
ZWxvdyBpbmRpY2F0ZXMgdGhlIGRlc2lnbiBmb3IgdGhpcy4NCg0KdXZkX2JpdF9tYXNrID0gKGFk
ZXYtPmFzaWNfdHlwZSA+IENISVBfVkVHQTIwKSA/IFNNVV9GRUFUVVJFX1ZDTl9QR19CSVQgOiBT
TVVfRkVBVFVSRV9EUE1fVVZEX0JJVA0KDQpBbnl3YXksIHBhdGNoIGxvb2tzIGdvb2QgZm9yIG1l
Lg0KUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQoNCg0KVGhhbmtz
LA0KUmF5DQoNCj4gKwkqKHVpbnQzMl90ICopZGF0YSA9IHNtdV9mZWF0dXJlX2lzX2VuYWJsZWQo
c211LA0KPiB1dmRfYml0X21hc2spID8gMSA6DQo+ICswOw0KPiAgCQkqc2l6ZSA9IDQ7DQo+ICAJ
CWJyZWFrOw0KPiAgCWNhc2UgQU1ER1BVX1BQX1NFTlNPUl9WQ0VfUE9XRVI6DQo+IC0tDQo+IDIu
MjIuMA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
