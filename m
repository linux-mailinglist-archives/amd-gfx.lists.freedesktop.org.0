Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 910C798294
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 20:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D7D6E95A;
	Wed, 21 Aug 2019 18:18:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780045.outbound.protection.outlook.com [40.107.78.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B96F6E95A
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 18:18:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFzFIlwJ43G0eHOsq9GeByCZk5ff1NTB56PJhNCE/OPhxFF4yrNconez9pcnGqwZ788o5bwG9hn+qq01MnMer72/kI+N1M893XN2Urgcf7OGxJY4sFn+wrzFcrcnQ/hv3B/evDXZIezjj3mSCWL3PpJvFei6wlqo980dzuTkY3eE2FWohe8fO9j5zqk5CAqd+Kk3Ss6KWrcH/mgOJ3vhGJxQzSdVcDjsNpB8NSFg0jN41Xbkxh/dFo2njC8p3CAAmGDZpdhLoApF3OolGKzLXSqcUTQwcsGb6RmqsC/7WYf60sq/o7+N6IVaDJqmA8RbqbRnddpWS0bRIxk2XzxmQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDIMVY4w6gSCIYQEwyHKqhzR96YSXuEoyv0PpBdYLmY=;
 b=hkbCt95i8s00jlVDbBp6c5AGeibIRIUQF/sQ8HGBi18aq9bE17LwY/LjGybU+H+X6OhYk6kkOqBbE+WPQ7sFDpRlUGl86IVqIe6yZP+1/nX7AgBE7uE55U3koZ0AHUyzUmPT0fKNgQ+7D6KHdStCNWti4IJc+JAAgcXRlwT5NkU7DVHARd/pzWAgIeTwmaJ1/vFCzKLqKgK3NkY7kGuYYBzeGRPu1si4A+HvOA1T4gOGu13FNfSAJtSoOnrxAg/VcUboo0/oboFJnE/rD1WWv5SIe8fxRmgF6ht+bJYyrKccO5tybuLmmKM8F3v/G+Fbu91rgrG7R9/oxy3T0eVFBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2603.namprd12.prod.outlook.com (20.176.116.84) by
 DM6PR12MB3274.namprd12.prod.outlook.com (20.179.106.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.19; Wed, 21 Aug 2019 18:18:48 +0000
Received: from DM6PR12MB2603.namprd12.prod.outlook.com
 ([fe80::c90f:5f8:954c:e663]) by DM6PR12MB2603.namprd12.prod.outlook.com
 ([fe80::c90f:5f8:954c:e663%7]) with mapi id 15.20.2178.020; Wed, 21 Aug 2019
 18:18:48 +0000
From: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: Calculate bpc based on max_requested_bpc
Thread-Topic: [PATCH] drm/amd/display: Calculate bpc based on max_requested_bpc
Thread-Index: AQHVWEGEy26pkySIL0uh6XoAZPve7KcF6TyA
Date: Wed, 21 Aug 2019 18:18:48 +0000
Message-ID: <1f00aa45-d0f5-959f-431e-3fc77c259637@amd.com>
References: <20190821165711.4031-1-nicholas.kazlauskas@amd.com>
In-Reply-To: <20190821165711.4031-1-nicholas.kazlauskas@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::32) To DM6PR12MB2603.namprd12.prod.outlook.com
 (2603:10b6:5:49::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3fbb2b9-3536-4128-9c6f-08d7266402ed
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3274; 
x-ms-traffictypediagnostic: DM6PR12MB3274:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3274235C46ADAEE63C32FDFE82AA0@DM6PR12MB3274.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(199004)(189003)(2906002)(14454004)(25786009)(186003)(3846002)(86362001)(386003)(26005)(5660300002)(6506007)(6116002)(53546011)(102836004)(31696002)(2616005)(8676002)(66446008)(66946007)(66476007)(4326008)(66556008)(8936002)(64756008)(2501003)(81166006)(486006)(31686004)(81156014)(476003)(6246003)(71200400001)(53936002)(305945005)(66066001)(7736002)(11346002)(446003)(478600001)(256004)(229853002)(6436002)(110136005)(54906003)(316002)(6486002)(36756003)(71190400001)(76176011)(99286004)(6512007)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3274;
 H:DM6PR12MB2603.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QC6nFWPyNmCWbLkYy1ZfflR9fGtw0OkQfpfrPQ9zm0NMgk8ob9Rqj5miRvgk35gy7OOlNgWoScHo6MLpKZE7y14eRVZPDq6qWetoeyhD5y9qlbi+Yf1CQlbkMXfoo+23GkfJnULmet1BnV2wtcnZRqUU+G6XK4wp3JdXPad13KD4B35SqOiqOaDgouDt33TCU0gmQhaOJZ781DHY3TdLevAGFatzdHLFt+wNyMXdvbsfnRHRWLM8pp74W9JlQBsGXF0cjb4NAMAKUoQdKvZbq8LYOP1dsPsrs9oO2UpXzfvYtTSp3A+rthYhAnAE/m3IMaeVMQD96L8lpk1wWbDKNcwZYRLDRKP45oxVbGbi+xuzT5Zw4ipyI7xcvhHn3hsDF/EQKi/eUese5CsfHDVOmVlbuuDd9pTv7B8GNS+5xzE=
Content-ID: <7CF45A8D17A1A54C8DEE227E7D5FD056@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3fbb2b9-3536-4128-9c6f-08d7266402ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 18:18:48.5235 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WX1JsGCz5o7UYc9/i2mreyNScV+aqtC34vl4e9j9LGiT2myDBGY1eGbvacqdWVlH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3274
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDIMVY4w6gSCIYQEwyHKqhzR96YSXuEoyv0PpBdYLmY=;
 b=FdpX7mZZJ7tWLWcersqV+6+U4YMXCtPObWg+5n5rKv6qNADpNEurCqE/5IoKTxddzs8vSnxXdAF1lBiTbCdgpby00Aw+OW0BEqtjzi5nIAAi1r+yZyPahVCJhqFR3JZdmsD7WgbuWCV8UrxK3W2hoDfU8TnYe2a6Y/czswnTtCg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Sunpeng.Li@amd.com; 
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
Cc: "Francis, David" <David.Francis@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPg0KVGhhbmtzIQ0KDQpPbiAy
MDE5LTA4LTIxIDEyOjU3IHAubS4sIE5pY2hvbGFzIEthemxhdXNrYXMgd3JvdGU6DQo+IFtXaHld
DQo+IFRoZSBvbmx5IHBsYWNlIHdoZXJlIHN0YXRlLT5tYXhfYnBjIGlzIHVwZGF0ZWQgb24gdGhl
IGNvbm5lY3RvciBpcw0KPiBhdCB0aGUgc3RhcnQgb2YgYXRvbWljIGNoZWNrIGR1cmluZyBkcm1f
YXRvbWljX2Nvbm5lY3Rvcl9jaGVjay4gSXQNCj4gaXNuJ3QgdXBkYXRlZCB3aGVuIGFkZGluZyB0
aGUgY29ubmVjdG9ycyB0byB0aGUgYXRvbWljIHN0YXRlIGFmdGVyDQo+IHRoZSBmYWN0LiBJdCBh
bHNvIGRvZXNuJ3QgbmVjZXNzYXJpbHkgcmVmbGVjdCB0aGUgcmlnaHQgdmFsdWUgd2hlbg0KPiBj
YWxsZWQgaW4gYW1kZ3B1IGR1cmluZyBtb2RlIHZhbGlkYXRpb24gb3V0c2lkZSBvZiBhdG9taWMg
Y2hlY2suDQo+IA0KPiBUaGlzIGNhbiBjYXVzZSB0aGUgd3JvbmcgYnBjIHRvIGJlIHVzZWQgZXZl
biBpZiB0aGUgbWF4X3JlcXVlc3RlZF9icGMNCj4gaXMgdGhlIGNvcnJlY3QgdmFsdWUuDQo+IA0K
PiBbSG93XQ0KPiBEb24ndCByZWx5IG9uIHN0YXRlLT5tYXhfYnBjIHJlZmxlY3RpbmcgdGhlIHJl
YWwgYnBjIHZhbHVlIGFuZCBqdXN0DQo+IGRvIHRoZSBtaW4oLi4uKSBiYXNlZCBvbiBkaXNwbGF5
IGluZm8gYnBjIGFuZCBtYXhfcmVxdWVzdGVkX2JwYy4NCj4gDQo+IENjOiBEYXZpZCBGcmFuY2lz
IDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+DQo+IENjOiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2Fu
cHJlZXQuTGFraGFAYW1kLmNvbT4NCj4gQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPg0K
PiBTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2Fz
QGFtZC5jb20+DQo+IC0tLQ0KPiAgLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbS5jICAgIHwgMTYgKysrKysrKysrKysrKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE0
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4gaW5kZXggN2NmOGRiY2Nj
ZTk1Li43M2VkN2I2YmQ4ZDMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPiBAQCAtMzIxNiwxMyArMzIxNiwyNSBAQCBz
dGF0aWMgZW51bSBkY19jb2xvcl9kZXB0aA0KPiAgY29udmVydF9jb2xvcl9kZXB0aF9mcm9tX2Rp
c3BsYXlfaW5mbyhjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLA0KPiAgCQkJ
CSAgICAgIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpzdGF0ZSkNCj4gIHsNCj4g
LQl1aW50MzJfdCBicGMgPSBjb25uZWN0b3ItPmRpc3BsYXlfaW5mby5icGM7DQo+ICsJdWludDhf
dCBicGMgPSAodWludDhfdCljb25uZWN0b3ItPmRpc3BsYXlfaW5mby5icGM7DQo+ICsNCj4gKwkv
KiBBc3N1bWUgOCBicGMgYnkgZGVmYXVsdCBpZiBubyBicGMgaXMgc3BlY2lmaWVkLiAqLw0KPiAr
CWJwYyA9IGJwYyA/IGJwYyA6IDg7DQo+ICANCj4gIAlpZiAoIXN0YXRlKQ0KPiAgCQlzdGF0ZSA9
IGNvbm5lY3Rvci0+c3RhdGU7DQo+ICANCj4gIAlpZiAoc3RhdGUpIHsNCj4gLQkJYnBjID0gc3Rh
dGUtPm1heF9icGM7DQo+ICsJCS8qDQo+ICsJCSAqIENhcCBkaXNwbGF5IGJwYyBiYXNlZCBvbiB0
aGUgdXNlciByZXF1ZXN0ZWQgdmFsdWUuDQo+ICsJCSAqDQo+ICsJCSAqIFRoZSB2YWx1ZSBmb3Ig
c3RhdGUtPm1heF9icGMgbWF5IG5vdCBjb3JyZWN0bHkgdXBkYXRlZA0KPiArCQkgKiBkZXBlbmRp
bmcgb24gd2hlbiB0aGUgY29ubmVjdG9yIGdldHMgYWRkZWQgdG8gdGhlIHN0YXRlDQo+ICsJCSAq
IG9yIGlmIHRoaXMgd2FzIGNhbGxlZCBvdXRzaWRlIG9mIGF0b21pYyBjaGVjaywgc28gaXQNCj4g
KwkJICogY2FuJ3QgYmUgdXNlZCBkaXJlY3RseS4NCj4gKwkJICovDQo+ICsJCWJwYyA9IG1pbihi
cGMsIHN0YXRlLT5tYXhfcmVxdWVzdGVkX2JwYyk7DQo+ICsNCj4gIAkJLyogUm91bmQgZG93biB0
byB0aGUgbmVhcmVzdCBldmVuIG51bWJlci4gKi8NCj4gIAkJYnBjID0gYnBjIC0gKGJwYyAmIDEp
Ow0KPiAgCX0NCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
