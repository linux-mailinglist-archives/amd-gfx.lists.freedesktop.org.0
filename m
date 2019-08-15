Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5168E25B
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2019 03:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8827B6E884;
	Thu, 15 Aug 2019 01:29:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790041.outbound.protection.outlook.com [40.107.79.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9322D6E884
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2019 01:29:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3HHtu1vIhWVY8A9SeUVBdR5zP7Do4BBGjbvQXF5KC9imTcIr2t/s2NHQMZDmjSBr/1XspyVxFV5ov18oYPnESuq9htx23lX0GufFhRR39vr6oT+vfPT6hSfl64mMmU5qBtmQXm8yS9I4Im8Gn/07/9s7JIL9uXNMJxNZlsD83nqFxMIzsr4vqJ2D75Gw7VsXk5kHR5O8WXkC42OGxEp30U9/lARSZ9EsTVMtEKqCbeAoOogtciYUhIoAiglj1ICEU32nRD2J4ijEUPvWZjyZxGu9u+J60qHEMqFlqLGNeI8cLCc/i8EP9e/6Leqx1WAsSg36KEA6Bo9NMeSAxBSSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxj/sHsijM5Y9ILXIy+8iRS4urwbp5CKTFNPZ7fVEUw=;
 b=Z1/WjJxP4fo6pJlzLKe63Eaco5ftghOt+w6fPmSm+nxGlaQotDeWJBw5pV2hDLmb3JQNdpwid/+k6PbCkT/mNb/iN/Ltv+ZZf50KTqCfoBq6vXKYzMmY2O0pqAj3BoKdjp/QT3T2cl9q2Y4V8/0xFcSfMfj7sFgildctdzdLL8EtvOh24YBRlVykeG85w6P1t0SvGye2VpZakrh6GAx77qG8y89A5XyLjMqtPQXwWkTu6pHFaTNsDPf2rgqIO6y3ZJ2/GdAg1OUSveVSGi/NxNW4QnT3G6avEZUdBtzXnrWWl7bu5tiE9MWeXlFkp1xeMQsPrXYUStE/5ldMed3m0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB4302.namprd12.prod.outlook.com (52.135.51.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Thu, 15 Aug 2019 01:29:06 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077%6]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 01:29:06 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2 5/5] drm/amdgpu: Use new mode2 reset interface for RV.
Thread-Topic: [PATCH v2 5/5] drm/amdgpu: Use new mode2 reset interface for RV.
Thread-Index: AQHVUuCTfkcFw0O6N0a1/pM9NDeIi6b7a7rA
Date: Thu, 15 Aug 2019 01:29:05 +0000
Message-ID: <MN2PR12MB3344CD79B2DF515F1B8B4519E4AC0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1565815217-9533-1-git-send-email-andrey.grodzovsky@amd.com>
 <1565815217-9533-6-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1565815217-9533-6-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bda381fb-d53a-429f-9891-08d7211ff69f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4302; 
x-ms-traffictypediagnostic: MN2PR12MB4302:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4302827A017DE6EE0F6FB777E4AC0@MN2PR12MB4302.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:466;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(199004)(189003)(13464003)(53936002)(478600001)(71200400001)(81166006)(71190400001)(316002)(99286004)(110136005)(81156014)(76116006)(66446008)(229853002)(86362001)(66476007)(5660300002)(6306002)(9686003)(66556008)(64756008)(54906003)(66946007)(6246003)(55016002)(8936002)(2906002)(6436002)(7736002)(305945005)(4326008)(966005)(14444005)(26005)(256004)(33656002)(25786009)(14454004)(74316002)(446003)(52536014)(8676002)(6506007)(486006)(3846002)(2501003)(6116002)(7696005)(76176011)(102836004)(66066001)(186003)(53546011)(476003)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4302;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kmvH951GiyNfY8TbZxR0YWJpj+6V2i1fyiOMU20yIpuTtfyFrK8+QcABhxT3h/05GOU+BikhdfL1/FCUT97+u4ahjl9+J7LJAClkVV1a00ZN4DbUJjRSmm8dcmgzPJOn3opIYS4XjcWGHuR0AJILA+6Y0PacKPRqdQIRJU/ljv2kW8Ac98vUPzLv0Ylse/zjYz6AvpffvVjAeUjZT2al+M5ILfwkVCr2CgUURpLaUKMwheduox9A3vkXF4FWnR4VSu1APR4QkX8Lc1gMECy8e3LPZU+ZMPRADzwrAhaAcl9nVvGris0l/q3S3MRmJgGONvVhYxRqLdFDZuRXnRlTiVjTP4+KF4dlhj0cr7H66Ly8P4QAKXAm8lrLlqeBgB3OKB7hh2CuDfifYS4qv4PJKrQlBIxe21PG8M1IiVhGdLE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bda381fb-d53a-429f-9891-08d7211ff69f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 01:29:05.6094 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XU2xkXo1lrQuqtl+taIC/pcZ87fIs5wzXGBO6k1P/XlGPngyh10Rwy+mJUCDi00/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4302
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxj/sHsijM5Y9ILXIy+8iRS4urwbp5CKTFNPZ7fVEUw=;
 b=wW++BjVSEAQxdPiD6hLGE/IXy2IVHLfgfi9M/GI9U0WiIz0MBnAaWt+Ej7LOd3x2FT3p2Y/Oz9pTq+zsuLX4RsWRHl12eRzhMGC/R8ZkWWGFHVOsOIAHrlsiFj2Wlmn8Km4MmYtXx3j5dbh8wxdMt4HjSjk9/o2+/19u8vHLpgo=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Grodzovsky,
 Andrey" <Andrey.Grodzovsky@amd.com>, "S, Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VyaWVzIGlzIFJldmlld2VkLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPg0KDQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGFtZC1nZnggPGFtZC1nZngtYm91
bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiBBbmRyZXkgR3JvZHpv
dnNreQ0KPiBTZW50OiBUaHVyc2RheSwgQXVndXN0IDE1LCAyMDE5IDQ6NDAgQU0NCj4gVG86IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFs
ZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBHcm9kem92c2t5LA0KPiBBbmRyZXkgPEFuZHJleS5H
cm9kem92c2t5QGFtZC5jb20+OyBRdWFuLCBFdmFuDQo+IDxFdmFuLlF1YW5AYW1kLmNvbT47IFMs
IFNoaXJpc2ggPFNoaXJpc2guU0BhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgNS81XSBk
cm0vYW1kZ3B1OiBVc2UgbmV3IG1vZGUyIHJlc2V0IGludGVyZmFjZSBmb3IgUlYuDQo+IA0KPiB2
MjoNCj4gQ2hlY2sgcHBmdW5jcyBwb2ludGVyIGZvciBOVUxMDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4NCj4gLS0tDQo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAgMSArDQo+ICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jICAgICAgICAgfCAyNSArKysrKysrKysr
KysrKysrKy0tLS0tLS0NCj4gLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCsp
LCA4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYw0KPiBpbmRleCAyNzUyNzczLi4wMmIzZTdkIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+IEBAIC0zNTI0LDYgKzM1MjQs
NyBAQCBib29sIGFtZGdwdV9kZXZpY2Vfc2hvdWxkX3JlY292ZXJfZ3B1KHN0cnVjdA0KPiBhbWRn
cHVfZGV2aWNlICphZGV2KQ0KPiAgCQljYXNlIENISVBfVkVHQTIwOg0KPiAgCQljYXNlIENISVBf
VkVHQTEwOg0KPiAgCQljYXNlIENISVBfVkVHQTEyOg0KPiArCQljYXNlIENISVBfUkFWRU46DQo+
ICAJCQlicmVhazsNCj4gIAkJZGVmYXVsdDoNCj4gIAkJCWdvdG8gZGlzYWJsZWQ7DQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQo+IGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYw0KPiBpbmRleCBjMmQzMjRkLi43N2U2Nzk5IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMNCj4gQEAgLTUwOCw2ICs1MDgsMTUgQEAg
c3RhdGljIGludCBzb2MxNV9hc2ljX2JhY29fcmVzZXQoc3RydWN0DQo+IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiArc3RhdGljIGludCBzb2MxNV9tb2Rl
Ml9yZXNldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikgew0KPiArCWlmICghYWRldi0+cG93
ZXJwbGF5LnBwX2Z1bmNzIHx8DQo+ICsJICAgICFhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MtPmFz
aWNfcmVzZXRfbW9kZV8yKQ0KPiArCQlyZXR1cm4gLUVOT0VOVDsNCj4gKw0KPiArCXJldHVybg0K
PiArYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzLT5hc2ljX3Jlc2V0X21vZGVfMihhZGV2LQ0KPiA+
cG93ZXJwbGF5LnBwX2hhbmRsZSk7DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyBlbnVtIGFtZF9yZXNl
dF9tZXRob2QNCj4gIHNvYzE1X2FzaWNfcmVzZXRfbWV0aG9kKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KSAgeyBAQCAtNTQ2LDE0DQo+ICs1NTUsMTQgQEAgc29jMTVfYXNpY19yZXNldF9tZXRo
b2Qoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+IA0KPiAgc3RhdGljIGludCBzb2MxNV9h
c2ljX3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KSAgew0KPiAtCWludCByZXQ7DQo+
IC0NCj4gLQlpZiAoc29jMTVfYXNpY19yZXNldF9tZXRob2QoYWRldikgPT0gQU1EX1JFU0VUX01F
VEhPRF9CQUNPKQ0KPiAtCQlyZXQgPSBzb2MxNV9hc2ljX2JhY29fcmVzZXQoYWRldik7DQo+IC0J
ZWxzZQ0KPiAtCQlyZXQgPSBzb2MxNV9hc2ljX21vZGUxX3Jlc2V0KGFkZXYpOw0KPiAtDQo+IC0J
cmV0dXJuIHJldDsNCj4gKwlzd2l0Y2ggKHNvYzE1X2FzaWNfcmVzZXRfbWV0aG9kKGFkZXYpKSB7
DQo+ICsJCWNhc2UgQU1EX1JFU0VUX01FVEhPRF9CQUNPOg0KPiArCQkJcmV0dXJuIHNvYzE1X2Fz
aWNfYmFjb19yZXNldChhZGV2KTsNCj4gKwkJY2FzZSBBTURfUkVTRVRfTUVUSE9EX01PREUyOg0K
PiArCQkJcmV0dXJuIHNvYzE1X21vZGUyX3Jlc2V0KGFkZXYpOw0KPiArCQlkZWZhdWx0Og0KPiAr
CQkJcmV0dXJuIHNvYzE1X2FzaWNfbW9kZTFfcmVzZXQoYWRldik7DQo+ICsJfQ0KPiAgfQ0KPiAN
Cj4gIC8qc3RhdGljIGludCBzb2MxNV9zZXRfdXZkX2Nsb2NrKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LCB1MzIgY2xvY2ssDQo+IC0tDQo+IDIuNy40DQo+IA0KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0K
PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
