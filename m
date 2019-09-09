Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C6DAD216
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 05:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4842589736;
	Mon,  9 Sep 2019 03:01:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770075.outbound.protection.outlook.com [40.107.77.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F6489736
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Sep 2019 03:01:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8SNt/xdCoPQCPUrJYSynYrBye+rF49RDsJAckc54K9WD9kGWM/h7NCqIwAADNV0iSz35CSkUxoZnvRHevUgkjdGPGkyhYEtkYAeRR0Tp7TmUy4m7+54Nm0eDRbdPOfQpY0ybd1UnHYKyAo3s1eKmUNlMZgWYmXv+C6kfNyJ8nrBpOK8uXdR3jJwN7+AqPd4iKMdJD03SQOqstlPfQNgoV1wxVfxzTWQ8pZf/q0I3ntz8CV333zntLUPiRp3SVZUR0jbqIegzDngjlj4lzJVZJjCfvgdmekh/fnzdK6OtQQWb48NgJB9J3V3itBry0cJvBwfmYeVeihmyG4pT3GanQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tH2VkWNAlgu+RI/pb8cSGPPTVzYA/yLpEKHsEibKwjM=;
 b=RyuwXM7HENzmajOB4o0ODkURpIvW3/akjkBj54HueNgJEWaZO5FZFwrlGWP6X1GT276EN2P+Gppiy8DS9h9rIUR6TfL8swg/geMvk2ZB9cmWd/stp99tKWEfsMH7HMVrWGLobtsm2+KO8mFwVIDeqUZjw/HXxcEAfm5i9BhkyJqoXpC9AWS/7dBP3yeB4T7D/Bx9tZBnMBz2BxMYHZ5Z8vZj4GVK9RPKb4Km+rLAxfZVkigrFS2X9hxKENfS+F1HyO1KwquGsYuGhX2B5kxKYXZaUPS7OK6uO99IReQ45yJxxTkDFI7rPO7uJd9Iy19zn3NnGj33jBbUlBG2Iwvp0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3759.namprd12.prod.outlook.com (10.255.236.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Mon, 9 Sep 2019 03:01:05 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 03:01:05 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Chen, Guchun" <Guchun.Chen@amd.com>
Subject: RE: [PATCH 3/3] drm/amdgpu: rename umc ras_init to ras_asic_init
Thread-Topic: [PATCH 3/3] drm/amdgpu: rename umc ras_init to ras_asic_init
Thread-Index: AQHVZJGMrpXuX/yuEUC9LfVtCgX06aciXukAgAAEw4CAAEO2wA==
Date: Mon, 9 Sep 2019 03:01:05 +0000
Message-ID: <MN2PR12MB3054F07E384BB173EAD69017B0B70@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <20190906090011.20271-1-tao.zhou1@amd.com>
 <20190906090011.20271-3-tao.zhou1@amd.com>
 <MWHPR12MB14245D0D195BBF11C91D6BDEFCB40@MWHPR12MB1424.namprd12.prod.outlook.com>
 <MWHPR12MB1424CE4253553B5228629D15FCB40@MWHPR12MB1424.namprd12.prod.outlook.com>
In-Reply-To: <MWHPR12MB1424CE4253553B5228629D15FCB40@MWHPR12MB1424.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7464067-4e8b-4f20-d8d7-08d734d1f4b0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3759; 
x-ms-traffictypediagnostic: MN2PR12MB3759:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3759CD514FA14179939201F6B0B70@MN2PR12MB3759.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(199004)(189003)(13464003)(55016002)(6436002)(6306002)(9686003)(478600001)(25786009)(6246003)(86362001)(14454004)(8936002)(66066001)(8676002)(81166006)(81156014)(33656002)(966005)(316002)(446003)(5660300002)(11346002)(53936002)(52536014)(486006)(71200400001)(71190400001)(99286004)(110136005)(186003)(74316002)(102836004)(76176011)(6506007)(305945005)(53546011)(7736002)(26005)(256004)(7696005)(476003)(229853002)(6636002)(2501003)(3846002)(6116002)(66446008)(64756008)(66476007)(66556008)(2906002)(66946007)(76116006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3759;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JDXYq4da+nq08poKWLmzmEwUVgajOwv+6MI95hKS5ZRTzKRmIqbIBKfH0oI2VtEliQCbZrQc7kiTEsdcWGQVDZpqnr9G3cD2l/MT7xe3LLN+1nyez89ry0XnufIEyI96s7MwW/MJ2qSOuk6PHfdbRrHsaSZAdHKkursvDb7N4itovPrULYzMjgT0YNwvOuWlkiN5Zo1K/0Op0zekqQ9liGFjOT4eSiHFi3lOcoMerSh78feaxCBs+jUPYpAn/cKmCxJVz1NxGIpGh8n59wezMeP/Sa0jMtOK6S5hOD/ZMfwxOG0EkEsp2B83MnxOsieLBYEadTHPDs3gdt2rp9+QnRi2+MgoraGkQgawuoQLkdBEvBfH392GsYjOgeu4kSjjfbO6s7t9cnA3Bz7QqO2FpE6HtS0GKdEJXtfhLsq9rp0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7464067-4e8b-4f20-d8d7-08d734d1f4b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 03:01:05.3184 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HwapJIPlpHPth5txlvOUJuT3Ak4iKK57NG12HSpAKzqiiWib8K/WzVaPcHuosHq4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3759
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tH2VkWNAlgu+RI/pb8cSGPPTVzYA/yLpEKHsEibKwjM=;
 b=jXe/FtSbAHVJMcX9s4YZ9ht27mz9zyhbV2+C2MvAp1axmqS7gX/3D4fZSg5Q0anAQGyL7P1DRIrZNvUSwkLDiaq8fyRy7Ypk/UndMQkgq5SIwEtpsYoCItNa0p//T2YxDlbQ+qjGbvzY5UTVTtmulH4A4QRmzMuSBU/sEoWsP7s=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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

dW1jLmZ1bmNzLT5yYXNfbGF0ZV9pbml0IGlzIGNvbW1vbiBmb3IgYWxsIHZlcnNpb25zIG9mIHVt
Yywgc28gaXQncyBpbXBsZW1lbnRlZCBpbiBhbWRncHVfdW1jLmMsIGJ1dCByYXNfYXNpY19pbml0
IGlzIHNwZWNpZmljIHRvIGVhY2ggdmVyc2lvbiBvZiB1bWMgYW5kIGlzIHBsYWNlZCBpbiB1bWNf
dnhfeC5jLg0KZXJyX2NudF9pbml0IGlzIGdvb2QgZm9yIGN1cnJlbnQgaW1wbGVtZW50YXRpb24g
YnV0IG1heSBiZSBub3QgZW5vdWdoIGZvciB0aGUgZnV0dXJlLCBob3cgYWJvdXQgcmVuYW1lIGl0
IHRvIHVtYy5mdW5jcy0+cmFzX2h3X2luaXQ/DQoNClJlZ2FyZHMsDQpUYW8NCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFu
Z0BhbWQuY29tPg0KPiBTZW50OiAyMDE55bm0OeaciDnml6UgNjo0MA0KPiBUbzogWmhhbmcsIEhh
d2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47IFpob3UxLCBUYW8NCj4gPFRhby5aaG91MUBh
bWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IENoZW4sIEd1Y2h1bg0KPiA8
R3VjaHVuLkNoZW5AYW1kLmNvbT4NCj4gU3ViamVjdDogUkU6IFtQQVRDSCAzLzNdIGRybS9hbWRn
cHU6IHJlbmFtZSB1bWMgcmFzX2luaXQgdG8gcmFzX2FzaWNfaW5pdA0KPiANCj4gTmV2ZXIgbWlu
ZC4gSSB3YXMgY29uZnVzZWQgYnkgdGhlIG5hbWUgInJhc19hc2ljX2luaXQiLiBUaGUgcHJvZ3Jh
bW1pbmcNCj4gc2VxdWVuY2UgaXMgZXhhY3RseSB3aGF0IHdlIGRpc2N1c3NlZCBiZWZvcmUuIEkg
dGhpbmsgd2UgY2FuIHJlbmFtZSB0aGlzDQo+IGZ1bmN0aW9uIHRvICJlcnJfY250X2luaXQiLg0K
PiANCj4gUmVnYXJkcywNCj4gSGF3a2luZw0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBP
biBCZWhhbGYgT2YNCj4gWmhhbmcsIEhhd2tpbmcNCj4gU2VudDogMjAxOeW5tDnmnIg55pelIDY6
MjMNCj4gVG86IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7DQo+IENoZW4sIEd1Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNvbT4NCj4g
U3ViamVjdDogUkU6IFtQQVRDSCAzLzNdIGRybS9hbWRncHU6IHJlbmFtZSB1bWMgcmFzX2luaXQg
dG8gcmFzX2FzaWNfaW5pdA0KPiANCj4gVGhlIHJhcyBpbml0IChvciB0aGUgbmV3IGFzaWNfaW5p
dCkgc2VlbXMgbm90IG5lY2Vzc2FyeSBhcyBsYXN0IHRpbWUgd2UNCj4gZGlzY3Vzc2VkLiBBbnkg
VU1DIFJBUyByZWdpc3RlciBpbml0aWFsaXphdGlvbiBpcyBzYWZlIGVub3VnaCB0byBiZQ0KPiBj
ZW50cmFsaXplZCB0byByYXNfbGF0ZV9pbml0IGludGVyZmFjZS4gSSB3b3VsZCBzdWdnZXN0IHRv
IHJlZHVjZSBzdWNoIGtpbmQgb2YNCj4gdW4tbmVjZXNzYXJ5IGludGVyZmFjZS4NCj4gDQo+IFJl
Z2FyZHMsDQo+IEhhd2tpbmcNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
WmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+DQo+IFNlbnQ6IDIwMTnlubQ55pyINuaXpSAx
NzowMQ0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFpoYW5nLCBIYXdraW5n
DQo+IDxIYXdraW5nLlpoYW5nQGFtZC5jb20+OyBDaGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFt
ZC5jb20+DQo+IENjOiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT4NCj4gU3ViamVjdDog
W1BBVENIIDMvM10gZHJtL2FtZGdwdTogcmVuYW1lIHVtYyByYXNfaW5pdCB0byByYXNfYXNpY19p
bml0DQo+IA0KPiB0aGlzIGludGVyZmFjZSBpcyByZWxhdGVkIHRvIHNwZWNpZmljIHZlcnNpb24g
b2YgdW1jLCBkaXN0aW5ndWlzaCBpdCBmcm9tDQo+IHJhc19sYXRlX2luaXQNCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmMgfCA0ICsrLS0NCj4gZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5oIHwgMiArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvdW1jX3Y2XzEuYyAgIHwgMiArLQ0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3VtYy5jDQo+IGluZGV4IDU2ODNjNTE3MTBhYS4uYjFjN2Y2NDNmMTk4IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5jDQo+IEBAIC02Myw4ICs2
Myw4IEBAIGludCBhbWRncHVfdW1jX3Jhc19sYXRlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UN
Cj4gKmFkZXYsIHZvaWQgKnJhc19paF9pbmZvKQ0KPiAgCX0NCj4gDQo+ICAJLyogcmFzIGluaXQg
b2Ygc3BlY2lmaWMgdW1jIHZlcnNpb24gKi8NCj4gLQlpZiAoYWRldi0+dW1jLmZ1bmNzICYmIGFk
ZXYtPnVtYy5mdW5jcy0+cmFzX2luaXQpDQo+IC0JCWFkZXYtPnVtYy5mdW5jcy0+cmFzX2luaXQo
YWRldik7DQo+ICsJaWYgKGFkZXYtPnVtYy5mdW5jcyAmJiBhZGV2LT51bWMuZnVuY3MtPnJhc19h
c2ljX2luaXQpDQo+ICsJCWFkZXYtPnVtYy5mdW5jcy0+cmFzX2FzaWNfaW5pdChhZGV2KTsNCj4g
DQo+ICAJcmV0dXJuIDA7DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3VtYy5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3VtYy5oDQo+IGluZGV4IDZmMjJjOTcwNDU1NS4uYTVlNGRmMjQ0MGJlIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmgNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5oDQo+IEBAIC01NCw3ICs1NCw3IEBADQo+
ICAJYWRldi0+dW1jLmZ1bmNzLT5kaXNhYmxlX3VtY19pbmRleF9tb2RlKGFkZXYpOw0KPiANCj4g
IHN0cnVjdCBhbWRncHVfdW1jX2Z1bmNzIHsNCj4gLQl2b2lkICgqcmFzX2luaXQpKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KTsNCj4gKwl2b2lkICgqcmFzX2FzaWNfaW5pdCkoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpOw0KPiAgCWludCAoKnJhc19sYXRlX2luaXQpKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LCB2b2lkICpyYXNfaWhfaW5mbyk7DQo+ICAJdm9pZCAoKnF1ZXJ5X3Jh
c19lcnJvcl9jb3VudCkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAJCQkJCXZvaWQg
KnJhc19lcnJvcl9zdGF0dXMpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvdW1jX3Y2XzEuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8x
LmMNCj4gaW5kZXggNGNkYjVjMDRjZDE3Li45MmYzYjE0OGUxODEgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYw0KPiBAQCAtMjcyLDcgKzI3Miw3IEBAIHN0YXRpYyB2
b2lkIHVtY192Nl8xX3Jhc19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlDQo+ICphZGV2KSAgfQ0K
PiANCj4gIGNvbnN0IHN0cnVjdCBhbWRncHVfdW1jX2Z1bmNzIHVtY192Nl8xX2Z1bmNzID0gew0K
PiAtCS5yYXNfaW5pdCA9IHVtY192Nl8xX3Jhc19pbml0LA0KPiArCS5yYXNfYXNpY19pbml0ID0g
dW1jX3Y2XzFfcmFzX2luaXQsDQo+ICAJLnJhc19sYXRlX2luaXQgPSBhbWRncHVfdW1jX3Jhc19s
YXRlX2luaXQsDQo+ICAJLnF1ZXJ5X3Jhc19lcnJvcl9jb3VudCA9IHVtY192Nl8xX3F1ZXJ5X3Jh
c19lcnJvcl9jb3VudCwNCj4gIAkucXVlcnlfcmFzX2Vycm9yX2FkZHJlc3MgPSB1bWNfdjZfMV9x
dWVyeV9yYXNfZXJyb3JfYWRkcmVzcywNCj4gLS0NCj4gMi4xNy4xDQo+IA0KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcg
bGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
