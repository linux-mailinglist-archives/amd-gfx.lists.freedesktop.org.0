Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EE057923
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Jun 2019 03:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D7D6E57F;
	Thu, 27 Jun 2019 01:51:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750078.outbound.protection.outlook.com [40.107.75.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B4B6E57F
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Jun 2019 01:51:37 +0000 (UTC)
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3423.namprd12.prod.outlook.com (20.178.242.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Thu, 27 Jun 2019 01:51:35 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1%3]) with mapi id 15.20.2008.017; Thu, 27 Jun 2019
 01:51:22 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: warn on smu interface version mismatch
Thread-Topic: [PATCH] drm/amd/powerplay: warn on smu interface version mismatch
Thread-Index: AQHVK+fJXp+C2SF0xkCEf4zbx9jaSqateYCogAFDEOA=
Date: Thu, 27 Jun 2019 01:51:22 +0000
Message-ID: <MN2PR12MB3344BE7B57FC531F96DEDB44E4FD0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190626062402.18551-1-xiaojie.yuan@amd.com>
 <BN8PR12MB36021167B2EBF7F48CE93CCA89E20@BN8PR12MB3602.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB36021167B2EBF7F48CE93CCA89E20@BN8PR12MB3602.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ea3f7a7f-8049-4c7a-88d9-08d6faa1f4f7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3423; 
