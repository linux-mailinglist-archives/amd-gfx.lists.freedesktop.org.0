Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA099C968
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 08:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E2D6E17C;
	Mon, 26 Aug 2019 06:28:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740052.outbound.protection.outlook.com [40.107.74.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C4E6E17C
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 06:28:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrR8kccPUPFXrtXLG078O8F+X/HF3NgdPSeAijwJZ5f3F084dL1ictc3CvOnnfJRBDXfMcVH9NtuKAqD4D73vYOdKvdZe5QGMS+kYQCjpRCUkI7h2XoareLTtRO4RMpC+cAM8aYocvW/Q1uZYJdYb+hUTOVM88rWbkTzalbXpvpbAon2lhKFA/vV9lLaWkDpDWgyb4IC5241eTPQvT5gfjRur2ggsyFsCP2s4EQmNhxL1PQ9325vXURcRT4FNHkmiIZjoMvEOcYrJq3zJPDcppo2/Hr1qdSHG2vBBT4QsqxbXMD3KEYcUPDmgZe9R9B5Mw+/JBUTvVcO+2ZgJGMoaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kq/a/lnzsUuTg41YrRaF+RCWAVBistFW2C4yyNpNqyM=;
 b=iQVPpcALNro2Z/XE/G4aiIu6WRAd2Vmc7P6/+GH5BrM7CyMgoEHQgTT48mkp7OXr02xU86hvjkq6XcQnQt7/AlUxSr5DJlzVebjJq6UgeHdoh+z3chqlnBDwkLJqy8BSBDaz8dR41QayvUhZ/JaEp5LAe5FDZ9Yz05iKBalKkDnGbrmlejJVs9dM+YJkx6efPnVZ6cMknFCM0p1woWMsc7VHGYiluR3rAiOcVMu4W2jsP0zWKgry3Xxua1YmCdkeo5XHBJ70fDvHICu8MlY17Ave/NNtyOBrEV+WurhNC9ZWtNyH0Iv9CeZWrYdhg0+SOf9Xakb0hckkTSqspjtgDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1260.namprd12.prod.outlook.com (10.168.239.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 06:28:11 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::9c59:de8d:9ec:5350]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::9c59:de8d:9ec:5350%4]) with mapi id 15.20.2178.023; Mon, 26 Aug 2019
 06:28:11 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 7/8] drm/amdgpu: enable/disable ras_controller_irq and
 err_event_athub_irq
Thread-Topic: [PATCH 7/8] drm/amdgpu: enable/disable ras_controller_irq and
 err_event_athub_irq
Thread-Index: AQHVW8IimPy0Elo9DEqszlDtfCz6HacM8PCAgAAFFQA=
Date: Mon, 26 Aug 2019 06:28:11 +0000
Message-ID: <DM5PR12MB1418D1AF796EEB1323B24511FCA10@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <1566791700-1912-1-git-send-email-Hawking.Zhang@amd.com>
 <1566791700-1912-8-git-send-email-Hawking.Zhang@amd.com>
 <MN2PR12MB3054689EC075D8A9BDFF3432B0A10@MN2PR12MB3054.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3054689EC075D8A9BDFF3432B0A10@MN2PR12MB3054.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47acf30c-2a08-4776-c535-08d729ee913b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1260; 
