Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9CDDEE99
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Oct 2019 16:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D766E0EC;
	Mon, 21 Oct 2019 14:00:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780073.outbound.protection.outlook.com [40.107.78.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2944F6E0EC
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Oct 2019 14:00:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWEq1xdmvVIzR7Pv/gSCKrasLpSaRf/GBtVNsAnlvmtJ2szGc5m1aPZ+O+UWNqxlUFgrjx2tG1tOhrZdaQdu5koJLPVk+kRWEYYchSnTf2QZBddNQKRdcmLf6P1BED5HYWOlKSLiqs/I67Sfsd2BP6PHLZqCwViz8poLhw8TU1aAqQOHWbIsogQ4NYtLIaag8UvbjI+NS0ZH86gvc7qdN1hYiavtS1aTo9bYKAjNjOEaXwH+QLtV9+hmj6pkssrGtUq3zHfLnG8NfU+kQVgtyKvaMi9shOlR7V7GqHLlAg6mGZhkJieCi0dOzNLdJ4E/1GNBtwzQRkI1Fsv+wce3oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXBgr/krUo7gYlbh796f8S825f8jr5ejYBqjWi3JZyw=;
 b=DVMnBqxRHCJcmV2DtHsYMOqLbKxBaNP8k89qWzSRMXSKR4luB1BfOBJj9Gu2I7Rm6U6MoBUXO1ffL1gOH7HgE9iMukc6ywE3EJDTaNsMxDmkBcjXTDOrB+FXGpYYjMpoFRtZLsEh+iGv+oqnKgGO5wzfq5+LJfS8U63MO9qpiouFjMtisxjrC/eO6KJWCKaSLw0evD8g9WMNpk4RI0qcW1pmIGcIooSiobBLfS/8kU64qqPuemQIrJpj0zC/E45dOYmKLmEkIKoREjczma95fUrZl+yzWFwwTNGPLbuqAUA/37TOo58ugAgS7jp4scTJWRatFQ51xfHLgFYpuJREBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1186.namprd12.prod.outlook.com (10.168.227.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Mon, 21 Oct 2019 14:00:18 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554%12]) with mapi id 15.20.2347.029; Mon, 21 Oct
 2019 14:00:18 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Li, Dennis" <Dennis.Li@amd.com>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>
