Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14653B40A8
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Sep 2019 20:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6997A6E97D;
	Mon, 16 Sep 2019 18:56:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800083.outbound.protection.outlook.com [40.107.80.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E256E97D
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 18:56:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFZkm6F0O/WuzPRL10N/lcXVDDnqH4LN8mpvfPkoJVVYZm7twZlJYJYBHp7u0ZfCdwvBG1seq3/xYZUteXTeWnb2ys4bO0vQ4hVwIxAxKylY9rjHe/jn49MSPgJ8lcvwVR3J5p7q9qRzA8GdvvHHtFsCBw82Z1m9MXUuP39S9tvX/du6joV05Wz7FCQYe8HYbCZ0itDw+lv1AIkfaO7nB3GD+JpxYX53pT9fGkNFF0LmTXqDlyfgT4/LlYr2w/ij/XdizpbhiD2840Bn3p/bVsFAGZpdBzbxs9rZBQQJ89q86SchKc3HDNDRP0x32STVkRSvgOXSp3t4ZfOmcSBUjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iL57ysPhrwppCZmYlfX3gjD4aWbymNXg48Owsab4oM=;
 b=ewiL6wr4ko0qkseKOxyUQhl10A+VsqgzHBXLow2ldf84BqcDX62wtM6Fka5ouZNC8c7x3dEWCjy2XYG6FcYnTG3eACZkPgsL24FRaNAN1MNFXNDeLpk9ra4H8vcXFM6z9qwzQUagFQMdNNDPOU9Mq1WnYQDNvJMJoQjFpopZG1ODI9GIq5ChTLqsDcRemXGclCrftIFTtObIrJevoRmASU8EkdzR24VYsmx1UTW0tn1TA2A1bPhzuW4Fz8UgE8cS8flhw1l68n95AzMkZLGF4/CzF5VvYEnqouUaId920QuTtasQDBw9gsCjpIwaB+YMQpS1OP9P0Ph+3Rmhnq7DvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1277.namprd12.prod.outlook.com (10.169.204.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.24; Mon, 16 Sep 2019 18:56:24 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::31f2:3115:6265:33a0]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::31f2:3115:6265:33a0%11]) with mapi id 15.20.2263.023; Mon, 16 Sep
 2019 18:56:24 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amdgpu: use PAGE_SHIFT rather than PAGE_SIZE to
 get the shift
Thread-Topic: [PATCH 1/2] drm/amdgpu: use PAGE_SHIFT rather than PAGE_SIZE to
 get the shift
