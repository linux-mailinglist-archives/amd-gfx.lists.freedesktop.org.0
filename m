Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AC0C9AB4
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2019 11:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429B26E983;
	Thu,  3 Oct 2019 09:25:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770051.outbound.protection.outlook.com [40.107.77.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC656E980
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 09:25:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qmb/rIRIu0YMzizYMu/J3nF8K9DUEL9/PE9BoCawWnsd8/lgU4Ssd/N6ATgvJi8efhW2dTaGw3X3hxEp3Z5bL5uqui2mN7z4SOFJoAl21aZ5mM4+2O0J1Pj4MD08Vh2F2jWtYTKCbVBxRqBUYGQREd4deqJl9PJsTHq0dxhZxMNbXWWyjtqyafZjNtOeTS52xhS7fEGqWWZbYcK6Y1Yh5QEx88TgURu/V+vyd1eWkjs54X82+UIhjnxobxdazmtIbHx1g/Hj82z2CAIy6Wm/XHocquoECh2bu9IGJwIihAPeeNDcv9NOBFLsf9FAebPX6WzSwqAjEKvCQqEixHCLfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXvqk9UM4YXlvSr06S6EE0Pen5gDSqtgJzThTgZ2smk=;
 b=Z0KqlMhsK4URB6EU3LAK1MulWf8eEldwxxqr8TjuWMLnejHOfNNMjooeO1S3/wQG6Ighs/hxqiokLczjdDluDEHl+PK9RAS1ViNJvmmXEuMMQM1ujO2mgr9bnp9oJrRk10PIX55Eu7ExtsqNSDp+A0QD6bF76+bR1U8FsDuGYafXrTyOZFH2Sku4hSkIrV2R9WSBwgYappbEwW/zUk3NNfKpX9LMwI+oBisvj67SO8ouaH5TigLe0hSFlX3TkuQ5xevGWjxMyZYw1/WHdNvkWiO4rtM1dRQU45+RoVf/vHvXBmJDAGSwHSZAoru30FdnIKj9m8ZB4YdFfMlsldEX8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1818.namprd12.prod.outlook.com (10.175.92.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.18; Thu, 3 Oct 2019 09:25:41 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::bd8c:bbd5:66a4:9e83]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::bd8c:bbd5:66a4:9e83%5]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 09:25:41 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Pelloux-prayer, Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>
Subject: Re: [PATCH] drm/amdgpu: do not execute 0-sized IBs
Thread-Topic: [PATCH] drm/amdgpu: do not execute 0-sized IBs
Thread-Index: AQHVecyGGhKV6YP3eEil8whRRUWNJw==
Date: Thu, 3 Oct 2019 09:25:41 +0000
Message-ID: <3a681615-c931-45a9-9cff-17b1e9836fca@email.android.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a02:908:1252:fb60:250b:55af:6b74:fdcf]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: adeb6e67-397c-454a-d9f9-08d747e3a93d
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1818:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1818ED80C302A72DADB43394839F0@DM5PR12MB1818.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(189003)(199004)(46003)(66446008)(64756008)(71200400001)(102836004)(66946007)(66476007)(71190400001)(66556008)(4326008)(14454004)(256004)(25786009)(6862004)(53546011)(6506007)(6486002)(81166006)(606006)(966005)(186003)(8676002)(31686004)(81156014)(7736002)(6436002)(76116006)(99286004)(6636002)(91956017)(6116002)(9686003)(86362001)(54896002)(6512007)(305945005)(6306002)(8936002)(316002)(236005)(5660300002)(2906002)(6246003)(486006)(229853002)(478600001)(31696002)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1818;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pvAEb27iPbpAIOJFtxLyuBWNRHjqWGI4KvqIP1RW/dHeGfy7TzxCis4YJ0XxB+zHw2RJGZhXHSwXuBsIUD1EFyHbvmV4bZIr/JXYBB14ph7f8OgK1ZIXmDcZ8Ca3ryByV5beCGRL5UgndefF6fTKPVENvpDsyijhOnTinere4FD3F7fnVsreExvvzENLEeByHXNy2mERZanBuTAghz6j/akeFWJ0elGnClC/GqMYheRiFJE4wAowm3htLoAjpIwFHmsdlo8dReRcj8TERvoYyYT4f2DVuPx3wUm1+NHJGMfZ32x70VOZAb2uF0u/Tr7WUgyBSLHPyzNioAY+wDl6EToEFWeEX7VRjKywWWiVdiYtuIVR5LEmsCmHvolVOlHmtZxvWsB3oJXeo0yhMHBeOeTtyHY9kxs6Zv4Lf8ppVXQqoixHFoUx0GsvOMpwSwWzwA+A0opDSdZheTym7d30Xw==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adeb6e67-397c-454a-d9f9-08d747e3a93d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 09:25:41.7766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZLLtF6IeY3n4GelI2Jlryt64oVvZGYc0whramK8RtOCln0LpCXPPBQV2aJlDVLj3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1818
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXvqk9UM4YXlvSr06S6EE0Pen5gDSqtgJzThTgZ2smk=;
 b=1XaRQd9HKUMwGMsExY1O9auIznmrRlsVxeTQAz95Vaa7hZfhX3LalYS5u171qgA06lIP7Ay+MunTR3Zv5MzAYL3U58eWqlwyr3/8YwJ2sk9jZSbi/sys5iuBrYqkrqJz2AkX0Q5tZS97bmDqfaYyMJIcCc4RIBR2zyFt2WSiaP4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1017425628=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1017425628==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_3a681615c93145a99cff17b1e9836fcaemailandroidcom_"

