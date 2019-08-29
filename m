Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 238D9A1135
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 07:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A51E89F75;
	Thu, 29 Aug 2019 05:48:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820081.outbound.protection.outlook.com [40.107.82.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F131889F75
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 05:48:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGpudWS07nBBVSVlsMOxhCzcSRwfPPRGY/V2t8tzm8x2IwsTY9YgT6GwhjQbkiP0O6zoXZZFVXH1zhcq1KbJYpPtwXRLWqamUsqBARFGPHJwjvq5DS07ZWjti48zmIkg7MmBNfut7m65QuXbY+mb1OqILLzoZ8c74JcNhcJ3slpG8pyKcYeFsxw3ZMIDCqKNOgFdHwfWyqD6ZyT7DyUKB2LPezzdORki4bYDOFscz5h5xDwqc5XBwPQAC5rMzfMuxEwVBQK+DSRblz4eT5Y8iu/mmVQl83vXXmwNBuGMgZchz6yY+5HuL1aJflUh+mPY3jhhmTHM+HTjt57l+BFZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WteNR1CuWEdePXCllB361Qm91UXuSnXVZS3noQvWOTQ=;
 b=PNqq8CF3Xibl3ujszsGzExNUtS8nGoca3WIEBwGR6D0XzzWSiCZgKmBA7PmDQhvOLc4qT8SDt89NXH8RDfNBOVGfKYLoO/GSsHDHVH5pNKqfl9wVeGaMQ/pyPoK/viQ4QwAdo/a4RWlhR9gaAiQNLO3th4YOPl5VJ/6M/r31ptXZFy9rmqgi497PRb3la4v5EMKAfcKsF/b+D7GJoCfK73+f75EhcmWXna7uRxg2scy0078FcX+8SaZoENcdCW/lA8faaZYQUNOY9sbJPSazvchS35Bm08sceTURQpV+/FFrJK23yMOzv98ZOZx0gQx45ojnLvZ7bIO4d+Xzfc70JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1612.namprd12.prod.outlook.com (10.172.37.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Thu, 29 Aug 2019 05:48:34 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 05:48:34 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 1/7] drm/amdgpu: add helper function to do common
 ras_late_init
Thread-Topic: [PATCH 1/7] drm/amdgpu: add helper function to do common
 ras_late_init
Thread-Index: AQHVXaD7xZVgNjzfBUG/Iwx3+3I6V6cRcCwAgAAO34CAACAFsA==
Date: Thu, 29 Aug 2019 05:48:34 +0000
Message-ID: <DM5PR12MB14186ACE0988DDDD784D7A66FCA20@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <1566997395-7185-1-git-send-email-Hawking.Zhang@amd.com>
 <MN2PR12MB305488AF7BE5CD29B8E6E152B0A20@MN2PR12MB3054.namprd12.prod.outlook.com>
 <MN2PR12MB305479DB08A348F173060E23B0A20@MN2PR12MB3054.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB305479DB08A348F173060E23B0A20@MN2PR12MB3054.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 359321d7-1a11-4b3b-5715-08d72c4487c3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1612; 
x-ms-traffictypediagnostic: DM5PR12MB1612:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB16127D89BFDA520C95858FB8FCA20@DM5PR12MB1612.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(199004)(189003)(13464003)(186003)(53546011)(446003)(102836004)(3846002)(14444005)(5660300002)(6116002)(486006)(256004)(476003)(11346002)(86362001)(8676002)(81166006)(81156014)(6506007)(52536014)(8936002)(71190400001)(9686003)(6436002)(478600001)(966005)(53936002)(6246003)(71200400001)(66446008)(110136005)(305945005)(26005)(66476007)(6306002)(14454004)(2906002)(76176011)(76116006)(66946007)(55016002)(6636002)(66556008)(66066001)(99286004)(7696005)(74316002)(229853002)(25786009)(64756008)(2501003)(7736002)(33656002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1612;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3/c3RJtdzMVp17cqfmafPsuflrz/S3inSQnca7BRhT0qoBMhCBUb2rWWK5n8cj9TO2eCc9qnXm9EXiJPCDfmWIYNq0h14R3Dn5IMKpbHqA9G8CKaJZiVgv3oadgcOLqDo2+HYvNlQN6mCQBdLyYjG6wrhy9PjfgyTwq20xYGpLhfKQ1ZKFhVEoAlbibQo+TE9AvIHGbHy7ki5yXv5jAkdjesMmSfkjBLmZ9jd0T/w3eCvmVYjPOLTqzjDivM9rSBfHVqfhuBGZyLOLAxow8HqkX8lx3RbwJz/I3+qn2aMa7RlViBeSzQxB3vikDjtS+niSdcOrAPutS/rygpZZGcTipk3CDeIUM+RfNBSD948sxgw+ndiu5WMk1/9bZx5gWV6AGN4gj00+2jByN9jkPH1rAFmQIbVEf+7pmgn0mFJag=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 359321d7-1a11-4b3b-5715-08d72c4487c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 05:48:34.1739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yge/mHJm0C0DItV2Y3G7/CenmeIwmjGD8oZxf1NvMmO0pp2EKIA+uE6jk4A1ODwuZxsT4VHXgp04U2Vmby4LlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1612
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WteNR1CuWEdePXCllB361Qm91UXuSnXVZS3noQvWOTQ=;
 b=Y1GEk8/dm9roUb8zJaukukiqgAoc+2BoGSfLqbKKJ2CVKT7ekLzHfUPLYmKWPfoFWunxtCo+Lgnejkr41/nD30cXe1I8kK5Ul8RejPN9eKZaEwBB1nyjHrasOw2y/24xLxMMnJ5WlOHOk+XB3KVqIR9PIhp6RuTPOZY1vF53DrQ=
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

R29vZCBwb2ludCwgSSB0aGluayB3ZSBjYW4gY2hlY2sgaWhfaW5mby5jYiwgaW5zdGVhZCBvZiBy
YXNfYmxvY2ssIGFzIHRoZSBjaGVjayBjb25kaXRpb24uIE9uIHRoZSBvdGhlciBoYW5kLCBJIGlu
aXRpYWxpemVkIHRoZSBoZWFkZXIgaW4gaWhfaW5mbyBpbiBjYXNlIHNvbWVvbmUgdXNlIGl0IGlu
IHNvbWV3aGVyZS4uLg0KDQpSZWdhcmRzLA0KSGF3a2luZw0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPiANClNlbnQ6IDIwMTnl
ubQ45pyIMjnml6UgMTE6NTINClRvOiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47IFpo
YW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzsgRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29t
Pg0KQ2M6IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+DQpTdWJqZWN0OiBS
RTogW1BBVENIIDEvN10gZHJtL2FtZGdwdTogYWRkIGhlbHBlciBmdW5jdGlvbiB0byBkbyBjb21t
b24gcmFzX2xhdGVfaW5pdA0KDQpBbm90aGVyIHdheSBpcyB0byBhZGQgY2hlY2sgZm9yIGloX2lu
Zm8gaW4gYW1kZ3B1X3Jhc19pbnRlcnJ1cHRfYWRkX2hhbmRsZXIgYW5kIGFtZGdwdV9yYXNfaW50
ZXJydXB0X3JlbW92ZV9oYW5kbGVyIGRpcmVjdGx5Lg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+IEZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3Rv
cC5vcmc+IE9uIEJlaGFsZiBPZiANCj4gWmhvdTEsIFRhbw0KPiBTZW50OiAyMDE55bm0OOaciDI5
5pelIDEwOjU5DQo+IFRvOiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsg
YW1kLSANCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgRGV1Y2hlciwgQWxleGFuZGVyIA0K
PiA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT4NCj4gQ2M6IFpoYW5nLCBIYXdraW5nIDxIYXdr
aW5nLlpoYW5nQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggMS83XSBkcm0vYW1kZ3B1
OiBhZGQgaGVscGVyIGZ1bmN0aW9uIHRvIGRvIGNvbW1vbiANCj4gcmFzX2xhdGVfaW5pdA0KPiAN
Cj4gDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogSGF3a2lu
ZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPiA+IFNlbnQ6IDIwMTnlubQ45pyIMjjm
l6UgMjE6MDMNCj4gPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFpob3UxLCBU
YW8gPFRhby5aaG91MUBhbWQuY29tPjsgDQo+ID4gRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5k
ZXIuRGV1Y2hlckBhbWQuY29tPg0KPiA+IENjOiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFu
Z0BhbWQuY29tPg0KPiA+IFN1YmplY3Q6IFtQQVRDSCAxLzddIGRybS9hbWRncHU6IGFkZCBoZWxw
ZXIgZnVuY3Rpb24gdG8gZG8gY29tbW9uIA0KPiA+IHJhc19sYXRlX2luaXQNCj4gPg0KPiA+IElu
IGxhdGVfaW5pdCBmb3IgcmFzLCB0aGUgaGVscGVyIGZ1bmN0aW9uIHdpbGwgYmUgdXNlZCB0byAx
KS4gDQo+ID4gZGlzYWJsZSByYXMgZmVhdHVyZSBpZiB0aGUgSVAgYmxvY2sgaXMgbWFza2VkIGFz
IGRpc2FibGVkIDIpLiBzZW5kIA0KPiA+IGVuYWJsZSBmZWF0dXJlIGNvbW1hbmQgaWYgdGhlIGlw
IGJsb2NrIHdhcyBtYXNrZWQgYXMgZW5hYmxlZCAzKS4gDQo+ID4gY3JlYXRlDQo+IGRlYnVnZnMv
c3lzZnMgbm9kZSBwZXIgSVAgYmxvY2sgNCkuDQo+ID4gcmVnaXN0ZXIgaW50ZXJydXB0IGhhbmRs
ZXINCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdA
YW1kLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3Jhcy5jIHwgNTcNCj4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmggfCAgNCArKysNCj4gPiAgMiBm
aWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQo+ID4gYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4gPiBpbmRleCAyMzBmN2U2Li4yYzMyZjk5IDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KPiA+IEBA
IC0xNTY0LDYgKzE1NjQsNjMgQEAgaW50IGFtZGdwdV9yYXNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZQ0KPiAqYWRldikNCj4gPiAgCXJldHVybiAtRUlOVkFMOw0KPiA+ICB9DQo+ID4NCj4gPiAr
LyogaGVscGVyIGZ1bmN0aW9uIHRvIGhhbmRsZSBjb21tb24gc3R1ZmYgaW4gaXAgbGF0ZSBpbml0
IHBoYXNlICovIA0KPiA+ICtpbnQgYW1kZ3B1X3Jhc19sYXRlX2luaXQoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsDQo+ID4gKwkJCSBzdHJ1Y3QgcmFzX2NvbW1vbl9pZiAqcmFzX2Jsb2NrLA0K
PiA+ICsJCQkgc3RydWN0IHJhc19mc19pZiAqZnNfaW5mbywNCj4gPiArCQkJIHN0cnVjdCByYXNf
aWhfaWYgKmloX2luZm8pDQo+ID4gK3sNCj4gPiArCWludCByOw0KPiA+ICsNCj4gPiArCS8qIGRp
c2FibGUgUkFTIGZlYXR1cmUgcGVyIElQIGJsb2NrIGlmIGl0IGlzIG5vdCBzdXBwb3J0ZWQgKi8N
Cj4gPiArCWlmICghYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoYWRldiwgcmFzX2Jsb2NrLT5ibG9j
aykpIHsNCj4gPiArCQlhbWRncHVfcmFzX2ZlYXR1cmVfZW5hYmxlX29uX2Jvb3QoYWRldiwgcmFz
X2Jsb2NrLCAwKTsNCj4gPiArCQlyZXR1cm4gMDsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlyID0g
YW1kZ3B1X3Jhc19mZWF0dXJlX2VuYWJsZV9vbl9ib290KGFkZXYsIHJhc19ibG9jaywgMSk7DQo+
ID4gKwlpZiAocikgew0KPiA+ICsJCWlmIChyID09IC1FQUdBSU4pIHsNCj4gPiArCQkJLyogcmVx
dWVzdCBncHUgcmVzZXQuIHdpbGwgcnVuIGFnYWluICovDQo+ID4gKwkJCWFtZGdwdV9yYXNfcmVx
dWVzdF9yZXNldF9vbl9ib290KGFkZXYsDQo+ID4gKwkJCQkJcmFzX2Jsb2NrLT5ibG9jayk7DQo+
ID4gKwkJCXJldHVybiAwOw0KPiA+ICsJCX0NCj4gPiArCQkvKiBpbiByZXN1bWUgcGhhc2UsIGlm
IGZhaWwgdG8gZW5hYmxlIHJhcywNCj4gPiArCQkgKiBjbGVhbiB1cCBhbGwgcmFzIGZzIG5vZGVz
LCBhbmQgZGlzYWJsZSByYXMgKi8NCj4gPiArCQlpZiAoYWRldi0+aW5fc3VzcGVuZCkNCj4gPiAr
CQkJZ290byBjbGVhbnVwOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCS8qIGluIHJlc3VtZSBwaGFz
ZSwgbm8gbmVlZCB0byBjcmVhdGUgcmFzIGZzIG5vZGUgKi8NCj4gPiArCWlmIChhZGV2LT5pbl9z
dXNwZW5kKQ0KPiA+ICsJCXJldHVybiAwOw0KPiA+ICsNCj4gPiArCWlmIChyYXNfYmxvY2stPmJs
b2NrID09IEFNREdQVV9SQVNfQkxPQ0tfX1VNQyB8fA0KPiA+ICsJICAgIHJhc19ibG9jay0+Ymxv
Y2sgPT0gQU1ER1BVX1JBU19CTE9DS19fU0RNQSB8fA0KPiA+ICsJICAgIHJhc19ibG9jay0+Ymxv
Y2sgPT0gQU1ER1BVX1JBU19CTE9DS19fR0ZYKSB7DQo+IFtUYW9dIHdlIGNhbiBzZXQgaWhfaW5m
byB0byBOVUxMIGlmIGEgcmFzIGJsb2NrIGhhcyBubyBpbnRlcnJ1cHQgYW5kIA0KPiBjaGFuZ2Ug
dGhlIGNvbmRpdGlvbiB0byAiaWYgKGloX2luZm8pIg0KPiANCj4gPiArCQlyID0gYW1kZ3B1X3Jh
c19pbnRlcnJ1cHRfYWRkX2hhbmRsZXIoYWRldiwgaWhfaW5mbyk7DQo+ID4gKwkJaWYgKHIpDQo+
ID4gKwkJCWdvdG8gaW50ZXJydXB0Ow0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCWFtZGdwdV9yYXNf
ZGVidWdmc19jcmVhdGUoYWRldiwgZnNfaW5mbyk7DQo+ID4gKw0KPiA+ICsJciA9IGFtZGdwdV9y
YXNfc3lzZnNfY3JlYXRlKGFkZXYsIGZzX2luZm8pOw0KPiA+ICsJaWYgKHIpDQo+ID4gKwkJZ290
byBzeXNmczsNCj4gPiArDQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArY2xlYW51cDoNCj4gPiArCWFt
ZGdwdV9yYXNfc3lzZnNfcmVtb3ZlKGFkZXYsIHJhc19ibG9jayk7DQo+ID4gK3N5c2ZzOg0KPiA+
ICsJYW1kZ3B1X3Jhc19kZWJ1Z2ZzX3JlbW92ZShhZGV2LCByYXNfYmxvY2spOw0KPiA+ICsJYW1k
Z3B1X3Jhc19pbnRlcnJ1cHRfcmVtb3ZlX2hhbmRsZXIoYWRldiwgaWhfaW5mbyk7DQo+IFtUYW9d
IGxhY2sgb2YgaWYgY29uZGl0aW9uDQo+IA0KPiA+ICtpbnRlcnJ1cHQ6DQo+ID4gKwlhbWRncHVf
cmFzX2ZlYXR1cmVfZW5hYmxlKGFkZXYsIHJhc19ibG9jaywgMCk7DQo+ID4gKwlyZXR1cm4gcjsN
Cj4gPiArfQ0KPiA+ICsNCj4gPiAgLyogZG8gc29tZSBpbml0IHdvcmsgYWZ0ZXIgSVAgbGF0ZSBp
bml0IGFzIGRlcGVuZGVuY2UuDQo+ID4gICAqIGFuZCBpdCBydW5zIGluIHJlc3VtZS9ncHUgcmVz
ZXQvYm9vdGluZyB1cCBjYXNlcy4NCj4gPiAgICovDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Jhcy5oDQo+ID4gaW5kZXggNmM3NmJiMi4uNTIxMjk2MSAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgNCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgNCj4gPiBAQCAtNTY2
LDYgKzU2NiwxMCBAQCBhbWRncHVfcmFzX2Vycm9yX3RvX3RhKGVudW0NCj4gYW1kZ3B1X3Jhc19l
cnJvcl90eXBlDQo+ID4gZXJyb3IpIHsgIGludCBhbWRncHVfcmFzX2luaXQoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpOyAgaW50IA0KPiA+IGFtZGdwdV9yYXNfZmluaShzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldik7ICBpbnQgDQo+ID4gYW1kZ3B1X3Jhc19wcmVfZmluaShzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldik7DQo+ID4gK2ludCBhbWRncHVfcmFzX2xhdGVfaW5pdChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwNCj4gPiArCQkJIHN0cnVjdCByYXNfY29tbW9uX2lmICpyYXNf
YmxvY2ssDQo+ID4gKwkJCSBzdHJ1Y3QgcmFzX2ZzX2lmICpmc19pbmZvLA0KPiA+ICsJCQkgc3Ry
dWN0IHJhc19paF9pZiAqaWhfaW5mbyk7DQo+ID4NCj4gPiAgaW50IGFtZGdwdV9yYXNfZmVhdHVy
ZV9lbmFibGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ID4gIAkJc3RydWN0IHJhc19j
b21tb25faWYgKmhlYWQsIGJvb2wgZW5hYmxlKTsNCj4gPiAtLQ0KPiA+IDIuNy40DQo+IA0KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBhbWQtZ2Z4
IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
