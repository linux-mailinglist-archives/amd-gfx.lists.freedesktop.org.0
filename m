Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DF5B610A
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 12:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A6A6EEA2;
	Wed, 18 Sep 2019 10:04:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700070.outbound.protection.outlook.com [40.107.70.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029486EE9F
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 10:04:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jn0t8jbZwPPEW9zBKcIfXtC7LaCpibd07IsOEwzT7duemRFchnIseU7zgydVIaoOU4KRh/ebihZLDbwknw89fRK+PIjYg/QXZiSEAf5UqLIZK6WOKleA1wpRrsQ1yBvFsOGUOjTuQLBxyLsD8s4I59LOyptYDY6V/DaXPLrOhLTyjkrWC04FiR90qU0Dvm3mtWTMX7PfqKxES7gqUZlthMfmg58qwURMGyX0tGuo0VhdvYj6BZCVWOmz2e0Tt3i4eKBUe1qaxWcXKUCXkuQcXeXNsnPe5aym9AxhOKocLuvFclW8cKVkKq/pjX9VzRTNUfpCD7+0DIud9TayoZajWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfomlYyk13+q0yS0/9j8dL5OIKudWD4obWIuYGFbZkc=;
 b=avgk16Iqn+JSg0zmenTPNsiwKuJsX71q1SrQF/gpYY9ApSIMfoUS/lEktiFDD9eNIqQ4+DuzwMcsEP1hBrb8q+FjEviXOTH5ZCkSWTFYu/Mgki9OflfP1mO8eNvq8BccA7YA/O68oZfIHE5a5DTntt6QZhf6uBhpz2H9i2iSLipO2teLzVZrVeay/XDXZb9W3yB8GRbGLWD3f+RnASjHXbMKYMJbWEPZ0Oqh3rsSHXCtGr8rI2/ZjZbn+qWUVGkMNI4XnYs158FxjjFajZftDrmI6KAwvJzYOJ9PpvA2Qmvm2oRmo8bVDuz2zA0cea3pKuCTVxGJH6GagFBtBrVeaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2975.namprd12.prod.outlook.com (20.178.243.142) by
 MN2PR12MB3183.namprd12.prod.outlook.com (20.179.82.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 18 Sep 2019 10:04:47 +0000
Received: from MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::3dbc:12f8:fbba:1e7e]) by MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::3dbc:12f8:fbba:1e7e%7]) with mapi id 15.20.2263.023; Wed, 18 Sep 2019
 10:04:47 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or
 passthrough
Thread-Topic: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or
 passthrough
Thread-Index: AQHVbgWu2rFDa0rF+0CzJp1BGtWXeKcxMqhg
Date: Wed, 18 Sep 2019 10:04:46 +0000
Message-ID: <MN2PR12MB2975280FA830F69A96966A3E8F8E0@MN2PR12MB2975.namprd12.prod.outlook.com>
References: <8cad9ead-c2da-43b1-91d1-0291e02c5fd8@email.android.com>
In-Reply-To: <8cad9ead-c2da-43b1-91d1-0291e02c5fd8@email.android.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af9e6f15-c1d1-4a47-2b35-08d73c1fa2e8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3183; 
x-ms-traffictypediagnostic: MN2PR12MB3183:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB31833A462F50930301F990FF8F8E0@MN2PR12MB3183.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(13464003)(189003)(199004)(6436002)(81156014)(4326008)(81166006)(7736002)(8936002)(5660300002)(52536014)(54906003)(8676002)(14454004)(236005)(6636002)(74316002)(9686003)(55016002)(6306002)(54896002)(9326002)(66066001)(7696005)(86362001)(186003)(446003)(102836004)(11346002)(25786009)(53546011)(6506007)(256004)(26005)(66446008)(33656002)(66556008)(229853002)(66946007)(64756008)(66476007)(316002)(2906002)(790700001)(6116002)(3846002)(14444005)(76176011)(6246003)(76116006)(71190400001)(71200400001)(6862004)(486006)(476003)(99286004)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3183;
 H:MN2PR12MB2975.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qpDJ/ASaA7ci0RZBt6EGN30z0MdsVWP+w4AB+BU7Ai7TgRufnYb+Rk3JgGT5P7e4o+T1qOnIquxowNKptdwR58gqFGq9/8NeQZcSehDUqv3JL5Zwva8SSyD+BBOXS0hkXq0uyEqDvOFqH0iQs24Def8XBaMql0SIkBLS018pYFeIyxk+6hE2IHaYdJMrD4qay14taRCEYL3TjGwCxD947FmxPNbzmpyvs8D1Ie0HAGsWZGOIrd3OktLZdy0u6Wd0gskTUIeMTsdUNhSqKg3nNG/8yvIv6Y7q5QLyXyL94FTqLtNUvXHf3WF4EqFWRay/lYUu7ZbUYm3i2MZxydgDo8enBnKkAWDEw4MTXzsxKllXAVrOSHmKD77N3VXTChHsV1TDRMibXNfwx6COUVlxJEKbjkzJULL062lid0oi7GI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af9e6f15-c1d1-4a47-2b35-08d73c1fa2e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 10:04:46.8693 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jznpfVbB12n3lGm1bQS0Ae1Fqn9ze4Tq7GpLI0CSJXbY6P2m3w8uf2jFWAQcthgw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3183
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfomlYyk13+q0yS0/9j8dL5OIKudWD4obWIuYGFbZkc=;
 b=s9HTGOWXrUNR1MUERg9N2mzvf174WYqTrbM76ErfmuLIJXa5XPQXBfJ0ZP6QGrRsfrcT4VnXI4BK2GEvKBlUfWZRPl5wJr3X5DM+0DLHJvv/oRCuIB/hIv8aVFU06sA8WDdNhTwvDeZSwBozebTEV7TQVJxVxymvkHgKqFQUUpE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Emily.Deng@amd.com; 
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
Cc: "Zhang, Jack \(Jian\)" <Jack.Zhang1@amd.com>, "Cui,
 Flora" <Flora.Cui@amd.com>, "Teng, Rui" <Rui.Teng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1674643731=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1674643731==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB2975280FA830F69A96966A3E8F8E0MN2PR12MB2975namp_"

