Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18085A2C80
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 03:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD826E229;
	Fri, 30 Aug 2019 01:51:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770040.outbound.protection.outlook.com [40.107.77.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A45A6E229
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 01:51:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nC03BLiMOJr0TfANdgRq2lpSWGbCJly6L4uVIrIPkoNPD4PR0Awu1nUSYBgdL+tj5pCPKHF4Y+D2khHQVrGMpRqzTO/bV9ED8+ovx6ztXq7wDJ+nZCYvQgs9KMnAbbfH+se4R5lIva76nIZ17Dhlqpz7FrQi6mAhb0zw/+iSeR+cmc7bbSndoAN8pz7TreS2phlN8WTwPYpwlAHtg+egG5Fzo95otd4JQt12AGavLGDCnJxkYhP64a+14MKi78MY/SRyBIeDe7KkDTW/tY0XhlLzlFkP5UQoPB6gszhTyiPrGN+qLPETqy5LrWdEHPA8SHQWsu13nN5TrTdwYdpU9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3DHIiUkns+iBqQvGU6gdcb4kROZvtsGRQitoIVIkoc=;
 b=h/Wj2tBzbyQVsGgEaPAh35iCzoZ68X2n5g5pSgIjlc/Y3MjDOMttWPV3KG83sPxf0gYVkZW6igwIZgvPlyip5UlTUuzA95jV41DkiTcY7XvJE5FpKwPPpS87a96FqHKKtD36zPOyvwOOC5/GOgxhXq46sRjoPR7I38hgyPOacoLvRpFuDQ2XZT2xTxiugS/fUOc3057ShCLnqU/l1tXmBcrlN2+fQLTUbh084YZ3FJQdw4cnZRaeVs2AoSbLXBdundWvh16+sBUyFVJD2a3K6FjTv6EiYaT78jlPF7wx9QOOBwlgdq419jPGbTN1gJDwOBL0Shnxptq1XEprK/ExHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3264.namprd12.prod.outlook.com (20.179.83.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Fri, 30 Aug 2019 01:51:18 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 01:51:18 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2 1/2] dmr/amdgpu: Avoid HW GPU reset for RAS.
Thread-Topic: [PATCH v2 1/2] dmr/amdgpu: Avoid HW GPU reset for RAS.
Thread-Index: AQHVXs1oggs+sPtLQkKeP3G8QccPEqcS7Fpw
Date: Fri, 30 Aug 2019 01:51:18 +0000
Message-ID: <MN2PR12MB305424BCCC2AAFEF865CCFBDB0BD0@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <1567126427-13912-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1567126427-13912-1-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9593ac61-e5ca-4b63-1b0c-08d72cec8d35
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3264; 
x-ms-traffictypediagnostic: MN2PR12MB3264:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB326423D582779FB8C8083C0FB0BD0@MN2PR12MB3264.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:785;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(13464003)(199004)(189003)(71190400001)(102836004)(66946007)(4326008)(14444005)(33656002)(486006)(71200400001)(53936002)(9686003)(53546011)(6246003)(186003)(256004)(229853002)(7736002)(7696005)(26005)(74316002)(55016002)(99286004)(6436002)(81166006)(8936002)(53946003)(14454004)(316002)(11346002)(476003)(446003)(81156014)(86362001)(478600001)(6506007)(76116006)(3846002)(305945005)(25786009)(110136005)(52536014)(30864003)(76176011)(66066001)(54906003)(5660300002)(2501003)(66556008)(8676002)(6116002)(64756008)(66476007)(66446008)(2906002)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3264;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZxAURwvwE9wQm0S4QZ2ytX700a4poaOKW+Oh+okl+h7/ejwOURi3CUcTRRK+8Sd61rGMKeU5ZWEQ9ntZlI0qpMDUf9V7Varj5fZBUr/sO/4ELszBjeVs6DslCSsCf/bSbhx03lpfhyE1ivbwgPwblMcvIjdbrQfWphytX1dVfRcOeSK7MlZzcEBjcOYrBM0QoSwLQp5pTMbug93Enw3Ox3k/1zBlC9JrtRaXBBd3ayzqUW95g14u0CtER6xMc43HYuRHw8GdFU1SSpcGS2DXiLdNpvtem+u9m/geTLZJMzNQHlqDgnFoVLHelNzh6TQSOk/olSIPV4DBqk5PtBgCo2VEVUBpwUY4nv4V7z1hFWYvlvqQGr/Cm3SoVyMmepoXPISdWtFGok1MVwxC7/2o/4Y+WySWaPYG1rIv5aPDQ6w=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9593ac61-e5ca-4b63-1b0c-08d72cec8d35
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 01:51:18.8346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m21IGxKmog+U4uMMi85ZwOEgNQUd36/qy7ZpHCJq7vPXk9m1y4GI67Ql/z0tYLia
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3264
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3DHIiUkns+iBqQvGU6gdcb4kROZvtsGRQitoIVIkoc=;
 b=QhnhAYt0RXXMvTEm8OcRU5HMqDHizHVkXWRz4nf8Umtb7SFCwY6Q5Uh42QGPeU//GEHytwmblkuylH9uj2R+CkN/huKk/ui15QS9cX0YNXXXhAwKTuBKA4s5+ZQ2lwbgyaxxBx/arsU7AXm3QAZbElsPV4OJoixz23BU/3GgclU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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
Cc: "alexdeucher@gmail.com" <alexdeucher@gmail.com>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV5IEdyb2R6b3Zz
a3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+DQo+IFNlbnQ6IDIwMTnlubQ45pyIMzDml6Ug
ODo1NA0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IGFsZXhkZXVj
aGVyQGdtYWlsLmNvbTsgWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47DQo+
IGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tOyBaaG91MSwgVGFvIDxUYW8uWmhvdTFA
YW1kLmNvbT47DQo+IEdyb2R6b3Zza3ksIEFuZHJleSA8QW5kcmV5Lkdyb2R6b3Zza3lAYW1kLmNv
bT4NCj4gU3ViamVjdDogW1BBVENIIHYyIDEvMl0gZG1yL2FtZGdwdTogQXZvaWQgSFcgR1BVIHJl
c2V0IGZvciBSQVMuDQo+IA0KPiBQcm9ibGVtOg0KPiBVbmRlciBjZXJ0YWluIGNvbmRpdGlvbnMs
IHdoZW4gc29tZSBJUCBib2NrcyB0YWtlIGEgUkFTIGVycm9yLCB3ZSBjYW4gZ2V0DQoNCltUYW9d
IHR5cG86ICJkbXIvYW1kZ3B1IiAtPiAiZHJtL2FtZGdwdSIsICJJUCBib2NrcyIgLT4gIklQIGJs
b2NrcyINCg0KPiBpbnRvIGEgc2l0dWF0aW9uIHdoZXJlIGEgR1BVIHJlc2V0IGlzIG5vdCBwb3Nz
aWJsZSBkdWUgdG8gaXNzdWVzIGluIFJBUyBpbg0KPiBTTVUvUFNQLg0KPiANCj4gVGVtcG9yYXJ5
IGZpeCB1bnRpbCBwcm9wZXIgc29sdXRpb24gaW4gUFNQL1NNVSBpcyByZWFkeToNCj4gV2hlbiB1
bmNvcnJlY3RhYmxlIGVycm9yIGhhcHBlbnMgdGhlIERGIHdpbGwgdW5jb25kaXRpb25hbGx5IGJy
b2FkY2FzdA0KPiBlcnJvciBldmVudCBwYWNrZXRzIHRvIGFsbCBpdHMgY2xpZW50cy9zbGF2ZSB1
cG9uIHJlY2VpdmluZyBmYXRhbCBlcnJvciBldmVudCBhbmQNCj4gZnJlZXplIGFsbCBpdHMgb3V0
Ym91bmQgcXVldWVzLCBlcnJfZXZlbnRfYXRodWIgaW50ZXJydXB0ICB3aWxsIGJlIHRyaWdnZXJl
ZC4NCj4gSW4gc3VjaCBjYXNlIGFuZCB3ZSB1c2UgdGhpcyBpbnRlcnJ1cHQNCj4gdG8gaXNzdWUg
R1BVIHJlc2V0LiBUSGUgR1BVIHJlc2V0IGNvZGUgaXMgbW9kaWZpZWQgZm9yIHN1Y2ggY2FzZSB0
byBhdm9pZCBIVw0KPiByZXNldCwgb25seSBzdG9wcyBzY2hlZHVsZXJzLCBkZWF0Y2hlcyBhbGwg
aW4gcHJvZ3Jlc3MgYW5kIG5vdCB5ZXQgc2NoZWR1bGVkDQo+IGpvYidzIGZlbmNlcywgc2V0IGVy
cm9yIGNvZGUgb24gdGhlbSBhbmQgc2lnbmFscy4NCj4gQWxzbyByZWplY3QgYW55IG5ldyBpbmNv
bWluZyBqb2Igc3VibWlzc2lvbnMgZnJvbSB1c2VyIHNwYWNlLg0KPiBBbGwgdGhpcyBpcyBkb25l
IHRvIG5vdGlmeSB0aGUgYXBwbGljYXRpb25zIG9mIHRoZSBwcm9ibGVtLg0KPiANCj4gdjI6DQo+
IEV4dHJhY3QgYW1kZ3B1X2FtZGtmZF9wcmUvcG9zdF9yZXNldCBmcm9tDQo+IGFtZGdwdV9kZXZp
Y2VfbG9jay91bmxvY2tfYWRldiBNb3ZlDQo+IGFtZGdwdV9qb2Jfc3RvcF9hbGxfam9ic19vbl9z
Y2hlZCB0byBhbWRncHVfam9iLmMgUmVtb3ZlIHByaW50IHBhcmFtDQo+IGZyb20gYW1kZ3B1X3Jh
c19xdWVyeV9lcnJvcl9jb3VudA0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zz
a3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgICAgIHwgIDQgKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCA0Ng0KPiArKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyAgICB8
ICA1ICsrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuYyAgICB8
IDM4DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2pvYi5oICAgIHwgIDMgKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9rbXMuYyAgICB8ICA2ICsrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9yYXMuYyAgICB8IDIyICsrKysrKysrKysrKy0tDQo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmggICAgfCAxMCArKysrKysrDQo+ICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jICAgICAgfCAxMCArKysrLS0tDQo+ICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jICAgICAgfCAyNCArKysrKysrKystLS0tLS0t
DQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQuYyAgICAgfCAgNSArKysr
DQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyAgICAgfCAzMiArKysr
KysrKysrKy0tLS0tLS0tLS0NCj4gIDEyIGZpbGVzIGNoYW5nZWQsIDE2MyBpbnNlcnRpb25zKCsp
LCA0MiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfY3MuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9jcy5jDQo+IGluZGV4IDlkYTY4MWUuLjMwMGFkYjggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9jcy5jDQo+IEBAIC0zOCw2ICszOCw3IEBADQo+ICAjaW5jbHVkZSAi
YW1kZ3B1X2dtYy5oIg0KPiAgI2luY2x1ZGUgImFtZGdwdV9nZW0uaCINCj4gICNpbmNsdWRlICJh
bWRncHVfZGlzcGxheS5oIg0KPiArI2luY2x1ZGUgImFtZGdwdV9yYXMuaCINCj4gDQo+ICAjaWYg
ZGVmaW5lZChIQVZFX0RSTV9GUkVFX0xBUkdFKQ0KPiAgI2RlZmluZSBrdmZyZWUgZHJtX2ZyZWVf
bGFyZ2UNCj4gQEAgLTE0NjEsNiArMTQ2Miw5IEBAIGludCBhbWRncHVfY3NfaW9jdGwoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgdm9pZA0KPiAqZGF0YSwgc3RydWN0IGRybV9maWxlICpmaWxwKQ0K
PiAgCWJvb2wgcmVzZXJ2ZWRfYnVmZmVycyA9IGZhbHNlOw0KPiAgCWludCBpLCByOw0KPiANCj4g
KwlpZiAoYW1kZ3B1X3Jhc19pbnRyX3RyaWdnZXJlZCgpKQ0KPiArCQlyZXR1cm4gLUVIV1BPSVNP
TjsNCj4gKw0KPiAgCWlmICghYWRldi0+YWNjZWxfd29ya2luZykNCj4gIAkJcmV0dXJuIC1FQlVT
WTsNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGV2aWNlLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMN
Cj4gaW5kZXggYTVkYWNjYy4uZDNhMDc4YiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPiBAQCAtMzcyNywyNSArMzcyNywxOCBAQCBzdGF0aWMg
Ym9vbCBhbWRncHVfZGV2aWNlX2xvY2tfYWRldihzdHJ1Y3QNCj4gYW1kZ3B1X2RldmljZSAqYWRl
diwgYm9vbCB0cnlsb2NrKQ0KPiAgCQlhZGV2LT5tcDFfc3RhdGUgPSBQUF9NUDFfU1RBVEVfTk9O
RTsNCj4gIAkJYnJlYWs7DQo+ICAJfQ0KPiAtCS8qIEJsb2NrIGtmZDogU1JJT1Ygd291bGQgZG8g
aXQgc2VwYXJhdGVseSAqLw0KPiAtCWlmICghYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKQ0KPiAtICAg
ICAgICAgICAgICAgIGFtZGdwdV9hbWRrZmRfcHJlX3Jlc2V0KGFkZXYpOw0KPiANCj4gIAlyZXR1
cm4gdHJ1ZTsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgdm9pZCBhbWRncHVfZGV2aWNlX3VubG9ja19h
ZGV2KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KSAgew0KPiAtCS8qdW5sb2NrIGtmZDogU1JJ
T1Ygd291bGQgZG8gaXQgc2VwYXJhdGVseSAqLw0KPiAtCWlmICghYW1kZ3B1X3NyaW92X3ZmKGFk
ZXYpKQ0KPiAtICAgICAgICAgICAgICAgIGFtZGdwdV9hbWRrZmRfcG9zdF9yZXNldChhZGV2KTsN
Cj4gIAlhbWRncHVfdmZfZXJyb3JfdHJhbnNfYWxsKGFkZXYpOw0KPiAgCWFkZXYtPm1wMV9zdGF0
ZSA9IFBQX01QMV9TVEFURV9OT05FOw0KPiAgCWFkZXYtPmluX2dwdV9yZXNldCA9IDA7DQo+ICAJ
bXV0ZXhfdW5sb2NrKCZhZGV2LT5sb2NrX3Jlc2V0KTsNCj4gIH0NCj4gDQo+IC0NCj4gIC8qKg0K
PiAgICogYW1kZ3B1X2RldmljZV9ncHVfcmVjb3ZlciAtIHJlc2V0IHRoZSBhc2ljIGFuZCByZWNv
dmVyIHNjaGVkdWxlcg0KPiAgICoNCj4gQEAgLTM3NjUsMTEgKzM3NTgsMTIgQEAgaW50IGFtZGdw
dV9kZXZpY2VfZ3B1X3JlY292ZXIoc3RydWN0DQo+IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAJ
c3RydWN0IGFtZGdwdV9oaXZlX2luZm8gKmhpdmUgPSBOVUxMOw0KPiAgCXN0cnVjdCBhbWRncHVf
ZGV2aWNlICp0bXBfYWRldiA9IE5VTEw7DQo+ICAJaW50IGksIHIgPSAwOw0KPiArCWJvb2wgaW5f
cmFzX2ludHIgPSBhbWRncHVfcmFzX2ludHJfdHJpZ2dlcmVkKCk7DQo+IA0KPiAgCW5lZWRfZnVs
bF9yZXNldCA9IGpvYl9zaWduYWxlZCA9IGZhbHNlOw0KPiAgCUlOSVRfTElTVF9IRUFEKCZkZXZp
Y2VfbGlzdCk7DQo+IA0KPiAtCWRldl9pbmZvKGFkZXYtPmRldiwgIkdQVSByZXNldCBiZWdpbiFc
biIpOw0KPiArCWRldl9pbmZvKGFkZXYtPmRldiwgIkdQVSAlcyBiZWdpbiFcbiIsIGluX3Jhc19p
bnRyID8gImpvYnMNCj4gK3N0b3AiOiJyZXNldCIpOw0KPiANCj4gIAljYW5jZWxfZGVsYXllZF93
b3JrX3N5bmMoJmFkZXYtPmRlbGF5ZWRfaW5pdF93b3JrKTsNCj4gDQo+IEBAIC0zNzk2LDkgKzM3
OTAsMTYgQEAgaW50IGFtZGdwdV9kZXZpY2VfZ3B1X3JlY292ZXIoc3RydWN0DQo+IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsDQo+ICAJCXJldHVybiAwOw0KPiAgCX0NCj4gDQo+ICsJLyogQmxvY2sga2Zk
OiBTUklPViB3b3VsZCBkbyBpdCBzZXBhcmF0ZWx5ICovDQo+ICsJaWYgKCFhbWRncHVfc3Jpb3Zf
dmYoYWRldikpDQo+ICsgICAgICAgICAgICAgICAgYW1kZ3B1X2FtZGtmZF9wcmVfcmVzZXQoYWRl
dik7DQo+ICsNCj4gIAkvKiBCdWlsZCBsaXN0IG9mIGRldmljZXMgdG8gcmVzZXQgKi8NCj4gIAlp
ZiAgKGFkZXYtPmdtYy54Z21pLm51bV9waHlzaWNhbF9ub2RlcyA+IDEpIHsNCj4gIAkJaWYgKCFo
aXZlKSB7DQo+ICsJCQkvKnVubG9jayBrZmQ6IFNSSU9WIHdvdWxkIGRvIGl0IHNlcGFyYXRlbHkg
Ki8NCj4gKwkJCWlmICghYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKQ0KPiArCQkgICAgICAgICAgICAg
ICAgYW1kZ3B1X2FtZGtmZF9wb3N0X3Jlc2V0KGFkZXYpOw0KPiAgCQkJYW1kZ3B1X2RldmljZV91
bmxvY2tfYWRldihhZGV2KTsNCj4gIAkJCXJldHVybiAtRU5PREVWOw0KPiAgCQl9DQo+IEBAIC0z
ODI0LDcgKzM4MjUsNyBAQCBpbnQgYW1kZ3B1X2RldmljZV9ncHVfcmVjb3ZlcihzdHJ1Y3QNCj4g
YW1kZ3B1X2RldmljZSAqYWRldiwNCj4gIAkvKiBibG9jayBhbGwgc2NoZWR1bGVycyBhbmQgcmVz
ZXQgZ2l2ZW4gam9iJ3MgcmluZyAqLw0KPiAgCWxpc3RfZm9yX2VhY2hfZW50cnkodG1wX2FkZXYs
IGRldmljZV9saXN0X2hhbmRsZSwgZ21jLnhnbWkuaGVhZCkgew0KPiAgCQkvKiBkaXNhYmxlIHJh
cyBvbiBBTEwgSVBzICovDQo+IC0JCWlmIChhbWRncHVfZGV2aWNlX2lwX25lZWRfZnVsbF9yZXNl
dCh0bXBfYWRldikpDQo+ICsJCWlmICghaW5fcmFzX2ludHIgJiYNCj4gYW1kZ3B1X2RldmljZV9p
cF9uZWVkX2Z1bGxfcmVzZXQodG1wX2FkZXYpKQ0KPiAgCQkJYW1kZ3B1X3Jhc19zdXNwZW5kKHRt
cF9hZGV2KTsNCj4gDQo+ICAJCWZvciAoaSA9IDA7IGkgPCBBTURHUFVfTUFYX1JJTkdTOyArK2kp
IHsgQEAgLTM4MzQsMTANCj4gKzM4MzUsMjYgQEAgaW50IGFtZGdwdV9kZXZpY2VfZ3B1X3JlY292
ZXIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAJCQkJY29udGludWU7DQo+IA0KPiAg
CQkJZHJtX3NjaGVkX3N0b3AoJnJpbmctPnNjaGVkLCBqb2IgPyAmam9iLT5iYXNlIDoNCj4gTlVM
TCk7DQo+ICsNCj4gKwkJCWlmIChpbl9yYXNfaW50cikNCj4gKwkJCQlhbWRncHVfam9iX3N0b3Bf
YWxsX2pvYnNfb25fc2NoZWQoJnJpbmctDQo+ID5zY2hlZCk7DQo+ICAJCX0NCj4gIAl9DQo+IA0K
PiANCj4gKwlpZiAoaW5fcmFzX2ludHIpIHsNCj4gKwkJbGlzdF9mb3JfZWFjaF9lbnRyeSh0bXBf
YWRldiwgZGV2aWNlX2xpc3RfaGFuZGxlLA0KPiBnbWMueGdtaS5oZWFkKSB7DQo+ICsJCQlpZiAo
dG1wX2FkZXYgPT0gYWRldikNCj4gKwkJCQljb250aW51ZTsNCj4gKw0KPiArCQkJaWYgKGFtZGdw
dV9kZXZpY2VfbG9ja19hZGV2KHRtcF9hZGV2LCBmYWxzZSkNCj4gJiYgIWFtZGdwdV9zcmlvdl92
Zih0bXBfYWRldikpDQo+ICsJCQkJYW1kZ3B1X2FtZGtmZF9wcmVfcmVzZXQodG1wX2FkZXYpOw0K
PiArDQo+ICsJCX0NCj4gKw0KPiArCQlnb3RvIHNraXBfc2NoZWRfcmVzdW1lOw0KPiArCX0NCj4g
Kw0KPiAgCS8qDQo+ICAJICogTXVzdCBjaGVjayBndWlsdHkgc2lnbmFsIGhlcmUgc2luY2UgYWZ0
ZXIgdGhpcyBwb2ludCBhbGwgb2xkDQo+ICAJICogSFcgZmVuY2VzIGFyZSBmb3JjZSBzaWduYWxl
ZC4NCj4gQEAgLTM4NzIsNyArMzg4OSw5IEBAIGludCBhbWRncHVfZGV2aWNlX2dwdV9yZWNvdmVy
KHN0cnVjdA0KPiBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgCQlpZiAodG1wX2FkZXYgPT0gYWRl
dikNCj4gIAkJCWNvbnRpbnVlOw0KPiANCj4gLQkJYW1kZ3B1X2RldmljZV9sb2NrX2FkZXYodG1w
X2FkZXYsIGZhbHNlKTsNCj4gKwkJaWYgKGFtZGdwdV9kZXZpY2VfbG9ja19hZGV2KHRtcF9hZGV2
LCBmYWxzZSkNCj4gJiYgIWFtZGdwdV9zcmlvdl92Zih0bXBfYWRldikpDQo+ICsJCQlhbWRncHVf
YW1ka2ZkX3ByZV9yZXNldCh0bXBfYWRldik7DQo+ICsNCj4gIAkJciA9IGFtZGdwdV9kZXZpY2Vf
cHJlX2FzaWNfcmVzZXQodG1wX2FkZXYsDQo+ICAJCQkJCQkgTlVMTCwNCj4gIAkJCQkJCSAmbmVl
ZF9mdWxsX3Jlc2V0KTsNCj4gQEAgLTM5MDAsNiArMzkxOSw3IEBAIGludCBhbWRncHVfZGV2aWNl
X2dwdV9yZWNvdmVyKHN0cnVjdA0KPiBhbWRncHVfZGV2aWNlICphZGV2LA0KPiANCj4gIAkvKiBQ
b3N0IEFTSUMgcmVzZXQgZm9yIGFsbCBkZXZzIC4qLw0KPiAgCWxpc3RfZm9yX2VhY2hfZW50cnko
dG1wX2FkZXYsIGRldmljZV9saXN0X2hhbmRsZSwgZ21jLnhnbWkuaGVhZCkgew0KPiArDQo+ICAJ
CWZvciAoaSA9IDA7IGkgPCBBTURHUFVfTUFYX1JJTkdTOyArK2kpIHsNCj4gIAkJCXN0cnVjdCBh
bWRncHVfcmluZyAqcmluZyA9IHRtcF9hZGV2LT5yaW5nc1tpXTsNCj4gDQo+IEBAIC0zOTI2LDcg
KzM5NDYsMTMgQEAgaW50IGFtZGdwdV9kZXZpY2VfZ3B1X3JlY292ZXIoc3RydWN0DQo+IGFtZGdw
dV9kZXZpY2UgKmFkZXYsDQo+ICAJCX0gZWxzZSB7DQo+ICAJCQlkZXZfaW5mbyh0bXBfYWRldi0+
ZGV2LCAiR1BVIHJlc2V0KCVkKQ0KPiBzdWNjZWVkZWQhXG4iLCBhdG9taWNfcmVhZCgmYWRldi0+
Z3B1X3Jlc2V0X2NvdW50ZXIpKTsNCj4gIAkJfQ0KPiArCX0NCj4gDQo+ICtza2lwX3NjaGVkX3Jl
c3VtZToNCj4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KHRtcF9hZGV2LCBkZXZpY2VfbGlzdF9oYW5k
bGUsIGdtYy54Z21pLmhlYWQpIHsNCj4gKwkJLyp1bmxvY2sga2ZkOiBTUklPViB3b3VsZCBkbyBp
dCBzZXBhcmF0ZWx5ICovDQo+ICsJCWlmICghaW5fcmFzX2ludHIgJiYgIWFtZGdwdV9zcmlvdl92
Zih0bXBfYWRldikpDQo+ICsJICAgICAgICAgICAgICAgIGFtZGdwdV9hbWRrZmRfcG9zdF9yZXNl
dCh0bXBfYWRldik7DQo+ICAJCWFtZGdwdV9kZXZpY2VfdW5sb2NrX2FkZXYodG1wX2FkZXYpOw0K
PiAgCX0NCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZHJ2LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMNCj4g
aW5kZXggMTUxZDdmMi4uNzU3ZmQ2ZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kcnYuYw0KPiBAQCAtNDAsNiArNDAsOCBAQA0KPiANCj4gICNpbmNsdWRlICJhbWRn
cHVfYW1ka2ZkLmgiDQo+IA0KPiArI2luY2x1ZGUgImFtZGdwdV9yYXMuaCINCj4gKw0KPiAgLyoN
Cj4gICAqIEtNUyB3cmFwcGVyLg0KPiAgICogLSAzLjAuMCAtIGluaXRpYWwgZHJpdmVyDQo+IEBA
IC0xMTc5LDYgKzExODEsOSBAQCBhbWRncHVfcGNpX3NodXRkb3duKHN0cnVjdCBwY2lfZGV2ICpw
ZGV2KQ0KPiAgCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBwY2lfZ2V0X2RydmRhdGEocGRldik7
DQo+ICAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBkZXYtPmRldl9wcml2YXRlOw0KPiAN
Cj4gKwlpZiAoYW1kZ3B1X3Jhc19pbnRyX3RyaWdnZXJlZCgpKQ0KPiArCQlyZXR1cm47DQo+ICsN
Cj4gIAkvKiBpZiB3ZSBhcmUgcnVubmluZyBpbiBhIFZNLCBtYWtlIHN1cmUgdGhlIGRldmljZQ0K
PiAgCSAqIHRvcm4gZG93biBwcm9wZXJseSBvbiByZWJvb3Qvc2h1dGRvd24uDQo+ICAJICogdW5m
b3J0dW5hdGVseSB3ZSBjYW4ndCBkZXRlY3QgY2VydGFpbiBkaWZmIC0tZ2l0DQo+IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2pvYi5jDQo+IGluZGV4IDRkNjdiNzcuLmIxMjk4MWUgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMNCj4gQEAgLTI1MCw2ICsyNTAs
NDQgQEAgc3RhdGljIHN0cnVjdCBkbWFfZmVuY2UgKmFtZGdwdV9qb2JfcnVuKHN0cnVjdA0KPiBk
cm1fc2NoZWRfam9iICpzY2hlZF9qb2IpDQo+ICAJcmV0dXJuIGZlbmNlOw0KPiAgfQ0KPiANCj4g
KyNkZWZpbmUgdG9fZHJtX3NjaGVkX2pvYihzY2hlZF9qb2IpCQlcDQo+ICsJCWNvbnRhaW5lcl9v
Zigoc2NoZWRfam9iKSwgc3RydWN0IGRybV9zY2hlZF9qb2IsDQo+IHF1ZXVlX25vZGUpDQo+ICsN
Cj4gK3ZvaWQgYW1kZ3B1X2pvYl9zdG9wX2FsbF9qb2JzX29uX3NjaGVkKHN0cnVjdCBkcm1fZ3B1
X3NjaGVkdWxlcg0KPiAqc2NoZWQpDQo+ICt7DQo+ICsJc3RydWN0IGRybV9zY2hlZF9qb2IgKnNf
am9iOw0KPiArCXN0cnVjdCBkcm1fc2NoZWRfZW50aXR5ICpzX2VudGl0eSA9IE5VTEw7DQo+ICsJ
aW50IGk7DQo+ICsNCj4gKwkvKiBTaWduYWwgYWxsIGpvYnMgbm90IHlldCBzY2hlZHVsZWQgKi8N
Cj4gKwlmb3IgKGkgPSBEUk1fU0NIRURfUFJJT1JJVFlfTUFYIC0gMTsgaSA+PQ0KPiBEUk1fU0NI
RURfUFJJT1JJVFlfTUlOOyBpLS0pIHsNCj4gKwkJc3RydWN0IGRybV9zY2hlZF9ycSAqcnEgPSAm
c2NoZWQtPnNjaGVkX3JxW2ldOw0KPiArDQo+ICsJCWlmICghcnEpDQo+ICsJCQljb250aW51ZTsN
Cj4gKw0KPiArCQlzcGluX2xvY2soJnJxLT5sb2NrKTsNCj4gKwkJbGlzdF9mb3JfZWFjaF9lbnRy
eShzX2VudGl0eSwgJnJxLT5lbnRpdGllcywgbGlzdCkgew0KPiArCQkJd2hpbGUgKChzX2pvYiA9
DQo+IHRvX2RybV9zY2hlZF9qb2Ioc3BzY19xdWV1ZV9wb3AoJnNfZW50aXR5LT5qb2JfcXVldWUp
KSkpIHsNCj4gKwkJCQlzdHJ1Y3QgZHJtX3NjaGVkX2ZlbmNlICpzX2ZlbmNlID0gc19qb2ItDQo+
ID5zX2ZlbmNlOw0KPiArDQo+ICsJCQkJZG1hX2ZlbmNlX3NpZ25hbCgmc19mZW5jZS0+c2NoZWR1
bGVkKTsNCj4gKwkJCQlkbWFfZmVuY2Vfc2V0X2Vycm9yKCZzX2ZlbmNlLT5maW5pc2hlZCwgLQ0K
PiBFSFdQT0lTT04pOw0KPiArCQkJCWRtYV9mZW5jZV9zaWduYWwoJnNfZmVuY2UtPmZpbmlzaGVk
KTsNCj4gKwkJCX0NCj4gKwkJfQ0KPiArCQlzcGluX3VubG9jaygmcnEtPmxvY2spOw0KPiArCX0N
Cj4gKw0KPiArCS8qIFNpZ25hbCBhbGwgam9icyBhbHJlYWR5IHNjaGVkdWxlZCB0byBIVyAqLw0K
PiArCWxpc3RfZm9yX2VhY2hfZW50cnkoc19qb2IsICZzY2hlZC0+cmluZ19taXJyb3JfbGlzdCwg
bm9kZSkgew0KPiArCQlzdHJ1Y3QgZHJtX3NjaGVkX2ZlbmNlICpzX2ZlbmNlID0gc19qb2ItPnNf
ZmVuY2U7DQo+ICsNCj4gKwkJZG1hX2ZlbmNlX3NldF9lcnJvcigmc19mZW5jZS0+ZmluaXNoZWQs
IC1FSFdQT0lTT04pOw0KPiArCQlkbWFfZmVuY2Vfc2lnbmFsKCZzX2ZlbmNlLT5maW5pc2hlZCk7
DQo+ICsJfQ0KPiArfQ0KPiArDQo+ICBjb25zdCBzdHJ1Y3QgZHJtX3NjaGVkX2JhY2tlbmRfb3Bz
IGFtZGdwdV9zY2hlZF9vcHMgPSB7DQo+ICAJLmRlcGVuZGVuY3kgPSBhbWRncHVfam9iX2RlcGVu
ZGVuY3ksDQo+ICAJLnJ1bl9qb2IgPSBhbWRncHVfam9iX3J1biwNCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuaA0KPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuaA0KPiBpbmRleCA1MWU2MjUwLi5kYzdlZTkzIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmgNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5oDQo+IEBAIC03Niw0ICs3
Niw3IEBAIGludCBhbWRncHVfam9iX3N1Ym1pdChzdHJ1Y3QgYW1kZ3B1X2pvYiAqam9iLCBzdHJ1
Y3QNCj4gZHJtX3NjaGVkX2VudGl0eSAqZW50aXR5LA0KPiAgCQkgICAgICB2b2lkICpvd25lciwg
c3RydWN0IGRtYV9mZW5jZSAqKmYpOyAgaW50DQo+IGFtZGdwdV9qb2Jfc3VibWl0X2RpcmVjdChz
dHJ1Y3QgYW1kZ3B1X2pvYiAqam9iLCBzdHJ1Y3QgYW1kZ3B1X3JpbmcNCj4gKnJpbmcsDQo+ICAJ
CQkgICAgIHN0cnVjdCBkbWFfZmVuY2UgKipmZW5jZSk7DQo+ICsNCj4gK3ZvaWQgYW1kZ3B1X2pv
Yl9zdG9wX2FsbF9qb2JzX29uX3NjaGVkKHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlcg0KPiArKnNj
aGVkKTsNCj4gKw0KPiAgI2VuZGlmDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfa21zLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfa21zLmMNCj4gaW5kZXggZGEyMTQzZC4uY2VkNzY2YyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYw0KPiBAQCAtMTA0Niw2ICsxMDQ2LDEyIEBAIGludCBh
bWRncHVfZHJpdmVyX29wZW5fa21zKHN0cnVjdCBkcm1fZGV2aWNlDQo+ICpkZXYsIHN0cnVjdCBk
cm1fZmlsZSAqZmlsZV9wcml2KQ0KPiAgCS8qIEVuc3VyZSBJQiB0ZXN0cyBhcmUgcnVuIG9uIHJp
bmcgKi8NCj4gIAlmbHVzaF9kZWxheWVkX3dvcmsoJmFkZXYtPmRlbGF5ZWRfaW5pdF93b3JrKTsN
Cj4gDQo+ICsNCj4gKwlpZiAoYW1kZ3B1X3Jhc19pbnRyX3RyaWdnZXJlZCgpKSB7DQo+ICsJCURS
TV9FUlJPUigiUkFTIEludHIgdHJpZ2dlcmVkLCBkZXZpY2UgZGlzYWJsZWQhISIpOw0KPiArCQly
ZXR1cm4gLUVIV1BPSVNPTjsNCj4gKwl9DQo+ICsNCj4gIAlmaWxlX3ByaXYtPmRyaXZlcl9wcml2
ID0gTlVMTDsNCj4gDQo+ICAJciA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMoZGV2LT5kZXYpOw0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQo+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQo+IGluZGV4IDJkNTg5N2Eu
LjdiMDBhYzYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMN
Cj4gQEAgLTI0LDYgKzI0LDggQEANCj4gICNpbmNsdWRlIDxsaW51eC9kZWJ1Z2ZzLmg+DQo+ICAj
aW5jbHVkZSA8bGludXgvbGlzdC5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiAr
I2luY2x1ZGUgPGxpbnV4L3JlYm9vdC5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L3N5c2NhbGxzLmg+
DQo+ICAjaW5jbHVkZSAiYW1kZ3B1LmgiDQo+ICAjaW5jbHVkZSAiYW1kZ3B1X3Jhcy5oIg0KPiAg
I2luY2x1ZGUgImFtZGdwdV9hdG9tZmlybXdhcmUuaCINCj4gQEAgLTY0LDYgKzY2LDkgQEAgY29u
c3QgY2hhciAqcmFzX2Jsb2NrX3N0cmluZ1tdID0gew0KPiAgLyogaW5qZWN0IGFkZHJlc3MgaXMg
NTIgYml0cyAqLw0KPiAgI2RlZmluZQlSQVNfVU1DX0lOSkVDVF9BRERSX0xJTUlUCSgweDFVTEwg
PDwgNTIpDQo+IA0KPiArDQo+ICthdG9taWNfdCBhbWRncHVfcmFzX2luX2ludHIgPSBBVE9NSUNf
SU5JVCgwKTsNCj4gKw0KPiAgc3RhdGljIGludCBhbWRncHVfcmFzX3Jlc2VydmVfdnJhbShzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gIAkJdWludDY0X3Qgb2Zmc2V0LCB1aW50NjRfdCBz
aXplLA0KPiAgCQlzdHJ1Y3QgYW1kZ3B1X2JvICoqYm9fcHRyKTsNCj4gQEAgLTE4OCw2ICsxOTMs
MTAgQEAgc3RhdGljIGludA0KPiBhbWRncHVfcmFzX2RlYnVnZnNfY3RybF9wYXJzZV9kYXRhKHN0
cnVjdCBmaWxlICpmLA0KPiANCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gKw0KPiArc3RhdGljIHN0
cnVjdCByYXNfbWFuYWdlciAqYW1kZ3B1X3Jhc19maW5kX29iaihzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZQ0KPiAqYWRldiwNCj4gKwkJc3RydWN0IHJhc19jb21tb25faWYgKmhlYWQpOw0KPiArDQo+ICAv
KioNCj4gICAqIERPQzogQU1ER1BVIFJBUyBkZWJ1Z2ZzIGNvbnRyb2wgaW50ZXJmYWNlDQo+ICAg
Kg0KPiBAQCAtNjI3LDEyICs2MzYsMTQgQEAgaW50IGFtZGdwdV9yYXNfZXJyb3JfcXVlcnkoc3Ry
dWN0DQo+IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAJaW5mby0+dWVfY291bnQgPSBvYmotPmVy
cl9kYXRhLnVlX2NvdW50Ow0KPiAgCWluZm8tPmNlX2NvdW50ID0gb2JqLT5lcnJfZGF0YS5jZV9j
b3VudDsNCj4gDQo+IC0JaWYgKGVycl9kYXRhLmNlX2NvdW50KQ0KPiArCWlmIChlcnJfZGF0YS5j
ZV9jb3VudCkgew0KPiAgCQlkZXZfaW5mbyhhZGV2LT5kZXYsICIlbGQgY29ycmVjdGFibGUgZXJy
b3JzIGRldGVjdGVkIGluICVzDQo+IGJsb2NrXG4iLA0KPiAgCQkJIG9iai0+ZXJyX2RhdGEuY2Vf
Y291bnQsIHJhc19ibG9ja19zdHIoaW5mby0NCj4gPmhlYWQuYmxvY2spKTsNCj4gLQlpZiAoZXJy
X2RhdGEudWVfY291bnQpDQo+ICsJfQ0KPiArCWlmIChlcnJfZGF0YS51ZV9jb3VudCkgew0KPiAg
CQlkZXZfaW5mbyhhZGV2LT5kZXYsICIlbGQgdW5jb3JyZWN0YWJsZSBlcnJvcnMgZGV0ZWN0ZWQN
Cj4gaW4gJXMgYmxvY2tcbiIsDQo+ICAJCQkgb2JqLT5lcnJfZGF0YS51ZV9jb3VudCwgcmFzX2Js
b2NrX3N0cihpbmZvLQ0KPiA+aGVhZC5ibG9jaykpOw0KPiArCX0NCj4gDQo+ICAJcmV0dXJuIDA7
DQo+ICB9DQo+IEBAIC0xNzE4LDMgKzE3MjksMTAgQEAgaW50IGFtZGdwdV9yYXNfZmluaShzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+ICsNCj4g
K3ZvaWQgYW1kZ3B1X3Jhc19nbG9iYWxfcmFzX2lzcihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dikgew0KPiArCWlmIChhdG9taWNfY21weGNoZygmYW1kZ3B1X3Jhc19pbl9pbnRyLCAwLCAxKSA9
PSAwKSB7DQo+ICsJCURSTV9XQVJOKCJSQVMgZXZlbnQgb2YgdHlwZQ0KPiBFUlJFVkVOVF9BVEhV
Ql9JTlRFUlJVUFQgZGV0ZWN0ZWQhIFN0b3BwaW5nIGFsbCBHUFUgam9icy5cbiIpOw0KPiArCX0N
Cj4gK30NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9y
YXMuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaA0KPiBpbmRl
eCA1YTBkZjczLi5jZjVmZmI2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcmFzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3Jhcy5oDQo+IEBAIC02MDAsNCArNjAwLDE0IEBAIGludCBhbWRncHVfcmFzX2ludGVycnVw
dF9yZW1vdmVfaGFuZGxlcihzdHJ1Y3QNCj4gYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gDQo+ICBp
bnQgYW1kZ3B1X3Jhc19pbnRlcnJ1cHRfZGlzcGF0Y2goc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsDQo+ICAJCXN0cnVjdCByYXNfZGlzcGF0Y2hfaWYgKmluZm8pOw0KPiArDQo+ICtleHRlcm4g
YXRvbWljX3QgYW1kZ3B1X3Jhc19pbl9pbnRyOw0KPiArDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wg
YW1kZ3B1X3Jhc19pbnRyX3RyaWdnZXJlZCh2b2lkKSB7DQo+ICsJcmV0dXJuICEhYXRvbWljX3Jl
YWQoJmFtZGdwdV9yYXNfaW5faW50cik7DQo+ICt9DQo+ICsNCj4gK3ZvaWQgYW1kZ3B1X3Jhc19n
bG9iYWxfcmFzX2lzcihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7DQo+ICsNCj4gICNlbmRp
Zg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0K
PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCj4gaW5kZXggYjJjODZh
MC4uZTdhODNmNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4
X3Y5XzAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+
IEBAIC01NjY5LDEwICs1NjY5LDEyIEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfcHJvY2Vzc19yYXNf
ZGF0YV9jYihzdHJ1Y3QNCj4gYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gIAkJc3RydWN0IGFtZGdw
dV9pdl9lbnRyeSAqZW50cnkpDQo+ICB7DQo+ICAJLyogVE9ETyB1ZSB3aWxsIHRyaWdnZXIgYW4g
aW50ZXJydXB0LiAqLw0KPiAtCWtnZDJrZmRfc2V0X3NyYW1fZWNjX2ZsYWcoYWRldi0+a2ZkLmRl
dik7DQo+IC0JaWYgKGFkZXYtPmdmeC5mdW5jcy0+cXVlcnlfcmFzX2Vycm9yX2NvdW50KQ0KPiAt
CQlhZGV2LT5nZnguZnVuY3MtPnF1ZXJ5X3Jhc19lcnJvcl9jb3VudChhZGV2LCBlcnJfZGF0YSk7
DQo+IC0JYW1kZ3B1X3Jhc19yZXNldF9ncHUoYWRldiwgMCk7DQo+ICsJaWYgKCFhbWRncHVfcmFz
X2lzX3N1cHBvcnRlZChhZGV2LCBBTURHUFVfUkFTX0JMT0NLX19HRlgpKSB7DQo+ICsJCWtnZDJr
ZmRfc2V0X3NyYW1fZWNjX2ZsYWcoYWRldi0+a2ZkLmRldik7DQo+ICsJCWlmIChhZGV2LT5nZngu
ZnVuY3MtPnF1ZXJ5X3Jhc19lcnJvcl9jb3VudCkNCj4gKwkJCWFkZXYtPmdmeC5mdW5jcy0+cXVl
cnlfcmFzX2Vycm9yX2NvdW50KGFkZXYsDQo+IGVycl9kYXRhKTsNCj4gKwkJYW1kZ3B1X3Jhc19y
ZXNldF9ncHUoYWRldiwgMCk7DQo+ICsJfQ0KPiAgCXJldHVybiBBTURHUFVfUkFTX1NVQ0NFU1M7
DQo+ICB9DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21j
X3Y5XzAuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4gaW5k
ZXggNDNiNGZiYy4uODdhNjZjMiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djlfMC5jDQo+IEBAIC0yNDMsMTggKzI0MywyMCBAQCBzdGF0aWMgaW50IGdtY192OV8wX3Byb2Nl
c3NfcmFzX2RhdGFfY2Ioc3RydWN0DQo+IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAJCXN0cnVj
dCByYXNfZXJyX2RhdGEgKmVycl9kYXRhLA0KPiAgCQlzdHJ1Y3QgYW1kZ3B1X2l2X2VudHJ5ICpl
bnRyeSkNCj4gIHsNCj4gLQlrZ2Qya2ZkX3NldF9zcmFtX2VjY19mbGFnKGFkZXYtPmtmZC5kZXYp
Ow0KPiAtCWlmIChhZGV2LT51bWMuZnVuY3MtPnF1ZXJ5X3Jhc19lcnJvcl9jb3VudCkNCj4gLQkJ
YWRldi0+dW1jLmZ1bmNzLT5xdWVyeV9yYXNfZXJyb3JfY291bnQoYWRldiwgZXJyX2RhdGEpOw0K
PiAtCS8qIHVtYyBxdWVyeV9yYXNfZXJyb3JfYWRkcmVzcyBpcyBhbHNvIHJlc3BvbnNpYmxlIGZv
ciBjbGVhcmluZw0KPiAtCSAqIGVycm9yIHN0YXR1cw0KPiAtCSAqLw0KPiAtCWlmIChhZGV2LT51
bWMuZnVuY3MtPnF1ZXJ5X3Jhc19lcnJvcl9hZGRyZXNzKQ0KPiAtCQlhZGV2LT51bWMuZnVuY3Mt
PnF1ZXJ5X3Jhc19lcnJvcl9hZGRyZXNzKGFkZXYsIGVycl9kYXRhKTsNCj4gKwlpZiAoIWFtZGdw
dV9yYXNfaXNfc3VwcG9ydGVkKGFkZXYsIEFNREdQVV9SQVNfQkxPQ0tfX0dGWCkpIHsNCltUYW9d
ICBDb21tZW50IGlzIHJlY29tbWVuZGVkIGZvciB0aGUgaWYgY29uZGl0aW9uDQoNCj4gKwkJa2dk
MmtmZF9zZXRfc3JhbV9lY2NfZmxhZyhhZGV2LT5rZmQuZGV2KTsNCj4gKwkJaWYgKGFkZXYtPnVt
Yy5mdW5jcy0+cXVlcnlfcmFzX2Vycm9yX2NvdW50KQ0KPiArCQkJYWRldi0+dW1jLmZ1bmNzLT5x
dWVyeV9yYXNfZXJyb3JfY291bnQoYWRldiwNCj4gZXJyX2RhdGEpOw0KPiArCQkvKiB1bWMgcXVl
cnlfcmFzX2Vycm9yX2FkZHJlc3MgaXMgYWxzbyByZXNwb25zaWJsZSBmb3INCj4gY2xlYXJpbmcN
Cj4gKwkJICogZXJyb3Igc3RhdHVzDQo+ICsJCSAqLw0KPiArCQlpZiAoYWRldi0+dW1jLmZ1bmNz
LT5xdWVyeV9yYXNfZXJyb3JfYWRkcmVzcykNCj4gKwkJCWFkZXYtPnVtYy5mdW5jcy0+cXVlcnlf
cmFzX2Vycm9yX2FkZHJlc3MoYWRldiwNCj4gZXJyX2RhdGEpOw0KPiANCj4gLQkvKiBvbmx5IHVu
Y29ycmVjdGFibGUgZXJyb3IgbmVlZHMgZ3B1IHJlc2V0ICovDQo+IC0JaWYgKGVycl9kYXRhLT51
ZV9jb3VudCkNCj4gLQkJYW1kZ3B1X3Jhc19yZXNldF9ncHUoYWRldiwgMCk7DQo+ICsJCS8qIG9u
bHkgdW5jb3JyZWN0YWJsZSBlcnJvciBuZWVkcyBncHUgcmVzZXQgKi8NCj4gKwkJaWYgKGVycl9k
YXRhLT51ZV9jb3VudCkNCj4gKwkJCWFtZGdwdV9yYXNfcmVzZXRfZ3B1KGFkZXYsIDApOw0KPiAr
CX0NCj4gDQo+ICAJcmV0dXJuIEFNREdQVV9SQVNfU1VDQ0VTUzsNCj4gIH0NCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjdfNC5jDQo+IGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvbmJpb192N180LmMNCj4gaW5kZXggMzY3ZjlkNi4uNTQ1OTkwYyAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmJpb192N180LmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmJpb192N180LmMNCj4gQEAgLTMwLDYg
KzMwLDcgQEANCj4gICNpbmNsdWRlICJuYmlvL25iaW9fN180XzBfc21uLmgiDQo+ICAjaW5jbHVk
ZSAiaXZzcmNpZC9uYmlvL2lycXNyY3NfbmJpZl83XzQuaCINCj4gICNpbmNsdWRlIDx1YXBpL2xp
bnV4L2tmZF9pb2N0bC5oPg0KPiArI2luY2x1ZGUgImFtZGdwdV9yYXMuaCINCj4gDQo+ICAjZGVm
aW5lIHNtbk5CSUZfTUdDR19DVFJMX0xDTEsJMHgxMDEzYTIxYw0KPiANCj4gQEAgLTMyOSw2ICsz
MzAsOCBAQCBzdGF0aWMgdm9pZA0KPiBuYmlvX3Y3XzRfaGFuZGxlX3Jhc19jb250cm9sbGVyX2lu
dHJfbm9fYmlmcmluZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZQ0KPiAgCQkJCQkJQklGX0RPT1JCRUxM
X0lOVF9DTlRMLA0KPiANCj4gCVJBU19DTlRMUl9JTlRFUlJVUFRfQ0xFQVIsIDEpOw0KPiAgCQlX
UkVHMzJfU09DMTUoTkJJTywgMCwgbW1CSUZfRE9PUkJFTExfSU5UX0NOVEwsDQo+IGJpZl9kb29y
YmVsbF9pbnRyX2NudGwpOw0KPiArDQo+ICsJCWFtZGdwdV9yYXNfZ2xvYmFsX3Jhc19pc3IoYWRl
dik7DQo+ICAJfQ0KPiAgfQ0KPiANCj4gQEAgLTM0NCw2ICszNDcsOCBAQCBzdGF0aWMgdm9pZA0K
PiBuYmlvX3Y3XzRfaGFuZGxlX3Jhc19lcnJfZXZlbnRfYXRodWJfaW50cl9ub19iaWZyaW5nKHN0
cnVjdCBhbWRncHVfZA0KPiAgCQkJCQkJQklGX0RPT1JCRUxMX0lOVF9DTlRMLA0KPiANCj4gCVJB
U19BVEhVQl9FUlJfRVZFTlRfSU5URVJSVVBUX0NMRUFSLCAxKTsNCj4gIAkJV1JFRzMyX1NPQzE1
KE5CSU8sIDAsIG1tQklGX0RPT1JCRUxMX0lOVF9DTlRMLA0KPiBiaWZfZG9vcmJlbGxfaW50cl9j
bnRsKTsNCj4gKw0KPiArCQlhbWRncHVfcmFzX2dsb2JhbF9yYXNfaXNyKGFkZXYpOw0KPiAgCX0N
Cj4gIH0NCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1h
X3Y0XzAuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jDQo+IGlu
ZGV4IDk1NjQzMmYuLjQzOGU1MDQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NkbWFfdjRfMC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nk
bWFfdjRfMC5jDQo+IEBAIC0xOTcyLDI0ICsxOTcyLDI2IEBAIHN0YXRpYyBpbnQNCj4gc2RtYV92
NF8wX3Byb2Nlc3NfcmFzX2RhdGFfY2Ioc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAJ
dWludDMyX3QgZXJyX3NvdXJjZTsNCj4gIAlpbnQgaW5zdGFuY2U7DQo+IA0KPiAtCWluc3RhbmNl
ID0gc2RtYV92NF8wX2lycV9pZF90b19zZXEoZW50cnktPmNsaWVudF9pZCk7DQo+IC0JaWYgKGlu
c3RhbmNlIDwgMCkNCj4gLQkJcmV0dXJuIDA7DQo+ICsJaWYgKCFhbWRncHVfcmFzX2lzX3N1cHBv
cnRlZChhZGV2LCBBTURHUFVfUkFTX0JMT0NLX19HRlgpKSB7DQo+ICsJCWluc3RhbmNlID0gc2Rt
YV92NF8wX2lycV9pZF90b19zZXEoZW50cnktPmNsaWVudF9pZCk7DQo+ICsJCWlmIChpbnN0YW5j
ZSA8IDApDQo+ICsJCQlyZXR1cm4gMDsNCj4gDQo+IC0Jc3dpdGNoIChlbnRyeS0+c3JjX2lkKSB7
DQo+IC0JY2FzZSBTRE1BMF80XzBfX1NSQ0lEX19TRE1BX1NSQU1fRUNDOg0KPiAtCQllcnJfc291
cmNlID0gMDsNCj4gLQkJYnJlYWs7DQo+IC0JY2FzZSBTRE1BMF80XzBfX1NSQ0lEX19TRE1BX0VD
QzoNCj4gLQkJZXJyX3NvdXJjZSA9IDE7DQo+IC0JCWJyZWFrOw0KPiAtCWRlZmF1bHQ6DQo+IC0J
CXJldHVybiAwOw0KPiAtCX0NCj4gKwkJc3dpdGNoIChlbnRyeS0+c3JjX2lkKSB7DQo+ICsJCWNh
c2UgU0RNQTBfNF8wX19TUkNJRF9fU0RNQV9TUkFNX0VDQzoNCj4gKwkJCWVycl9zb3VyY2UgPSAw
Ow0KPiArCQkJYnJlYWs7DQo+ICsJCWNhc2UgU0RNQTBfNF8wX19TUkNJRF9fU0RNQV9FQ0M6DQo+
ICsJCQllcnJfc291cmNlID0gMTsNCj4gKwkJCWJyZWFrOw0KPiArCQlkZWZhdWx0Og0KPiArCQkJ
cmV0dXJuIDA7DQo+ICsJCX0NCj4gDQo+IC0Ja2dkMmtmZF9zZXRfc3JhbV9lY2NfZmxhZyhhZGV2
LT5rZmQuZGV2KTsNCj4gKwkJa2dkMmtmZF9zZXRfc3JhbV9lY2NfZmxhZyhhZGV2LT5rZmQuZGV2
KTsNCj4gDQo+IC0JYW1kZ3B1X3Jhc19yZXNldF9ncHUoYWRldiwgMCk7DQo+ICsJCWFtZGdwdV9y
YXNfcmVzZXRfZ3B1KGFkZXYsIDApOw0KPiArCX0NCj4gDQo+ICAJcmV0dXJuIEFNREdQVV9SQVNf
U1VDQ0VTUzsNCj4gIH0NCj4gLS0NCj4gMi43LjQNCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