Thread-Index: AQHVbL6gw0SiSrF9pUOzwY/HIWL9uqcup16A
Date: Mon, 16 Sep 2019 18:56:24 +0000
Message-ID: <09026a34-0d42-b40d-2a75-09052830eaa5@amd.com>
References: <20190916184313.20567-1-alexander.deucher@amd.com>
In-Reply-To: <20190916184313.20567-1-alexander.deucher@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::24) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96c31370-c679-4ac1-4c02-08d73ad79259
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR12MB1277; 
x-ms-traffictypediagnostic: MWHPR12MB1277:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1277779016E29450FF6AB881EA8C0@MWHPR12MB1277.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(189003)(199004)(64756008)(8936002)(66476007)(66556008)(66946007)(99286004)(305945005)(66446008)(53936002)(81156014)(14454004)(81166006)(478600001)(4326008)(25786009)(8676002)(86362001)(66066001)(6246003)(6506007)(5660300002)(76176011)(7736002)(52116002)(386003)(53546011)(26005)(102836004)(186003)(256004)(476003)(3846002)(110136005)(2616005)(11346002)(6512007)(31686004)(446003)(6486002)(229853002)(6436002)(36756003)(71190400001)(71200400001)(6116002)(31696002)(4744005)(486006)(14444005)(2906002)(2501003)(316002)(15583001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1277;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ojPkIHVDc8t9H9duMN2V/xt+anjVpRMnTCOpt49OUG6Bz+kbA3C/5yaymM68i2bKiSh0lY9EUi1ERx/yPOz3bozNBt057EZBpffQd8sX3R44l2ifYTc5mNYA2TaZ23Y+WWoLwdo/jDeW5WuLQAqrLkfqDmLjr2wY9Ww5HDMbxAuGu0/KnPIRnHup1uOHu0QgkssdIZ4B3y/HHAFZMOYusoxVhVMr6J2YGYMmiHain2h38FuV1BSKSh+EreD3xUWLYc0namLyqnbb7LNPk2esU32L5TglcOaXZRNMnSorRyoIIHJ/1c+83CS7QR57FKyC+/VaWfq3nDtfbonERAy2N53j3IB2bVgvfng6FcLvX6R6c4dtBuNo5MsbNFfcF9m9wbIUesvMv8ldqpLsVYjdxmyQZaJq/UOlsdt5R46ghFk=
Content-ID: <F066F685DA56BF43AA5BC1D7755ABBE5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96c31370-c679-4ac1-4c02-08d73ad79259
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 18:56:24.6368 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: keet3lV9qTr0TI49F7sygy0IHox2pgPVJo76u5Yq5w1JrD+WX5NPfWIyFTIBPmNFp73lrMfEVeh6WxabSVaEiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1277
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iL57ysPhrwppCZmYlfX3gjD4aWbymNXg48Owsab4oM=;
 b=ghjW1D0+m///M1poe6F8PRfKkn5ZzMayRaCEhhIouNF9VNYbTu70Ammlmmra+UWmXq9PfjywoC6PDhX2H7o2IwD7Jdrlo5XLbVa6CehIjPWd/2tmjPRI/uPWgxyOQ9PhT1BsnYAEuOjRUu1wSqvvlXxPY+//e61OFTyzFmfEr8A=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VyaWVzIGlzIFJldmlld2VkLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zz
a3lAYW1kLmNvbT4NCg0KQW5kcmV5DQoNCk9uIDkvMTYvMTkgMjo0MyBQTSwgQWxleCBEZXVjaGVy
IHdyb3RlOg0KPiBMb29rcyBsaWtlIGEgY29weSBhbmQgcGFzdGUgdHlwby4NCj4NCj4gRml4ZXM6
IDBkOWE4MDIxMzgyOSAoImRybS9hbWRncHU6IGNsZWFudXAgY3JlYXRpbmcgQk9zIGF0IGZpeGVk
IGxvY2F0aW9uIikNCj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmFzLmMgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcmFzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4g
aW5kZXggYmU0OTQxOTc3OGRiLi5mZjFmYzA4NGZmZTEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4gQEAgLTE0MDksNyArMTQwOSw3IEBAIGludCBhbWRn
cHVfcmFzX3Jlc2VydmVfYmFkX3BhZ2VzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAg
IAlmb3IgKGkgPSBkYXRhLT5sYXN0X3Jlc2VydmVkOyBpIDwgZGF0YS0+Y291bnQ7IGkrKykgew0K
PiAgIAkJYnAgPSBkYXRhLT5icHNbaV0ucmV0aXJlZF9wYWdlOw0KPiAgIA0KPiAtCQlpZiAoYW1k
Z3B1X2JvX2NyZWF0ZV9rZXJuZWxfYXQoYWRldiwgYnAgPDwgUEFHRV9TSVpFLCBQQUdFX1NJWkUs
DQo+ICsJCWlmIChhbWRncHVfYm9fY3JlYXRlX2tlcm5lbF9hdChhZGV2LCBicCA8PCBQQUdFX1NI
SUZULCBQQUdFX1NJWkUsDQo+ICAgCQkJCQkgICAgICAgQU1ER1BVX0dFTV9ET01BSU5fVlJBTSwN
Cj4gICAJCQkJCSAgICAgICAmYm8sIE5VTEwpKQ0KPiAgIAkJCURSTV9FUlJPUigiUkFTIEVSUk9S
OiByZXNlcnZlIHZyYW0gJWxseCBmYWlsXG4iLCBicCk7DQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