--_000_MN2PR12MB2975280FA830F69A96966A3E8F8E0MN2PR12MB2975namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQ2hyaXN0aWFuLA0KRG8geW91IHRoaW5rIHRoaXMgaXMgYmVjYXVzZSB0aGUgd3JvbmcgdXNl
IGNhc2U/IEV2ZW4gd2UgYWRkIHRoZSBlcnJvciBsb2csIHRoZSBpc3N1ZSBzdGlsbCBoYXBwZW5z
LiBDb3VsZCB3ZSBjaGFuZ2UgdGhpcyBlcnJvciB0byB3YXJuaW5nPyBBcyBmb3IgdGhlIHJpZ2h0
IG1ldGhvZCB0byByZW1vdmUgdGhlIGRyaXZlciwgaXQgc2hvdWxkbuKAmXQgb2NjdXIgaXNzdWVz
Lg0KDQpCZXN0IHdpc2hlcw0KRW1pbHkgRGVuZw0KRnJvbTogS29lbmlnLCBDaHJpc3RpYW4gPENo
cmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4NClNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDE4LCAy
MDE5IDU6NDUgUE0NClRvOiBEZW5nLCBFbWlseSA8RW1pbHkuRGVuZ0BhbWQuY29tPg0KQ2M6IFpo
YW5nLCBKYWNrIChKaWFuKSA8SmFjay5aaGFuZzFAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBUZW5nLCBSdWkgPFJ1aS5UZW5nQGFtZC5jb20+OyBDdWksIEZsb3JhIDxG
bG9yYS5DdWlAYW1kLmNvbT4NClN1YmplY3Q6IFJFOiBbUEFUQ0hdIGRybS9hbWRncHUvc3Jpb3Y6
IG9taXQgZmJjb24gZXJyb3IgdW5kZXIgc3Jpb3Ygb3IgcGFzc3Rocm91Z2gNCg0KWWVzLCBleGFj
dGx5Lg0KDQpUaGUgcHJvYmxlbSBpcyB0aGF0IGV2ZW4gd2hlbiBvdXRwdXQgaXMgcXhsIG9yIHRo
ZSBJbnRlbCBkcml2ZXIgb3VyIGRyaXZlciBpcyBzdGlsbCBsb2FkZWQgYW5kIGZvcmNlZnVsbHkg
cmVtb3ZpbmcgaXQgcmVuZGVycyB0aGUgZGVza3RvcCB1bnVzYWJsZS4NCg0KQ2hyaXN0aWFuLg0K
DQoNCkFtIDE4LjA5LjIwMTkgMTE6MjQgc2NocmllYiAiRGVuZywgRW1pbHkiIDxFbWlseS5EZW5n
QGFtZC5jb208bWFpbHRvOkVtaWx5LkRlbmdAYW1kLmNvbT4+Og0KDQpIaSBDaHJpc3RpYW4sDQoN
CkRvIHlvdSBtZWFuLCBmb3IgcGFzc3Rocm91Z2ggbW9kZSwgdGhlIGRlc2t0b3AgaXMgcmVuZGVy
ZWQgYnkgb3VyIGFzaWMsIGJ1dCBlbmR1c2VyIGlzIHRyeWluZyB0byByZW1vdmUgdGhlIGRyaXZl
ciBieSBob3QgcGx1Zz8NCg0KDQoNCkJlc3Qgd2lzaGVzDQoNCkVtaWx5IERlbmcNCg0KRnJvbTog
S29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbTxtYWlsdG86Q2hyaXN0
aWFuLktvZW5pZ0BhbWQuY29tPj4NClNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDE4LCAyMDE5
IDQ6NDQgUE0NClRvOiBEZW5nLCBFbWlseSA8RW1pbHkuRGVuZ0BhbWQuY29tPG1haWx0bzpFbWls
eS5EZW5nQGFtZC5jb20+Pg0KQ2M6IFpoYW5nLCBKYWNrIChKaWFuKSA8SmFjay5aaGFuZzFAYW1k
LmNvbTxtYWlsdG86SmFjay5aaGFuZzFAYW1kLmNvbT4+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzxtYWlsdG86YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBUZW5nLCBSdWkg
PFJ1aS5UZW5nQGFtZC5jb208bWFpbHRvOlJ1aS5UZW5nQGFtZC5jb20+PjsgQ3VpLCBGbG9yYSA8
RmxvcmEuQ3VpQGFtZC5jb208bWFpbHRvOkZsb3JhLkN1aUBhbWQuY29tPj4NClN1YmplY3Q6IFJF
OiBbUEFUQ0hdIGRybS9hbWRncHUvc3Jpb3Y6IG9taXQgZmJjb24gZXJyb3IgdW5kZXIgc3Jpb3Yg
b3IgcGFzc3Rocm91Z2gNCg0KDQoNCkhpIEVtaWx5LA0KDQoNCg0KWWVhaCwgZXhhY3RseSB0aGF0
J3MgdGhlIHByb2JsZW06IEluIHNvbWUgY2FzZXMgdGhlIGRyaXZlciBjYW4gYmUgdW5sb2FkZWQg
d2hpbGUgaXQgaXMgc3RpbGwgaW4gdXNlIQ0KDQoNCg0KU2VlIHdlIGFkZGVkIHRoaXMgZXJyb3Ig
bWVzc2FnZSBiZWNhdXNlIGVuZHVzZXJzIHRyaWVkIHRvIHVzZSBQQ0llIGhvdCBwbHVnIHRvIHVu
bG9hZCB0aGUgZHJpdmVyIHRvIHVzZSB0aGUgaGFyZHdhcmUgZm9yIHBhdGh0aHJvdWdoLg0KDQoN
Cg0KQnV0IHRoaXMgd2lsbCBjb21wbGV0ZWx5IG51a2UgeW91ciBkZXNrdG9wLCBldmVuIHdoZW4g
YW1kZ3B1IGlzIG9ubHkgYSBzZWNvbmRhcnkgZGV2aWNlIGxpa2UgaW4gdGhlIHF4bCBjYXNlLg0K
DQoNCg0KSmFjayBpcyB1c2luZyB0aGUgY29ycmVjdCB3YXkgb2YgZG9pbmcgaXQsIGUuZy4gdXNp
bmcgIm1vZHByb2JlIC1yIiBvciBybW1vZC4gQm90aCBjb21tYW5kcyBjaGVjayB0aGUgdXNlIGNv
dW50IGJlZm9yZSB1bmxvYWRpbmcgdGhlIGRyaXZlciBpbnN0YW5jZXMuDQoNCg0KDQpJIGRvbid0
IHNlZSBhIHdheSB0byBkaXN0aW5ndCB0aGUgdHdvIGNhc2VzIGFuZCB3aGF0IEphY2sgaXMgZG9p
bmcgaXMgdW5mb3J0dW5hdGUgbm90IHRoZSBjb21tb24gb25lLg0KDQoNCg0KUmVnYXJkcywNCg0K
Q2hyaXN0aWFuLg0KDQoNCg0KDQoNCkFtIDE4LjA5LjIwMTkgMTA6MDggc2NocmllYiAiRGVuZywg
RW1pbHkiIDxFbWlseS5EZW5nQGFtZC5jb208bWFpbHRvOkVtaWx5LkRlbmdAYW1kLmNvbT4+Og0K
DQpIaSBDaHJpc3RpYW4sDQoNCiAgICAgQmVmb3JlIHVubG9hZGluZyBkcml2ZXIsIHVzZXIgbXVz
dCBzdXJlIHRoZXJlIGlzIG5vdCBhbnkgdXNlcnNwYWNlIHRvIHVzZSBvZiBhbWRncHUsIGlmIG5v
dCwgaXQgd2lsbCByZXBvcnQgZHJpdmVyIGlzIGluIHVzZS4gQW5kIHRoZSB1bmxvYWRpbmcgZHJp
dmVyIGlzIGEgZmVhdHVyZSBhYm91dCBhbWRncHUgZHJpdmVyIHdoaWNoIHdpbGwgYmUgZWFzaWVy
IHRvIHJlcGxhY2UgZHJpdmVyIHdpdGhvdXQgcmVib290aW5nIFZNLiBEbyB5b3UgdGhpbmsgaXQg
aGFzIGFueSBpc3N1ZSBhYm91dCBkcml2ZXIgdW5sb2FkaW5nIHBhdGg/DQoNCg0KDQpCZXN0IHdp
c2hlcw0KDQpFbWlseSBEZW5nDQoNCkZyb206IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4u
S29lbmlnQGFtZC5jb208bWFpbHRvOkNocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4+DQpTZW50OiBX
ZWRuZXNkYXksIFNlcHRlbWJlciAxOCwgMjAxOSAzOjU0IFBNDQpUbzogWmhhbmcsIEphY2sgKEpp
YW4pIDxKYWNrLlpoYW5nMUBhbWQuY29tPG1haWx0bzpKYWNrLlpoYW5nMUBhbWQuY29tPj4NCkNj
OiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzxtYWlsdG86YW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc+OyBUZW5nLCBSdWkgPFJ1aS5UZW5nQGFtZC5jb208bWFpbHRvOlJ1aS5UZW5n
QGFtZC5jb20+PjsgRGVuZywgRW1pbHkgPEVtaWx5LkRlbmdAYW1kLmNvbTxtYWlsdG86RW1pbHku
RGVuZ0BhbWQuY29tPj47IEN1aSwgRmxvcmEgPEZsb3JhLkN1aUBhbWQuY29tPG1haWx0bzpGbG9y
YS5DdWlAYW1kLmNvbT4+DQpTdWJqZWN0OiBSRTogW1BBVENIXSBkcm0vYW1kZ3B1L3NyaW92OiBv
bWl0IGZiY29uIGVycm9yIHVuZGVyIHNyaW92IG9yIHBhc3N0aHJvdWdoDQoNCg0KDQpIaSBKYWNr
LA0KDQoNCg0KV2VsbCB0aGF0IGJlbGlldmUgaXMgdW5mb3J0dW5hdGVseSBjb21wbGV0ZWx5IHdy
b25nLg0KDQoNCg0KVGhlIHBvaW50IGlzIHRoYXQgQU5ZIHVzZSBvZiBhbWRncHUgYnkgdXNlcnNw
YWNlIHdpbGwgcHJldmVudCBjb3JyZWN0IGRyaXZlciB1bmxvYWQsIHRoYXQgcXhsIGlzIHVzZWQg
Zm9yIHRoZSBmYmNvbiBkb2Vzbid0IGNoYW5nZSBhbnl0aGluZyBoZXJlLg0KDQoNCg0KU28gdGhl
IHBhdGNoIGlzIGEgY2xlYXIgTkFLLiBEcml2ZXIgdW5sb2FkIGlzIG5vdCBzdXBwb3NlZCB0byB3
b3JrIGV2ZW4gdW5kZXIgU1JJT1YuDQoNCg0KDQpSZWdhcmRzLA0KDQpDaHJpc3RpYW4uDQoNCg0K
DQoNCg0KDQoNCkFtIDE4LjA5LjIwMTkgMDk6MzIgc2NocmllYiAiWmhhbmcsIEphY2sgKEppYW4p
IiA8SmFjay5aaGFuZzFAYW1kLmNvbTxtYWlsdG86SmFjay5aaGFuZzFAYW1kLmNvbT4+Og0KDQpI
aSwgQ2hyaXN0aWFuIGFuZCBmb2xrcywNCg0KSW4gdmlydHVhbCBtYWNoaW5lcyhzdWNoIHZpcnQt
bWFuYWdlciksIHRoZXJlJ3MgYWx3YXlzIGEgdmlydHVhbCBncmFwaGljcyBkZXZpY2UgZXhpc3Rl
ZCBsaWtlICJxeGwiIGFzIHRoZSBkZWZhdWx0IGdmeCBkZXZpY2UuDQpTbyB1bmRlciBzdWNoIGNv
bmRpdGlvbiwgd2UgYmVsaWV2ZSBpdCdzIHJlYXNvbmFibGUgdG8gdW5sb2FkIGFtZGdwdSBkcml2
ZXIgYXMgaXQgaXMgbm90IHRyZWF0ZWQgYXMgdGhlIGRlZmF1bHQgZmJjb24gZGV2aWNlLg0KDQpX
b3VsZCB5b3UgcGxlYXNlIGhlbHAgdG8gcmV2aWV3IHRoaXMgcGF0Y2g/DQoNCkJlc3Qgd2lzaGVz
LA0KSmFjaw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSmFjayBaaGFuZyA8
SmFjay5aaGFuZzFAYW1kLmNvbTxtYWlsdG86SmFjay5aaGFuZzFAYW1kLmNvbT4+DQpTZW50OiBX
ZWRuZXNkYXksIFNlcHRlbWJlciAxOCwgMjAxOSAzOjI1IFBNDQpUbzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc8bWFpbHRvOmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPg0KQ2M6
IFpoYW5nLCBKYWNrIChKaWFuKSA8SmFjay5aaGFuZzFAYW1kLmNvbTxtYWlsdG86SmFjay5aaGFu
ZzFAYW1kLmNvbT4+DQpTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHUvc3Jpb3Y6IG9taXQgZmJj
b24gZXJyb3IgdW5kZXIgc3Jpb3Ygb3IgcGFzc3Rocm91Z2gNCg0KSW4gdmlydHVhbCBtYWNoaW5l
LCB0aGVyZSB3b3VsZCBiZSBhIHF4bCBvciBjaXJydXMgZ3JhcGhpY3MgZGV2aWNlIGFzIHRoZSBk
ZWZhdWx0IG1hc3RlciBmYmNvbiBkZXZpY2UuDQoNClNvIGZvciBQRihwYXNzdGhyb3VnaCBtb2Rl
KSBvciBTUklPViBWRiwgaXQgaXMgcmVhc29uYWJsZSB0byB1bmxvYWQgYW1kZ3B1IGRyaXZlci4g
QW1kZ3B1IGRvZXNuJ3QgaGF2ZSB0byBiZSB0aGUgb25seSBmYmNvbiBkZXZpY2UgdW5kZXIgdGhp
cyBjb25kaXRpb24uDQoNClNpZ25lZC1vZmYtYnk6IEphY2sgWmhhbmcgPEphY2suWmhhbmcxQGFt
ZC5jb208bWFpbHRvOkphY2suWmhhbmcxQGFtZC5jb20+Pg0KLS0tDQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgNSArKystLQ0KIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZHJ2LmMNCmluZGV4IDQyMDg4OGUuLmFkYTJiMjUgMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KQEAgLTExMDMsOCArMTEwMyw5IEBAIHN0YXRpYyB2b2lk
DQogYW1kZ3B1X3BjaV9yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpICB7DQogICAgICAgICBz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOw0KLQ0KLSAgICAg
ICBEUk1fRVJST1IoIkRldmljZSByZW1vdmFsIGlzIGN1cnJlbnRseSBub3Qgc3VwcG9ydGVkIG91
dHNpZGUgb2YgZmJjb25cbiIpOw0KKyAgICAgICBzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9
IGRldi0+ZGV2X3ByaXZhdGU7DQorICAgICAgIGlmICghYW1kZ3B1X3NyaW92X3ZmKGFkZXYpICYm
ICFhbWRncHVfcGFzc3Rocm91Z2goYWRldikpDQorICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJE
ZXZpY2UgcmVtb3ZhbCBpcyBjdXJyZW50bHkgbm90IHN1cHBvcnRlZCBvdXRzaWRlIG9mDQorZmJj
b25cbiIpOw0KICAgICAgICAgZHJtX2Rldl91bnBsdWcoZGV2KTsNCiAgICAgICAgIGRybV9kZXZf
cHV0KGRldik7DQogICAgICAgICBwY2lfZGlzYWJsZV9kZXZpY2UocGRldik7DQotLQ0KMi43LjQN
Cg0KDQoNCg==

