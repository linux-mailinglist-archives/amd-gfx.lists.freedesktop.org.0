Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C39DA2141A
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 09:17:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13AAA89862;
	Fri, 17 May 2019 07:17:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680077.outbound.protection.outlook.com [40.107.68.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1EA89862
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 07:17:24 +0000 (UTC)
Received: from MN2PR12MB3039.namprd12.prod.outlook.com (20.178.243.144) by
 MN2PR12MB2863.namprd12.prod.outlook.com (20.179.82.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Fri, 17 May 2019 07:17:22 +0000
Received: from MN2PR12MB3039.namprd12.prod.outlook.com
 ([fe80::8c2:3755:16e2:8765]) by MN2PR12MB3039.namprd12.prod.outlook.com
 ([fe80::8c2:3755:16e2:8765%5]) with mapi id 15.20.1856.012; Fri, 17 May 2019
 07:17:22 +0000
From: "Tao, Yintian" <Yintian.Tao@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0hdIGRybS9hbWRncHU6IHNraXAgZncgcHJpIGJvIGFs?=
 =?utf-8?Q?loc_for_SRIOV?=
Thread-Topic: [PATCH] drm/amdgpu: skip fw pri bo alloc for SRIOV
Thread-Index: AQHVC94FavSrKvZPp0CPl1uF2nyUjaZunC7ggABGjYCAAAYecA==
Date: Fri, 17 May 2019 07:17:22 +0000
Message-ID: <MN2PR12MB30390AB5467D6A7080AD45C6E50B0@MN2PR12MB3039.namprd12.prod.outlook.com>
References: <1558007618-24482-1-git-send-email-yttao@amd.com>
 <MN2PR12MB3039EAC37D6BB17BD3582D77E50B0@MN2PR12MB3039.namprd12.prod.outlook.com>,
 <f77131be-9a53-789d-0f1e-c743c80dc11a@amd.com>
In-Reply-To: <f77131be-9a53-789d-0f1e-c743c80dc11a@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [101.88.198.114]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8eada93-7db5-4413-bef6-08d6da97b4d9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2863; 
x-ms-traffictypediagnostic: MN2PR12MB2863:
x-microsoft-antispam-prvs: <MN2PR12MB2863A05607B59FA8715EC570E50B0@MN2PR12MB2863.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(346002)(396003)(39860400002)(136003)(13464003)(199004)(189003)(51874003)(86362001)(52536014)(53936002)(71190400001)(6862004)(4326008)(478600001)(72206003)(5660300002)(19627405001)(224303003)(14454004)(71200400001)(256004)(54906003)(316002)(33656002)(53546011)(64756008)(6606003)(6116002)(3846002)(26005)(7696005)(8936002)(446003)(9686003)(54896002)(76116006)(91956017)(66476007)(68736007)(55016002)(7736002)(66946007)(66556008)(66446008)(73956011)(76176011)(99286004)(6636002)(2906002)(102836004)(25786009)(66066001)(186003)(11346002)(81166006)(81156014)(6436002)(486006)(476003)(6506007)(74316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2863;
 H:MN2PR12MB3039.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9YBWX2dMjT1RQrTy71f06Y8a/lu5uKiiOemL/9LuWTaK86t1C9kMQ/YxK5WLbp681ut99kWsajryQtDg0eo7n0WU50PhcdEP+JIrJkJ0TOthCbhZbdoV6jULlgiOfFE299DjonDODJ0CGX1Dj/YtjURAKLspbvvae2PQNR6RfOsjVfvrqoXoV+W7X61fxAKf9wgWLBl9ayXCkq302xANOsmwyhKKnN/YVaiHWRIZjlo7bnyPy7mtGJ7g7Ep16yJ0wRPnfTCO0U4VxUGZrOb1gFISaQCXyPEvGf5Ilb3+0gLYgscKhsdyzliJEPEv52eEB/B1/q5SZxXO30/DzyT8FQAj60TSZ0txCbjnFzg7lG0yOU4ut2LHCpKctLJWOaE3rirk+QGlP6ILgJRflNyTO9No6LiV6g1Z1Xmyxmzoc4c=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8eada93-7db5-4413-bef6-08d6da97b4d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 07:17:22.7418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2863
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0QcQW/RjgVwshOAaxHJBnQ8PmHankzKXccFh4sdYAY=;
 b=ZcX3KFucVetymFtVMwp2tV/iIo55N1uO6UusidSCSN9RpZMmTdk3Q06xJJHfizQ+S7tWXhr8ZTgB3P2i46NjBQ7TsBzzT1JYq1W2cFyiOe20FL+9LX7mIQavQXwXTx8H7LG1G4Y4NazeKZrnuo3Km03Xsg58p0oEfEbDO31WE9Y=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yintian.Tao@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Liu,
 Monk" <Monk.Liu@amd.com>
Content-Type: multipart/mixed; boundary="===============2062472355=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============2062472355==
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB30390AB5467D6A7080AD45C6E50B0MN2PR12MB3039namp_"

--_000_MN2PR12MB30390AB5467D6A7080AD45C6E50B0MN2PR12MB3039namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgIENocmlzdGlhbg0KDQoNCk1hbnkgdGhhbmtzIGZvciB5b3VyIHJldmlldy4NCg0KDQpUaGUg
YmFja2dyb3VuZCBpcyB0aGF0IHRoaXMgYm8gaXMgdG8gbGV0IHBzcCBsb2FkIHNvcyBhbmQgc3lz
ZHJ2IGJ1dCB1bmRlciBzcmlvdiwgc29zIGFuZCBzeXNkcnYgaXMgbG9hZGVkIGJ5IFZCSU9TIG9y
IGh5cGVydmlzb3IgZHJpdmVyLg0KDQoNClRoZSByZWFzb24gd2h5IG5vdCBsZXQgZ3Vlc3QgZHJp
dmVyIHRvIGxvYWQgaXQgdW5kZXIgU1JJT1YgaXMgdGhhdCBpdCBpcyBub3Qgc2FmZS4NCg0KDQoN
CkJlc3QgUmVnYXJkcw0KDQpZaW50aWFuIFRhbw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXw0K5Y+R5Lu25Lq6OiBLb2VuaWcsIENocmlzdGlhbg0K5Y+R6YCB5pe26Ze0OiAyMDE5
5bm0NeaciDE35pelIDE0OjUzOjM1DQrmlLbku7bkuro6IFRhbywgWWludGlhbg0K5oqE6YCBOiBM
aXUsIE1vbms7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQrkuLvpopg6IFJlOiBbUEFU
Q0hdIGRybS9hbWRncHU6IHNraXAgZncgcHJpIGJvIGFsbG9jIGZvciBTUklPVg0KDQpMb29rcyBn
b29kIHRvIG1lIG5vdywgYnV0IEkgZG9uJ3Qga25vdyB0aGUgdGVjaG5pY2FsIGJhY2tncm91bmQg
d2h5IHRoaXMNCkJPIGlzIG5vdCBuZWVkZWQgdW5kZXIgU1JJT1YuDQoNClNvIHRoaXMgcGF0Y2gg
aXMgQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4u
DQoNClJlZ2FyZHMsDQpDaHJpc3RpYW4uDQoNCkFtIDE3LjA1LjE5IHVtIDA0OjQxIHNjaHJpZWIg
VGFvLCBZaW50aWFuOg0KPiBIaSBDaHJpc3RpYW4NCj4NCj4NCj4gSSBoYXZlIG1vZGlmaWVkIGl0
IGFjY29yZGluZyB0byB5b3VyIHN1Z2dlc3Rpb24uIENhbiB5b3UgaGVscCByZXZpZXcgdGhpcyBh
Z2Fpbj8gVGhhbmtzIGluIGFkdmFuY2UuDQo+DQo+DQo+IEJlc3QgUmVnYXJkcw0KPiBZaW50aWFu
IFRhbw0KPg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBZaW50aWFuIFRh
byA8eXR0YW9AYW1kLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIE1heSAxNiwgMjAxOSA3OjU0IFBN
DQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogVGFvLCBZaW50aWFu
IDxZaW50aWFuLlRhb0BhbWQuY29tPjsgTGl1LCBNb25rIDxNb25rLkxpdUBhbWQuY29tPg0KPiBT
dWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IHNraXAgZncgcHJpIGJvIGFsbG9jIGZvciBTUklP
Vg0KPg0KPiBQU1AgZncgcHJpbWFyeSBidWZmZXIgaXMgbm90IHVzZWQgdW5kZXIgU1JJT1YuDQo+
IFRoZXJlZm9yZSwgd2UgZG9uJ3QgbmVlZCB0byBhbGxvY2F0ZSBtZW1vcnkgZm9yIGl0Lg0KPg0K
PiB2MjogcmVtb3ZlIHN1cGVyZmx1b3VzIGNoZWNrIGZvciBhbWRncHVfYm9fZnJlZV9rZXJuZWwo
KS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogWWludGlhbiBUYW8gPHl0dGFvQGFtZC5jb20+DQo+IFNp
Z25lZC1vZmYtYnk6IE1vbmsgTGl1IDxNb25rLkxpdUBhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMgfCAxNyArKysrKysrKysrLS0tLS0t
LQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0K
Pg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jDQo+IGluZGV4IGM1Njdh
NTUuLmFmOTgzNWMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9wc3AuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNw
LmMNCj4gQEAgLTkwNSwxMyArOTA1LDE2IEBAIHN0YXRpYyBpbnQgcHNwX2xvYWRfZncoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAgICAgICBpZiAoIXBzcC0+Y21kKQ0KPiAgICAgICAg
ICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4NCj4gLSAgICAgcmV0ID0gYW1kZ3B1X2JvX2NyZWF0
ZV9rZXJuZWwoYWRldiwgUFNQXzFfTUVHLCBQU1BfMV9NRUcsDQo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgQU1ER1BVX0dFTV9ET01BSU5fR1RULA0KPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwc3AtPmZ3X3ByaV9ibywNCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmcHNwLT5md19wcmlfbWNfYWRkciwNCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmcHNwLT5md19wcmlfYnVmKTsNCj4g
LSAgICAgaWYgKHJldCkNCj4gLSAgICAgICAgICAgICBnb3RvIGZhaWxlZDsNCj4gKyAgICAgLyog
dGhpcyBmdyBwcmkgYm8gaXMgbm90IHVzZWQgdW5kZXIgU1JJT1YgKi8NCj4gKyAgICAgaWYgKCFh
bWRncHVfc3Jpb3ZfdmYocHNwLT5hZGV2KSkgew0KPiArICAgICAgICAgICAgIHJldCA9IGFtZGdw
dV9ib19jcmVhdGVfa2VybmVsKGFkZXYsIFBTUF8xX01FRywgUFNQXzFfTUVHLA0KPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFNREdQVV9HRU1fRE9NQUlOX0dU
VCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmcHNwLT5m
d19wcmlfYm8sDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
JnBzcC0+ZndfcHJpX21jX2FkZHIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgJnBzcC0+ZndfcHJpX2J1Zik7DQo+ICsgICAgICAgICAgICAgaWYgKHJldCkN
Cj4gKyAgICAgICAgICAgICAgICAgICAgIGdvdG8gZmFpbGVkOw0KPiArICAgICB9DQo+DQo+ICAg
ICAgICByZXQgPSBhbWRncHVfYm9fY3JlYXRlX2tlcm5lbChhZGV2LCBQU1BfRkVOQ0VfQlVGRkVS
X1NJWkUsIFBBR0VfU0laRSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgQU1ER1BVX0dFTV9ET01BSU5fVlJBTSwNCg0K

--_000_MN2PR12MB30390AB5467D6A7080AD45C6E50B0MN2PR12MB3039namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPjwhLS0gUCB7bWFyZ2luLXRvcDowO21hcmdpbi1ib3R0b206MDt9IC0t
Pjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBkaXI9Imx0ciI+DQo8ZGl2IGlkPSJkaXZ0YWdkZWZh
dWx0d3JhcHBlciIgc3R5bGU9ImZvbnQtc2l6ZToxMnB0O2NvbG9yOiMwMDAwMDA7Zm9udC1mYW1p
bHk6Q2FsaWJyaSxIZWx2ZXRpY2Esc2Fucy1zZXJpZjsiIGRpcj0ibHRyIj4NCjxwIHN0eWxlPSJt
YXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowIj5IaSZuYnNwOyBDaHJpc3RpYW48L3A+DQo8cCBz
dHlsZT0ibWFyZ2luLXRvcDowO21hcmdpbi1ib3R0b206MCI+PGJyPg0KPC9wPg0KPHAgc3R5bGU9
Im1hcmdpbi10b3A6MDttYXJnaW4tYm90dG9tOjAiPk1hbnkgdGhhbmtzIGZvciB5b3VyIHJldmll
dy48L3A+DQo8cCBzdHlsZT0ibWFyZ2luLXRvcDowO21hcmdpbi1ib3R0b206MCI+PGJyPg0KPC9w
Pg0KPHAgc3R5bGU9Im1hcmdpbi10b3A6MDttYXJnaW4tYm90dG9tOjAiPlRoZSBiYWNrZ3JvdW5k
IGlzIHRoYXQgdGhpcyBibyBpcyB0byBsZXQgcHNwIGxvYWQgc29zIGFuZCBzeXNkcnYgYnV0IHVu
ZGVyIHNyaW92LCBzb3MgYW5kIHN5c2RydiBpcyBsb2FkZWQgYnkgVkJJT1Mgb3IgaHlwZXJ2aXNv
ciBkcml2ZXIuPC9wPg0KPHAgc3R5bGU9Im1hcmdpbi10b3A6MDttYXJnaW4tYm90dG9tOjAiPjxi
cj4NCjwvcD4NCjxwIHN0eWxlPSJtYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowIj5UaGUgcmVh
c29uIHdoeSBub3QgbGV0IGd1ZXN0IGRyaXZlciB0byBsb2FkIGl0IHVuZGVyIFNSSU9WIGlzIHRo
YXQgaXQgaXMgbm90IHNhZmUuPC9wPg0KPHAgc3R5bGU9Im1hcmdpbi10b3A6MDttYXJnaW4tYm90
dG9tOjAiPjxicj4NCjwvcD4NCjxwIHN0eWxlPSJtYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTow
Ij48YnI+DQo8L3A+DQo8cCBzdHlsZT0ibWFyZ2luLXRvcDowO21hcmdpbi1ib3R0b206MCI+QmVz
dCBSZWdhcmRzPC9wPg0KPHAgc3R5bGU9Im1hcmdpbi10b3A6MDttYXJnaW4tYm90dG9tOjAiPllp
bnRpYW4gVGFvPC9wPg0KPC9kaXY+DQo8aHIgc3R5bGU9ImRpc3BsYXk6aW5saW5lLWJsb2NrO3dp
ZHRoOjk4JSIgdGFiaW5kZXg9Ii0xIj4NCjxkaXYgaWQ9ImRpdlJwbHlGd2RNc2ciIGRpcj0ibHRy
Ij48Zm9udCBmYWNlPSJDYWxpYnJpLCBzYW5zLXNlcmlmIiBzdHlsZT0iZm9udC1zaXplOjExcHQi
IGNvbG9yPSIjMDAwMDAwIj48Yj7lj5Hku7bkuro6PC9iPiBLb2VuaWcsIENocmlzdGlhbjxicj4N
CjxiPuWPkemAgeaXtumXtDo8L2I+IDIwMTnlubQ15pyIMTfml6UgMTQ6NTM6MzU8YnI+DQo8Yj7m
lLbku7bkuro6PC9iPiBUYW8sIFlpbnRpYW48YnI+DQo8Yj7mioTpgIE6PC9iPiBMaXUsIE1vbms7
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPGJyPg0KPGI+5Li76aKYOjwvYj4gUmU6IFtQ
QVRDSF0gZHJtL2FtZGdwdTogc2tpcCBmdyBwcmkgYm8gYWxsb2MgZm9yIFNSSU9WPC9mb250Pg0K
PGRpdj4mbmJzcDs8L2Rpdj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0iQm9keUZyYWdtZW50Ij48Zm9u
dCBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4NCjxkaXYgY2xhc3M9IlBs
YWluVGV4dCI+TG9va3MgZ29vZCB0byBtZSBub3csIGJ1dCBJIGRvbid0IGtub3cgdGhlIHRlY2hu
aWNhbCBiYWNrZ3JvdW5kIHdoeSB0aGlzDQo8YnI+DQpCTyBpcyBub3QgbmVlZGVkIHVuZGVyIFNS
SU9WLjxicj4NCjxicj4NClNvIHRoaXMgcGF0Y2ggaXMgQWNrZWQtYnk6IENocmlzdGlhbiBLw7Zu
aWcgJmx0O2NocmlzdGlhbi5rb2VuaWdAYW1kLmNvbSZndDsuPGJyPg0KPGJyPg0KUmVnYXJkcyw8
YnI+DQpDaHJpc3RpYW4uPGJyPg0KPGJyPg0KQW0gMTcuMDUuMTkgdW0gMDQ6NDEgc2NocmllYiBU
YW8sIFlpbnRpYW46PGJyPg0KJmd0OyBIaSBDaHJpc3RpYW48YnI+DQomZ3Q7PGJyPg0KJmd0Ozxi
cj4NCiZndDsgSSBoYXZlIG1vZGlmaWVkIGl0IGFjY29yZGluZyB0byB5b3VyIHN1Z2dlc3Rpb24u
IENhbiB5b3UgaGVscCByZXZpZXcgdGhpcyBhZ2Fpbj8gVGhhbmtzIGluIGFkdmFuY2UuPGJyPg0K
Jmd0Ozxicj4NCiZndDs8YnI+DQomZ3Q7IEJlc3QgUmVnYXJkczxicj4NCiZndDsgWWludGlhbiBU
YW88YnI+DQomZ3Q7PGJyPg0KJmd0OyAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLTxicj4NCiZn
dDsgRnJvbTogWWludGlhbiBUYW8gJmx0O3l0dGFvQGFtZC5jb20mZ3Q7PGJyPg0KJmd0OyBTZW50
OiBUaHVyc2RheSwgTWF5IDE2LCAyMDE5IDc6NTQgUE08YnI+DQomZ3Q7IFRvOiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzxicj4NCiZndDsgQ2M6IFRhbywgWWludGlhbiAmbHQ7WWludGlh
bi5UYW9AYW1kLmNvbSZndDs7IExpdSwgTW9uayAmbHQ7TW9uay5MaXVAYW1kLmNvbSZndDs8YnI+
DQomZ3Q7IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdTogc2tpcCBmdyBwcmkgYm8gYWxsb2Mg
Zm9yIFNSSU9WPGJyPg0KJmd0Ozxicj4NCiZndDsgUFNQIGZ3IHByaW1hcnkgYnVmZmVyIGlzIG5v
dCB1c2VkIHVuZGVyIFNSSU9WLjxicj4NCiZndDsgVGhlcmVmb3JlLCB3ZSBkb24ndCBuZWVkIHRv
IGFsbG9jYXRlIG1lbW9yeSBmb3IgaXQuPGJyPg0KJmd0Ozxicj4NCiZndDsgdjI6IHJlbW92ZSBz
dXBlcmZsdW91cyBjaGVjayBmb3IgYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCkuPGJyPg0KJmd0Ozxi
cj4NCiZndDsgU2lnbmVkLW9mZi1ieTogWWludGlhbiBUYW8gJmx0O3l0dGFvQGFtZC5jb20mZ3Q7
PGJyPg0KJmd0OyBTaWduZWQtb2ZmLWJ5OiBNb25rIExpdSAmbHQ7TW9uay5MaXVAYW1kLmNvbSZn
dDs8YnI+DQomZ3Q7IC0tLTxicj4NCiZndDsmbmJzcDsmbmJzcDsgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3BzcC5jIHwgMTcgJiM0MzsmIzQzOyYjNDM7JiM0MzsmIzQzOyYjNDM7
JiM0MzsmIzQzOyYjNDM7JiM0MzstLS0tLS0tPGJyPg0KJmd0OyZuYnNwOyZuYnNwOyAxIGZpbGUg
Y2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygmIzQzOyksIDcgZGVsZXRpb25zKC0pPGJyPg0KJmd0Ozxi
cj4NCiZndDsgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9w
c3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYzxicj4NCiZndDsg
aW5kZXggYzU2N2E1NS4uYWY5ODM1YyAxMDA2NDQ8YnI+DQomZ3Q7IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYzxicj4NCiZndDsgJiM0MzsmIzQzOyYjNDM7IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jPGJyPg0KJmd0OyBAQCAtOTA1
LDEzICYjNDM7OTA1LDE2IEBAIHN0YXRpYyBpbnQgcHNwX2xvYWRfZncoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpPGJyPg0KJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyBpZiAoIXBzcC0mZ3Q7Y21kKTxicj4NCiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsgcmV0dXJuIC1FTk9NRU07PGJyPg0KJmd0OyZuYnNwOyZuYnNwOyA8YnI+DQom
Z3Q7IC0mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgcmV0ID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJu
ZWwoYWRldiwgUFNQXzFfTUVHLCBQU1BfMV9NRUcsPGJyPg0KJmd0OyAtJm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IEFNREdQVV9HRU1fRE9NQUlOX0dUVCw8YnI+
DQomZ3Q7IC0mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgJmFt
cDtwc3AtJmd0O2Z3X3ByaV9ibyw8YnI+DQomZ3Q7IC0mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsgJmFtcDtwc3AtJmd0O2Z3X3ByaV9tY19hZGRyLDxicj4NCiZn
dDsgLSZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAmYW1wO3Bz
cC0mZ3Q7ZndfcHJpX2J1Zik7PGJyPg0KJmd0OyAtJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGlm
IChyZXQpPGJyPg0KJmd0OyAtJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGdvdG8gZmFpbGVkOzxicj4NCiZndDsg
JiM0MzsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgLyogdGhpcyBmdyBwcmkgYm8gaXMgbm90IHVz
ZWQgdW5kZXIgU1JJT1YgKi88YnI+DQomZ3Q7ICYjNDM7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
IGlmICghYW1kZ3B1X3NyaW92X3ZmKHBzcC0mZ3Q7YWRldikpIHs8YnI+DQomZ3Q7ICYjNDM7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7IHJldCA9IGFtZGdwdV9ib19jcmVhdGVfa2VybmVsKGFkZXYsIFBTUF8xX01F
RywgUFNQXzFfTUVHLDxicj4NCiZndDsgJiM0MzsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgQU1E
R1BVX0dFTV9ET01BSU5fR1RULDxicj4NCiZndDsgJiM0MzsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsgJmFtcDtwc3AtJmd0O2Z3X3ByaV9ibyw8YnI+DQomZ3Q7ICYjNDM7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7ICZhbXA7cHNwLSZndDtmd19wcmlfbWNfYWRkciw8YnI+DQomZ3Q7ICYjNDM7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICZhbXA7cHNwLSZndDtmd19wcmlfYnVmKTs8YnI+DQomZ3Q7
ICYjNDM7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGlmIChyZXQpPGJyPg0KJmd0OyAmIzQzOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBnb3Rv
IGZhaWxlZDs8YnI+DQomZ3Q7ICYjNDM7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IH08YnI+DQom
Z3Q7Jm5ic3A7Jm5ic3A7IDxicj4NCiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsgcmV0ID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWwoYWRldiwgUFNQX0ZFTkNF
X0JVRkZFUl9TSVpFLCBQQUdFX1NJWkUsPGJyPg0KJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBBTURHUFVfR0VNX0RPTUFJ
Tl9WUkFNLDxicj4NCjxicj4NCjwvZGl2Pg0KPC9zcGFuPjwvZm9udD48L2Rpdj4NCjwvYm9keT4N
CjwvaHRtbD4NCg==

--_000_MN2PR12MB30390AB5467D6A7080AD45C6E50B0MN2PR12MB3039namp_--

--===============2062472355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============2062472355==--
