Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A19C333BB
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Jun 2019 17:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE34789221;
	Mon,  3 Jun 2019 15:38:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780078.outbound.protection.outlook.com [40.107.78.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788AE89221
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 15:38:31 +0000 (UTC)
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com (10.174.106.148) by
 DM5PR1201MB2488.namprd12.prod.outlook.com (10.172.86.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Mon, 3 Jun 2019 15:38:29 +0000
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::dde4:7ea4:1b9b:45ae]) by DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::dde4:7ea4:1b9b:45ae%9]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 15:38:29 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: use new HMM APIs and helpers
Thread-Topic: [PATCH] drm/amdgpu: use new HMM APIs and helpers
Thread-Index: AQHVFvW7FwLiVzA03k2ytJmujZXksaaEQkeAgAE8UICAACWJgIAAHqUAgAAIBwCAA/JOgIAAEnIAgABHToA=
Date: Mon, 3 Jun 2019 15:38:28 +0000
Message-ID: <1e20eb48-90a6-d666-ef41-b4046cc9d934@amd.com>
References: <20190530144049.1996-1-Philip.Yang@amd.com>
 <704410a5-be01-f423-11ef-01a640cd469c@amd.com>
 <bd8f1fd6-f6c4-66fc-c0b9-c8ed36cd6027@amd.com>
 <befbe7fa-0bd3-ffcf-d2eb-36f15053d1a5@amd.com>
 <9ae26883-4326-c60f-9a8e-d95d0d458e31@amd.com>
 <9f5f4060-5f8f-b688-2cc2-39aca92c7505@amd.com>
 <972ef129-3dae-d5eb-100f-b9be83d0afcc@gmail.com>
 <c20fba4e-f303-75b9-4bba-bdede43237aa@gmail.com>
