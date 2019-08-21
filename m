Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 290DE97836
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 13:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED326E2DF;
	Wed, 21 Aug 2019 11:44:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720047.outbound.protection.outlook.com [40.107.72.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5F66E2DF
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 11:44:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INc3MWfNORA0fkdM4D1t4yycQpi1+skeUdt1GpK+W+fgx3EUk75z5GawNUFE2VntX4QPfjfxiGx4YGe98la/aFyc3LYfgXVUJ87WqwEyYTijfgOOWHjC0ZmOb+p1Z9Vk6ecLGiKKhYApQUA7laL2et4VYoOUpQ/24zPxqHf0tHokYbhYQrKtdbmMYXAf7JnsXxbhWYJwWGhelwiUBIv6tJsk3qVaHxWLalt6rHTAcdpkeFDZNLCq/ld43wsoYGTCXWwM6PhfukbAA9sdx2LQsQ+SObTbMmdFMEouoQnp7nj/cRSmlKXrlSJQwU9/4FM3NHgY8DKs2FPjQAE+rVplJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wb6VIpbn/teffXq8xZmadhMO+leYZmHQ0Lt50hA7bIM=;
 b=Z9bkpmveVNiwHY55HhZVb0BEItfGudvWz8zrPNlybjoXIqjsgXa16cK6Y1h74Ozu+nEovV2lT65HVj7jYV8Mw+I0Cy2/XRiSLt+alzeRt2gxdRnSGXLKWtSV5JC3j/tZEezm6PqWqwls0hdUR+h/9WKBrxsw+FpRImCrvwcmez7QXq1NWKwlQkfEzHL+DBVwZaxf0dicUUK6c8ZXL1zbe8xrR/zw7KlLeeSvEJLfq6qXsaL67ERNG/J1deeEogSGRC2mYPuIzji7at+ZoolND0132HBzKCNK8URARDdJQoK5YtSdDLDsO+3ey9g11KFuA7nkjn0nGnnZci9GvvXf9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3503.namprd12.prod.outlook.com (20.178.243.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Wed, 21 Aug 2019 11:44:34 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2178.018; Wed, 21 Aug 2019
 11:44:34 +0000
From: Kevin Wang <kevwa@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: update cached feature enablement status
Thread-Topic: [PATCH] drm/amd/powerplay: update cached feature enablement
 status
Thread-Index: AQHVWAI7yTpfvZ3yD0SbniKMht3J6KcFe42A
Date: Wed, 21 Aug 2019 11:44:34 +0000
Message-ID: <861ead73-5ce2-ea37-746d-bc82b79d9b88@amd.com>
References: <20190821092413.27155-1-evan.quan@amd.com>
In-Reply-To: <20190821092413.27155-1-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32a05eb6-3cc2-4dda-c48a-08d7262cefed
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3503; 
x-ms-traffictypediagnostic: MN2PR12MB3503:
x-microsoft-antispam-prvs: <MN2PR12MB35039686D10A7847D83B54E0A2AA0@MN2PR12MB3503.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(39860400002)(346002)(136003)(396003)(189003)(199004)(2906002)(6116002)(53546011)(102836004)(81156014)(11346002)(305945005)(486006)(186003)(2616005)(386003)(26005)(31696002)(66066001)(8936002)(5660300002)(6512007)(99286004)(2501003)(6506007)(476003)(31686004)(3846002)(2351001)(5640700003)(6436002)(6246003)(53936002)(15650500001)(14454004)(446003)(6916009)(52116002)(478600001)(8676002)(25786009)(66946007)(316002)(36756003)(76176011)(14444005)(256004)(71190400001)(71200400001)(229853002)(66476007)(66446008)(81166006)(7736002)(6486002)(66556008)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3503;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cPi6t+BNA+JvaStlln5iI/tZdGx2PamCwdZHVDgN2UaH3hRMd7WFiEciHbyhoc9comXHShz2v6x5dionbz8DY/OZNByZp0kMLncAVvVcgMlUVK1EUlR5xxZ6Z8c8Ds0M7EYVBNSsWWP2KF+JX8Mph9cAbBje8rlkRy6Jg3pB/MnZOXI8TU/Sz6aVnJ/28zWYpzzAjDdLHHDc4c5xx/8jPXTan8rdFIrhvvjYOrJuLmA79GcFy3e3NxhrBPy41rvyV30RHiJVP0e52kLbHYvO5yJU1ATJWuymOL4Tlyrj0NejH/viD90airLc0JtW2rPJG7FaZ0PmENFvw6NBsoZkCDrvTVl7X/gVkCqMjHfvqknSTZm1uaX6xsf7a1ASTnnK6lhIGyuMDJfXjB8ptnkZ/tx4TMovZnZCMk5w2Berk7Q=
x-ms-exchange-transport-forked: True
Content-ID: <734B7E329C868E468C3A69A8CB7E96C6@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a05eb6-3cc2-4dda-c48a-08d7262cefed
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 11:44:34.4016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hh1ja1vUemdPM6uiXVA6zgX0zYtC5J/2uIxZFJP2j5dfChpdedjfTYKcdYhffCnk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3503
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wb6VIpbn/teffXq8xZmadhMO+leYZmHQ0Lt50hA7bIM=;
 b=30VPdJpuYvTs/zNJoOdvhdm6zOQ+kKDAYWq3G7PCaDlGbMsKhggHU3yr028XJH/Is3BgT6sU2RfWICWvHkmYXhq4n2ox3ixhXji0ZEgWmbS7c9EZhdim/WQAOknUIJnezOl4zlEgDh6gUkrGvuThMxDMbFbTlAtxaA7Um+xLQsA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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

SGkgRXZhbiwNCg0KdGhpcyBpcyBrbm93IGlzc3VlIGZvciBtZS4NCmkgdGhpbmsgd2Ugc2hvdWxk
IGFkZCB1cGRhdGUgZmVhdHVyZSBtYXNrIGNhY2hlZCBvcGVyYXRpb24gaW50byANCnNtdV9mZWF0
dXJlX3VwZGF0ZV9lbmFibGVfc3RhdGUgZnVuY3Rpb24uDQoNCkJlc3QgUmVnYXJkcywNCktldmlu
DQoNCk9uIDgvMjEvMTkgNToyNCBQTSwgRXZhbiBRdWFuIHdyb3RlOg0KPiBOZWVkIHRvIHVwZGF0
ZSBpbiBjYWNoZSBmZWF0dXJlIGVuYWJsZW1lbnQgc3RhdHVzIGFmdGVyIHBwX2ZlYXR1cmUNCj4g
c2V0dGluZ3MuIEFub3RoZXIgZml4IGZvciB0aGUgY29tbWl0IGJlbG93Og0KPiBkcm0vYW1kL3Bv
d2VycGxheTogaW1wbG1lbnQgc3lzZnMgZmVhdHVyZSBzdGF0dXMgZnVuY3Rpb24gaW4gc211DQo+
DQo+IENoYW5nZS1JZDogSTkwZTI5YjBkODM5ZGYyNjgyNWQ1OTkzMjEyZjYwOTdjN2FkNGJlYmYN
Cj4gU2lnbmVkLW9mZi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4NCj4gLS0tDQo+
ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIHwgMTYgKysrKysr
KysrKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspDQo+DQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMNCj4gaW5kZXggYzY2M2Qy
NWRiNWFiLi4wNDg2N2NhZmIzMjIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2FtZGdwdV9zbXUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9hbWRncHVfc211LmMNCj4gQEAgLTk2LDExICs5NiwxMyBAQCBzaXplX3Qgc211X3N5c19n
ZXRfcHBfZmVhdHVyZV9tYXNrKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBjaGFyICpidWYpDQo+
ICAgDQo+ICAgaW50IHNtdV9zeXNfc2V0X3BwX2ZlYXR1cmVfbWFzayhzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwgdWludDY0X3QgbmV3X21hc2spDQo+ICAgew0KPiArCXN0cnVjdCBzbXVfZmVhdHVy
ZSAqZmVhdHVyZSA9ICZzbXUtPnNtdV9mZWF0dXJlOw0KPiAgIAlpbnQgcmV0ID0gMDsNCj4gICAJ
dWludDMyX3QgZmVhdHVyZV9tYXNrWzJdID0geyAwIH07DQo+ICAgCXVpbnQ2NF90IGZlYXR1cmVf
Ml9lbmFibGVkID0gMDsNCj4gICAJdWludDY0X3QgZmVhdHVyZV8yX2Rpc2FibGVkID0gMDsNCj4g
ICAJdWludDY0X3QgZmVhdHVyZV9lbmFibGVzID0gMDsNCj4gKwl1aW50NjRfdCBmZWF0dXJlX2lk
Ow0KPiAgIA0KPiAgIAlyZXQgPSBzbXVfZmVhdHVyZV9nZXRfZW5hYmxlZF9tYXNrKHNtdSwgZmVh
dHVyZV9tYXNrLCAyKTsNCj4gICAJaWYgKHJldCkNCj4gQEAgLTExNSwxMSArMTE3LDI1IEBAIGlu
dCBzbXVfc3lzX3NldF9wcF9mZWF0dXJlX21hc2soc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVp
bnQ2NF90IG5ld19tYXNrKQ0KPiAgIAkJcmV0ID0gc211X2ZlYXR1cmVfdXBkYXRlX2VuYWJsZV9z
dGF0ZShzbXUsIGZlYXR1cmVfMl9lbmFibGVkLCB0cnVlKTsNCj4gICAJCWlmIChyZXQpDQo+ICAg
CQkJcmV0dXJuIHJldDsNCj4gKw0KPiArCQltdXRleF9sb2NrKCZmZWF0dXJlLT5tdXRleCk7DQo+
ICsJCWZvciAoZmVhdHVyZV9pZCA9IDA7IGZlYXR1cmVfaWQgPCA2NDsgZmVhdHVyZV9pZCsrKSB7
DQo+ICsJCQlpZiAoZmVhdHVyZV8yX2VuYWJsZWQgJiAoMVVMTCA8PCBmZWF0dXJlX2lkKSkNCj4g
KwkJCQl0ZXN0X2FuZF9zZXRfYml0KGZlYXR1cmVfaWQsIGZlYXR1cmUtPmVuYWJsZWQpOw0KPiAr
CQl9DQo+ICsJCW11dGV4X3VubG9jaygmZmVhdHVyZS0+bXV0ZXgpOw0KPiAgIAl9DQo+ICAgCWlm
IChmZWF0dXJlXzJfZGlzYWJsZWQpIHsNCj4gICAJCXJldCA9IHNtdV9mZWF0dXJlX3VwZGF0ZV9l
bmFibGVfc3RhdGUoc211LCBmZWF0dXJlXzJfZGlzYWJsZWQsIGZhbHNlKTsNCj4gICAJCWlmIChy
ZXQpDQo+ICAgCQkJcmV0dXJuIHJldDsNCj4gKw0KPiArCQltdXRleF9sb2NrKCZmZWF0dXJlLT5t
dXRleCk7DQo+ICsJCWZvciAoZmVhdHVyZV9pZCA9IDA7IGZlYXR1cmVfaWQgPCA2NDsgZmVhdHVy
ZV9pZCsrKSB7DQo+ICsJCQlpZiAoZmVhdHVyZV8yX2Rpc2FibGVkICYgKDFVTEwgPDwgZmVhdHVy
ZV9pZCkpDQo+ICsJCQkJdGVzdF9hbmRfY2xlYXJfYml0KGZlYXR1cmVfaWQsIGZlYXR1cmUtPmVu
YWJsZWQpOw0KPiArCQl9DQo+ICsJCW11dGV4X3VubG9jaygmZmVhdHVyZS0+bXV0ZXgpOw0KPiAg
IAl9DQo+ICAgDQo+ICAgCXJldHVybiByZXQ7DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