--_000_MN2PR12MB2975280FA830F69A96966A3E8F8E0MN2PR12MB2975namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkRlbmdYaWFuOw0KCXBhbm9zZS0xOjIgMSA2IDAgMyAxIDEgMSAx
IDE7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpDYWxpYnJpOw0KCXBhbm9zZS0xOjIgMTUg
NSAyIDIgMiA0IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6IlxARGVuZ1hpYW4i
Ow0KCXBhbm9zZS0xOjIgMSA2IDAgMyAxIDEgMSAxIDE7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMg
Ki8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWwsIGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBp
bjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJZm9udC1zaXplOjExLjBwdDsNCglmb250LWZh
bWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQphOmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJ
e21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjpibHVlOw0KCXRleHQtZGVjb3JhdGlvbjp1
bmRlcmxpbmU7fQ0KYTp2aXNpdGVkLCBzcGFuLk1zb0h5cGVybGlua0ZvbGxvd2VkDQoJe21zby1z
dHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjpwdXJwbGU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVy
bGluZTt9DQpwLm1zb25vcm1hbDAsIGxpLm1zb25vcm1hbDAsIGRpdi5tc29ub3JtYWwwDQoJe21z
by1zdHlsZS1uYW1lOm1zb25vcm1hbDsNCgltc28tbWFyZ2luLXRvcC1hbHQ6YXV0bzsNCgltYXJn
aW4tcmlnaHQ6MGluOw0KCW1zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvOw0KCW1hcmdpbi1sZWZ0
OjBpbjsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNl
cmlmO30NCnNwYW4uRW1haWxTdHlsZTIwDQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsLXJlcGx5
Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7
fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1m
YW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6
OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29y
ZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+PCEtLVtpZiBndGUg
bXNvIDldPjx4bWw+DQo8bzpzaGFwZWRlZmF1bHRzIHY6ZXh0PSJlZGl0IiBzcGlkbWF4PSIxMDI2
IiAvPg0KPC94bWw+PCFbZW5kaWZdLS0+PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+DQo8bzpzaGFw
ZWxheW91dCB2OmV4dD0iZWRpdCI+DQo8bzppZG1hcCB2OmV4dD0iZWRpdCIgZGF0YT0iMSIgLz4N
CjwvbzpzaGFwZWxheW91dD48L3htbD48IVtlbmRpZl0tLT4NCjwvaGVhZD4NCjxib2R5IGxhbmc9
IkVOLVVTIiBsaW5rPSJibHVlIiB2bGluaz0icHVycGxlIj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0
aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5IaSBDaHJpc3RpYW4sPG86cD48L286cD48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0idGV4dC1pbmRlbnQ6MTAuMHB0Ij5EbyB5b3Ug
dGhpbmsgdGhpcyBpcyBiZWNhdXNlIHRoZSB3cm9uZyB1c2UgY2FzZT8gRXZlbiB3ZSBhZGQgdGhl
IGVycm9yIGxvZywgdGhlIGlzc3VlIHN0aWxsIGhhcHBlbnMuIENvdWxkIHdlIGNoYW5nZSB0aGlz
IGVycm9yIHRvIHdhcm5pbmc/IEFzIGZvciB0aGUgcmlnaHQgbWV0aG9kIHRvIHJlbW92ZSB0aGUg
ZHJpdmVyLCBpdCBzaG91bGRu4oCZdCBvY2N1ciBpc3N1ZXMuPG86cD48L286cD48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPkJlc3Qgd2lzaGVzPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5FbWls
eSBEZW5nPG86cD48L286cD48L3A+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItbGVm
dDpzb2xpZCBibHVlIDEuNXB0O3BhZGRpbmc6MGluIDBpbiAwaW4gNC4wcHQiPg0KPGRpdj4NCjxk
aXYgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci10b3A6c29saWQgI0UxRTFFMSAxLjBwdDtwYWRk
aW5nOjMuMHB0IDBpbiAwaW4gMGluIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxiPkZyb206PC9i
PiBLb2VuaWcsIENocmlzdGlhbiAmbHQ7Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tJmd0OyA8YnI+
DQo8Yj5TZW50OjwvYj4gV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMTgsIDIwMTkgNTo0NSBQTTxicj4N
CjxiPlRvOjwvYj4gRGVuZywgRW1pbHkgJmx0O0VtaWx5LkRlbmdAYW1kLmNvbSZndDs8YnI+DQo8
Yj5DYzo8L2I+IFpoYW5nLCBKYWNrIChKaWFuKSAmbHQ7SmFjay5aaGFuZzFAYW1kLmNvbSZndDs7
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBUZW5nLCBSdWkgJmx0O1J1aS5UZW5nQGFt
ZC5jb20mZ3Q7OyBDdWksIEZsb3JhICZsdDtGbG9yYS5DdWlAYW1kLmNvbSZndDs8YnI+DQo8Yj5T
dWJqZWN0OjwvYj4gUkU6IFtQQVRDSF0gZHJtL2FtZGdwdS9zcmlvdjogb21pdCBmYmNvbiBlcnJv
ciB1bmRlciBzcmlvdiBvciBwYXNzdGhyb3VnaDxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2Rp
dj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPGRpdj4NCjxk
aXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5ZZXMsIGV4YWN0bHkuPG86cD48L286cD48L3A+DQo8
ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4N
CjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5UaGUgcHJvYmxlbSBpcyB0aGF0IGV2ZW4gd2hl
biBvdXRwdXQgaXMgcXhsIG9yIHRoZSBJbnRlbCBkcml2ZXIgb3VyIGRyaXZlciBpcyBzdGlsbCBs
b2FkZWQgYW5kIGZvcmNlZnVsbHkgcmVtb3ZpbmcgaXQgcmVuZGVycyB0aGUgZGVza3RvcCB1bnVz
YWJsZS48bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+Q2hyaXN0aWFuLjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpw
PiZuYnNwOzwvbzpwPjwvcD4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5BbSAxOC4wOS4y
MDE5IDExOjI0IHNjaHJpZWIgJnF1b3Q7RGVuZywgRW1pbHkmcXVvdDsgJmx0OzxhIGhyZWY9Im1h
aWx0bzpFbWlseS5EZW5nQGFtZC5jb20iPkVtaWx5LkRlbmdAYW1kLmNvbTwvYT4mZ3Q7OjxvOnA+
PC9vOnA+PC9wPg0KPGJsb2NrcXVvdGUgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci1sZWZ0OnNv
bGlkICNDQ0NDQ0MgMS4wcHQ7cGFkZGluZzowaW4gMGluIDBpbiA2LjBwdDttYXJnaW4tbGVmdDo0
LjhwdDttYXJnaW4tcmlnaHQ6MGluIj4NCjxkaXY+DQo8ZGl2Pg0KPHA+SGkgQ2hyaXN0aWFuLDxv
OnA+PC9vOnA+PC9wPg0KPHAgc3R5bGU9InRleHQtaW5kZW50OjEwLjBwdCI+RG8geW91IG1lYW4s
IGZvciBwYXNzdGhyb3VnaCBtb2RlLCB0aGUgZGVza3RvcCBpcyByZW5kZXJlZCBieSBvdXIgYXNp
YywgYnV0IGVuZHVzZXIgaXMgdHJ5aW5nIHRvIHJlbW92ZSB0aGUgZHJpdmVyIGJ5IGhvdCBwbHVn
PzxvOnA+PC9vOnA+PC9wPg0KPHA+Jm5ic3A7PG86cD48L286cD48L3A+DQo8cD5CZXN0IHdpc2hl
czxvOnA+PC9vOnA+PC9wPg0KPHA+RW1pbHkgRGVuZzxvOnA+PC9vOnA+PC9wPg0KPGRpdiBzdHls
ZT0iYm9yZGVyOm5vbmU7Ym9yZGVyLWxlZnQ6c29saWQgYmx1ZSAxLjVwdDtwYWRkaW5nOjBpbiAw
aW4gMGluIDQuMHB0Ij4NCjxkaXY+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItdG9w
OnNvbGlkICNFMUUxRTEgMS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGluIDBpbiI+DQo8cD48Yj5G
cm9tOjwvYj4gS29lbmlnLCBDaHJpc3RpYW4gJmx0OzxhIGhyZWY9Im1haWx0bzpDaHJpc3RpYW4u
S29lbmlnQGFtZC5jb20iPkNocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbTwvYT4mZ3Q7DQo8YnI+DQo8
Yj5TZW50OjwvYj4gV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMTgsIDIwMTkgNDo0NCBQTTxicj4NCjxi
PlRvOjwvYj4gRGVuZywgRW1pbHkgJmx0OzxhIGhyZWY9Im1haWx0bzpFbWlseS5EZW5nQGFtZC5j
b20iPkVtaWx5LkRlbmdAYW1kLmNvbTwvYT4mZ3Q7PGJyPg0KPGI+Q2M6PC9iPiBaaGFuZywgSmFj
ayAoSmlhbikgJmx0OzxhIGhyZWY9Im1haWx0bzpKYWNrLlpoYW5nMUBhbWQuY29tIj5KYWNrLlpo
YW5nMUBhbWQuY29tPC9hPiZndDs7DQo8YSBocmVmPSJtYWlsdG86YW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmciPmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPC9hPjsgVGVuZywgUnVp
ICZsdDs8YSBocmVmPSJtYWlsdG86UnVpLlRlbmdAYW1kLmNvbSI+UnVpLlRlbmdAYW1kLmNvbTwv
YT4mZ3Q7OyBDdWksIEZsb3JhICZsdDs8YSBocmVmPSJtYWlsdG86RmxvcmEuQ3VpQGFtZC5jb20i
PkZsb3JhLkN1aUBhbWQuY29tPC9hPiZndDs8YnI+DQo8Yj5TdWJqZWN0OjwvYj4gUkU6IFtQQVRD
SF0gZHJtL2FtZGdwdS9zcmlvdjogb21pdCBmYmNvbiBlcnJvciB1bmRlciBzcmlvdiBvciBwYXNz
dGhyb3VnaDxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjxwPiZuYnNwOzxvOnA+PC9v
OnA+PC9wPg0KPGRpdj4NCjxkaXY+DQo8cD5IaSBFbWlseSw8bzpwPjwvbzpwPjwvcD4NCjxkaXY+
DQo8cD4mbmJzcDs8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwPlllYWgsIGV4YWN0
bHkgdGhhdCdzIHRoZSBwcm9ibGVtOiBJbiBzb21lIGNhc2VzIHRoZSBkcml2ZXIgY2FuIGJlIHVu
bG9hZGVkIHdoaWxlIGl0IGlzIHN0aWxsIGluIHVzZSE8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0K
PGRpdj4NCjxwPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHA+U2VlIHdl
IGFkZGVkIHRoaXMgZXJyb3IgbWVzc2FnZSBiZWNhdXNlIGVuZHVzZXJzIHRyaWVkIHRvIHVzZSBQ
Q0llIGhvdCBwbHVnIHRvIHVubG9hZCB0aGUgZHJpdmVyIHRvIHVzZSB0aGUgaGFyZHdhcmUgZm9y
IHBhdGh0aHJvdWdoLjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHA+Jm5ic3A7PG86
cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cD5CdXQgdGhpcyB3aWxsIGNvbXBsZXRlbHkg
bnVrZSB5b3VyIGRlc2t0b3AsIGV2ZW4gd2hlbiBhbWRncHUgaXMgb25seSBhIHNlY29uZGFyeSBk
ZXZpY2UgbGlrZSBpbiB0aGUgcXhsIGNhc2UuPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+
DQo8cD4mbmJzcDs8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwPkphY2sgaXMgdXNp
bmcgdGhlIGNvcnJlY3Qgd2F5IG9mIGRvaW5nIGl0LCBlLmcuIHVzaW5nICZxdW90O21vZHByb2Jl
IC1yJnF1b3Q7IG9yIHJtbW9kLiBCb3RoIGNvbW1hbmRzIGNoZWNrIHRoZSB1c2UgY291bnQgYmVm
b3JlIHVubG9hZGluZyB0aGUgZHJpdmVyIGluc3RhbmNlcy48bzpwPjwvbzpwPjwvcD4NCjwvZGl2
Pg0KPGRpdj4NCjxwPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHA+SSBk
b24ndCBzZWUgYSB3YXkgdG8gZGlzdGluZ3QgdGhlIHR3byBjYXNlcyBhbmQgd2hhdCBKYWNrIGlz
IGRvaW5nIGlzIHVuZm9ydHVuYXRlIG5vdCB0aGUgY29tbW9uIG9uZS48bzpwPjwvbzpwPjwvcD4N
CjwvZGl2Pg0KPGRpdj4NCjxwPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0K
PHA+UmVnYXJkcyw8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwPkNocmlzdGlhbi48
bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0K
PC9kaXY+DQo8L2Rpdj4NCjxkaXY+DQo8cD4mbmJzcDs8bzpwPjwvbzpwPjwvcD4NCjxkaXY+DQo8
cD5BbSAxOC4wOS4yMDE5IDEwOjA4IHNjaHJpZWIgJnF1b3Q7RGVuZywgRW1pbHkmcXVvdDsgJmx0
OzxhIGhyZWY9Im1haWx0bzpFbWlseS5EZW5nQGFtZC5jb20iPkVtaWx5LkRlbmdAYW1kLmNvbTwv
YT4mZ3Q7OjxvOnA+PC9vOnA+PC9wPg0KPGJsb2NrcXVvdGUgc3R5bGU9ImJvcmRlcjpub25lO2Jv
cmRlci1sZWZ0OnNvbGlkICNDQ0NDQ0MgMS4wcHQ7cGFkZGluZzowaW4gMGluIDBpbiA2LjBwdDtt
YXJnaW4tbGVmdDo0LjhwdDttYXJnaW4tdG9wOjUuMHB0O21hcmdpbi1yaWdodDowaW47bWFyZ2lu
LWJvdHRvbTo1LjBwdCI+DQo8ZGl2Pg0KPGRpdj4NCjxwPkhpIENocmlzdGlhbiw8bzpwPjwvbzpw
PjwvcD4NCjxwPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBCZWZvcmUgdW5sb2FkaW5nIGRyaXZl
ciwgdXNlciBtdXN0IHN1cmUgdGhlcmUgaXMgbm90IGFueSB1c2Vyc3BhY2UgdG8gdXNlIG9mIGFt
ZGdwdSwgaWYgbm90LCBpdCB3aWxsIHJlcG9ydCBkcml2ZXIgaXMgaW4gdXNlLiBBbmQgdGhlIHVu
bG9hZGluZyBkcml2ZXIgaXMgYSBmZWF0dXJlIGFib3V0IGFtZGdwdSBkcml2ZXIgd2hpY2ggd2ls
bCBiZSBlYXNpZXIgdG8gcmVwbGFjZSBkcml2ZXIgd2l0aG91dCByZWJvb3RpbmcgVk0uIERvIHlv
dQ0KIHRoaW5rIGl0IGhhcyBhbnkgaXNzdWUgYWJvdXQgZHJpdmVyIHVubG9hZGluZyBwYXRoPzxv
OnA+PC9vOnA+PC9wPg0KPHA+Jm5ic3A7PG86cD48L286cD48L3A+DQo8cD5CZXN0IHdpc2hlczxv
OnA+PC9vOnA+PC9wPg0KPHA+RW1pbHkgRGVuZzxvOnA+PC9vOnA+PC9wPg0KPGRpdiBzdHlsZT0i
Ym9yZGVyOm5vbmU7Ym9yZGVyLWxlZnQ6c29saWQgYmx1ZSAxLjVwdDtwYWRkaW5nOjBpbiAwaW4g
MGluIDQuMHB0Ij4NCjxkaXY+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItdG9wOnNv
bGlkICNFMUUxRTEgMS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGluIDBpbiI+DQo8cD48Yj5Gcm9t
OjwvYj4gS29lbmlnLCBDaHJpc3RpYW4gJmx0OzxhIGhyZWY9Im1haWx0bzpDaHJpc3RpYW4uS29l
bmlnQGFtZC5jb20iPkNocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbTwvYT4mZ3Q7DQo8YnI+DQo8Yj5T
ZW50OjwvYj4gV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMTgsIDIwMTkgMzo1NCBQTTxicj4NCjxiPlRv
OjwvYj4gWmhhbmcsIEphY2sgKEppYW4pICZsdDs8YSBocmVmPSJtYWlsdG86SmFjay5aaGFuZzFA
YW1kLmNvbSI+SmFjay5aaGFuZzFAYW1kLmNvbTwvYT4mZ3Q7PGJyPg0KPGI+Q2M6PC9iPiA8YSBo
cmVmPSJtYWlsdG86YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmciPmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnPC9hPjsgVGVuZywgUnVpICZsdDs8YSBocmVmPSJtYWlsdG86UnVpLlRl
bmdAYW1kLmNvbSI+UnVpLlRlbmdAYW1kLmNvbTwvYT4mZ3Q7OyBEZW5nLCBFbWlseSAmbHQ7PGEg
aHJlZj0ibWFpbHRvOkVtaWx5LkRlbmdAYW1kLmNvbSI+RW1pbHkuRGVuZ0BhbWQuY29tPC9hPiZn
dDs7IEN1aSwgRmxvcmEgJmx0OzxhIGhyZWY9Im1haWx0bzpGbG9yYS5DdWlAYW1kLmNvbSI+Rmxv
cmEuQ3VpQGFtZC5jb208L2E+Jmd0Ozxicj4NCjxiPlN1YmplY3Q6PC9iPiBSRTogW1BBVENIXSBk
cm0vYW1kZ3B1L3NyaW92OiBvbWl0IGZiY29uIGVycm9yIHVuZGVyIHNyaW92IG9yIHBhc3N0aHJv
dWdoPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwvZGl2Pg0KPHA+Jm5ic3A7PG86cD48L286cD48
L3A+DQo8ZGl2Pg0KPGRpdj4NCjxwPkhpIEphY2ssPG86cD48L286cD48L3A+DQo8ZGl2Pg0KPHA+
Jm5ic3A7PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cD5XZWxsIHRoYXQgYmVsaWV2
ZSBpcyB1bmZvcnR1bmF0ZWx5IGNvbXBsZXRlbHkgd3JvbmcuPG86cD48L286cD48L3A+DQo8L2Rp
dj4NCjxkaXY+DQo8cD4mbmJzcDs8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwPlRo
ZSBwb2ludCBpcyB0aGF0IEFOWSB1c2Ugb2YgYW1kZ3B1IGJ5IHVzZXJzcGFjZSB3aWxsIHByZXZl
bnQgY29ycmVjdCBkcml2ZXIgdW5sb2FkLCB0aGF0IHF4bCBpcyB1c2VkIGZvciB0aGUgZmJjb24g
ZG9lc24ndCBjaGFuZ2UgYW55dGhpbmcgaGVyZS48bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRp
dj4NCjxwPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHA+U28gdGhlIHBh
dGNoIGlzIGEgY2xlYXIgTkFLLiBEcml2ZXIgdW5sb2FkIGlzIG5vdCBzdXBwb3NlZCB0byB3b3Jr
IGV2ZW4gdW5kZXIgU1JJT1YuPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cD4mbmJz
cDs8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwPlJlZ2FyZHMsPG86cD48L286cD48
L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cD5DaHJpc3RpYW4uPG86cD48L286cD48L3A+DQo8L2Rpdj4N
CjxkaXY+DQo8cD4mbmJzcDs8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwPiZuYnNw
OzxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjxkaXY+DQo8cD4mbmJzcDs8bzpwPjwv
bzpwPjwvcD4NCjxkaXY+DQo8cD5BbSAxOC4wOS4yMDE5IDA5OjMyIHNjaHJpZWIgJnF1b3Q7Wmhh
bmcsIEphY2sgKEppYW4pJnF1b3Q7ICZsdDs8YSBocmVmPSJtYWlsdG86SmFjay5aaGFuZzFAYW1k
LmNvbSI+SmFjay5aaGFuZzFAYW1kLmNvbTwvYT4mZ3Q7OjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+
DQo8L2Rpdj4NCjwvZGl2Pg0KPGRpdj4NCjxwIHN0eWxlPSJtYXJnaW4tYm90dG9tOjEyLjBwdCI+
SGksIENocmlzdGlhbiBhbmQgZm9sa3MsPGJyPg0KPGJyPg0KSW4gdmlydHVhbCBtYWNoaW5lcyhz
dWNoIHZpcnQtbWFuYWdlciksIHRoZXJlJ3MgYWx3YXlzIGEgdmlydHVhbCBncmFwaGljcyBkZXZp
Y2UgZXhpc3RlZCBsaWtlICZxdW90O3F4bCZxdW90OyBhcyB0aGUgZGVmYXVsdCBnZnggZGV2aWNl
Ljxicj4NClNvIHVuZGVyIHN1Y2ggY29uZGl0aW9uLCB3ZSBiZWxpZXZlIGl0J3MgcmVhc29uYWJs
ZSB0byB1bmxvYWQgYW1kZ3B1IGRyaXZlciBhcyBpdCBpcyBub3QgdHJlYXRlZCBhcyB0aGUgZGVm
YXVsdCBmYmNvbiBkZXZpY2UuPGJyPg0KPGJyPg0KV291bGQgeW91IHBsZWFzZSBoZWxwIHRvIHJl
dmlldyB0aGlzIHBhdGNoPzxicj4NCjxicj4NCkJlc3Qgd2lzaGVzLDxicj4NCkphY2s8YnI+DQo8
YnI+DQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLTxicj4NCkZyb206IEphY2sgWmhhbmcgJmx0
OzxhIGhyZWY9Im1haWx0bzpKYWNrLlpoYW5nMUBhbWQuY29tIj5KYWNrLlpoYW5nMUBhbWQuY29t
PC9hPiZndDsgPGJyPg0KU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMTgsIDIwMTkgMzoyNSBQ
TTxicj4NClRvOiA8YSBocmVmPSJtYWlsdG86YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmci
PmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPC9hPjxicj4NCkNjOiBaaGFuZywgSmFjayAo
SmlhbikgJmx0OzxhIGhyZWY9Im1haWx0bzpKYWNrLlpoYW5nMUBhbWQuY29tIj5KYWNrLlpoYW5n
MUBhbWQuY29tPC9hPiZndDs8YnI+DQpTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHUvc3Jpb3Y6
IG9taXQgZmJjb24gZXJyb3IgdW5kZXIgc3Jpb3Ygb3IgcGFzc3Rocm91Z2g8YnI+DQo8YnI+DQpJ
biB2aXJ0dWFsIG1hY2hpbmUsIHRoZXJlIHdvdWxkIGJlIGEgcXhsIG9yIGNpcnJ1cyBncmFwaGlj
cyBkZXZpY2UgYXMgdGhlIGRlZmF1bHQgbWFzdGVyIGZiY29uIGRldmljZS48YnI+DQo8YnI+DQpT
byBmb3IgUEYocGFzc3Rocm91Z2ggbW9kZSkgb3IgU1JJT1YgVkYsIGl0IGlzIHJlYXNvbmFibGUg
dG8gdW5sb2FkIGFtZGdwdSBkcml2ZXIuIEFtZGdwdSBkb2Vzbid0IGhhdmUgdG8gYmUgdGhlIG9u
bHkgZmJjb24gZGV2aWNlIHVuZGVyIHRoaXMgY29uZGl0aW9uLjxicj4NCjxicj4NClNpZ25lZC1v
ZmYtYnk6IEphY2sgWmhhbmcgJmx0OzxhIGhyZWY9Im1haWx0bzpKYWNrLlpoYW5nMUBhbWQuY29t
Ij5KYWNrLlpoYW5nMUBhbWQuY29tPC9hPiZndDs8YnI+DQotLS08YnI+DQombmJzcDtkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCA1ICYjNDM7JiM0MzsmIzQzOy0tPGJy
Pg0KJm5ic3A7MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygmIzQzOyksIDIgZGVsZXRpb25z
KC0pPGJyPg0KPGJyPg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYzxicj4N
CmluZGV4IDQyMDg4OGUuLmFkYTJiMjUgMTAwNjQ0PGJyPg0KLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jPGJyPg0KJiM0MzsmIzQzOyYjNDM7IGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jPGJyPg0KQEAgLTExMDMsOCAmIzQzOzExMDMs
OSBAQCBzdGF0aWMgdm9pZDxicj4NCiZuYnNwO2FtZGdwdV9wY2lfcmVtb3ZlKHN0cnVjdCBwY2lf
ZGV2ICpwZGV2KSZuYnNwOyB7PGJyPg0KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7IHN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBwY2lfZ2V0X2RydmRhdGEo
cGRldik7PGJyPg0KLTxicj4NCi0mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsg
RFJNX0VSUk9SKCZxdW90O0RldmljZSByZW1vdmFsIGlzIGN1cnJlbnRseSBub3Qgc3VwcG9ydGVk
IG91dHNpZGUgb2YgZmJjb25cbiZxdW90Oyk7PGJyPg0KJiM0MzsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBkZXYtJmd0O2Rl
dl9wcml2YXRlOzxicj4NCiYjNDM7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
IGlmICghYW1kZ3B1X3NyaW92X3ZmKGFkZXYpICZhbXA7JmFtcDsgIWFtZGdwdV9wYXNzdGhyb3Vn
aChhZGV2KSk8YnI+DQomIzQzOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBEUk1fRVJST1Io
JnF1b3Q7RGV2aWNlIHJlbW92YWwgaXMgY3VycmVudGx5IG5vdCBzdXBwb3J0ZWQgb3V0c2lkZSBv
ZiA8YnI+DQomIzQzO2ZiY29uXG4mcXVvdDspOzxicj4NCiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBkcm1fZGV2X3VucGx1ZyhkZXYpOzxicj4NCiZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBkcm1fZGV2X3B1dChk
ZXYpOzxicj4NCiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyBwY2lfZGlzYWJsZV9kZXZpY2UocGRldik7PGJyPg0KLS08YnI+DQoyLjcuNDxvOnA+PC9vOnA+
PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Jsb2NrcXVvdGU+DQo8L2Rp
dj4NCjxwPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9k
aXY+DQo8L2Rpdj4NCjwvYmxvY2txdW90ZT4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjwv
ZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_MN2PR12MB2975280FA830F69A96966A3E8F8E0MN2PR12MB2975namp_--

--===============1674643731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1674643731==--
