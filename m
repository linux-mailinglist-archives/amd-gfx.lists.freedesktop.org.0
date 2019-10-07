Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1C2CEB63
	for <lists+amd-gfx@lfdr.de>; Mon,  7 Oct 2019 20:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A816E156;
	Mon,  7 Oct 2019 18:04:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820072.outbound.protection.outlook.com [40.107.82.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFE46E156
 for <amd-gfx@lists.freedesktop.org>; Mon,  7 Oct 2019 18:04:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiftbDGr8XjQITu/FqgxihRWXtfzhh5+8jYoy/AHCBuDNcEtE5ju6jC5zVt7ClazoE2FNg2wlSRWX0Ncus1OUrz6aPmg3G6rtMVxAhbWAPCjbpcEj1k6lpy6iXw1h2flkAeXFunN794QGhrqnMtNxkbZKW0+PHyBKZbBGDNgwr8UZ9D0CvgTiWaq3egD2vx56W1enz0UUFziCm1s/heopUZ8VTBZBpCeAYW66q3DOdBgK4THfKhMoyTH3qiyaHw6M3jIHenXVxPgsOnmpETFHF4J3pSsct7lpmqXmxYfo9k93H4oouSpNQjV66UKbf3uYuuowSP3khXgdfhaqSlRgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1c3XVs9p/At/UgKQmUc46M4E/np39PfOXLMkrmxw6tU=;
 b=fXOzvQwx3BlcupFNCpE7GxGOHVETSD1dn9ENKTVK+aQEzJfOby+sE7AbJzrTaWMy45sHO9TNsIsxs/2yh2DV2FPlZCtNINi8NWKYkmTQa7wozKhh3whIz9ecNHqdB/v8jbLO6OhUeXf5C6vGInnbfvbZMijbU16fp3Z/m3EYAb888U4slIZIPOo496DZepWLJF5BBLtczHe2t4UheQ/TATlP9FAPQ1WYkLm1GkqavCfIC4JDkBBIx/wnz1P5zXdZSjS6bEjGt7KGRI9zQSjv2w+fWnwRLBPZjdYxUHwZRXO3An91Ev0v+cZquR8ZAPlCWu/JFVdOhLH2AawOH5yz9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.25; Mon, 7 Oct 2019 18:04:33 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::145c:4149:8b99:c3b4]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::145c:4149:8b99:c3b4%6]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 18:04:33 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Enable gfx cache probing on HDP write for
 arcturus
Thread-Topic: [PATCH] drm/amdgpu: Enable gfx cache probing on HDP write for
 arcturus
Thread-Index: AQHVby+cOrlga564PUeguQaR/P1as6dKqVOQgAABygCABOlCoA==
Date: Mon, 7 Oct 2019 18:04:33 +0000
Message-ID: <BL0PR12MB2580FB1137F93CF6B6CF8DE9809B0@BL0PR12MB2580.namprd12.prod.outlook.com>
References: <1568927828-17593-1-git-send-email-Oak.Zeng@amd.com>
 <BL0PR12MB2580DFF062B6AE6A61C3AFBC809E0@BL0PR12MB2580.namprd12.prod.outlook.com>
 <79b8aa8b-1e0c-643e-266f-45239592b6b1@amd.com>
In-Reply-To: <79b8aa8b-1e0c-643e-266f-45239592b6b1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.228.209.96]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1bf0408c-4618-43da-82ad-08d74b50cebf
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BL0PR12MB2580:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR12MB25805CB77ABCD9422E58637F809B0@BL0PR12MB2580.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(199004)(189003)(13464003)(4326008)(66946007)(6506007)(86362001)(66556008)(2501003)(66446008)(76116006)(14454004)(3846002)(6116002)(53546011)(66476007)(64756008)(5660300002)(102836004)(305945005)(446003)(316002)(476003)(76176011)(71190400001)(33656002)(71200400001)(52536014)(8936002)(2906002)(99286004)(486006)(478600001)(74316002)(25786009)(26005)(55016002)(14444005)(6246003)(66066001)(256004)(110136005)(186003)(6436002)(81166006)(81156014)(7736002)(11346002)(9686003)(229853002)(8676002)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2580;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AX7ijGwelZohczDm1zjKJ3f5IzohV5aYY02jc3wAucUMa8E1Q39OIluyw++s2GX4d16dA31bV6jkcJ33QLaD1VhVcn9JIAbUdKVEk4pZXSFlI0RTNbgCNDEuEahFqQjzxEiQpOzjeo/WkYOPsU4CHBA2vh860zLP5ZotQTgtSenKflR9uwGza5ctaoLCCl6X/2DqPe0CGsE8W9TpwqF4XXn+SUAnqMKRQUhquMf1jIDYCXrR8ZIvDIf17dPFuo799A4cACRecN4MkYsTNRc1LJuOj+T/vY0lVHfaqHNYotKc4C6B6MoUTOGjU7V+lJoEdrz+r3t30PeZc5WSQN24ft66kzt6tBRLueE+2zT/Fp8Pgyl3FIfVaVeBPyo7+x07g6mUB7HKrBWbj6poU+X6izyfZGtOPCqmo07NAKWm48k=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf0408c-4618-43da-82ad-08d74b50cebf
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 18:04:33.2539 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2/Aif6aZTl5tjeS18Khg9x4YaPvL5wpLfq1kC0ZrP+k3iPqy36r69vefa2cDjKBK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2580
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1c3XVs9p/At/UgKQmUc46M4E/np39PfOXLMkrmxw6tU=;
 b=eTPfW5Q0cpQ6FX5qZ4jZq5GpjqLnzS80Q22CpWZrFIhgwKg4rMAm5eKLuT/vqHBm19GELVPRh3gelYl+EUdn3zQTKOUfc7kKgyv0qAx0vQqgkW7T5BmVwJPqcD/Bb14myr91yK+zgqIZBzrdShTdbxw+gEDbX4rZXBkY7dn/PZY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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

