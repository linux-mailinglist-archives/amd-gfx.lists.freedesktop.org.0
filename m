Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6555EF17
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 00:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB5289709;
	Wed,  3 Jul 2019 22:19:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750084.outbound.protection.outlook.com [40.107.75.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E576F89709
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Jul 2019 22:19:26 +0000 (UTC)
Received: from BN6PR1201MB2547.namprd12.prod.outlook.com (10.172.107.138) by
 BN6PR1201MB2515.namprd12.prod.outlook.com (10.172.106.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Wed, 3 Jul 2019 22:19:25 +0000
Received: from BN6PR1201MB2547.namprd12.prod.outlook.com
 ([fe80::5df:17a6:c301:e36a]) by BN6PR1201MB2547.namprd12.prod.outlook.com
 ([fe80::5df:17a6:c301:e36a%7]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 22:19:25 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/amdkfd: Consistently apply noretry setting
Thread-Topic: [PATCH 1/1] drm/amdkfd: Consistently apply noretry setting
Thread-Index: AQHVKJBNQEMnb8jF3Uq9ShlXitOFVqa3wP4AgAHInYA=
Date: Wed, 3 Jul 2019 22:19:24 +0000
Message-ID: <5edef671-8986-e513-f03b-15066b8ab0d6@amd.com>
References: <20190622001959.32290-1-Felix.Kuehling@amd.com>
 <953e3a92-2d3b-0275-2a05-253570ab6277@amd.com>
In-Reply-To: <953e3a92-2d3b-0275-2a05-253570ab6277@amd.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0030.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::43) To BN6PR1201MB2547.namprd12.prod.outlook.com
 (2603:10b6:404:aa::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1df58ccc-fd8a-4005-cf81-08d700048168
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR1201MB2515; 
x-ms-traffictypediagnostic: BN6PR1201MB2515:
x-microsoft-antispam-prvs: <BN6PR1201MB251549BDAEBD91EB9E4FB901E6FB0@BN6PR1201MB2515.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(189003)(199004)(66476007)(66446008)(73956011)(186003)(66946007)(26005)(66556008)(76176011)(64756008)(53546011)(72206003)(478600001)(2501003)(31696002)(386003)(6506007)(110136005)(6486002)(36756003)(316002)(486006)(68736007)(31686004)(2906002)(102836004)(476003)(446003)(8936002)(2616005)(5660300002)(8676002)(11346002)(81156014)(81166006)(52116002)(71190400001)(229853002)(71200400001)(305945005)(7736002)(99286004)(66066001)(6512007)(66574012)(14444005)(25786009)(256004)(53936002)(4326008)(86362001)(14454004)(6246003)(3846002)(6116002)(6436002)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB2515;
 H:BN6PR1201MB2547.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LpiN0UI3Ec/9ep90hiCh2rlhCABafJkSmdoejYkJUT6+mUYoldBjuiGQ6JY91gugoNUzZiATyO4+1lofYCfiw+QuwnKBL9AXYoA1xcWsoFi3Yg3OBGtw7VfdkrGkSS1SdiIn8y8mvC7tCcis7P2MHEYZlUqhxjppw/3T1BEWkSLcA6sRM6+ih0q5B9J6p4g86lZUj0gwyGgsSQZGaG0vgE4TlLqBkIdThsIRIVYIheXvX7lAwVTEmcT8OEbnpEl4j5QAx7rURzA1IF+H9wrGmRZc2aFVFl76SAQm7k8Texd1Gyo+Kv5VreQl9OIRDVvUma3RN0uOf9jEUUNDBt8dsjH2KmthDz0IWV/0/eUUSNF9PvgTHD168rn29wXErAKdSrP2GmJDuJUPj96KX9OPXYqav8zI9qYjrzqpRwCWJLE=
Content-ID: <E22CC92D75CDD8419D463D40F4EEC2C1@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df58ccc-fd8a-4005-cf81-08d700048168
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 22:19:25.0082 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yangp@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2515
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRBn01X+zhV6OOlyFqNi9sdh1Sp+/FkPdRee6DkMOkM=;
 b=FL5A4hlZ/wHZldtpms7MRFFiVm1MXgFgNpvHHs5pbBKl/ltLPbclpLHvA6GxA7tANLk2XHRZtE7y/tzNigKRYjMFd/BgD5cNHQeW8UINfOL61TZn37rdn4VitWARcvC3JJnfyfCMDcCwiR+UliubMJaLPHeOSYoLr3+eKYi5Cx8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YW1kZ3B1X25vcmV0cnkgZGVmYXVsdCB2YWx1ZSBpcyAwLCB0aGlzIHdpbGwgZ2VuZXJhdGUgVk0g
ZmF1bHQgc3Rvcm0gDQpiZWNhdXNlIHRoZSB2bSBmYXVsdCBpcyBub3QgcmVjb3ZlcmVkLiBJdCBt
YXkgc2xvdyBkb3duIHRoZSBtYWNoaW5lIGFuZCANCm5lZWQgcmVib290IGFmdGVyIGFwcGxpY2F0
aW9uIFZNIGZhdWx0LiBNYXliZSBjaGFuZ2UgZGVmYXVsdCB2YWx1ZSB0byAxPw0KDQpPdGhlciB0
aGFuIHRoYXQsIHRoaXMgaXMgcmV2aWV3ZWQgYnkgUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFt
ZC5jb20+DQoNCk9uIDIwMTktMDctMDIgMzowNSBwLm0uLCBLdWVobGluZywgRmVsaXggd3JvdGU6
DQo+IFBpbmcuDQo+IA0KPiBDaHJpc3RpYW4sIFBoaWxpcCwgYW55IG9waW5pb24gYWJvdXQgdGhp
cyBwYXRjaD8NCj4gDQo+IE9uIDIwMTktMDYtMjEgODoyMCBwLm0uLCBLdWVobGluZywgRmVsaXgg
d3JvdGU6DQo+PiBBcHBseSB0aGUgc2FtZSBzZXR0aW5nIHRvIFNIX01FTV9DT05GSUcgYW5kIFZN
X0NPTlRFWFQxX0NOVEwuIFRoaXMNCj4+IG1ha2VzIHRoZSBub3JldHJ5IHBhcmFtIG5vIGxvbmdl
ciBLRkQtc3BlY2lmaWMuIE9uIEdGWDEwIEknbSBub3QNCj4+IGNoYW5naW5nIFNIX01FTV9DT05G
SUcgaW4gdGhpcyBjb21taXQgYmVjYXVzZSBHRlgxMCBoYXMgZGlmZmVyZW50DQo+PiByZXRyeSBi
ZWhhdmlvdXIgaW4gdGhlIFNRIGFuZCBJIGRvbid0IGhhdmUgYSB3YXkgdG8gdGVzdCBpdCBhdCB0
aGUNCj4+IG1vbWVudC4NCj4+DQo+PiBTdWdnZXN0ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPENo
cmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4NCj4+IENDOiBQaGlsaXAgWWFuZyA8UGhpbGlwLllhbmdA
YW1kLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGlu
Z0BhbWQuY29tPg0KPj4gLS0tDQo+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHUuaCAgICAgICAgICAgICAgfCAgMSArDQo+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZHJ2LmMgICAgICAgICAgfCAxNiArKysrKy0tLS0tLS0tLS0tDQo+PiAgICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jICAgICAgICAgICAgfCAgNCArKysrDQo+
PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhodWJfdjFfMC5jICAgICAgICAgfCAg
MyArKy0NCj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeGh1Yl92Ml8wLmMgICAg
ICAgICB8ICAzICsrLQ0KPj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjFf
MC5jICAgICAgICAgIHwgIDMgKystDQo+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9t
bWh1Yl92Ml8wLmMgICAgICAgICAgfCAgMyArKy0NCj4+ICAgIC4uLi9kcm0vYW1kL2FtZGtmZC9r
ZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXJfdjkuYyB8ICAyICstDQo+PiAgICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oICAgICAgICAgICAgfCAgMiArLQ0KPj4gICAgOSBmaWxl
cyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KPj4gaW5kZXggOWIxZWZkZjk0YmRmLi4wNTg3NTI3
OWMwOWUgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUu
aA0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgNCj4+IEBAIC0x
NjQsNiArMTY0LDcgQEAgZXh0ZXJuIGludCBhbWRncHVfYXN5bmNfZ2Z4X3Jpbmc7DQo+PiAgICBl
eHRlcm4gaW50IGFtZGdwdV9tY2JwOw0KPj4gICAgZXh0ZXJuIGludCBhbWRncHVfZGlzY292ZXJ5
Ow0KPj4gICAgZXh0ZXJuIGludCBhbWRncHVfbWVzOw0KPj4gK2V4dGVybiBpbnQgYW1kZ3B1X25v
cmV0cnk7DQo+PiAgICANCj4+ICAgICNpZmRlZiBDT05GSUdfRFJNX0FNREdQVV9TSQ0KPj4gICAg
ZXh0ZXJuIGludCBhbWRncHVfc2lfc3VwcG9ydDsNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZHJ2LmMNCj4+IGluZGV4IDdjZjZhYjA3YjExMy4uMGQ1NzhkOTViZTkzIDEwMDY0
NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jDQo+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMNCj4+IEBAIC0xNDAs
NiArMTQwLDcgQEAgaW50IGFtZGdwdV9hc3luY19nZnhfcmluZyA9IDE7DQo+PiAgICBpbnQgYW1k
Z3B1X21jYnAgPSAwOw0KPj4gICAgaW50IGFtZGdwdV9kaXNjb3ZlcnkgPSAwOw0KPj4gICAgaW50
IGFtZGdwdV9tZXMgPSAwOw0KPj4gK2ludCBhbWRncHVfbm9yZXRyeTsNCj4+ICAgIA0KPj4gICAg
c3RydWN0IGFtZGdwdV9tZ3B1X2luZm8gbWdwdV9pbmZvID0gew0KPj4gICAgCS5tdXRleCA9IF9f
TVVURVhfSU5JVElBTElaRVIobWdwdV9pbmZvLm11dGV4KSwNCj4+IEBAIC01OTEsNiArNTkyLDEw
IEBAIE1PRFVMRV9QQVJNX0RFU0MobWVzLA0KPj4gICAgCSJFbmFibGUgTWljcm8gRW5naW5lIFNj
aGVkdWxlciAoMCA9IGRpc2FibGVkIChkZWZhdWx0KSwgMSA9IGVuYWJsZWQpIik7DQo+PiAgICBt
b2R1bGVfcGFyYW1fbmFtZWQobWVzLCBhbWRncHVfbWVzLCBpbnQsIDA0NDQpOw0KPj4gICAgDQo+
PiArTU9EVUxFX1BBUk1fREVTQyhub3JldHJ5LA0KPj4gKwkiRGlzYWJsZSByZXRyeSBmYXVsdHMg
KDAgPSByZXRyeSBlbmFibGVkIChkZWZhdWx0KSwgMSA9IHJldHJ5IGRpc2FibGVkKSIpOw0KPj4g
K21vZHVsZV9wYXJhbV9uYW1lZChub3JldHJ5LCBhbWRncHVfbm9yZXRyeSwgaW50LCAwNjQ0KTsN
Cj4+ICsNCj4+ICAgICNpZmRlZiBDT05GSUdfSFNBX0FNRA0KPj4gICAgLyoqDQo+PiAgICAgKiBE
T0M6IHNjaGVkX3BvbGljeSAoaW50KQ0KPj4gQEAgLTY2NiwxNyArNjcxLDYgQEAgbW9kdWxlX3Bh
cmFtKGlnbm9yZV9jcmF0LCBpbnQsIDA0NDQpOw0KPj4gICAgTU9EVUxFX1BBUk1fREVTQyhpZ25v
cmVfY3JhdCwNCj4+ICAgIAkiSWdub3JlIENSQVQgdGFibGUgZHVyaW5nIEtGRCBpbml0aWFsaXph
dGlvbiAoMCA9IHVzZSBDUkFUIChkZWZhdWx0KSwgMSA9IGlnbm9yZSBDUkFUKSIpOw0KPj4gICAg
DQo+PiAtLyoqDQo+PiAtICogRE9DOiBub3JldHJ5IChpbnQpDQo+PiAtICogVGhpcyBwYXJhbWV0
ZXIgc2V0cyBzaF9tZW1fY29uZmlnLnJldHJ5X2Rpc2FibGUuIERlZmF1bHQgdmFsdWUsIDAsIGVu
YWJsZXMgcmV0cnkuDQo+PiAtICogU2V0dGluZyAxIGRpc2FibGVzIHJldHJ5Lg0KPj4gLSAqIFJl
dHJ5IGlzIG5lZWRlZCBmb3IgcmVjb3ZlcmFibGUgcGFnZSBmYXVsdHMuDQo+PiAtICovDQo+PiAt
aW50IG5vcmV0cnk7DQo+PiAtbW9kdWxlX3BhcmFtKG5vcmV0cnksIGludCwgMDY0NCk7DQo+PiAt
TU9EVUxFX1BBUk1fREVTQyhub3JldHJ5LA0KPj4gLQkiU2V0IHNoX21lbV9jb25maWcucmV0cnlf
ZGlzYWJsZSBvbiBWZWdhMTAgKDAgPSByZXRyeSBlbmFibGVkIChkZWZhdWx0KSwgMSA9IHJldHJ5
IGRpc2FibGVkKSIpOw0KPj4gLQ0KPj4gICAgLyoqDQo+PiAgICAgKiBET0M6IGhhbHRfaWZfaHdz
X2hhbmcgKGludCkNCj4+ICAgICAqIEhhbHQgaWYgSFdTIGhhbmcgaXMgZGV0ZWN0ZWQuIERlZmF1
bHQgdmFsdWUsIDAsIGRpc2FibGVzIHRoZSBoYWx0IG9uIGhhbmcuDQo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92OV8wLmMNCj4+IGluZGV4IGUwZjMwMTRlNzZlYS4uYzRlNzE1MTcwYmZl
IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0K
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KPj4gQEAgLTE5
MzgsMTEgKzE5MzgsMTUgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y5XzBfY29uc3RhbnRzX2luaXQoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+PiAgICAJCWlmIChpID09IDApIHsNCj4+ICAgIAkJ
CXRtcCA9IFJFR19TRVRfRklFTEQoMCwgU0hfTUVNX0NPTkZJRywgQUxJR05NRU5UX01PREUsDQo+
PiAgICAJCQkJCSAgICBTSF9NRU1fQUxJR05NRU5UX01PREVfVU5BTElHTkVEKTsNCj4+ICsJCQl0
bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgU0hfTUVNX0NPTkZJRywgUkVUUllfRElTQUJMRSwNCj4+
ICsJCQkJCSAgICAhIWFtZGdwdV9ub3JldHJ5KTsNCj4+ICAgIAkJCVdSRUczMl9TT0MxNV9STEMo
R0MsIDAsIG1tU0hfTUVNX0NPTkZJRywgdG1wKTsNCj4+ICAgIAkJCVdSRUczMl9TT0MxNV9STEMo
R0MsIDAsIG1tU0hfTUVNX0JBU0VTLCAwKTsNCj4+ICAgIAkJfSBlbHNlIHsNCj4+ICAgIAkJCXRt
cCA9IFJFR19TRVRfRklFTEQoMCwgU0hfTUVNX0NPTkZJRywgQUxJR05NRU5UX01PREUsDQo+PiAg
ICAJCQkJCSAgICBTSF9NRU1fQUxJR05NRU5UX01PREVfVU5BTElHTkVEKTsNCj4+ICsJCQl0bXAg
PSBSRUdfU0VUX0ZJRUxEKHRtcCwgU0hfTUVNX0NPTkZJRywgUkVUUllfRElTQUJMRSwNCj4+ICsJ
CQkJCSAgICAhIWFtZGdwdV9ub3JldHJ5KTsNCj4+ICAgIAkJCVdSRUczMl9TT0MxNV9STEMoR0Ms
IDAsIG1tU0hfTUVNX0NPTkZJRywgdG1wKTsNCj4+ICAgIAkJCXRtcCA9IFJFR19TRVRfRklFTEQo
MCwgU0hfTUVNX0JBU0VTLCBQUklWQVRFX0JBU0UsDQo+PiAgICAJCQkJKGFkZXYtPmdtYy5wcml2
YXRlX2FwZXJ0dXJlX3N0YXJ0ID4+IDQ4KSk7DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3YxXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dmeGh1Yl92MV8wLmMNCj4+IGluZGV4IDlmMGYxODlmYzExMS4uMTU5ODY3NDhmNTlmIDEwMDY0
NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3YxXzAuYw0KPj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3YxXzAuYw0KPj4gQEAgLTIz
Niw3ICsyMzYsOCBAQCBzdGF0aWMgdm9pZCBnZnhodWJfdjFfMF9zZXR1cF92bWlkX2NvbmZpZyhz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4+ICAgIAkJCQkgICAgYmxvY2tfc2l6ZSk7DQo+
PiAgICAJCS8qIFNlbmQgbm8tcmV0cnkgWE5BQ0sgb24gZmF1bHQgdG8gc3VwcHJlc3MgVk0gZmF1
bHQgc3Rvcm0uICovDQo+PiAgICAJCXRtcCA9IFJFR19TRVRfRklFTEQodG1wLCBWTV9DT05URVhU
MV9DTlRMLA0KPj4gLQkJCQkgICAgUkVUUllfUEVSTUlTU0lPTl9PUl9JTlZBTElEX1BBR0VfRkFV
TFQsIDEpOw0KPj4gKwkJCQkgICAgUkVUUllfUEVSTUlTU0lPTl9PUl9JTlZBTElEX1BBR0VfRkFV
TFQsDQo+PiArCQkJCSAgICAhYW1kZ3B1X25vcmV0cnkpOw0KPj4gICAgCQlXUkVHMzJfU09DMTVf
T0ZGU0VUKEdDLCAwLCBtbVZNX0NPTlRFWFQxX0NOVEwsIGksIHRtcCk7DQo+PiAgICAJCVdSRUcz
Ml9TT0MxNV9PRkZTRVQoR0MsIDAsIG1tVk1fQ09OVEVYVDFfUEFHRV9UQUJMRV9TVEFSVF9BRERS
X0xPMzIsIGkqMiwgMCk7DQo+PiAgICAJCVdSRUczMl9TT0MxNV9PRkZTRVQoR0MsIDAsIG1tVk1f
Q09OVEVYVDFfUEFHRV9UQUJMRV9TVEFSVF9BRERSX0hJMzIsIGkqMiwgMCk7DQo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3YyXzAuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dmeGh1Yl92Ml8wLmMNCj4+IGluZGV4IGI3ZGU2MGExNTYyMy4u
ZDYwNWI0OTYzZjhhIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4aHViX3YyXzAuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHVi
X3YyXzAuYw0KPj4gQEAgLTIxNSw3ICsyMTUsOCBAQCBzdGF0aWMgdm9pZCBnZnhodWJfdjJfMF9z
ZXR1cF92bWlkX2NvbmZpZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4+ICAgIAkJCQlh
ZGV2LT52bV9tYW5hZ2VyLmJsb2NrX3NpemUgLSA5KTsNCj4+ICAgIAkJLyogU2VuZCBuby1yZXRy
eSBYTkFDSyBvbiBmYXVsdCB0byBzdXBwcmVzcyBWTSBmYXVsdCBzdG9ybS4gKi8NCj4+ICAgIAkJ
dG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIEdDVk1fQ09OVEVYVDFfQ05UTCwNCj4+IC0JCQkJICAg
IFJFVFJZX1BFUk1JU1NJT05fT1JfSU5WQUxJRF9QQUdFX0ZBVUxULCAwKTsNCj4+ICsJCQkJICAg
IFJFVFJZX1BFUk1JU1NJT05fT1JfSU5WQUxJRF9QQUdFX0ZBVUxULA0KPj4gKwkJCQkgICAgIWFt
ZGdwdV9ub3JldHJ5KTsNCj4+ICAgIAkJV1JFRzMyX1NPQzE1X09GRlNFVChHQywgMCwgbW1HQ1ZN
X0NPTlRFWFQxX0NOVEwsIGksIHRtcCk7DQo+PiAgICAJCVdSRUczMl9TT0MxNV9PRkZTRVQoR0Ms
IDAsIG1tR0NWTV9DT05URVhUMV9QQUdFX1RBQkxFX1NUQVJUX0FERFJfTE8zMiwgaSoyLCAwKTsN
Cj4+ICAgIAkJV1JFRzMyX1NPQzE1X09GRlNFVChHQywgMCwgbW1HQ1ZNX0NPTlRFWFQxX1BBR0Vf
VEFCTEVfU1RBUlRfQUREUl9ISTMyLCBpKjIsIDApOw0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YxXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L21taHViX3YxXzAuYw0KPj4gaW5kZXggMDVkMWQ0NDhjOGY1Li5kYzVjZTAzMDM0ZDMgMTAw
NjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92MV8wLmMNCj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YxXzAuYw0KPj4gQEAgLTI2
NSw3ICsyNjUsOCBAQCBzdGF0aWMgdm9pZCBtbWh1Yl92MV8wX3NldHVwX3ZtaWRfY29uZmlnKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPj4gICAgCQkJCSAgICBibG9ja19zaXplKTsNCj4+
ICAgIAkJLyogU2VuZCBuby1yZXRyeSBYTkFDSyBvbiBmYXVsdCB0byBzdXBwcmVzcyBWTSBmYXVs
dCBzdG9ybS4gKi8NCj4+ICAgIAkJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIFZNX0NPTlRFWFQx
X0NOVEwsDQo+PiAtCQkJCSAgICBSRVRSWV9QRVJNSVNTSU9OX09SX0lOVkFMSURfUEFHRV9GQVVM
VCwgMSk7DQo+PiArCQkJCSAgICBSRVRSWV9QRVJNSVNTSU9OX09SX0lOVkFMSURfUEFHRV9GQVVM
VCwNCj4+ICsJCQkJICAgICFhbWRncHVfbm9yZXRyeSk7DQo+PiAgICAJCVdSRUczMl9TT0MxNV9P
RkZTRVQoTU1IVUIsIDAsIG1tVk1fQ09OVEVYVDFfQ05UTCwgaSwgdG1wKTsNCj4+ICAgIAkJV1JF
RzMyX1NPQzE1X09GRlNFVChNTUhVQiwgMCwgbW1WTV9DT05URVhUMV9QQUdFX1RBQkxFX1NUQVJU
X0FERFJfTE8zMiwgaSoyLCAwKTsNCj4+ICAgIAkJV1JFRzMyX1NPQzE1X09GRlNFVChNTUhVQiwg
MCwgbW1WTV9DT05URVhUMV9QQUdFX1RBQkxFX1NUQVJUX0FERFJfSEkzMiwgaSoyLCAwKTsNCj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92Ml8wLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92Ml8wLmMNCj4+IGluZGV4IDM3YTFhMzE4
YWU2My4uMGY5NTQ5ZjE5YWRlIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvbW1odWJfdjJfMC5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9t
bWh1Yl92Ml8wLmMNCj4+IEBAIC0yMDUsNyArMjA1LDggQEAgc3RhdGljIHZvaWQgbW1odWJfdjJf
MF9zZXR1cF92bWlkX2NvbmZpZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4+ICAgIAkJ
CQkgICAgYWRldi0+dm1fbWFuYWdlci5ibG9ja19zaXplIC0gOSk7DQo+PiAgICAJCS8qIFNlbmQg
bm8tcmV0cnkgWE5BQ0sgb24gZmF1bHQgdG8gc3VwcHJlc3MgVk0gZmF1bHQgc3Rvcm0uICovDQo+
PiAgICAJCXRtcCA9IFJFR19TRVRfRklFTEQodG1wLCBNTVZNX0NPTlRFWFQxX0NOVEwsDQo+PiAt
CQkJCSAgICBSRVRSWV9QRVJNSVNTSU9OX09SX0lOVkFMSURfUEFHRV9GQVVMVCwgMCk7DQo+PiAr
CQkJCSAgICBSRVRSWV9QRVJNSVNTSU9OX09SX0lOVkFMSURfUEFHRV9GQVVMVCwNCj4+ICsJCQkJ
ICAgICFhbWRncHVfbm9yZXRyeSk7DQo+PiAgICAJCVdSRUczMl9TT0MxNV9PRkZTRVQoTU1IVUIs
IDAsIG1tTU1WTV9DT05URVhUMV9DTlRMLCBpLCB0bXApOw0KPj4gICAgCQlXUkVHMzJfU09DMTVf
T0ZGU0VUKE1NSFVCLCAwLCBtbU1NVk1fQ09OVEVYVDFfUEFHRV9UQUJMRV9TVEFSVF9BRERSX0xP
MzIsIGkqMiwgMCk7DQo+PiAgICAJCVdSRUczMl9TT0MxNV9PRkZTRVQoTU1IVUIsIDAsIG1tTU1W
TV9DT05URVhUMV9QQUdFX1RBQkxFX1NUQVJUX0FERFJfSEkzMiwgaSoyLCAwKTsNCj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFn
ZXJfdjkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFu
YWdlcl92OS5jDQo+PiBpbmRleCBlOWZlMzkzODIzNzEuLjk1YTgyYWM0NTVmMiAxMDA2NDQNCj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdl
cl92OS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1
ZXVlX21hbmFnZXJfdjkuYw0KPj4gQEAgLTYxLDcgKzYxLDcgQEAgc3RhdGljIGludCB1cGRhdGVf
cXBkX3Y5KHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KPj4gICAgCQlxcGQtPnNo
X21lbV9jb25maWcgPQ0KPj4gICAgCQkJCVNIX01FTV9BTElHTk1FTlRfTU9ERV9VTkFMSUdORUQg
PDwNCj4+ICAgIAkJCQkJU0hfTUVNX0NPTkZJR19fQUxJR05NRU5UX01PREVfX1NISUZUOw0KPj4g
LQkJaWYgKG5vcmV0cnkgJiYNCj4+ICsJCWlmIChhbWRncHVfbm9yZXRyeSAmJg0KPj4gICAgCQkg
ICAgIWRxbS0+ZGV2LT5kZXZpY2VfaW5mby0+bmVlZHNfaW9tbXVfZGV2aWNlKQ0KPj4gICAgCQkJ
cXBkLT5zaF9tZW1fY29uZmlnIHw9DQo+PiAgICAJCQkJMSA8PCBTSF9NRU1fQ09ORklHX19SRVRS
WV9ESVNBQkxFX19TSElGVDsNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfcHJpdi5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaA0K
Pj4gaW5kZXggZDRiYmEwMTI0ZDI5Li5hYTdiZjIwZDIwZjggMTAwNjQ0DQo+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oDQo+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oDQo+PiBAQCAtMTU3LDcgKzE1Nyw3IEBAIGV4dGVybiBp
bnQgaWdub3JlX2NyYXQ7DQo+PiAgICAvKg0KPj4gICAgICogU2V0IHNoX21lbV9jb25maWcucmV0
cnlfZGlzYWJsZSBvbiBWZWdhMTANCj4+ICAgICAqLw0KPj4gLWV4dGVybiBpbnQgbm9yZXRyeTsN
Cj4+ICtleHRlcm4gaW50IGFtZGdwdV9ub3JldHJ5Ow0KPj4gICAgDQo+PiAgICAvKg0KPj4gICAg
ICogSGFsdCBpZiBIV1MgaGFuZyBpcyBkZXRlY3RlZA0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