--_000_3a681615c93145a99cff17b1e9836fcaemailandroidcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCkFtIDAzLjEwLjIwMTkgMTA6MjUgc2NocmllYiAiUGVsbG91eC1wcmF5ZXIsIFBpZXJyZS1l
cmljIiA8UGllcnJlLWVyaWMuUGVsbG91eC1wcmF5ZXJAYW1kLmNvbT46DQoNCk9uIDAzLzEwLzIw
MTkgMTA6MDksIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+IEFtIDAzLjEwLjE5IHVtIDEwOjAz
IHNjaHJpZWIgUGVsbG91eC1wcmF5ZXIsIFBpZXJyZS1lcmljOg0KPj4gVGhpcyBjYW4gYmUgc2Fm
ZWx5IHNraXBwZWQgZW50aXJlbHkuDQo+PiBUaGlzIHNlZW1zIHRvIGhlbHAgd2l0aCBodHRwczov
L2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTE0ODEuDQo+DQo+IE5BSywg
cGxlYXNlIGluc3RlYWQgZml4IGdtY192MTBfMF9mbHVzaF9ncHVfdGxiIHRvIGluY2x1ZGUgYXQg
bGVhc3Qgc29tZSBOT1AgaW4gdGhlIHN1Ym1pdHRlZCBJQnMuDQoNCklzIHRoZXJlIGFueSBpbnRl
cmVzdCBpbiBleGVjdXRpbmcgYW4gZW1wdHkgKG9yIG9ubHkgZmlsbGVkIHdpdGggTk9QcykgSUI/
DQoNClllYWgsIHdlIHVzZWQgdG8gaGF2ZSBzb21lIGR1bW15IHplcm8gc2l6ZWQgSUJzIGZvciB0
aGUgTU0gZW5naW5lcyB3aGljaCBvdGhlcndpc2UgY291bGRuJ3QgZXhlY3V0ZSBhIGZlbmNlIGNv
bW1hbmQuDQoNCkl0IHNob3VsZG4ndCBtYXR0ZXIgZm9yIG1vZGVybiBmaXJtd2FyZS9oYXJkd2Fy
ZSwgYnV0IHlvdSBjb3VsZCBhY3R1YWxseSBzaWxlbnRseSBicmVhayBzb21ld2hlcmUgZWxzZSB3
aXRoIHRoaXMsIHNvIGJldHRlciBub3QgZG8gdGhpcy4NCg0KU29ycnkgc2hvdWxkIGhhdmUgbWVu
dGlvbmVkIHRoYXQgZGlyZWN0bHksDQpDaHJpc3RpYW4uDQoNCg0KQW55d2F5IEkgY2FuIG1vZGlm
eSB0aGUgcGF0Y2ggdG8gZG8gdGhpcy4NCg0KVGhhbmtzLA0KUGllcnJlLUVyaWMNCg0KPg0KPiBD
aHJpc3RpYW4uDQo+DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogUGllcnJlLUVyaWMgUGVsbG91eC1Q
cmF5ZXIgPHBpZXJyZS1lcmljLnBlbGxvdXgtcHJheWVyQGFtZC5jb20+DQo+PiAtLS0NCj4+ICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMgfCA1ICsrKysrDQo+PiAgIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfaWIuYw0KPj4gaW5kZXggNjA2NTU4MzRkNjQ5Li5hYTE2M2U2NzlmMWYgMTAw
NjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYw0KPj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMNCj4+IEBAIC0yMjcs
NiArMjI3LDExIEBAIGludCBhbWRncHVfaWJfc2NoZWR1bGUoc3RydWN0IGFtZGdwdV9yaW5nICpy
aW5nLCB1bnNpZ25lZCBudW1faWJzLA0KPj4gICAgICAgICAgICAgICAhYW1kZ3B1X3NyaW92X3Zm
KGFkZXYpKSAvKiBmb3IgU1JJT1YgcHJlZW1wdGlvbiwgUHJlYW1ibGUgQ0UgaWIgbXVzdCBiZSBp
bnNlcnRlZCBhbnl3YXkgKi8NCj4+ICAgICAgICAgICAgICAgY29udGludWU7DQo+PiAgICsgICAg
ICAgIGlmIChpYi0+bGVuZ3RoX2R3ID09IDApIHsNCj4+ICsgICAgICAgICAgICAvKiBPbiBOYXZp
IGdtY192MTBfMF9mbHVzaF9ncHVfdGxiIGVtaXRzIDAgc2l6ZWQgSUIgKi8NCj4+ICsgICAgICAg
ICAgICBjb250aW51ZTsNCj4+ICsgICAgICAgIH0NCj4+ICsNCj4+ICAgICAgICAgICBhbWRncHVf
cmluZ19lbWl0X2liKHJpbmcsIGpvYiwgaWIsIHN0YXR1cyk7DQo+PiAgICAgICAgICAgc3RhdHVz
ICY9IH5BTURHUFVfSEFWRV9DVFhfU1dJVENIOw0KPj4gICAgICAgfQ0KPg0KDQo=

