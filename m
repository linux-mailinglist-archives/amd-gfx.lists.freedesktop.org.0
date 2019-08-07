Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 104988452D
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 09:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4B86E614;
	Wed,  7 Aug 2019 07:06:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EFCB6E36B
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 07:06:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9+fL2LZb4Kc4C5bZV/gctYpRPjzR+NLv3hmzCeI+0mPyHyvTaN2XT8ahVrzNQ2dQ8wsza0l5ZOBNlUaor/vssnA3WlI7YuxcZBLD8e06DtN/ofvcqhx5RkRr2DpY9hSkO4IlZxrG9C7TUcTyNEUASQG5Fv/dh1eiwD6gMqZMbipjp3F879BS5PtJt6QYNZH7v47H4CJRqaxiwD6mJ6+ELkAy5iDGVAYWogcBjK0AdavmOyL1gS2Koi4+V+LiWXH+tZTlUIkhuLm1PNwl2tyvZaNSwQ0iUyvztAgna7JzBXuQz/qGkXRgdLjZZlRhMa8d9gNwChAQkBfi8sdsSb7ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yarihCgIa8lkimUIzBwbUlFKOEDsj7ArIE98nemJo6w=;
 b=TBGMPnrTJHeqJ70j4IzSVZ73ZV4SEZ/mPN4TqtuJcI8zfuKuOuEmTEiTY77/Cg6ChS1xygz3cNIV9IZEhFuTqc2m2OdhGWTScNBfwoHJagePsNmwr3P+rr70DE1FRi/B69tYghMZvZdFBDDEHXw8OdtVufvpJvG9TxhsdXxtpcZSfxuemvowu21/l9BpZ9iQ/SmIi2FM9oVU51XKjD1c+utwT9r462Uk91bp0NhpAXGB6FBlwDxCH/dblTSegHC+YdwwNIBuwav4r8bmI9ffNQ76i7ISriu1bpVDGAMODxNiEJsuFHoD2l+X5KUKd+NcCGmdyD0En1JXHb/cKyRWMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB2896.namprd12.prod.outlook.com (20.179.80.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Wed, 7 Aug 2019 07:06:35 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::90f0:834e:73ee:76c7]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::90f0:834e:73ee:76c7%5]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 07:06:35 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Li, Dennis" <Dennis.Li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: RE: [PATCH v2 libdrm 0/3] add ras inject test for gfx and umc module
