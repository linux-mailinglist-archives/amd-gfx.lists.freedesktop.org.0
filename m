Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A07B3327
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Sep 2019 04:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8156E071;
	Mon, 16 Sep 2019 02:10:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700073.outbound.protection.outlook.com [40.107.70.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ACFC6E071
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 02:10:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJgigbH97VNfyx8q50GSHaO7vBsqYEHvslrcJbSV45LlICIlaT2cdrDF7BbOT3mPU5xNz3hHhfW1Yl4TiCWa4gqLN9ZPij6GrBVoLxfeFLjCrdKXgTvgM3iBEU8ljv5b5kk0e1S4T3cWSCtcawIv2rueB064onIeiQHuM/ud2mQ5pMkuA7lHpZwCC7JZQ5fBnWPIuMe7uCGc34mnXVB4cdK9dFQGWCFV+CDk1mLaqIFIOVnclfnVodh+9fqjV8cATDkjRc7VkrI8ocYCYC/ubSnJRhZ1GzPm8R9MSTW7QInheP/DLOK3QFu05j5OcXxBo03NwLcH2npFjLgUAUI38Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjDACNbMvRhBLKG07QIcs3SpO7AZsPQQPJXEgqqYc6I=;
 b=B/lS0y56eC8be1pbZL9aGYcnICJ9RsCg3Hx4+BqGlaWYc3XeGU9Ay094KOiIdJWHj3a8UGLQqTLI58/FUQlHOh8VEnD+u7TFOEGc+ZZMMeNYLSomC77mj4p1Q0oaorprTIQTOUuQHXIcJlrdNoAP6M8/SwoEELKBHsieFOHQTnONxZksn5P9/ckOUml5kvYG3zkiwriL103eprdp+MXopFgnIpYg8jwUPksz0d3ayoeyYneVgT+8MsGHJi5WUo4jM2hayDPuSJ0B/OWgbpPmNHhFR0ys5LLFg7PHWt8qIy6Hc3xMp1xCmvGZRJ++o5PV7SFsA6IRwAaRohIwup0STw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3712.namprd12.prod.outlook.com (10.255.236.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.23; Mon, 16 Sep 2019 02:09:57 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 02:09:57 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Liu, Aaron" <Aaron.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: remove program of lbpw for renoir
Thread-Topic: [PATCH] drm/amdgpu: remove program of lbpw for renoir
Thread-Index: AQHVbC+2fwzT4dRYr0674BFnUu5jFqctjyWA
Date: Mon, 16 Sep 2019 02:09:57 +0000
Message-ID: <MN2PR12MB3309C46E808FD1F3A9E4D340EC8C0@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <1568598006-13573-1-git-send-email-aaron.liu@amd.com>
In-Reply-To: <1568598006-13573-1-git-send-email-aaron.liu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 653ff03b-7c91-49a0-e809-08d73a4af8e8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3712; 
x-ms-traffictypediagnostic: MN2PR12MB3712:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3712E6C8359185A95CA80354EC8C0@MN2PR12MB3712.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:565;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(13464003)(199004)(189003)(9686003)(55016002)(446003)(99286004)(110136005)(74316002)(7736002)(86362001)(305945005)(316002)(2906002)(6506007)(6246003)(476003)(102836004)(53546011)(186003)(26005)(11346002)(52536014)(76116006)(5660300002)(66476007)(66446008)(64756008)(66556008)(66946007)(53936002)(7696005)(76176011)(3846002)(6116002)(66066001)(8676002)(486006)(229853002)(71200400001)(71190400001)(8936002)(2501003)(81166006)(6436002)(256004)(81156014)(14454004)(33656002)(25786009)(4326008)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3712;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1WXtNmcL735ZQDThmJnRoX+LnGxSRtugrglveYLmNrxDWCmqO5IfOtecxOCk4e/kxXTMc37ZYYDqfWL6GnhFLbP/rzkM0n9r35Hfr0TGI8BIgadLTAwswQv95Gohw0d3WFuwj2Y7+SaYU+w7ufrd7ij3n9ISNHW0Xxzg7VrzWDsDZv7j0TkHB76y/e57iFbJXDCHs8hVxmRkpAp3aXiocYbzpF0lqs3XBGxBirNA5350eW8+kw14KfOHYEp41DiO8mg4eV0BL5JAHN/ZiSX0RQxL+ljdQdyJud5znHkuSnIvZIYMYJfxA9s0XRFvbrruYDU4ZAOUDpnKUC/AGUFYZYnkIZapKC8kT2onSo09WdbPFr/8gQXiwQ349o56HKWsshbpcpcHF0uaBR3xNKiu6PLnR5pywggGT4HUxmFUT/E=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 653ff03b-7c91-49a0-e809-08d73a4af8e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 02:09:57.2989 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SeBEq7MJKDufSJ26E7Fqesy6JbRy1JlFVD+VxDPL7TjTbvTwTRMnbPBjKnv2/+ap21Zke83NKgCfeoqwbIp4WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3712
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjDACNbMvRhBLKG07QIcs3SpO7AZsPQQPJXEgqqYc6I=;
 b=rDvCwSDtay8mXQVhwCLEX+x7PEnk4Qg7+GFY/03h4T9TUXD8mDMqgVse49AUWx8+NnPtIZIBbvncY/OOXmVjfXKY02i35isCo/iod0I3pRWExz9idJaM6+we6GBGEJ3Lm+DYaftJ/ImmaGkVoJjJ/lcJbsJL3GOZAlGVN5Nc3Ps=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogTGl1LCBBYXJvbiA8QWFyb24u
TGl1QGFtZC5jb20+Cj4gU2VudDogTW9uZGF5LCBTZXB0ZW1iZXIgMTYsIDIwMTkgOTo0MCBBTQo+
IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBEZXVjaGVyLCBBbGV4YW5k
ZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBIdWFuZywgUmF5Cj4gPFJheS5IdWFuZ0Bh
bWQuY29tPjsgTGl1LCBBYXJvbiA8QWFyb24uTGl1QGFtZC5jb20+Cj4gU3ViamVjdDogW1BBVENI
XSBkcm0vYW1kZ3B1OiByZW1vdmUgcHJvZ3JhbSBvZiBsYnB3IGZvciByZW5vaXIKPiAKPiBUaGVz
ZSBpcyBubyBMQlBXIG9uIFJlbm9pci4gU28gcmVtb3ZpbmcgcHJvZ3JhbSBvZiBsYnB3IGZvciBy
ZW5vaXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWFyb24gTGl1IDxhYXJvbi5saXVAYW1kLmNvbT4K
ClJldmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgoKPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyB8IDIgLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dmeF92OV8wLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8w
LmMKPiBpbmRleCBiNzVlZjg5Li5mZTIxZWY4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nZnhfdjlfMC5jCj4gQEAgLTE2NDYsNyArMTY0Niw2IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBf
cmxjX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UKPiAqYWRldikKPiAKPiAgCXN3aXRjaCAoYWRl
di0+YXNpY190eXBlKSB7Cj4gIAljYXNlIENISVBfUkFWRU46Cj4gLQljYXNlIENISVBfUkVOT0lS
Ogo+ICAJCWdmeF92OV8wX2luaXRfbGJwdyhhZGV2KTsKPiAgCQlicmVhazsKPiAgCWNhc2UgQ0hJ
UF9WRUdBMjA6Cj4gQEAgLTMwMTMsNyArMzAxMiw2IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfcmxj
X3Jlc3VtZShzdHJ1Y3QKPiBhbWRncHVfZGV2aWNlICphZGV2KQo+IAo+ICAJc3dpdGNoIChhZGV2
LT5hc2ljX3R5cGUpIHsKPiAgCWNhc2UgQ0hJUF9SQVZFTjoKPiAtCWNhc2UgQ0hJUF9SRU5PSVI6
Cj4gIAkJaWYgKGFtZGdwdV9sYnB3ID09IDApCj4gIAkJCWdmeF92OV8wX2VuYWJsZV9sYnB3KGFk
ZXYsIGZhbHNlKTsKPiAgCQllbHNlCj4gLS0KPiAyLjcuNAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
