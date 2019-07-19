Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC396E1F0
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 09:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED4F6E5B7;
	Fri, 19 Jul 2019 07:51:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780082.outbound.protection.outlook.com [40.107.78.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508F46E5B7
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 07:51:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l92VN04hQmFZEiyS3zVvD/j6mVX9zSgcbni66gcx+OBSjBRWs33DpOHQZ+zD+EKW4hSVtMyl6ZglvANQWye5XCdZLXpcF5OVZsXOt5YqeJ8HvICLHbwxlS0vzRqrAueHdfu/qRTwyQVTvHdxjuZG7kJzLyMIbzIJMNj047wOlGmC8zg0/2ZiiIgl1izhk7Ly/HmAAgNekoNljYkA7DkDZaGLSScN1NbLHywOeFNmdt0cKXHwhtrdQKsl1wT3eaMX79YameB7luaxNy48RzXblEuce0lKkPPSUetpsNSS9b59O6oQ55ItYtBPlyc/2/iCaplWMGb3IJk6NfUB4Gx7zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWWsi1Ir+zVR/Qmznkn36GW14cqOv0/IICbsIr789n0=;
 b=CdiZEg0qnTxFIgwWsIcKnzKvtbV6K2P6Q9LMccCTNf9df/VXOLXevzIyEXcueD2WFj+ea46DjhNZVtnw9b1mRpJ4q5NR6BeD8VS3nhzvCK6XdEI5GiXuTY8lqKAb94rRsfkzMwpHC4mbkEfW1vRtl6AGDtNHZ3PmZMUDaeoQ/DC93bQK2qDlLzQ0kZQXb52tLctz+Qu9hn2UgWm/sKfwq2yu7WeaBJA6cs4saf2PScDxxzmQVYnu5hW4Mp9mlJSeAg6v1hNzRI6yN1GRLJEvf4jbP4fqEni7bNvYNsGO6YLIhe+8tLH7zknAhZzKUWkTDFnRkRyw53No5RVa1IuYwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3887.namprd12.prod.outlook.com (10.255.237.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Fri, 19 Jul 2019 07:51:27 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f821:f3f7:3ee3:8c5e]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f821:f3f7:3ee3:8c5e%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 07:51:27 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Liu, Leo"
 <Leo.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: use VCN firmware offset for cache window
Thread-Topic: [PATCH] drm/amdgpu: use VCN firmware offset for cache window
Thread-Index: AQHVPYB6yYJz3cuPKECZQ4KnHJ5BFqbRjT0AgAAFCvA=
Date: Fri, 19 Jul 2019 07:51:27 +0000
Message-ID: <MN2PR12MB3309CECAD6DE68FB772B825CECCB0@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20190718154616.14841-1-leo.liu@amd.com>
 <20190718154945.15004-1-leo.liu@amd.com>
 <ebd4bfbf-2c08-8a54-fba4-2a8bf347fc0f@gmail.com>
In-Reply-To: <ebd4bfbf-2c08-8a54-fba4-2a8bf347fc0f@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46e3cc96-1cb9-4c16-fced-08d70c1de7ba
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3887; 
x-ms-traffictypediagnostic: MN2PR12MB3887:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3887DC191BB1D2FAAF6FDDE3ECCB0@MN2PR12MB3887.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(189003)(199004)(13464003)(316002)(55016002)(9686003)(3846002)(2906002)(4326008)(5660300002)(6246003)(6306002)(6116002)(486006)(966005)(446003)(53936002)(11346002)(305945005)(229853002)(99286004)(52536014)(66066001)(6436002)(110136005)(66476007)(71200400001)(71190400001)(66946007)(66446008)(64756008)(66556008)(102836004)(76116006)(68736007)(8676002)(76176011)(86362001)(186003)(26005)(256004)(7696005)(8936002)(81156014)(7736002)(2501003)(74316002)(81166006)(14454004)(476003)(25786009)(53546011)(6506007)(478600001)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3887;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cMHvYmX4DLYqrbAP2IMAMk6n62tlolT5QmNDaaRqkOMNF3iCZPb2bFbK1y7gJu4Nqw1aE7XwjmQdkL42DSgFginr52SFIkFtAeA1Zk3nS4TxNFR80U2EaD/hzWais6KUqlbhFIvgVtdJoCAQI0wBqL253PlPgg3ibt5MGF2UXu0rj13BebUWhfW149yvjvWeB28HWwRqIt3TkfzMLTBYYcEQ3Oh6U6gAnalICDfNledrPeBbCAF5fS6b5qGqdQmYc7hAJtFqOBM/yr8+IziCTTwuxctW1cXXChAb8jKeTWxrNcdiXn5QsNmcgws375ycP1Kt0O61jPgzKEHLsawIgHqzsph2HCHE1CR9y/eXe6UTw0BCAAUl6QdcD7y7HDS/BEQBFvnDm5iMhDxoAO34fHde2qZ3vtgyW2pcMHxMUzw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e3cc96-1cb9-4c16-fced-08d70c1de7ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 07:51:27.5731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ruihuang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3887
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWWsi1Ir+zVR/Qmznkn36GW14cqOv0/IICbsIr789n0=;
 b=EnwT1oI+Ac79elS99T2MSjJgbYBmG77FcJ6hQJC0fhSnddCeh6NTZ0QYAhwtcgAabyeRVSRIUimcWQD0X+rnLpfWMTDji3wYMyXpRLRIVppgn0GjfU3hg3nwppJ2iVdligHPcr/Sk9lrY/EJ69Qb8x3Z8bBSBgtJqsuyMiYXB+o=
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
Cc: "Liu, Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gQ2hyaXN0aWFuIEs/
bmlnDQo+IFNlbnQ6IEZyaWRheSwgSnVseSAxOSwgMjAxOSAzOjMzIFBNDQo+IFRvOiBMaXUsIExl
byA8TGVvLkxpdUBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogdXNlIFZDTiBmaXJtd2FyZSBvZmZzZXQgZm9y
IGNhY2hlDQo+IHdpbmRvdw0KPiANCj4gQW0gMTguMDcuMTkgdW0gMTc6NDkgc2NocmllYiBMaXUs
IExlbzoNCj4gPiBTaW5jZSB3ZSBhcmUgdXNpbmcgdGhlIHNpZ25lZCBGVyBub3csIGFuZCBhbHNv
IHVzaW5nIFBTUCBmaXJtd2FyZQ0KPiA+IGxvYWRpbmcsIGJ1dCBpdCdzIHN0aWxsIHBvdGVudGlh
bCB0byBicmVhayBkcml2ZXIgd2hlbiBsb2FkaW5nIEZXDQo+ID4gZGlyZWN0bHkgaW5zdGVhZCBv
ZiBQU1AsIHNvIHdlIHNob3VsZCBhZGQgb2Zmc2V0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
TGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPg0KPiANCj4gQWNrZWQtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCg0KVGhhbmtzIExlbyEgIA0KDQpQYXRjaCBp
cw0KUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQoNCj4gDQo+ID4g
LS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jIHwgMyAtLS0N
Cj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMNCj4gPiBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMNCj4gPiBpbmRleCAzY2I2MmU0NDhhMzcuLjg4
ZTNkZWRjZjkyNiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92
Y25fdjJfMC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAu
Yw0KPiA+IEBAIC0zNzksMTEgKzM3OSw4IEBAIHN0YXRpYyB2b2lkIHZjbl92Ml8wX21jX3Jlc3Vt
ZShzdHJ1Y3QNCj4gYW1kZ3B1X2RldmljZSAqYWRldikNCj4gPiAgIAkJV1JFRzMyX1NPQzE1KFVW
RCwgMCwNCj4gbW1VVkRfTE1JX1ZDUFVfQ0FDSEVfNjRCSVRfQkFSX0hJR0gsDQo+ID4gICAJCQl1
cHBlcl8zMl9iaXRzKGFkZXYtPnZjbi5pbnN0LT5ncHVfYWRkcikpOw0KPiA+ICAgCQlvZmZzZXQg
PSBzaXplOw0KPiA+IC0JCS8qIE5vIHNpZ25lZCBoZWFkZXIgZm9yIG5vdyBmcm9tIGZpcm13YXJl
DQo+ID4gICAJCVdSRUczMl9TT0MxNShVVkQsIDAsIG1tVVZEX1ZDUFVfQ0FDSEVfT0ZGU0VUMCwN
Cj4gPiAgIAkJCUFNREdQVV9VVkRfRklSTVdBUkVfT0ZGU0VUID4+IDMpOw0KPiA+IC0JCSovDQo+
ID4gLQkJV1JFRzMyX1NPQzE1KFVWRCwgMCwgbW1VVkRfVkNQVV9DQUNIRV9PRkZTRVQwLA0KPiAw
KTsNCj4gPiAgIAl9DQo+ID4NCj4gPiAgIAlXUkVHMzJfU09DMTUoVVZELCAwLCBtbVVWRF9WQ1BV
X0NBQ0hFX1NJWkUwLCBzaXplKTsNCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