x-ms-traffictypediagnostic: DM5PR12MB1260:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1260E108A4884C7E3C1AF845FCA10@DM5PR12MB1260.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:397;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(13464003)(189003)(199004)(102836004)(66946007)(110136005)(76116006)(53546011)(6506007)(3846002)(7696005)(64756008)(66556008)(66476007)(66446008)(316002)(6116002)(86362001)(14454004)(71190400001)(256004)(74316002)(71200400001)(26005)(53936002)(6436002)(6306002)(66066001)(9686003)(55016002)(52536014)(8676002)(5660300002)(305945005)(186003)(76176011)(7736002)(8936002)(33656002)(2906002)(99286004)(486006)(478600001)(446003)(476003)(6636002)(11346002)(966005)(2501003)(81156014)(81166006)(229853002)(25786009)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1260;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iKNfQDq9rCM6MoxhiBipzHcoOZ5RL8Ux0JOL7dbNpaZd3+lJTx3UWdLudWRl1YXmKvpVpdv/OaoZ8p5QC2Eo9f1C6fZ/tVrKuUfcDvbN6A5VLp7WNLLdT8/OfEdsHznaJz5hfADClbrG2xvlXOI60/uWItv0O5lsy/uKlqk/oFuBUjQFMbYuFMEhAltgKQHYUR6m8l6N2q4BoaAAxVJbVa1hfqnB2jJM6QslzZQ+14BONaKSUws3PliRSyU83i0vvosYZqhZC9LeCrZ7DzWD/ZmcForw46kGcy0qTG6XhZhcGtO9RL0S0dor4rBm7/NYf8/hu61OjtvjjnWFqXx8A7SpyN+xmNroi9FjAfXGHU263pvzBmM+/LPjzByrieMTlVzJvylay+Gi7rebOu3kBy3xOYnX9pzaN/gOyuTPsI8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47acf30c-2a08-4776-c535-08d729ee913b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 06:28:11.0373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +v5EKzLtQZL2CpQao19Vu+3bsmHtHgmBdiiOyYxraZgTccZ1w0FVZEkfGn/fhGsytDjdHVAOJWckHYznnss9vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1260
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kq/a/lnzsUuTg41YrRaF+RCWAVBistFW2C4yyNpNqyM=;
 b=N7siQUR4bq69zSH82ar3kkAvtMuswLG+IwTrg/qFzstFuOdKGpIYpkWJKul0H++WrTVMeLwqYTOUOPHwA/EPFYFN14M/FjwAHZj+qPzKr32fhbt2qnaA9SJADI4mwTKlT8wSamu7u65Ziq80yMCmnmFfFAQ+TcOVKNmeyfPrX+M=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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