Thread-Topic: [PATCH v2 libdrm 0/3] add ras inject test for gfx and umc module
Thread-Index: AQHVTOysY9kPzc/53Ey7aZKsiC9YVqbvQvLg
Date: Wed, 7 Aug 2019 07:06:35 +0000
Message-ID: <MN2PR12MB3054BD1718399F47CECF85DAB0D40@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <20190807065202.30023-1-guchun.chen@amd.com>
In-Reply-To: <20190807065202.30023-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7d03a23-d68e-4b6c-f14c-08d71b05c8ed
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2896; 
x-ms-traffictypediagnostic: MN2PR12MB2896:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB2896FAFCB3C6B56F8793F576B0D40@MN2PR12MB2896.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(366004)(346002)(39850400004)(199004)(189003)(13464003)(256004)(3846002)(68736007)(186003)(11346002)(26005)(53546011)(446003)(81166006)(8676002)(81156014)(33656002)(6506007)(486006)(14454004)(110136005)(76176011)(7696005)(102836004)(8936002)(99286004)(7736002)(476003)(305945005)(966005)(5660300002)(6636002)(4326008)(66946007)(2906002)(52536014)(74316002)(66476007)(66556008)(64756008)(66446008)(316002)(76116006)(71200400001)(71190400001)(25786009)(66066001)(6116002)(478600001)(86362001)(2501003)(229853002)(6246003)(6306002)(53936002)(9686003)(6436002)(55016002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2896;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: d9Qi1pKOgop0AIukluoKnBwjCXycxVloJOjXO1ItJG7hCuVB2tckQOU236ScTEanVXn9ty+xF8qpToz0l6Ff8NIcAdkxOy/rdTUb7WmlxWLsSgGDcP5O8DIPZk755FZDm+XytCGjCqovWgKKlkUfPWrtkjafOcMNkqH2BjWfO93UaGdlRbizgs4E45gIU3unbJDEa6Zr9PDSigmBSLsaqmo288ZaDnx2/gQrRVt+EPTBDQ/3NPDUiEoJS+zABrfzhZCPAv9q9wAx92ljG/gmzpdL5/rdx8J2dNwWgQFiL578jieSAgZ6Tx9ltHD0zAf1g4mLk/UaS1ZRo2Ti+UHDJD6u2Sl3dxGJqUYm7If0XtyBJ7c/I/Ge25/iVWPF2inLFt4diiAYmEByi8Ab+FuoBqHLLG92gQN8lp0r8n/XGqk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7d03a23-d68e-4b6c-f14c-08d71b05c8ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 07:06:35.1620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tazhou1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2896
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yarihCgIa8lkimUIzBwbUlFKOEDsj7ArIE98nemJo6w=;
 b=KPFQ+VMz0qUJuy7IA2WiK6bXsZeh4HEqCOhGSTAYdzr4k52eaRq6auARFTilT0FggYkDIRjetrHuSJONYKNwwSpLB7RbbkEctTtaAjeb47tUJ3ujENqxlCLybhxMYlg+qCmF2C91zM0U3EdPRUBnEKjRRLBXO3ij/dk7Iy3hZRg=
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
Cc: "Chen, Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIHNlcmllcyBpczoNCg0KUmV2aWV3ZWQtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNv
bT4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQt
Z2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gR3VjaHVu
IENoZW4NCj4gU2VudDogMjAxOeW5tDjmnIg35pelIDE0OjUyDQo+IFRvOiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsgWmhhbmcsIEhhd2tpbmcNCj4gPEhhd2tpbmcuWmhhbmdAYW1kLmNv
bT47IExpLCBEZW5uaXMgPERlbm5pcy5MaUBhbWQuY29tPjsgUGFuLCBYaW5odWkNCj4gPFhpbmh1
aS5QYW5AYW1kLmNvbT47IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPg0KPiBDYzogQ2hl
biwgR3VjaHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgbGli
ZHJtIDAvM10gYWRkIHJhcyBpbmplY3QgdGVzdCBmb3IgZ2Z4IGFuZCB1bWMgbW9kdWxlDQo+IA0K
PiBUaGVzZSBwYXRjaGVzIGFyZSB0byBzdXBwb3J0IHJhcyBpbmplY3QgdGVzdCBmb3IgZ2Z4IGFu
ZCB1bWMgbW9kdWxlcy4NCj4gDQo+IFBhdGNoIHYyOg0KPiBDb3JyZWN0ICJlamVjdCIgaW4gYWxs
IGNvbW1pdHMgdG8gImluamVjdCIuDQo+IEFkZCBtb3JlIGVycm9yIGNoZWNrcyBhbmQgcHJpbnQg
d2hlbiBwYXJzaW5nIGNvbmZpZ3VyYXRpb24gZmlsZS4NCj4gQWRkIHVtYyBtdWx0aV91bmNvcnJl
Y3RhYmxlIHRlc3QgaW4gZGVmYXVsdCBjb25maWd1cmF0aW9uIGZpbGUuDQo+IA0KPiBHdWNodW4g
Q2hlbiAoMyk6DQo+ICAgYW1kZ3B1OiBhZGQgZ2Z4IHJhcyBpbmplY3QgY29uZmlndXJhdGlvbiBm
aWxlDQo+ICAgdGVzdHMvYW1kZ3B1L3JhczogcmVmaW5lIHJhcyBpbmplY3QgdGVzdA0KPiAgIGFt
ZGdwdTogYWRkIHVtYyByYXMgaW5qZWN0IHRlc3QgY29uZmlndXJhdGlvbg0KPiANCj4gIGNvbmZp
Z3VyZS5hYyAgICAgICAgICAgICB8ICAxOCArKw0KPiAgZGF0YS9hbWRncHVfcmFzLmpzb24gICAg
IHwgMjY3ICsrKysrKysrKysrKysrKysrKysrDQo+ICBtZXNvbi5idWlsZCAgICAgICAgICAgICAg
fCAgIDEgKw0KPiAgdGVzdHMvYW1kZ3B1L01ha2VmaWxlLmFtIHwgICA1ICstDQo+ICB0ZXN0cy9h
bWRncHUvbWVzb24uYnVpbGQgfCAgMTYgKy0NCj4gIHRlc3RzL2FtZGdwdS9yYXNfdGVzdHMuYyB8
IDUyNyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQ0KPiAtDQo+ICA2IGZp
bGVzIGNoYW5nZWQsIDc4MyBpbnNlcnRpb25zKCspLCA1MSBkZWxldGlvbnMoLSkgIGNyZWF0ZSBt
b2RlIDEwMDY0NA0KPiBkYXRhL2FtZGdwdV9yYXMuanNvbg0KPiANCj4gLS0NCj4gMi4xNy4xDQo+
IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBh
bWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