QWdyZWVkLiBJIHdpbGwgbW92ZSBub25lIGdhcnQgbG9naWMgZnJvbSBnbWNfdjlfMF9nYXJ0X2Vu
YWJsZSB0byBnbWNfdjlfMF9od19pbml0DQoNClJlZ2FyZHMsDQpPYWsNCg0KLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCkZyb206IEt1ZWhsaW5nLCBGZWxpeCA8RmVsaXguS3VlaGxpbmdAYW1k
LmNvbT4gDQpTZW50OiBGcmlkYXksIE9jdG9iZXIgNCwgMjAxOSAxMTowMyBBTQ0KVG86IFplbmcs
IE9hayA8T2FrLlplbmdAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpD
YzogS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4NClN1YmplY3Q6
IFJlOiBbUEFUQ0hdIGRybS9hbWRncHU6IEVuYWJsZSBnZnggY2FjaGUgcHJvYmluZyBvbiBIRFAg
d3JpdGUgZm9yIGFyY3R1cnVzDQoNCkknbSBwcmV0dHkgc3VyZSB0aGUgZ2FydF9lbmFibGUgZnVu
Y3Rpb24gaXMgbm90IHRoZSByaWdodCBwbGFjZSBmb3IgdGhpcy4gR0FSVCBpcyBmb3IgR1BVIGFj
Y2VzcyB0byBzeXN0ZW0gbWVtb3J5LiBIRFAgaXMgZm9yIGhvc3QgYWNjZXNzIHRvIEdQVSBtZW1v
cnkuIEFsc28sIEkgd291bGQgZXhwZWN0IGFueXRoaW5nIGRvbmUgaW4gZ2FydF9lbmFibGUgdG8g
YmUgdW5kb25lIGluIGdhcnRfZGlzYWJsZS4gSWYgdGhhdCdzIG5vdCB0aGUgaW50ZW50aW9uLCBt
YXliZSB0aGlzIHNob3VsZCBnbyBpbiBnbWNfdjlfMF9od19pbml0Lg0KDQpSZWdhcmRzLA0KIMKg
IEZlbGl4DQoNCk9uIDIwMTktMTAtMDQgMTA6NTYsIFplbmcsIE9hayB3cm90ZToNCj4gUGluZy4u
Lg0KPg0KPiBSZWdhcmRzLA0KPiBPYWsNCj4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gRnJvbTogWmVuZywgT2FrIDxPYWsuWmVuZ0BhbWQuY29tPg0KPiBTZW50OiBUaHVyc2RheSwg
U2VwdGVtYmVyIDE5LCAyMDE5IDU6MTcgUE0NCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+IENjOiBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+OyBL
b2VuaWcsIENocmlzdGlhbiANCj4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IFplbmcsIE9h
ayA8T2FrLlplbmdAYW1kLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBFbmFi
bGUgZ2Z4IGNhY2hlIHByb2Jpbmcgb24gSERQIHdyaXRlIGZvciANCj4gYXJjdHVydXMNCj4NCj4g
VGhpcyBhbGxvd3MgZ2Z4IGNhY2hlIHRvIGJlIHByb2JlZCBhbmQgaW52YWxpZGF0ZWQgKGZvciBu
b25lLWRpcnR5IGNhY2hlIGxpbmVzKSBvbiBhIEhEUCB3cml0ZSAoZnJvbSBlaXRoZXIgYW5vdGhl
ciBHUFUgb3IgQ1BVKS4gVGhpcyBzaG91bGQgd29yayBvbmx5IGZvciB0aGUgbWVtb3J5IG1hcHBl
ZCBhcyBSVyBtZW1vcnkgdHlwZSBuZXdseSBhZGRlZCBmb3IgYXJjdHVydXMsIHRvIGFjaGlldmUg
c29tZSBjYWNoZSBjb2hlcmVuY2UgYi90IG11bHRpcGxlIG1lbW9yeSBjbGllbnRzLg0KPg0KPiBD
aGFuZ2UtSWQ6IEkwYTY5ZDAwMDBlNDg3MDZiYjcxMzIzNWJmYmM4M2ZjYzY3Nzc0NjE0DQo+IFNp
Z25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIHwgMyArKysNCj4gICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nbWNfdjlfMC5jIA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dt
Y192OV8wLmMNCj4gaW5kZXggNTdkNzZlZS4uZTAxYTM1OSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nbWNfdjlfMC5jDQo+IEBAIC0xMjcyLDYgKzEyNzIsOSBAQCBzdGF0aWMgaW50
IGdtY192OV8wX2dhcnRfZW5hYmxlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAgIAkJ
LyogVE9ETyBmb3IgcmVub2lyICovDQo+ICAgCQltbWh1Yl92MV8wX3VwZGF0ZV9wb3dlcl9nYXRp
bmcoYWRldiwgdHJ1ZSk7DQo+ICAgCQlicmVhazsNCj4gKwljYXNlIENISVBfQVJDVFVSVVM6DQo+
ICsJCVdSRUczMl9GSUVMRDE1KEhEUCwgMCwgSERQX01NSFVCX0NOVEwsIEhEUF9NTUhVQl9HQ0Ms
IDEpOw0KPiArCQlicmVhazsNCj4gICAJZGVmYXVsdDoNCj4gICAJCWJyZWFrOw0KPiAgIAl9DQo+
IC0tDQo+IDIuNy40DQo+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
