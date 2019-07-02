Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8C35D698
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 21:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3989789DDF;
	Tue,  2 Jul 2019 19:09:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C40B89DDF
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 19:09:26 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB4026.namprd12.prod.outlook.com (10.255.175.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Tue, 2 Jul 2019 19:09:25 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 19:09:24 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Liu,
 Shaoyun" <Shaoyun.Liu@amd.com>
Subject: Re: [PATCH 1/1] drm/amdkfd: Print a warning when the runlist becomes
 oversubscribed
Thread-Topic: [PATCH 1/1] drm/amdkfd: Print a warning when the runlist becomes
 oversubscribed
Thread-Index: AQHVJ6Bu8AHyw8lXiEi/31pwu70W9qa3w26AgAAAooA=
Date: Tue, 2 Jul 2019 19:09:24 +0000
Message-ID: <b7545a57-e650-96a5-97a8-56415c17d760@amd.com>
References: <20190620194309.11148-1-Felix.Kuehling@amd.com>
 <62b2f458-0b8e-f069-5ac2-2a56bcf5674d@amd.com>
In-Reply-To: <62b2f458-0b8e-f069-5ac2-2a56bcf5674d@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-clientproxiedby: YTBPR01CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::38) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68ef205a-c4f0-4bd3-76a6-08d6ff20cbfc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB4026; 
x-ms-traffictypediagnostic: DM6PR12MB4026:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB4026690CC2E712CF3803B7D892F80@DM6PR12MB4026.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(189003)(199004)(31686004)(58126008)(316002)(36756003)(14454004)(65826007)(6636002)(99286004)(6512007)(186003)(229853002)(966005)(53936002)(6246003)(52116002)(478600001)(2501003)(65806001)(110136005)(72206003)(65956001)(6486002)(6436002)(25786009)(66066001)(26005)(5660300002)(11346002)(3846002)(8676002)(305945005)(81156014)(66556008)(66476007)(66446008)(102836004)(4326008)(86362001)(66946007)(6306002)(53546011)(31696002)(14444005)(2906002)(476003)(64756008)(446003)(6116002)(71200400001)(2616005)(73956011)(486006)(76176011)(256004)(64126003)(71190400001)(6506007)(7736002)(68736007)(386003)(8936002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4026;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OpnlGGWrX1q/RXTIJUK1j91bueMpSlMyxh+kQs1RpCAr+/b2GfUDBC4WvgIwS1BkwEziPZ2vxleORq9tuy9KCndiYKV+TIH5Zoy0KDs24JjB6anR9TFAckJNN5PavCTt4zT01Lb3KFTOgNiFSr14EFNFKfPfzseeqovfftp7V/qOxCHvooKkrNxjBQeF/TnKuEkQr2pd3w+Ks0zutCHpApYYImDSFEDgqpUTxRI7wUjg5MgwCSSUua3A3hvWWybhq0lcf/7aNBJXObBb6bWasVLxmi8PFx+gD6a92KQ8NW7H8M5/BDEU8s/eWlIkTc4yC3MgvnidvJtx+vKoAzfWg0tVKluc3quAXRyvMDZCM0+VihkrX7PMAxpY9W/iIdoC0QsyUMcg37gUNO45+HJ6hW33itYnpM41zwD5P6Od7J8=
Content-ID: <5AC52EE98F43A444AC96DA48154E5327@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ef205a-c4f0-4bd3-76a6-08d6ff20cbfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 19:09:24.8369 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4026
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spOwo9CsAADox+W9KLFRCZPx1XhjIMjR3eqULTuBogA=;
 b=Et/jsvhG02oD9B2rDj/6bLY8yB/eF6zhIM+9cAoQ7zHYjNBjTryOdNpuxQW7oCatDtRkf4pnSGUzY9yKg8JSKQ52E+kuBQn5GQG7vKVxHduKtpti4sqAkKKf/fMhisHnRyhGH8etZGU3aASFs6V82ho64OYI0VgcyMQcEWb+Rvg=
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0wMiAzOjA3IHAubS4sIEt1ZWhsaW5nLCBGZWxpeCB3cm90ZToNCj4gUGluZy4N
Cj4NCj4gU2hhb3l1biwgZG8geW91IG1pbmQgcmV2aWV3aW5nIHRoaXMgcGF0Y2g/DQoNClNvcnJ5
LCBuZXZlciBtaW5kLiBJIG1pc3NlZCB0aGF0IE9hayBhbHJlYWR5IHJldmlld2VkIGl0Lg0KDQpU
aGFuayB5b3UgT2FrIQ0KDQoNCj4NCj4gVGhhbmtzLA0KPiAgIMKgIEZlbGl4DQo+DQo+IE9uIDIw
MTktMDYtMjAgMzo0MyBwLm0uLCBLdWVobGluZywgRmVsaXggd3JvdGU6DQo+PiBPdmVyc3Vic2Ny
aXB0aW9uIG9mIHF1ZXVlcyBvciBwcm9jZXNzZXMgcmVzdWx0cyBpbiBwb29yIHBlcmZvcm1hbmNl
DQo+PiBtb3N0bHkgYmVjYXVzZSBIV1MgYmxpbmJseSBzY2hlZHVsZXMgYnVzeSBhbmQgaWRsZSBx
dWV1ZXMsIHJlc3VsdGluZw0KPj4gaW4gcG9vciBvY2N1cGFuY3kgaWYgbWFueSBxdWV1ZXMgYXJl
IGlkbGUuDQo+Pg0KPj4gTGV0IHVzZXJzIGtub3cgd2l0aCBhIHdhcm5pbmcgbWVzc2FnZSB3aGVu
IHRyYW5zaXRpb25pbmcgZnJvbSBhDQo+PiBub24tb3ZlcnN1YnNjcmliZWQgdG8gYW4gb3ZlcnN1
YnNjcmliZWQgcnVubGlzdC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVobGluZyA8
RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCj4+IC0tLQ0KPj4gICAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX3BhY2tldF9tYW5hZ2VyLmMgfCA2ICsrKysrLQ0KPj4gICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaCAgICAgICAgICAgfCAxICsNCj4+ICAgIDIgZmls
ZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wYWNrZXRfbWFuYWdlci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BhY2tldF9tYW5hZ2VyLmMNCj4+IGluZGV4
IGM3MmM4ZjVmZDU0Yy4uY2NmNmIyMzEwMzE2IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX3BhY2tldF9tYW5hZ2VyLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9wYWNrZXRfbWFuYWdlci5jDQo+PiBAQCAtMjAzLDExICsyMDMs
MTUgQEAgc3RhdGljIGludCBwbV9jcmVhdGVfcnVubGlzdF9pYihzdHJ1Y3QgcGFja2V0X21hbmFn
ZXIgKnBtLA0KPj4gICAgDQo+PiAgICAJcHJfZGVidWcoIkZpbmlzaGVkIG1hcCBwcm9jZXNzIGFu
ZCBxdWV1ZXMgdG8gcnVubGlzdFxuIik7DQo+PiAgICANCj4+IC0JaWYgKGlzX292ZXJfc3Vic2Ny
aXB0aW9uKQ0KPj4gKwlpZiAoaXNfb3Zlcl9zdWJzY3JpcHRpb24pIHsNCj4+ICsJCWlmICghcG0t
PmlzX292ZXJfc3Vic2NyaXB0aW9uKQ0KPj4gKwkJCXByX3dhcm4oIlJ1bmxpc3QgaXMgZ2V0dGlu
ZyBvdmVyc3Vic2NyaWJlZC4gRXhwZWN0IHJlZHVjZWQgUk9DbSBwZXJmb3JtYW5jZS5cbiIpOw0K
Pj4gICAgCQlyZXR2YWwgPSBwbS0+cG1mLT5ydW5saXN0KHBtLCAmcmxfYnVmZmVyW3JsX3dwdHJd
LA0KPj4gICAgCQkJCQkqcmxfZ3B1X2FkZHIsDQo+PiAgICAJCQkJCWFsbG9jX3NpemVfYnl0ZXMg
LyBzaXplb2YodWludDMyX3QpLA0KPj4gICAgCQkJCQl0cnVlKTsNCj4+ICsJfQ0KPj4gKwlwbS0+
aXNfb3Zlcl9zdWJzY3JpcHRpb24gPSBpc19vdmVyX3N1YnNjcmlwdGlvbjsNCj4+ICAgIA0KPj4g
ICAgCWZvciAoaSA9IDA7IGkgPCBhbGxvY19zaXplX2J5dGVzIC8gc2l6ZW9mKHVpbnQzMl90KTsg
aSsrKQ0KPj4gICAgCQlwcl9kZWJ1ZygiMHglMlggIiwgcmxfYnVmZmVyW2ldKTsNCj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaA0KPj4gaW5kZXggNDA3MGU2ZDI0ZWY3Li5kNGJi
YTAxMjRkMjkgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
cHJpdi5oDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oDQo+
PiBAQCAtOTM3LDYgKzkzNyw3IEBAIHN0cnVjdCBwYWNrZXRfbWFuYWdlciB7DQo+PiAgICAJYm9v
bCBhbGxvY2F0ZWQ7DQo+PiAgICAJc3RydWN0IGtmZF9tZW1fb2JqICppYl9idWZmZXJfb2JqOw0K
Pj4gICAgCXVuc2lnbmVkIGludCBpYl9zaXplX2J5dGVzOw0KPj4gKwlib29sIGlzX292ZXJfc3Vi
c2NyaXB0aW9uOw0KPj4gICAgDQo+PiAgICAJY29uc3Qgc3RydWN0IHBhY2tldF9tYW5hZ2VyX2Z1
bmNzICpwbWY7DQo+PiAgICB9Ow0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