Subject: RE: [PATCH] drm/amdgpu: refine reboot debugfs operation in ras case
Thread-Topic: [PATCH] drm/amdgpu: refine reboot debugfs operation in ras case
Thread-Index: AQHVh+8N5mrw8nPdiEumnSvGbahk/KdlH6bQ
Date: Mon, 21 Oct 2019 14:00:18 +0000
Message-ID: <BN6PR12MB1809E5D27F447653C7E42D5FF7690@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20191021090735.19696-1-guchun.chen@amd.com>
In-Reply-To: <20191021090735.19696-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf4daf23-c71c-45d9-4096-08d7562f0188
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN6PR12MB1186:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB118693E4ED1FB84BC7D89C41F7690@BN6PR12MB1186.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(13464003)(189003)(199004)(86362001)(6246003)(8676002)(81166006)(81156014)(71200400001)(71190400001)(3846002)(6116002)(256004)(55016002)(33656002)(6636002)(6436002)(476003)(11346002)(446003)(486006)(99286004)(966005)(8936002)(4326008)(7696005)(76176011)(186003)(6506007)(26005)(52536014)(498600001)(53546011)(5660300002)(102836004)(9686003)(305945005)(7736002)(14454004)(6306002)(54906003)(110136005)(76116006)(66446008)(64756008)(66556008)(66476007)(66946007)(2906002)(66066001)(25786009)(74316002)(2501003)(229853002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1186;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kiezX1hMpxskDiqG8kTuX1LtD1rogeZTQtoboO/pmCfoPjPiribww/d6Z26Cd1q8g83Vs9/AKZCDQsEn0BJOpbIA3vldsJSaF4eYd3WWoUG/Z2v9lmnVbe+XusTu2PfLWgkIVhArbOlCpv5clhkfATdJULgsXkCKZoPwO6a/rS6YwjypxAsQnLmUmwb8rt3YzATQHoj/yZRVMkEU2GhAXhZXzWCvraaTaYTjGPJqlkzIc2tkgoC0QD8rUDMfXRTnd+dkXoh59jPr4+YipnhIjRW3wwwoh+XhbYfphR0Z9QB2AT9ijPvwlN+H18TBTBq5JtVqc57PVWW7Me9Bz6S8Hm/F4Rp5guqlz8TjTamg4T/DeXtFytW/1K6aC4IsFhiiWlodi3rZSIl3VJJaSSZaKtwwBPBA98avZkEnss3lB8kRt7iF6KmdWH+Dug2ZjicpoEyTIr/FlyanJRfBetWW1QM8S1UIh8TAat7XJQICqT0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4daf23-c71c-45d9-4096-08d7562f0188
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 14:00:18.4363 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wucaBKni9n26WYTdlFGLIpeAX4O/fcefMEGuB5bKdkOgqX8IR7BvB2o29So/+wORAkWLNjgqxIDRX2OcmSOTbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1186
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXBgr/krUo7gYlbh796f8S825f8jr5ejYBqjWi3JZyw=;
 b=Qnnl+k/AKSGV1r9Mr/EjxrPhQWL1HDv6f15ud9ph3lOvQJkx3fEP3DIokfIfzk3NfQLNugdWl8audcLHpZ5yXT5JQqwvlqWoQfdNxCwwIUHkxYebrPawvVTBxJw38JMH+B7EmagM2PG8WnTtp58UxZOW4MqyjFOXlKrNZuN9uG0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
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
Cc: "Li, Candice" <Candice.Li@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gQ2hlbiwgR3VjaHVu
DQo+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAyMSwgMjAxOSA1OjA4IEFNDQo+IFRvOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgWmhhbmcsIEhhd2tpbmcNCj4gPEhhd2tpbmcuWmhhbmdA
YW1kLmNvbT47IExpLCBEZW5uaXMgPERlbm5pcy5MaUBhbWQuY29tPjsNCj4gR3JvZHpvdnNreSwg
QW5kcmV5IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQuY29tPjsgWmhvdTEsIFRhbw0KPiA8VGFvLlpo
b3UxQGFtZC5jb20+DQo+IENjOiBMaSwgQ2FuZGljZSA8Q2FuZGljZS5MaUBhbWQuY29tPjsgQ2hl
biwgR3VjaHVuDQo+IDxHdWNodW4uQ2hlbkBhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0hdIGRy
bS9hbWRncHU6IHJlZmluZSByZWJvb3QgZGVidWdmcyBvcGVyYXRpb24gaW4gcmFzIGNhc2UNCj4g
DQo+IFJlYm9vdCBvcGVyYXRpb24gZm9yIHJhcyByZWNvdmVyeSBpcyBvbmUgY29tbW9uIGRlYnVn
ZnMgZW50cnksIHdoaWNoDQo+IHNob3VsZCBnZXQgcmlkIG9mIHJhc19jdHJsIG5vZGUgYW5kIHJl
bW92ZSBpcCBkZXBlbmRlbmNlIHdoZW4gaW5wdXR0aW5nIGJ5DQo+IHVzZXIuIFNvIGFkZCBvbmUg
bmV3IGF1dG9fcmVib290IG5vZGUgaW4gcmFzIGRlYnVnZnMgZGlyIHRvIGFjaGlldmUgdGhpcy4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEd1Y2h1biBDaGVuIDxndWNodW4uY2hlbkBhbWQuY29tPg0K
DQpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0K
DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgNTUN
Cj4gKysrKysrKysrKysrKysrKysrKysrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQ5IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Jhcy5jDQo+IGluZGV4IDYyMjAzOTQ1MjFlNC4uM2FkY2QyOWZlYjVmIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQo+IEBAIC0xNTMsOCAr
MTUzLDYgQEAgc3RhdGljIGludA0KPiBhbWRncHVfcmFzX2RlYnVnZnNfY3RybF9wYXJzZV9kYXRh
KHN0cnVjdCBmaWxlICpmLA0KPiAgCQlvcCA9IDE7DQo+ICAJZWxzZSBpZiAoc3NjYW5mKHN0ciwg
ImluamVjdCAlMzJzICU4cyIsIGJsb2NrX25hbWUsIGVycikgPT0gMikNCj4gIAkJb3AgPSAyOw0K
PiAtCWVsc2UgaWYgKHNzY2FuZihzdHIsICJyZWJvb3QgJTMycyIsIGJsb2NrX25hbWUpID09IDEp
DQo+IC0JCW9wID0gMzsNCj4gIAllbHNlIGlmIChzdHJbMF0gJiYgc3RyWzFdICYmIHN0clsyXSAm
JiBzdHJbM10pDQo+ICAJCS8qIGFzY2lpIHN0cmluZywgYnV0IGNvbW1hbmRzIGFyZSBub3QgbWF0
Y2hlZC4gKi8NCj4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+IEBAIC0yMjMsNyArMjIxLDYgQEAgc3Rh
dGljIHN0cnVjdCByYXNfbWFuYWdlcg0KPiAqYW1kZ3B1X3Jhc19maW5kX29iaihzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwNCj4gICAqIC0gMDogZGlzYWJsZSBSQVMgb24gdGhlIGJsb2NrLiBU
YWtlIDo6aGVhZCBhcyBpdHMgZGF0YS4NCj4gICAqIC0gMTogZW5hYmxlIFJBUyBvbiB0aGUgYmxv
Y2suIFRha2UgOjpoZWFkIGFzIGl0cyBkYXRhLg0KPiAgICogLSAyOiBpbmplY3QgZXJyb3JzIG9u
IHRoZSBibG9jay4gVGFrZSA6OmluamVjdCBhcyBpdHMgZGF0YS4NCj4gLSAqIC0gMzogcmVib290
IG9uIHVucmVjb3ZlcmFibGUgZXJyb3INCj4gICAqDQo+ICAgKiBIb3cgdG8gdXNlIHRoZSBpbnRl
cmZhY2U/DQo+ICAgKiBwcm9ncmFtczoNCj4gQEAgLTMwNSw5ICszMDIsNiBAQCBzdGF0aWMgc3Np
emVfdCBhbWRncHVfcmFzX2RlYnVnZnNfY3RybF93cml0ZShzdHJ1Y3QNCj4gZmlsZSAqZiwgY29u
c3QgY2hhciBfX3VzZXIgKg0KPiAgCQkvKiBkYXRhLmluamVjdC5hZGRyZXNzIGlzIG9mZnNldCBp
bnN0ZWFkIG9mIGFic29sdXRlIGdwdQ0KPiBhZGRyZXNzICovDQo+ICAJCXJldCA9IGFtZGdwdV9y
YXNfZXJyb3JfaW5qZWN0KGFkZXYsICZkYXRhLmluamVjdCk7DQo+ICAJCWJyZWFrOw0KPiAtCWNh
c2UgMzoNCj4gLQkJYW1kZ3B1X3Jhc19nZXRfY29udGV4dChhZGV2KS0+cmVib290ID0gdHJ1ZTsN
Cj4gLQkJYnJlYWs7DQo+ICAJZGVmYXVsdDoNCj4gIAkJcmV0ID0gLUVJTlZBTDsNCj4gIAkJYnJl
YWs7DQo+IEBAIC0zNDYsNiArMzQwLDQ2IEBAIHN0YXRpYyBzc2l6ZV90DQo+IGFtZGdwdV9yYXNf
ZGVidWdmc19lZXByb21fd3JpdGUoc3RydWN0IGZpbGUgKmYsIGNvbnN0IGNoYXIgX191c2VyDQo+
ICAJcmV0dXJuIHJldCA9PSAxID8gc2l6ZSA6IC1FSU87DQo+ICB9DQo+IA0KPiArLyoqDQo+ICsg
KiBET0M6IEFNREdQVSBSQVMgZGVidWdmcyBhdXRvIHJlYm9vdCBpbnRlcmZhY2UNCj4gKyAqDQo+
ICsgKiBBZnRlciBvbmUgdW5jb3JyZWN0YWJsZSBlcnJvciBoYXBwZW5zLCBHUFUgcmVjb3Zlcnkg
d2lsbCBiZSBzY2hlZHVsZWQuDQo+ICsgKiBEdWUgdG8gdGhlIGtub3duIHByb2JsZW0gaW4gR1BV
IHJlY292ZXJ5IGZhaWxpbmcgdG8gYnJpbmcgR1BVIGJhY2ssDQo+ICt0aGlzDQo+ICsgKiBpbnRl
cmZhY2UgcHJvdmlkZXMgb25lIGRpcmVjdCB3YXkgdG8gdXNlciB0byByZWJvb3Qgc3lzdGVtDQo+
ICthdXRvbWF0aWNhbGx5DQo+ICsgKiBpbiBzdWNoIGNhc2Ugd2l0aGluIEVSUkVWRU5UX0FUSFVC
X0lOVEVSUlVQVCBnZW5lcmF0ZWQuIE5vcm1hbA0KPiBHUFUNCj4gK3JlY292ZXJ5DQo+ICsgKiBy
b3V0aW5lIHdpbGwgbmV2ZXIgYmUgY2FsbGVkLg0KPiArICoNCj4gKyAqIEVuYWJsZSBhdXRvX3Jl
Ym9vdDoNCj4gKyAqDQo+ICsgKgllY2hvIDEgPiAvc3lzL2tlcm5lbC9kZWJ1Zy9kcmkveC9yYXMv
YXV0b19yZWJvb3QNCj4gKyAqDQo+ICsgKiBSZXZlcnQgYXV0b19yZWJvb3Q6DQo+ICsgKg0KPiAr
ICogCWVjaG8gMCA+IC9zeXMva2VybmVsL2RlYnVnL2RyaS94L3Jhcy9hdXRvX3JlYm9vdA0KPiAr
ICoNCj4gKyAqLw0KPiArc3RhdGljIHNzaXplX3QgYW1kZ3B1X3Jhc19kZWJ1Z2ZzX3JlYm9vdF93
cml0ZShzdHJ1Y3QgZmlsZSAqZiwNCj4gKwljb25zdCBjaGFyIF9fdXNlciAqYnVmLCBzaXplX3Qg
c2l6ZSwgbG9mZl90ICpwb3MpIHsNCj4gKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9DQo+
ICsJCShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWZpbGVfaW5vZGUoZiktPmlfcHJpdmF0ZTsNCj4g
KwljaGFyIHRtcFs4XSA9IHswfTsNCj4gKwlpbnQgdmFsdWUgPSAtMTsNCj4gKw0KPiArCWlmIChz
aXplICE9IHNpbXBsZV93cml0ZV90b19idWZmZXIodG1wLCBzaXplb2YodG1wKSwgcG9zLCBidWYs
IHNpemUpKQ0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKw0KPiArCWlmIChrc3RydG9pbnQodG1w
LCAxMCwgJnZhbHVlKSkNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4gKwlpZiAodmFsdWUg
PT0gMSkNCj4gKwkJYW1kZ3B1X3Jhc19nZXRfY29udGV4dChhZGV2KS0+cmVib290ID0gdHJ1ZTsN
Cj4gKwllbHNlIGlmICh2YWx1ZSA9PSAwKQ0KPiArCQlhbWRncHVfcmFzX2dldF9jb250ZXh0KGFk
ZXYpLT5yZWJvb3QgPSBmYWxzZTsNCj4gKw0KPiArCXJldHVybiBzaXplOw0KPiArfQ0KPiArDQo+
ICBzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBhbWRncHVfcmFzX2RlYnVnZnNf
Y3RybF9vcHMgPSB7DQo+ICAJLm93bmVyID0gVEhJU19NT0RVTEUsDQo+ICAJLnJlYWQgPSBOVUxM
LA0KPiBAQCAtMzYwLDYgKzM5NCwxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0
aW9ucw0KPiBhbWRncHVfcmFzX2RlYnVnZnNfZWVwcm9tX29wcyA9IHsNCj4gIAkubGxzZWVrID0g
ZGVmYXVsdF9sbHNlZWsNCj4gIH07DQo+IA0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29w
ZXJhdGlvbnMgYW1kZ3B1X3Jhc19kZWJ1Z2ZzX3JlYm9vdF9vcHMgPSB7DQo+ICsJLm93bmVyID0g
VEhJU19NT0RVTEUsDQo+ICsJLnJlYWQgPSBOVUxMLA0KPiArCS53cml0ZSA9IGFtZGdwdV9yYXNf
ZGVidWdmc19yZWJvb3Rfd3JpdGUsDQo+ICsJLmxsc2VlayA9IGRlZmF1bHRfbGxzZWVrDQo+ICt9
Ow0KPiArDQo+ICAvKioNCj4gICAqIERPQzogQU1ER1BVIFJBUyBzeXNmcyBFcnJvciBDb3VudCBJ
bnRlcmZhY2UNCj4gICAqDQo+IEBAIC0xMDM3LDYgKzEwNzgsOCBAQCBzdGF0aWMgdm9pZA0KPiBh
bWRncHVfcmFzX2RlYnVnZnNfY3JlYXRlX2N0cmxfbm9kZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikNCj4gIAkJCQlhZGV2LCAmYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2N0cmxfb3BzKTsNCj4gIAlk
ZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJyYXNfZWVwcm9tX3Jlc2V0IiwgU19JV1VHTyB8IFNfSVJVR08s
DQo+IGNvbi0+ZGlyLA0KPiAgCQkJCWFkZXYsICZhbWRncHVfcmFzX2RlYnVnZnNfZWVwcm9tX29w
cyk7DQo+ICsJZGVidWdmc19jcmVhdGVfZmlsZSgiYXV0b19yZWJvb3QiLCBTX0lXVUdPIHwgU19J
UlVHTywgY29uLT5kaXIsDQo+ICsJCQkJYWRldiwgJmFtZGdwdV9yYXNfZGVidWdmc19yZWJvb3Rf
b3BzKTsNCj4gIH0NCj4gDQo+ICB2b2lkIGFtZGdwdV9yYXNfZGVidWdmc19jcmVhdGUoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+IC0tDQo+IDIuMTcuMQ0KPiANCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxp
c3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