x-ms-traffictypediagnostic: MN2PR12MB3423:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3423A54653ED629C040C463BE4FD0@MN2PR12MB3423.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(366004)(136003)(396003)(346002)(13464003)(199004)(189003)(25786009)(5660300002)(2906002)(86362001)(6246003)(7696005)(486006)(305945005)(8936002)(8676002)(476003)(55016002)(9686003)(478600001)(72206003)(6306002)(11346002)(6436002)(3846002)(76176011)(52536014)(966005)(6116002)(446003)(7736002)(81166006)(186003)(53546011)(6506007)(26005)(99286004)(102836004)(81156014)(4326008)(110136005)(53936002)(71190400001)(68736007)(14454004)(71200400001)(33656002)(316002)(66946007)(2501003)(66446008)(229853002)(64756008)(74316002)(66476007)(76116006)(14444005)(73956011)(256004)(66556008)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3423;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CfKub9xqy4tborJ19F6d1quIbGxXSwhsGhQ9uxOvn+hCIa4xQ8yFEoojoZthTms+x7bZvznHnl5YaySkIh4hqOOTa/Y16CE5F6CM6duLsYS5aeVEc8l37QBOuIaunNIzFJ0vwIKb/oR/E8hToHVXNqEUXmoLW6iF69i3rvyhxlSMrIpinTVz+AcOHbpTvrce4ZIIZuxpWLMufRS/OrDRXALdh9YHmZF8YuBbSDKQTlEQXcyG1U8A+gLK2qCD2v7Ls47o1cSl/f1GqPj/FNP9jiZLm7vTEH9Qv7Kl7GcRokZNWIEhBO7eLX4OuF5eQXWsWABbeSFMn0RZkjlXC2i/46nXU+jhriSbwJrHWSyIRJB9gx7JaKrn91gnhqZNrBtxRPclBxxSZ6vF10Ma+kFYch8eiFesazxdKDuHbbChLQo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea3f7a7f-8049-4c7a-88d9-08d6faa1f4f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 01:51:22.3826 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3423
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1aiYyjS2pHoeyONEYel3+Ran3gtiKK2LJy6P93QjpYA=;
 b=bpMgb9GaMD/pbYhdKVmlRhc0U9g5Oa2p8xrOREDcy2m+J0CqEjVZP27dZsyAaYfK7cRZCVcd4wCL4rO3dtGjdtm5eaE4Nh4rGhCVC73N19zOOvF+zYkdRPxi4nWSuSVkCpVwS5ewabjDwCYrwRWTsxzImTSa2clqXYTwSlR6is8=
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
Cc: "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SSBkbyBub3QgdGhpbmsgdGhpcyBpcyBhIGdvb2QgaWRlYS4NCkFzIHRoZXJlIGlzIHN0aWxsIHNv
bWUgY2FzZXMgdGhhdCB2ZXJzaW9uIG1pc21hdGNoIHdpbGwgY2F1c2UgdW5leHBlY3RlZCAgaXNz
dWVzLiBBbmQgdGhleSB3aWxsIGJlIGhhcmQgdG8gZGVidWcuDQpJZiB0aGlzIGlzIGZvciBkZWJ1
ZyBwdXJwb3NlIG9ubHksIEkgd291bGQgc3VnZ2VzdCB0byBrZWVwIHRoaXMgaW4geW91ciBjdXN0
b20gYnJhbmNoIG9ubHkuDQoNClJlZ2FyZHMsDQpFdmFuDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+IEZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3Rv
cC5vcmc+IE9uIEJlaGFsZiBPZg0KPiBZdWFuLCBYaWFvamllDQo+IFNlbnQ6IFdlZG5lc2RheSwg
SnVuZSAyNiwgMjAxOSAyOjM0IFBNDQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPiBDYzogV2FuZywgS2V2aW4oWWFuZykgPEtldmluMS5XYW5nQGFtZC5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0hdIGRybS9hbWQvcG93ZXJwbGF5OiB3YXJuIG9uIHNtdSBpbnRlcmZhY2Ug
dmVyc2lvbg0KPiBtaXNtYXRjaA0KPiANCj4gQ3VycmVudCBTTVUgSUYgdmVyc2lvbiBjaGVjayBp
cyB0b28gc3RyaWN0LCBkcml2ZXIgd2l0aCBvbGQgc211MTFfZHJpdmVyX2lmLmgNCj4gc29tZXRp
bWVzIHdvcmtzIGZpbmUgd2l0aCBuZXcgU01VIGZpcm13YXJlLiBXZSBwcmVmZXIgdG8gc2VlIGEg
d2FybmluZw0KPiBpbnN0ZWFkIGEgZXJyb3IgZm9yIGRlYnVnIHB1cnBvc2VzLg0KPiANCj4gQlIs
DQo+IFhpYW9qaWUNCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCj4gRnJvbTogWXVhbiwgWGlhb2ppZQ0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMjYsIDIw
MTkgMjoyNDoxOSBQTQ0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6
IFdhbmcsIEtldmluKFlhbmcpOyBZdWFuLCBYaWFvamllDQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJt
L2FtZC9wb3dlcnBsYXk6IHdhcm4gb24gc211IGludGVyZmFjZSB2ZXJzaW9uDQo+IG1pc21hdGNo
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUueXVhbkBhbWQuY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIHwg
MyArLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjEx
XzAuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jDQo+IGlu
ZGV4IGMzZjQ4ZmFlNmYzMi4uMzM5ZDA2M2UyNGZmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYw0KPiBAQCAtMjcyLDggKzI3Miw3IEBAIHN0YXRpYyBp
bnQgc211X3YxMV8wX2NoZWNrX2Z3X3ZlcnNpb24oc3RydWN0DQo+IHNtdV9jb250ZXh0ICpzbXUp
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICJzbXUgZncgdmVyc2lvbiA9IDB4JTA4eCAoJWQu
JWQuJWQpXG4iLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBzbXUtPnNtY19pZl92ZXJzaW9u
LCBpZl92ZXJzaW9uLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBzbXVfdmVyc2lvbiwgc211
X21ham9yLCBzbXVfbWlub3IsIHNtdV9kZWJ1Zyk7DQo+IC0gICAgICAgICAgICAgICBwcl9lcnIo
IlNNVSBkcml2ZXIgaWYgdmVyc2lvbiBub3QgbWF0Y2hlZFxuIik7DQo+IC0gICAgICAgICAgICAg
ICByZXQgPSAtRUlOVkFMOw0KPiArICAgICAgICAgICAgICAgcHJfd2FybigiU01VIGRyaXZlciBp
ZiB2ZXJzaW9uIG5vdCBtYXRjaGVkXG4iKTsNCj4gICAgICAgICB9DQo+IA0KPiAgICAgICAgIHJl
dHVybiByZXQ7DQo+IC0tDQo+IDIuMjAuMQ0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
