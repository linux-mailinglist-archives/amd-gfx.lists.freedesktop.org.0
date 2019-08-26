Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75D69C8EE
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 08:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6611589FC9;
	Mon, 26 Aug 2019 06:05:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730047.outbound.protection.outlook.com [40.107.73.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A176D89FC9
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 06:05:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MhHWTAYgXm7Y9x/HUgrHosk3HR3vOaddfdK7WBWCCKDyDv12aaykNshhh0BQ4oYYCx/EKYaZ1HrTD/prioBTPADJjQiXoS8i+xusR96Sj6g7V4JWU1fOHp0lNg6nGjB5ZpaUgGikCqtzu+WctArfSqJWbatiedBsS0hxbGeYGVKZjayu8cTtEdveCIt5zrYPnffAAqxGy1sc2O7Kb4zoSHjLSeHpB6pT8If6ucRfbM+ENAnuyS4KWdCJge9vyHWYl2WTMjj9/Nn7nrAwzNPOE10RwWUIOAymrTvNsu3qlM1OipAwaL6qftjg4BZewAxeV5OHJFPYUj/rjzI1rSIpWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UE656XA7FZLc1cdIU1eJEveXl4N5dxbDKxgfc9cm2Jc=;
 b=YNEqFHJd3Gv7wurSNXE/vuXJR4Kpkued/hPKrhW4wCwCQMKk6qaYTlGnCvyu0mEUJZ9nrGWhBk+PXAvn2cibuOS/PRWSlj9s0y2koJTGdgZR8BfeUXADRmtVWEqLZrawtcbSQnZ7iHKb58UKuUcR+Rp+gxqIWjOdexHFLZC6Cw5xlpIvVXo4q7SaiBecRLAn1IJqnpLq/dm7rh2jH6ebFUVVJmwKcBU35ueTyppoha3Y505axrT5UZQwKGc56Sb939UNYrGmffF7OMXss4q1mXcERWjhrm4lqKWb0Wnzr4YhjBUGm5BoLA/HgDKPT1ZSC/+/+CkFq2KGvDsIHW82sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB4207.namprd12.prod.outlook.com (52.135.50.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 06:05:15 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 06:05:15 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 7/8] drm/amdgpu: enable/disable ras_controller_irq and
 err_event_athub_irq
Thread-Topic: [PATCH 7/8] drm/amdgpu: enable/disable ras_controller_irq and
 err_event_athub_irq
Thread-Index: AQHVW8IiHWZyOyzzGkqsG/UvJcZ65acM79nA
Date: Mon, 26 Aug 2019 06:05:15 +0000
Message-ID: <MN2PR12MB3054689EC075D8A9BDFF3432B0A10@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <1566791700-1912-1-git-send-email-Hawking.Zhang@amd.com>
 <1566791700-1912-8-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1566791700-1912-8-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a02d020e-3eb1-4352-58fb-08d729eb5d74
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4207; 
x-ms-traffictypediagnostic: MN2PR12MB4207:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB42074BF7096C9DF697C6A030B0A10@MN2PR12MB4207.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:198;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(189003)(13464003)(199004)(53936002)(66066001)(8936002)(316002)(110136005)(86362001)(74316002)(6436002)(52536014)(305945005)(8676002)(81156014)(81166006)(7736002)(66556008)(5660300002)(76116006)(64756008)(66446008)(33656002)(11346002)(446003)(486006)(2906002)(476003)(6506007)(53546011)(71200400001)(71190400001)(2501003)(6116002)(478600001)(14454004)(6636002)(3846002)(26005)(66946007)(66476007)(256004)(76176011)(7696005)(102836004)(229853002)(25786009)(9686003)(55016002)(6306002)(6246003)(966005)(4326008)(99286004)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4207;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iAjfOQPNdXp7KzIVODKyzlu+JyLvT8E4VZyYYqcKLWAezu6gCtOHK+Gn+f91w2gJdVx9zKRF+FwfPPUrcwkbtV6Qm9lMoh6BNThIjlnfj0aeL9mWuo2rVGMMt3tN3QpWEQaZQ5lYjWLJct9WtJO90gHYQpLeiYrOdMu0xXNF7j3ugmQJi9tWAezp575B/t8Oc3WOPERlcu/jELbwsRMZ7cR+cwc2iycG1IhwiXHKU2iAW86LthdEMarHkuwchscJp6SOq2JGeNJ8Ne5Oxkiw7Nk/5zMbPWs2lpspvya4ad1pAHF90wZyi7qa92q3LhDflhOVLlPWjCyn55kfKH+TXPBemrNrskhy/7cqnflUwew4Y+6g2GJdGbC+Ncd/iyBn6xFh6XoLDBybwRw6Y9ucPGvbow5yN9DA0YW322Z1/rA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a02d020e-3eb1-4352-58fb-08d729eb5d74
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 06:05:15.6644 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3RTY4rftL2v9wVGnvtaUOAqSWdYh1JZ9epIGLp0FD9h9wB1czoeyJTnTgpiWgQKo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4207
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UE656XA7FZLc1cdIU1eJEveXl4N5dxbDKxgfc9cm2Jc=;
 b=2pBYEFVOwFrZI7DZn0d3GaTPBZdpuR5/8MWaR6SHpBXa4TIqHYv1ZAJv9hP985SVoVTffeYbk1bwS+H8zO+WJ2gA/UB7+sRAUboayAKXs2Oq6LvMJBqx/8PnF8EcfCWM9y0TXkLfaRM1u+MKhBJoov4QcAv/M1e34L4hUJkEOx4=
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
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IEhhd2tpbmcg
WmhhbmcNCj4gU2VudDogMjAxOeW5tDjmnIgyNuaXpSAxMTo1NQ0KPiBUbzogYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7IERldWNoZXIsIEFsZXhhbmRlcg0KPiA8QWxleGFuZGVyLkRldWNo
ZXJAYW1kLmNvbT4NCj4gQ2M6IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+
DQo+IFN1YmplY3Q6IFtQQVRDSCA3LzhdIGRybS9hbWRncHU6IGVuYWJsZS9kaXNhYmxlIHJhc19j
b250cm9sbGVyX2lycSBhbmQNCj4gZXJyX2V2ZW50X2F0aHViX2lycQ0KPiANCltUYW9dIG5lZWQg
YSBjb21taXQgZGVzY3JpcHRpb24NCg0KPiBTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxI
YXdraW5nLlpoYW5nQGFtZC5jb20+DQo+IFJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ21jX3Y5XzAuYyB8IDE2ICsrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
NiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8w
LmMNCj4gaW5kZXggNTVkYTZmNS4uOGI0YTU2OCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nbWNfdjlfMC5jDQo+IEBAIC04MjIsNiArODIyLDE4IEBAIHN0YXRpYyBpbnQgZ21jX3Y5
XzBfZWNjX3Jhc19ibG9ja19sYXRlX2luaXQodm9pZA0KPiAqaGFuZGxlLA0KPiAgCQkJZ290byBp
cnE7DQo+ICAJfQ0KPiANCj4gKwlpZiAoYWRldi0+bmJpby5mdW5jcy0+aW5pdF9yYXNfY29udHJv
bGxlcl9pbnRlcnJ1cHQpIHsNCj4gKwkJciA9IGFtZGdwdV9pcnFfZ2V0KGFkZXYsICZhZGV2LT5u
YmlvLnJhc19jb250cm9sbGVyX2lycSwgMCk7DQo+ICsJCWlmIChyKQ0KPiArCQkJZ290byBpcnE7
DQo+ICsJfQ0KPiArDQo+ICsJaWYgKGFkZXYtPm5iaW8uZnVuY3MtPmluaXRfcmFzX2Vycl9ldmVu
dF9hdGh1Yl9pbnRlcnJ1cHQpIHsNCj4gKwkJciA9IGFtZGdwdV9pcnFfZ2V0KGFkZXYsICZhZGV2
LQ0KPiA+bmJpby5yYXNfZXJyX2V2ZW50X2F0aHViX2lycSwgMCk7DQo+ICsJCWlmIChyKQ0KPiAr
CQkJZ290byBpcnE7DQo+ICsJfQ0KW1Rhb10gQm90aCB1bWMgYW5kIG1taHViIHJhcyBpbml0IHdp
bGwgY2FsbCBpdCwgSSB0aGluayBpdCdzIGJldHRlciB0byBwdXQgdGhlc2UgdHdvIGlycV9nZXQg
aW4gdGhlIHBhdGggb2YgdW1jIGJsb2NrLg0KDQo+ICsNCj4gIAlyZXR1cm4gMDsNCj4gIGlycToN
Cj4gIAlhbWRncHVfcmFzX3N5c2ZzX3JlbW92ZShhZGV2LCAqcmFzX2lmKTsgQEAgLTE0MjcsNiAr
MTQzOSwxMA0KPiBAQCBzdGF0aWMgaW50IGdtY192OV8wX2h3X2Zpbmkodm9pZCAqaGFuZGxlKQ0K
PiANCj4gIAlhbWRncHVfaXJxX3B1dChhZGV2LCAmYWRldi0+Z21jLmVjY19pcnEsIDApOw0KPiAg
CWFtZGdwdV9pcnFfcHV0KGFkZXYsICZhZGV2LT5nbWMudm1fZmF1bHQsIDApOw0KPiArCWlmIChh
ZGV2LT5uYmlvLmZ1bmNzLT5pbml0X3Jhc19jb250cm9sbGVyX2ludGVycnVwdCkNCj4gKwkJYW1k
Z3B1X2lycV9wdXQoYWRldiwgJmFkZXYtPm5iaW8ucmFzX2NvbnRyb2xsZXJfaXJxLCAwKTsNCj4g
KwlpZiAoYWRldi0+bmJpby5mdW5jcy0+aW5pdF9yYXNfZXJyX2V2ZW50X2F0aHViX2ludGVycnVw
dCkNCj4gKwkJYW1kZ3B1X2lycV9wdXQoYWRldiwgJmFkZXYtDQo+ID5uYmlvLnJhc19lcnJfZXZl
bnRfYXRodWJfaXJxLCAwKTsNCj4gIAlnbWNfdjlfMF9nYXJ0X2Rpc2FibGUoYWRldik7DQo+IA0K
PiAgCXJldHVybiAwOw0KPiAtLQ0KPiAyLjcuNA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