VGhhbmtzLiBMZXQgbWUgZmluZCBhIG1vcmUgcmVhc29uYWJsZSBwbGFjZSB0byBkbyBiaWZfZWNj
X2xhdGVfaW5pdC4gVGhlIGNvZGUgaXMgZHJhbWF0aWNhbGx5IGNoYW5nZWQgc2luY2UgdGhlIGZp
cnN0IHRpbWUgSSB3b3JrZWQgb3V0IHRoZSBzZXJpZXMuDQoNClJlZ2FyZHMsDQpIYXdraW5nDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBaaG91MSwgVGFvIDxUYW8uWmhvdTFA
YW1kLmNvbT4gDQpTZW50OiAyMDE55bm0OOaciDI25pelIDE0OjA1DQpUbzogWmhhbmcsIEhhd2tp
bmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+DQpDYzogWmhh
bmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NClN1YmplY3Q6IFJFOiBbUEFUQ0gg
Ny84XSBkcm0vYW1kZ3B1OiBlbmFibGUvZGlzYWJsZSByYXNfY29udHJvbGxlcl9pcnEgYW5kIGVy
cl9ldmVudF9hdGh1Yl9pcnENCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24g
QmVoYWxmIE9mIA0KPiBIYXdraW5nIFpoYW5nDQo+IFNlbnQ6IDIwMTnlubQ45pyIMjbml6UgMTE6
NTUNCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBEZXVjaGVyLCBBbGV4YW5k
ZXIgDQo+IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPg0KPiBDYzogWmhhbmcsIEhhd2tpbmcg
PEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDcvOF0gZHJtL2FtZGdw
dTogZW5hYmxlL2Rpc2FibGUgcmFzX2NvbnRyb2xsZXJfaXJxIGFuZCANCj4gZXJyX2V2ZW50X2F0
aHViX2lycQ0KPiANCltUYW9dIG5lZWQgYSBjb21taXQgZGVzY3JpcHRpb24NCg0KPiBTaWduZWQt
b2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+DQo+IFJldmlld2Vk
LWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+IC0tLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyB8IDE2ICsrKysrKysrKysrKysr
KysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KPiBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4gaW5kZXggNTVkYTZmNS4uOGI0YTU2OCAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jDQo+IEBAIC04MjIsNiArODIy
LDE4IEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBfZWNjX3Jhc19ibG9ja19sYXRlX2luaXQodm9pZA0K
PiAqaGFuZGxlLA0KPiAgCQkJZ290byBpcnE7DQo+ICAJfQ0KPiANCj4gKwlpZiAoYWRldi0+bmJp
by5mdW5jcy0+aW5pdF9yYXNfY29udHJvbGxlcl9pbnRlcnJ1cHQpIHsNCj4gKwkJciA9IGFtZGdw
dV9pcnFfZ2V0KGFkZXYsICZhZGV2LT5uYmlvLnJhc19jb250cm9sbGVyX2lycSwgMCk7DQo+ICsJ
CWlmIChyKQ0KPiArCQkJZ290byBpcnE7DQo+ICsJfQ0KPiArDQo+ICsJaWYgKGFkZXYtPm5iaW8u
ZnVuY3MtPmluaXRfcmFzX2Vycl9ldmVudF9hdGh1Yl9pbnRlcnJ1cHQpIHsNCj4gKwkJciA9IGFt
ZGdwdV9pcnFfZ2V0KGFkZXYsICZhZGV2LQ0KPiA+bmJpby5yYXNfZXJyX2V2ZW50X2F0aHViX2ly
cSwgMCk7DQo+ICsJCWlmIChyKQ0KPiArCQkJZ290byBpcnE7DQo+ICsJfQ0KW1Rhb10gQm90aCB1
bWMgYW5kIG1taHViIHJhcyBpbml0IHdpbGwgY2FsbCBpdCwgSSB0aGluayBpdCdzIGJldHRlciB0
byBwdXQgdGhlc2UgdHdvIGlycV9nZXQgaW4gdGhlIHBhdGggb2YgdW1jIGJsb2NrLg0KDQo+ICsN
Cj4gIAlyZXR1cm4gMDsNCj4gIGlycToNCj4gIAlhbWRncHVfcmFzX3N5c2ZzX3JlbW92ZShhZGV2
LCAqcmFzX2lmKTsgQEAgLTE0MjcsNiArMTQzOSwxMCBAQCANCj4gc3RhdGljIGludCBnbWNfdjlf
MF9od19maW5pKHZvaWQgKmhhbmRsZSkNCj4gDQo+ICAJYW1kZ3B1X2lycV9wdXQoYWRldiwgJmFk
ZXYtPmdtYy5lY2NfaXJxLCAwKTsNCj4gIAlhbWRncHVfaXJxX3B1dChhZGV2LCAmYWRldi0+Z21j
LnZtX2ZhdWx0LCAwKTsNCj4gKwlpZiAoYWRldi0+bmJpby5mdW5jcy0+aW5pdF9yYXNfY29udHJv
bGxlcl9pbnRlcnJ1cHQpDQo+ICsJCWFtZGdwdV9pcnFfcHV0KGFkZXYsICZhZGV2LT5uYmlvLnJh
c19jb250cm9sbGVyX2lycSwgMCk7DQo+ICsJaWYgKGFkZXYtPm5iaW8uZnVuY3MtPmluaXRfcmFz
X2Vycl9ldmVudF9hdGh1Yl9pbnRlcnJ1cHQpDQo+ICsJCWFtZGdwdV9pcnFfcHV0KGFkZXYsICZh
ZGV2LQ0KPiA+bmJpby5yYXNfZXJyX2V2ZW50X2F0aHViX2lycSwgMCk7DQo+ICAJZ21jX3Y5XzBf
Z2FydF9kaXNhYmxlKGFkZXYpOw0KPiANCj4gIAlyZXR1cm4gMDsNCj4gLS0NCj4gMi43LjQNCj4g
DQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFt
ZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