--_000_3a681615c93145a99cff17b1e9836fcaemailandroidcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <E7E09A96FB5ECE4794CEC48D9F5C14B6@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdiBkaXI9ImF1
dG8iPg0KPGRpdj48YnI+DQo8ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPg0KPGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPkFtIDAzLjEwLjIwMTkgMTA6MjUgc2NocmllYiAmcXVvdDtQZWxsb3V4
LXByYXllciwgUGllcnJlLWVyaWMmcXVvdDsgJmx0O1BpZXJyZS1lcmljLlBlbGxvdXgtcHJheWVy
QGFtZC5jb20mZ3Q7OjxiciB0eXBlPSJhdHRyaWJ1dGlvbiI+DQo8YmxvY2txdW90ZSBjbGFzcz0i
cXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xp
ZDtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjxkaXY+PGZvbnQgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMXB0Ij4NCjxkaXY+PGJyPg0KT24gMDMvMTAvMjAxOSAxMDowOSwgQ2hyaXN0aWFu
IEvDtm5pZyB3cm90ZTo8YnI+DQomZ3Q7IEFtIDAzLjEwLjE5IHVtIDEwOjAzIHNjaHJpZWIgUGVs
bG91eC1wcmF5ZXIsIFBpZXJyZS1lcmljOjxicj4NCiZndDsmZ3Q7IFRoaXMgY2FuIGJlIHNhZmVs
eSBza2lwcGVkIGVudGlyZWx5Ljxicj4NCiZndDsmZ3Q7IFRoaXMgc2VlbXMgdG8gaGVscCB3aXRo
IDxhIGhyZWY9Imh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEx
MTQ4MSI+DQpodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTE0
ODE8L2E+Ljxicj4NCiZndDsgPGJyPg0KJmd0OyBOQUssIHBsZWFzZSBpbnN0ZWFkIGZpeCBnbWNf
djEwXzBfZmx1c2hfZ3B1X3RsYiB0byBpbmNsdWRlIGF0IGxlYXN0IHNvbWUgTk9QIGluIHRoZSBz
dWJtaXR0ZWQgSUJzLjxicj4NCjxicj4NCklzIHRoZXJlIGFueSBpbnRlcmVzdCBpbiBleGVjdXRp
bmcgYW4gZW1wdHkgKG9yIG9ubHkgZmlsbGVkIHdpdGggTk9QcykgSUI/PGJyPg0KPC9kaXY+DQo8
L3NwYW4+PC9mb250PjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2
Pg0KPGRpdiBkaXI9ImF1dG8iPjxicj4NCjwvZGl2Pg0KPGRpdiBkaXI9ImF1dG8iPlllYWgsIHdl
IHVzZWQgdG8gaGF2ZSBzb21lIGR1bW15IHplcm8gc2l6ZWQgSUJzIGZvciB0aGUgTU0gZW5naW5l
cyB3aGljaCBvdGhlcndpc2UgY291bGRuJ3QgZXhlY3V0ZSBhIGZlbmNlIGNvbW1hbmQuPC9kaXY+
DQo8ZGl2IGRpcj0iYXV0byI+PGJyPg0KPC9kaXY+DQo8ZGl2IGRpcj0iYXV0byI+SXQgc2hvdWxk
bid0IG1hdHRlciBmb3IgbW9kZXJuIGZpcm13YXJlL2hhcmR3YXJlLCBidXQgeW91IGNvdWxkIGFj
dHVhbGx5IHNpbGVudGx5IGJyZWFrIHNvbWV3aGVyZSBlbHNlIHdpdGggdGhpcywgc28gYmV0dGVy
IG5vdCBkbyB0aGlzLjwvZGl2Pg0KPGRpdiBkaXI9ImF1dG8iPjxicj4NCjwvZGl2Pg0KPGRpdiBk
aXI9ImF1dG8iPlNvcnJ5IHNob3VsZCBoYXZlIG1lbnRpb25lZCB0aGF0IGRpcmVjdGx5LDwvZGl2
Pg0KPGRpdiBkaXI9ImF1dG8iPkNocmlzdGlhbi48L2Rpdj4NCjxkaXYgZGlyPSJhdXRvIj48YnI+
DQo8L2Rpdj4NCjxkaXYgZGlyPSJhdXRvIj4NCjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj4NCjxk
aXYgY2xhc3M9ImdtYWlsX3F1b3RlIj4NCjxibG9ja3F1b3RlIGNsYXNzPSJxdW90ZSIgc3R5bGU9
Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVm
dDoxZXgiPg0KPGRpdj48Zm9udCBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQi
Pg0KPGRpdj48YnI+DQpBbnl3YXkgSSBjYW4gbW9kaWZ5IHRoZSBwYXRjaCB0byBkbyB0aGlzLjxi
cj4NCjxicj4NClRoYW5rcyw8YnI+DQpQaWVycmUtRXJpYzxicj4NCjxicj4NCiZndDsgPGJyPg0K
Jmd0OyBDaHJpc3RpYW4uPGJyPg0KJmd0OyA8YnI+DQomZ3Q7Jmd0Ozxicj4NCiZndDsmZ3Q7IFNp
Z25lZC1vZmYtYnk6IFBpZXJyZS1FcmljIFBlbGxvdXgtUHJheWVyICZsdDtwaWVycmUtZXJpYy5w
ZWxsb3V4LXByYXllckBhbWQuY29tJmd0Ozxicj4NCiZndDsmZ3Q7IC0tLTxicj4NCiZndDsmZ3Q7
ICZuYnNwOyBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYyB8IDUgJiM0Mzsm
IzQzOyYjNDM7JiM0MzsmIzQzOzxicj4NCiZndDsmZ3Q7ICZuYnNwOyAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCYjNDM7KTxicj4NCiZndDsmZ3Q7PGJyPg0KJmd0OyZndDsgZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmM8YnI+DQomZ3Q7Jmd0OyBpbmRleCA2MDY1NTgzNGQ2
NDkuLmFhMTYzZTY3OWYxZiAxMDA2NDQ8YnI+DQomZ3Q7Jmd0OyAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYzxicj4NCiZndDsmZ3Q7ICYjNDM7JiM0MzsmIzQzOyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jPGJyPg0KJmd0OyZndDsgQEAg
LTIyNyw2ICYjNDM7MjI3LDExIEBAIGludCBhbWRncHVfaWJfc2NoZWR1bGUoc3RydWN0IGFtZGdw
dV9yaW5nICpyaW5nLCB1bnNpZ25lZCBudW1faWJzLDxicj4NCiZndDsmZ3Q7ICZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyAhYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKSAvKiBmb3IgU1JJT1YgcHJlZW1wdGlv
biwgUHJlYW1ibGUgQ0UgaWIgbXVzdCBiZSBpbnNlcnRlZCBhbnl3YXkgKi88YnI+DQomZ3Q7Jmd0
OyAmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgY29udGludWU7PGJyPg0KJmd0OyZndDsgJm5ic3A7ICYj
NDM7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGlmIChpYi0mZ3Q7
bGVuZ3RoX2R3ID09IDApIHs8IS0tIC0tPjxicj4NCiZndDsmZ3Q7ICYjNDM7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IC8q
IE9uIE5hdmkgZ21jX3YxMF8wX2ZsdXNoX2dwdV90bGIgZW1pdHMgMCBzaXplZCBJQiAqLzxicj4N
CiZndDsmZ3Q7ICYjNDM7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGNvbnRpbnVlOzxicj4NCiZndDsmZ3Q7ICYjNDM7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IH08YnI+DQomZ3Q7Jmd0OyAm
IzQzOzxicj4NCiZndDsmZ3Q7ICZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyBhbWRncHVfcmluZ19lbWl0X2liKHJpbmcsIGpvYiwgaWIsIHN0YXR1
cyk7PGJyPg0KJmd0OyZndDsgJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7IHN0YXR1cyAmYW1wOz0gfkFNREdQVV9IQVZFX0NUWF9TV0lUQ0g7PGJy
Pg0KJmd0OyZndDsgJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IH08YnI+DQomZ3Q7IDxi
cj4NCjwvZGl2Pg0KPC9zcGFuPjwvZm9udD48L2Rpdj4NCjwvYmxvY2txdW90ZT4NCjwvZGl2Pg0K
PGJyPg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_3a681615c93145a99cff17b1e9836fcaemailandroidcom_--

--===============1017425628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1017425628==--