In-Reply-To: <c20fba4e-f303-75b9-4bba-bdede43237aa@gmail.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::23) To DM5PR1201MB0155.namprd12.prod.outlook.com
 (2603:10b6:4:55::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b1bb7e1-0a85-4098-e045-08d6e839867f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR1201MB2488; 
x-ms-traffictypediagnostic: DM5PR1201MB2488:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR1201MB24885096FD55E8B1DEC7DA70E6140@DM5PR1201MB2488.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(39860400002)(366004)(346002)(396003)(199004)(189003)(81156014)(81166006)(25786009)(256004)(14444005)(5660300002)(8936002)(305945005)(7736002)(36756003)(8676002)(110136005)(6436002)(966005)(476003)(2501003)(478600001)(486006)(73956011)(66556008)(11346002)(66476007)(66946007)(66446008)(64756008)(14454004)(446003)(2616005)(6486002)(229853002)(72206003)(186003)(6512007)(316002)(52116002)(99286004)(31686004)(68736007)(76176011)(26005)(6306002)(53936002)(6246003)(2906002)(31696002)(86362001)(386003)(66574012)(3846002)(6116002)(6506007)(102836004)(53546011)(71190400001)(71200400001)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB2488;
 H:DM5PR1201MB0155.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KWW8eMCpaxOsrBnWzufcvGiHtu60HM/Smt8i/22ytOdQpT7I0Tnm6W3ZszUfFzc8FDa0jB3OiTkvuRntdyrwg/XpIeSpQR3hMWGKqP/oBAUe6loxBGX+vhWrtNMGRH3XEaXDOd7P2voWqA2D6kLlXcJWNEKRiX6yvKZtb4rkGww3beoePA9FN146AtXDgZaYORnz7w5o+1JjXcGAquyNyGtIkfF0wIx5EuZ9tiS6iv/lzPgbKv7hVp7ALleZQXMiL8y/593SnMU5qd4XY/k6wQr88z1sAq1lLTHkm2AbSn0nrWheQ6hsd2uhMpdSlaVCofZp/RXyiOMswA0Kyg6UuxPBMbYfdosfwlvB5v3gUvgLPakiyEE8+GQAB61Y6mTy1dsUoXtBo9lPCeSSsUuPPOC3pqDf5hYFoBGC5YYidiQ=
Content-ID: <18116B6294660540A7E4B30D86977324@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1bb7e1-0a85-4098-e045-08d6e839867f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 15:38:29.0143 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yangp@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2488
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svD3SnSdY+jNp55eqOj5p1IkBr9zzOx+z6D/pUlEYKY=;
 b=QEf0LzkVEtKMaQmV34lAQATiKpHJUwAwwBFby4QKI5pAzuzHRUzVFTMdKnip4c9Hr9vf81sfcs+GWGohYp1O2+Es8Awfj2eYm3e4YV4fExeSan7k9/bj0mhh5Tsy2p7LIAzlNjkBVT1fvEoOXtvGyAYEzqoazp4dStaG9xwWlqE=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNCk9uIDIwMTktMDYtMDMgNzoyMyBhLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KPiBB
bSAwMy4wNi4xOSB1bSAxMjoxNyBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6DQo+PiBBbSAwMS4w
Ni4xOSB1bSAwMDowMSBzY2hyaWViIEt1ZWhsaW5nLCBGZWxpeDoNCj4+PiBPbiAyMDE5LTA1LTMx
IDU6MzIgcC5tLiwgWWFuZywgUGhpbGlwIHdyb3RlOg0KPj4+PiBPbiAyMDE5LTA1LTMxIDM6NDIg
cC5tLiwgS3VlaGxpbmcsIEZlbGl4IHdyb3RlOg0KPj4+Pj4gT24gMjAxOS0wNS0zMSAxOjI4IHAu
bS4sIFlhbmcsIFBoaWxpcCB3cm90ZToNCj4+Pj4+PiBPbiAyMDE5LTA1LTMwIDY6MzYgcC5tLiwg
S3VlaGxpbmcsIEZlbGl4IHdyb3RlOg0KPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIMKgwqDCoMKgwqDC
oCAjaWYgSVNfRU5BQkxFRChDT05GSUdfRFJNX0FNREdQVV9VU0VSUFRSKQ0KPj4+Pj4+Pj4gLcKg
wqDCoCBpZiAoZ3R0LT5yYW5nZXMgJiYNCj4+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCB0dG0tPnBh
Z2VzWzBdID09IGhtbV9wZm5fdG9fcGFnZSgmZ3R0LT5yYW5nZXNbMF0sDQo+Pj4+Pj4+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGd0dC0+cmFuZ2Vz
WzBdLnBmbnNbMF0pKQ0KPj4+Pj4+Pj4gK8KgwqDCoCBpZiAoZ3R0LT5yYW5nZSAmJg0KPj4+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIHR0bS0+cGFnZXNbMF0gPT0gaG1tX2RldmljZV9lbnRyeV90b19w
YWdlKGd0dC0+cmFuZ2UsDQo+Pj4+Pj4+PiArIGd0dC0+cmFuZ2UtPnBmbnNbMF0pKQ0KPj4+Pj4+
PiBJIHRoaW5rIGp1c3QgY2hlY2tpbmcgZ3R0LT5yYW5nZSBoZXJlIGlzIGVub3VnaC4gSWYgZ3R0
LT5yYW5nZSBpcyANCj4+Pj4+Pj4gbm90DQo+Pj4+Pj4+IE5VTEwgaGVyZSwgd2UncmUgbGVha2lu
ZyBtZW1vcnkuDQo+Pj4+Pj4+DQo+Pj4+Pj4gSWYganVzdCBjaGVja2luZyBndHQtPnJhbmdlLCB0
aGVyZSBpcyBhIGZhbHNlIHdhcm5pbmcgaW4gYW1kZ3B1X3Rlc3QNCj4+Pj4+PiB1c2VycHRyIGNh
c2UgaW4gYW1kZ3B1X2NzX2xpc3RfdmFsaWRhdGUgcGF0aC4gSWYgdXNlcnB0ciBpcyANCj4+Pj4+
PiBpbnZhbGlkYXRlZCwNCj4+Pj4+PiB0aGVuIHR0bS0+cGFnZXNbMF0gaXMgb3V0ZGF0ZWQgcGFn
ZXMsIGxvYmotPnVzZXJfcGFnZXMgaXMgbmV3IA0KPj4+Pj4+IHBhZ2VzLCBpdA0KPj4+Pj4+IGdv
ZXMgdG8gdHRtX3R0X3VuYmluZCBmaXJzdCB0byB1bnBpbiBvbGQgcGFnZXMgKHRoaXMgY2F1c2Vz
IGZhbHNlDQo+Pj4+Pj4gd2FybmluZykgdGhlbiBjYWxsIGFtZGdwdV90dG1fdHRfc2V0X3VzZXJf
cGFnZXMuDQo+Pj4+PiBCdXQgZG9lc24ndCB0aGF0IG1lYW4gd2UncmUgbGVha2luZyB0aGUgZ3R0
LT5yYW5nZSBzb21ld2hlcmU/DQo+Pj4+Pg0KPj4+PiB0dG1fdHRfdW5iaW5kIGlzIGNhbGxlZCBm
cm9tIHR0bV90dF9kZXN0cm95IGFuZCANCj4+Pj4gYW1kZ3B1X2NzX2xpc3RfdmFsaWRhdGUsDQo+
Pj4+IHRoZSBsYXRlciBvbmUgY2F1c2VzIGZhbHNlIHdhcm5pbmcuIHR0bV90dG1fZGVzdG9yeSBw
YXRoIGlzIGZpbmUgdG8gDQo+Pj4+IG9ubHkNCj4+Pj4gY2hlY2sgZ3R0LT5yYW5nZS4NCj4+Pj4N
Cj4+Pj4gRG91YmxlIGNoZWNrZWQsIGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXMgYW5kDQo+
Pj4+IGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXNfZG9uZSBhbHdheXMgbWF0Y2ggaW4gYm90
aCBwYXRocywgc28gbm8gDQo+Pj4+IGxlYWsNCj4+Pj4gZ3R0LT5yYW5nZS4NCj4+Pj4NCj4+Pj4g
MS4gYW1kZ3B1X2dlbV91c2VycHRyX2lvY3RsDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgYW1kZ3B1
X3R0bV90dF9nZXRfdXNlcl9wYWdlcw0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHRt
LT5wYWdlcyBmb3IgdXNlcnB0ciBwYWdlcw0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgIGFtZGdwdV90
dG1fdHRfZ2V0X3VzZXJfcGFnZXNfZG9uZQ0KPj4+Pg0KPj4+PiAyLiBhbWRncHVfY3NfaW9jdGwN
Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBhbWRncHVfY3NfcGFyc2VyX2Jvcw0KPj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcw0KPj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHVzZXJwYWdlX2ludmFsaWRhdGVkKQ0KPj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlLT51c2VyX3BhZ2VzIGZvciBuZXcgcGFnZXMN
Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFtZGdwdV9jc19saXN0X3ZhbGlkYXRlDQo+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICh1c2VycGFnZV9pbnZhbGlk
YXRlZCkNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHRtX3R0
X3VuYmluZCB0dG0tPnBhZ2VzIC8vIHRoaXMgY2F1c2VzIHdhcm5pbmcNCj4+Pj4gYW1kZ3B1X3R0
bV90dF9zZXRfdXNlcl9wYWdlcyh0dG0tPnBhZ2VzLCBlLT51c2VyX3BhZ2VzKQ0KPj4+IEhtbSwg
SSB0aGluayBhbWRncHVfY3MgaXMgZG9pbmcgc29tZXRoaW5nIHdlaXJkIHRoZXJlLiBJdCBkb2Vz
IHNvbWUNCj4+PiBkb3VibGUgYm9vay1rZWVwaW5nIG9mIHRoZSB1c2VyIHBhZ2VzIGluIHRoZSBC
TyBsaXN0IGFuZCB0aGUgVFRNIEJPLiBXZQ0KPj4+IGRpZCBzb21ldGhpbmcgc2ltaWxhciBmb3Ig
S0ZEIGFuZCBzaW1wbGlmaWVkIGl0IHdoZW4gbW92aW5nIHRvIEhNTS4gSXQNCj4+PiBjb3VsZCBw
cm9iYWJseSBiZSBzaW1wbGlmaWVkIGZvciBhbWRncHVfY3MgYXMgd2VsbC4gQnV0IG5vdCBpbiB0
aGlzDQo+Pj4gcGF0Y2ggc2VyaWVzLg0KPj4NCj4+IFRoYXQgYWN0dWFsbHkgc291bmRzIGxpa2Ug
YSBidWcgdG8gbWUuDQo+Pg0KPj4gSXQgaXMgbW9zdCBsaWtlbHkgYSBsZWZ0b3ZlciBmcm9tIHRo
ZSB0aW1lIHdoZW4gd2UgY291bGRuJ3QgZ2V0IHRoZSANCj4+IHBhZ2VzIGZvciBhIEJPIHdoaWxl
IHRoZSBCTyB3YXMgcmVzZXJ2ZWQuDQo+IA0KPiBNaG0sIGF0IGxlYXN0IGl0J3Mgbm90IHJhY3kg
aW4gdGhlIHdheSBJIHRob3VnaHQgaXQgd291bGQgYmUuIEJ1dCBpdCBpcyANCj4gY2VydGFpbmx5
IHN0aWxsIG92ZXJraWxsIGFuZCBzaG91bGQgYmUgc2ltcGxpZmllZC4NCj4gDQo+IFBoaWxpcCBh
cmUgeW91IHRha2luZyBhIGxvb2sgb3Igc2hvdWxkIEkgdGFja2xlIHRoaXM/DQo+IA0KSGkgQ2hy
aXN0aWFuLA0KDQpJIHdpbGwgc3VibWl0IGFub3RoZXIgcGF0Y2ggdG8gc2ltcGxpZnkgYW1kZ3B1
X2NzX2lvY3RsIHBhdGgsIHBsZWFzZSANCmhlbHAgcmV2aWV3IGl0Lg0KDQpUaGFua3MsDQpQaGls
aXANCg0KPiBUaGFua3MsDQo+IENocmlzdGlhbi4NCj4gDQo+Pg0KPj4NCj4+IEdvaW5nIHRvIHRh
a2UgYSBjbG9zZXIgbG9vaywNCj4+IENocmlzdGlhbi4NCj4+DQo+Pj4NCj4+PiBJJ2xsIHJldmll
dyB5b3VyIHVwZGF0ZWQgY2hhbmdlLg0KPj4+DQo+Pj4gVGhhbmtzLA0KPj4+IMKgIMKgIEZlbGl4
DQo+Pj4NCj4+Pg0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgIGFtZGdwdV9jc19zdWJtaXQNCj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXNfZG9u
ZQ0KPj4+Pg0KPj4+Pj4gUmVnYXJkcywNCj4+Pj4+IMKgwqDCoCDCoCBGZWxpeA0KPj4+Pj4NCj4+
Pj4+DQo+Pj4+Pj4gSSB3aWxsIHN1Ym1pdCBwYXRjaCB2MiwgdG8gYWRkIHJldHJ5IGlmIGhtbV9y
YW5nZV9mYXVsdCByZXR1cm5zIA0KPj4+Pj4+IC1FQUdBSU4uDQo+Pj4+Pj4gdXNlIGt6YWxsb2Mg
dG8gYWxsb2NhdGUgc21hbGwgc2l6ZSByYW5nZS4NCj4+Pj4+Pg0KPj4+Pj4+IFRoYW5rcywNCj4+
Pj4+PiBQaGlsaXANCj4+Pj4+Pg0KPj4+Pj4+PiBSZWdhcmRzLA0KPj4+Pj4+PiDCoMKgwqDCoMKg
IMKgIEZlbGl4DQo+Pj4+Pj4+DQo+Pj4+Pj4+DQo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCj4+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPj4+IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQo+Pg0KPiANCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
