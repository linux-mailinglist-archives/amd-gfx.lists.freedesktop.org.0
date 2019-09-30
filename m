Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E66C24A3
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Sep 2019 17:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D0C6E486;
	Mon, 30 Sep 2019 15:47:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790075.outbound.protection.outlook.com [40.107.79.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83E56E486
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Sep 2019 15:47:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TiUnva4Sco4GymzyVN3V0obKlFh82tfn+GUw62zzuQWoQy4eBMnVCxqV0bKa/LEuspDIxRtuz46Z0g86db8zCo5gnd0RwfqF/XByW2wR13txdkbiJWic286kRj5zriNNF6Wgu8rN48+tY2A/0f6AZDs/Wo2IvoiC2XnhtgiCo2PcglhwTyxoDKSj4Zye4/DvsuXDQ4pOeIPtihMUhhHxuYb4U5g0S0AGCZRyTp6nBnG4OEXRBEY4dchGeKZXyeUsprgKL6mDN8RD2Yiumat89wqNMN5VMol9A/UWCAabrBige8tH3NVrTDmRk0QlHUVCsaYrzeu0/WNzbVJCUMv7hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhUZQJEl3u6wWH93kpHFn2htTN5jtaxOizZssXekefk=;
 b=LwY81B33iN0kCaDWfLRigNMrMfHt8tNOb8zXFirKKBqMFFO+NhLmTJQbD9+c76LjLw6ASjLRqmUAn1Pp6NAvRxOSprRn3TZjijchAiQJYh3Hb8zQ2dKLX7AX90Gv4q8rZNBr6chRg9TdzNoCz320KfN3cIptrM48rbeXJ+XLKv/gqIZIluvRkCPaTfvGpMdngTDc61jZZW7Yu5wqcStdbohpBATcZ/vMvaPE7OhWZNei6AckwkTKdNyJKshgH9ytD4+jsy+FNI7129iAU4epq+5/WGqg4IvtfQVA5PIFAsub1gl+JZqGoEj2qMTPZRdUeyx3+Cg4GWhCcCSdYank8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2697.namprd12.prod.outlook.com (20.176.116.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.22; Mon, 30 Sep 2019 15:47:55 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2284.023; Mon, 30 Sep 2019
 15:47:55 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zhao, Yong" <Yong.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 6/6] drm/amdkfd: Improve KFD IOCTL printing
Thread-Topic: [PATCH 6/6] drm/amdkfd: Improve KFD IOCTL printing
Thread-Index: AQHVda6wMj3eBLg120CTYyyCT+J8P6dEYXoA
Date: Mon, 30 Sep 2019 15:47:55 +0000
Message-ID: <30b9f4d8-0365-27fb-b6b4-ba2d20b9cb81@amd.com>
References: <20190928034132.28340-1-Yong.Zhao@amd.com>
 <20190928034132.28340-6-Yong.Zhao@amd.com>
In-Reply-To: <20190928034132.28340-6-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::23) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 326cc06a-29d3-4c35-2db9-08d745bd8f83
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB2697; 
x-ms-traffictypediagnostic: DM6PR12MB2697:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB26974E4B18DD3C7FBC08A60592820@DM6PR12MB2697.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(189003)(199004)(6246003)(31686004)(2501003)(256004)(66946007)(8676002)(71190400001)(71200400001)(66446008)(64756008)(66556008)(66476007)(14444005)(99286004)(52116002)(8936002)(6436002)(6116002)(3846002)(5660300002)(486006)(476003)(6486002)(25786009)(11346002)(446003)(81156014)(81166006)(7736002)(102836004)(305945005)(76176011)(31696002)(6512007)(66066001)(86362001)(2616005)(186003)(26005)(53546011)(229853002)(6506007)(2906002)(36756003)(65806001)(65956001)(478600001)(386003)(58126008)(110136005)(14454004)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2697;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jXeKyf/vtqsMMSnB3nQ3iZBRathCW5eaX59MTLtRJtjqRxtn4+5L8XzUgoHqhjYb8xNygSktaeE0stPyHQjrgNGBQKoNT+E+WMgjTJjqGPkomEi00v9Uos34dFGfcJ3Vdwn5FaPbegDIU0wAr46uNF5aE7S6VJAT3n2+pWGuIN+ed+FCnHYtdf8odY6XiPFgpo6Lq3MXX99DYMjJZq+kGU3TifWIEcx34Yp4z4mNCSZwmaHIEkQS2XjxJUPxMWwtPLvYHAjcQ5jM8WRAgfNE1WSG2uNFqJCsV8oy6PepZ8WxDLMyGsepVF6d2LGBWdfNVI8sKScM80+w20ocU+ZIHIa+nTFdwNa2fGIei3SEJRBVwUJ85OeeJaWKkpu7KgLrwh+yWNhmul5UoIx4cpE7nFMELf9JSqbX432TanB/7QU=
Content-ID: <ABAC3CAC37F94449A8036D7F8C1EFC2E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 326cc06a-29d3-4c35-2db9-08d745bd8f83
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 15:47:55.6448 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fvJsl/RspNJzK70pSQGaU4KQQLVxKEFlEMfwspWKctzHz5ceWHUnt5mB5jEcOVG7kwiog4/xbyumCyJQELUX2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2697
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhUZQJEl3u6wWH93kpHFn2htTN5jtaxOizZssXekefk=;
 b=Hz5wfu1tX5ui4jYs6motrmMaDY2yluxCUMzoWsI7VgDSIlTmEnFR+EGJoXsVM+o9mMjApdnUgIvIe9UMjifYqhvmaLSikLoKdt4HGBlJtHszq98YHaceCo3qVzee8uPCKGHwVUUthqxhXmqziRAb9iH47f7vBcKdc8GBI1Fii98=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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

T24gMjAxOS0wOS0yNyAxMTo0MSBwLm0uLCBaaGFvLCBZb25nIHdyb3RlOg0KPiBUaGUgY29kZSB1
c2UgaGV4IGRlZmluZSwgc28gc2hvdWxkIHRoZSBwcmludGluZy4gQWxzbywgcHJpbnRmIGEgbWVz
c2FnZQ0KPiBpZiB0aGVyZSBpcyBhIGZhaWx1cmUuDQo+DQo+IENoYW5nZS1JZDogSWE3Y2M3Njkw
NTUzYmIwNDM5MTViM2Q4YzAxNTcyMTZjNjQ0MjFhNjANCj4gU2lnbmVkLW9mZi1ieTogWW9uZyBa
aGFvIDxZb25nLlpoYW9AYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2NoYXJkZXYuYyB8IDUgKysrLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9jaGFyZGV2LmMNCj4gaW5kZXggYzI4YmEwYzFkN2FjLi5kMWFiMDljMGY1MjIgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYw0KPiBAQCAtMTg0MCw3
ICsxODQwLDcgQEAgc3RhdGljIGxvbmcga2ZkX2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlcCwgdW5z
aWduZWQgaW50IGNtZCwgdW5zaWduZWQgbG9uZyBhcmcpDQo+ICAgCX0gZWxzZQ0KPiAgIAkJZ290
byBlcnJfaTE7DQo+ICAgDQo+IC0JZGV2X2RiZyhrZmRfZGV2aWNlLCAiaW9jdGwgY21kIDB4JXgg
KCMlZCksIGFyZyAweCVseFxuIiwgY21kLCBuciwgYXJnKTsNCj4gKwlkZXZfZGJnKGtmZF9kZXZp
Y2UsICJpb2N0bCBjbWQgMHgleCAoIzB4JXgpLCBhcmcgMHglbHhcbiIsIGNtZCwgbnIsIGFyZyk7
DQo+ICAgDQo+ICAgCXByb2Nlc3MgPSBrZmRfZ2V0X3Byb2Nlc3MoY3VycmVudCk7DQo+ICAgCWlm
IChJU19FUlIocHJvY2VzcykpIHsNCj4gQEAgLTE4OTUsNyArMTg5NSw4IEBAIHN0YXRpYyBsb25n
IGtmZF9pb2N0bChzdHJ1Y3QgZmlsZSAqZmlsZXAsIHVuc2lnbmVkIGludCBjbWQsIHVuc2lnbmVk
IGxvbmcgYXJnKQ0KPiAgIAkJa2ZyZWUoa2RhdGEpOw0KPiAgIA0KPiAgIAlpZiAocmV0Y29kZSkN
Cj4gLQkJZGV2X2RiZyhrZmRfZGV2aWNlLCAicmV0ID0gJWRcbiIsIHJldGNvZGUpOw0KPiArCQlk
ZXZfZXJyKGtmZF9kZXZpY2UsICJpb2N0bCBjbWQgKCMweCV4KSwgYXJnIDB4JWx4LCByZXQgPSAl
ZFxuIiwNCj4gKwkJCQluciwgYXJnLCByZXRjb2RlKTsNCg0KTkFLLiBXZSBkb24ndCB3YW50IHRv
IHNwYW0gdGhlIGtlcm5lbCBsb2cgd2l0aCBjcnlwdGljIGVycm9yIG1lc3NhZ2VzIA0KZXZlcnkg
dGltZSBpb2N0bCBmdW5jdGlvbnMgZmFpbC4gUGxlYXNlIGxlYXZlIHRoaXMgYXMgYSBkZXZfZGJn
IG1lc3NhZ2UuIA0KRmFpbGluZyBpb2N0bCBmdW5jdGlvbnMgY291bGQgYmUgcGVyZmVjdGx5IG5v
cm1hbCBmb3IgYSBudW1iZXIgb2YgDQpyZWFzb25zIChzeXN0ZW0gY2FsbCBpbnRlcnJ1cHRlZCBi
eSBzaWduYWwsIHJ1bm5pbmcgb3V0IG9mIGV2ZW50IHNsb3RzLCANCnRpbWVvdXRzIG9uIGV2ZW50
IHdhaXRpbmcsIGV0YykuIEJ1dCBldmVyeSBidWcgcmVwb3J0IHdpbGwgaW5jb3JyZWN0bHkgDQpi
bGFtZSBhbnkgdW5yZWxhdGVkIHByb2JsZW0gb24gdGhvc2UgbWVzc2FnZXMgaWYgdGhleSBoYXBw
ZW4gdG8gYXBwZWFyIA0KaW4gdGhlIGtlcm5lbCBsb2cuDQoNClJlZ2FyZHMsDQogwqAgRmVsaXgN
Cg0KDQo+ICAgDQo+ICAgCXJldHVybiByZXRjb2RlOw0KPiAgIH0NCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
