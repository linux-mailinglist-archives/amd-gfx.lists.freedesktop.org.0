Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AC22D3FC
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 04:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C836E063;
	Wed, 29 May 2019 02:51:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780055.outbound.protection.outlook.com [40.107.78.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535616E063
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 May 2019 02:51:46 +0000 (UTC)
Received: from MWHPR12MB1326.namprd12.prod.outlook.com (10.169.205.19) by
 MWHPR12MB1632.namprd12.prod.outlook.com (10.172.56.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Wed, 29 May 2019 02:51:43 +0000
Received: from MWHPR12MB1326.namprd12.prod.outlook.com
 ([fe80::2c1a:62f0:b1bd:74d7]) by MWHPR12MB1326.namprd12.prod.outlook.com
 ([fe80::2c1a:62f0:b1bd:74d7%2]) with mapi id 15.20.1922.021; Wed, 29 May 2019
 02:51:43 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu:Fix the unpin warning about csb buffer
Thread-Topic: [PATCH] drm/amdgpu:Fix the unpin warning about csb buffer
Thread-Index: AQHVFSxBYHqsgoR6uEW/oFZToTLUWqaAUbTQgAEWydA=
Date: Wed, 29 May 2019 02:51:43 +0000
Message-ID: <MWHPR12MB1326C5856A40BB52D1BC34508F1F0@MWHPR12MB1326.namprd12.prod.outlook.com>
References: <1559030775-19612-1-git-send-email-Emily.Deng@amd.com>
 <MWHPR12MB1326361E2C7ADE7523E3E7D48F1E0@MWHPR12MB1326.namprd12.prod.outlook.com>
In-Reply-To: <MWHPR12MB1326361E2C7ADE7523E3E7D48F1E0@MWHPR12MB1326.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef8367cd-984c-4f0e-a3a0-08d6e3e0956d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1632; 
x-ms-traffictypediagnostic: MWHPR12MB1632:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR12MB16328034DA26803736E755058F1F0@MWHPR12MB1632.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0052308DC6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(346002)(376002)(396003)(39860400002)(189003)(199004)(13464003)(14444005)(256004)(5660300002)(9686003)(81156014)(2351001)(316002)(6246003)(64756008)(66476007)(66446008)(66946007)(73956011)(33656002)(66556008)(14454004)(446003)(53936002)(72206003)(486006)(26005)(76116006)(476003)(11346002)(52536014)(478600001)(2501003)(5640700003)(71190400001)(8936002)(6916009)(68736007)(66066001)(74316002)(7736002)(305945005)(229853002)(8676002)(81166006)(55016002)(25786009)(102836004)(6506007)(6306002)(6116002)(2906002)(3846002)(6436002)(76176011)(99286004)(7696005)(86362001)(186003)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1632;
 H:MWHPR12MB1326.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Pv4Cg0QC749w8IpsslEFZ6NdpmfSh11laj4g3xpTed6E9MBGWAlhN5zrvFyT250+anE6js43MzOEa04nqAwI/GLsXVy9T3nTKBbcTwThSxZfEXGOGvucOeuPzw3zLB2n+XlbIcSyntEQ4L0I2SezZfszpt6VweF7Uh8fPkSZvEXr6fj/E10kMWCi8gBOdwRdU8u29DVkybXGjbEtINJKF20h3/xkw7qKbj7xB64rxw/UnPw/K1O9hQagBjInou6Vn5RV0SpdMHL2NHGLNt6Om1V8nm94fecCjSKwFhOcc55vBGXKvRUYW2c7Q59qxy80iDG1W28cwC8hUg0XgBkCbuoYlesSnohazZ9OL6CmRKWLZyQZnbZIJ4wg8o9BCgcOAOyDGYm31IKTu15jwN6FSo3jT1eQikanDTCboMu+1sI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8367cd-984c-4f0e-a3a0-08d6e3e0956d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 02:51:43.6962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jqdeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1632
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcld30KX45WIUigCnlcUUS//tvIYP6bM/SBv270aOZU=;
 b=lxRtoLzvzmm+6/5X8AWaQAWptRKOfa9ypLakQJ/END4lZKHlSO7cEgg48hVF5GmulJjONcAPGah47sYLwl+zURVZpH7TwIIIZYnRNpo5VK2a3qUyLB5krQga0AoLuebDGBB6jrVlqnnc5ZqhdygPvCRe40ZMmmXdVJ73FrIeyck=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGluZy4uLi4uLg0KDQpCZXN0IHdpc2hlcw0KRW1pbHkgRGVuZw0KDQoNCg0KPi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogRGVuZywgRW1pbHkgPEVtaWx5LkRlbmdAYW1kLmNvbT4N
Cj5TZW50OiBUdWVzZGF5LCBNYXkgMjgsIDIwMTkgNjoxNCBQTQ0KPlRvOiBEZW5nLCBFbWlseSA8
RW1pbHkuRGVuZ0BhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj5TdWJq
ZWN0OiBSRTogW1BBVENIXSBkcm0vYW1kZ3B1OkZpeCB0aGUgdW5waW4gd2FybmluZyBhYm91dCBj
c2IgYnVmZmVyDQo+DQo+UGluZyAuLi4uLi4NCj4NCj5CZXN0IHdpc2hlcw0KPkVtaWx5IERlbmcN
Cj4NCj4NCj4NCj4+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+RnJvbTogYW1kLWdmeCA8
YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+PkVt
aWx5IERlbmcNCj4+U2VudDogVHVlc2RheSwgTWF5IDI4LCAyMDE5IDQ6MDYgUE0NCj4+VG86IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PkNjOiBEZW5nLCBFbWlseSA8RW1pbHkuRGVu
Z0BhbWQuY29tPg0KPj5TdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6Rml4IHRoZSB1bnBpbiB3
YXJuaW5nIGFib3V0IGNzYiBidWZmZXINCj4+DQo+PkFzIGl0IHdpbGwgZGVzdHJveSBjbGVhcl9z
dGF0ZV9vYmosIGFuZCBhbHNvIHdpbGwgdW5waW4gaXQgaW4gdGhlDQo+PmdmeF92OV8wX3N3X2Zp
bmksIHNvIGRvbid0IG5lZWQgdG8gY2FsbCBhbWRncHVfYm9fZnJlZV9rZXJuZWwgaW4NCj4+Z2Z4
X3Y5XzBfc3dfZmluaSwgb3IgaXQgd2lsbCBoYXZlIHVucGluIHdhcm5pbmcuDQo+Pg0KPj5TaWdu
ZWQtb2ZmLWJ5OiBFbWlseSBEZW5nIDxFbWlseS5EZW5nQGFtZC5jb20+DQo+Pi0tLQ0KPj4gZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyB8IDQgKy0tLQ0KPj4gMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4NCj4+ZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCj4+Yi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+PmluZGV4IGM3NjM3MzMuLmNjNWEzODIgMTAwNjQ0
DQo+Pi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCj4+KysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KPj5AQCAtMTc5NCw5ICsxNzk0
LDcgQEAgc3RhdGljIGludCBnZnhfdjlfMF9zd19maW5pKHZvaWQgKmhhbmRsZSkNCj4+DQo+PiAJ
Z2Z4X3Y5XzBfbWVjX2ZpbmkoYWRldik7DQo+PiAJZ2Z4X3Y5XzBfbmdnX2ZpbmkoYWRldik7DQo+
Pi0JYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaiwN
Cj4+LQkJCQkmYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9ncHVfYWRkciwNCj4+LQkJCQkodm9p
ZCAqKikmYWRldi0+Z2Z4LnJsYy5jc19wdHIpOw0KPj4rCWFtZGdwdV9ib191bnJlZigmYWRldi0+
Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmopOw0KPj4gCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJ
UF9SQVZFTikgew0KPj4gCQlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJmFkZXYtPmdmeC5ybGMuY3Bf
dGFibGVfb2JqLA0KPj4gCQkJCSZhZGV2LT5nZngucmxjLmNwX3RhYmxlX2dwdV9hZGRyLA0KPj4t
LQ0KPj4yLjcuNA0KPj4NCj4+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCj4+YW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4+YW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4+aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
