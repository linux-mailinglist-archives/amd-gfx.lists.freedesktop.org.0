Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FB0A38BC
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 16:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83F08936C;
	Fri, 30 Aug 2019 14:03:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800057.outbound.protection.outlook.com [40.107.80.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98328936C
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 14:03:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYFo4RTajOrEqjuMON89pOqd2Nl55x2U6PiFtLSeCW0zjwzJ4dwWraz1BGuLlpN9gIUhwFu+TXueVecFZGN3t5iitKA4XYyMgXgTyaO6DsqN6Nmww/e8yP3zZXGZraibuP2yH18TVp+oCzRjw6iCB9H/oeniYvS+9vEklQ3B7197IhHtpwj3RB+BX24rde1o96ZrSKIL5qalwYb7EzgMz4evJBiEXaHx6Z+puf+EmPn299Zol4zm+jUTPVuppAOGSWHaKVSEHLCSlD7+VyU2PdKoiCjOuoUCmSkeaYPATNistqByQNy8o/4yYDo3MkT7bA1gcaHFpNI9npmdKGb9Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InIXxk/6AjrVsmBPiXQHWV7th0qvtsVGm+ikJOPVTXc=;
 b=Waj2VY218SUnuPL5qXNUN+h6nODJ5GczCtor2RGJU9M2PF7/0ZflkfJakVS82vgcQ21yBj592I5lghBJiG0PsirATz7Bg0I0s83eg3CvrNuYMR56HN5jzm9q2SDW+NYbGSZC+z3zFUZEgql1Q6SeOFj+HFVjxoYhqFwr6+oksfk/WjEXdoVFioSPqCCGQruJ4AUEZVK7oVuO/GwLK0vhIpCgvAZJrxoDlhs+D/XMeEJXnxWfRCTw6UQ/YQSBP0ZNjPv82283uH234Q9FAKvd1ZL7vdrM0ShbuQpBrzo6mWvBF3TAqCl44LiEoZuT0JPDm5fkJ+gZvDaVSfVyQiMslA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1695.namprd12.prod.outlook.com (10.172.55.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Fri, 30 Aug 2019 14:03:19 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::4047:39c1:ac17:3813]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::4047:39c1:ac17:3813%6]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 14:03:19 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Chen, Guchun" <Guchun.Chen@amd.com>, "Li,
 Dennis" <Dennis.Li@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: Re: [PATCH 4/4] drm/amdgpu: move the call of ras recovery_init and
 bad page reserve to proper place
Thread-Topic: [PATCH 4/4] drm/amdgpu: move the call of ras recovery_init and
 bad page reserve to proper place
Thread-Index: AQHVXy4RdwveBREoO0muGWcI0SWLfKcTuPuA
Date: Fri, 30 Aug 2019 14:03:19 +0000
Message-ID: <d70f5672-2d8e-8efe-7b08-9df1c87f98ba@amd.com>
References: <20190830122453.19703-1-tao.zhou1@amd.com>
 <20190830122453.19703-5-tao.zhou1@amd.com>
In-Reply-To: <20190830122453.19703-5-tao.zhou1@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::15) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 396d2e08-4b1d-4a28-93da-08d72d52cfdc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1695; 
x-ms-traffictypediagnostic: MWHPR12MB1695:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB169525C0377AFB018A167B25EABD0@MWHPR12MB1695.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(199004)(189003)(5660300002)(31696002)(6636002)(53936002)(86362001)(66066001)(11346002)(14444005)(6436002)(7736002)(256004)(102836004)(25786009)(8676002)(476003)(66476007)(66556008)(64756008)(81156014)(2616005)(186003)(66446008)(81166006)(446003)(66946007)(26005)(2501003)(52116002)(229853002)(76176011)(6486002)(14454004)(478600001)(6506007)(71190400001)(386003)(486006)(53546011)(99286004)(316002)(305945005)(110136005)(2906002)(36756003)(31686004)(8936002)(3846002)(6246003)(6116002)(71200400001)(6512007)(79990200002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1695;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ylmGN8qB3hRA6J12vgmkD8VE6XNKhsa8xQpvisWWH2Mf8Nz3mB7CpGpF8zxf4sOukz9WH5l0ByplwVrXO214kkSV+5lkn4UokFq3J1pHPu1Ci/vqxRQOoQRJ76EDUI8dFEzO47J0NY1VHblkOT43P2c8TDc4d06I8lqXJmiIuExRJUmLbeWv98dFGgRS/qUbsw20E0+lPGlZSRw0kftVHjvQrlRYJNstx8l5nI4QC9MGGPohfD0GNIpchJ0PCnytp6Ixotlw8MDjw86jYp+kMamB9wVMPrPsSSNtiUJ88bbMGpRt5CS5MHA9CmKrVvZ5YemytcSi6s6ENejJlaZq33CQR5h3S+99oDv+ocqmuHa8UuTZH9/0sEzFd19bG5KQxamjumZpRL1Y8htdKxJqdfWD3/WgLy6JxIsvLG5Ka7Esc+cqvw00h84EsF5HEM1qADuOoguV1XMGS5jYWX2eTA==
Content-ID: <A327ACEBE9C0F04CA3D5BBDE34FF57FE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 396d2e08-4b1d-4a28-93da-08d72d52cfdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 14:03:19.5721 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8sB8eqoZJb+G3oEvLKijK6AhdagIhEGgkYUz8D4KM0azsPJoIE32PfXLbqQE0tD301aKWCYLIN5GXlI0f7m86Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1695
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InIXxk/6AjrVsmBPiXQHWV7th0qvtsVGm+ikJOPVTXc=;
 b=mA/tHcvAktv+np4NevPMfN/gtXOca5jhiJX8Gs3eEEYT7hV+81bEoEZo2rdpFUHo7TymRijEmg02aNy1hIQM6YAv+aZMUX84EONcnSwqSDtpj3GENOu6BAdWF5SS9ZTEbdScQBnGpq637FLc5UrsoALhCEm5MtNYA8iaT8XiWss=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpPbiA4LzMwLzE5IDg6MjQgQU0sIFRhbyBaaG91IHdyb3RlOg0KPiByYXMgcmVjb3ZlcnlfaW5p
dCBzaG91bGQgYmUgY2FsbGVkIGFmdGVyIHR0bSBhbmQgc211IGluaXQsDQo+IGJhZCBwYWdlIHJl
c2VydmUgc2hvdWxkIGJlIHB1dCBpbiBmcm9udCBvZiBncHUgcmVzZXQgc2luY2UgaTJjDQo+IG1h
eSBiZSB1bnN0YWJsZSBkdXJpbmcgZ3B1IHJlc2V0DQo+IGFkZCBjbGVhbnVwIGZvciByZWNvdmVy
eV9pbml0IGFuZCByZWNvdmVyeV9maW5pDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0
YW8uemhvdTFAYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RldmljZS5jIHwgMTYgKysrKysrKysrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyAgICB8IDI4ICsrKysrKysrKysrKystLS0tLS0tLS0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmggICAgfCAgNSArKysrDQo+
ICAgMyBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkNCj4N
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2Uu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPiBpbmRleCA2
N2IwOWNiMmE5ZTIuLjRlNDg5NWFjOTI2ZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPiBAQCAtMjg5NCw2ICsyODk0LDE3IEBAIGludCBhbWRn
cHVfZGV2aWNlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAgCQlnb3RvIGZh
aWxlZDsNCj4gICAJfQ0KPiAgIA0KPiArCS8qIHJldGlyZWQgcGFnZXMgd2lsbCBiZSBsb2FkZWQg
ZnJvbSBlZXByb20gYW5kIHJlc2VydmVkIGhlcmUsDQo+ICsJICogbmV3IGJvIG1heSBiZSBjcmVh
dGVkLCBpdCBzaG91bGQgYmUgY2FsbGVkIGFmdGVyIHR0bSBpbml0LA0KPiArCSAqIGFjY2Vzc2lu
ZyBlZXByb20gYWxzbyByZWxpZXMgb24gc211ICh1bmxvY2sgaTJjIGJ1cykgYW5kIGl0DQo+ICsJ
ICogc2hvdWxkIGJlIGNhbGxlZCBhZnRlciBzbXUgaW5pdA0KPiArCSAqDQo+ICsJICogTm90ZTog
dGhlb3JldGljYWxseSwgdGhpcyBzaG91bGQgYmUgY2FsbGVkIGJlZm9yZSBhbGwgdnJhbSBhbGxv
Y2F0aW9ucw0KPiArCSAqIHRvIHByb3RlY3QgcmV0aXJlZCBwYWdlIGZyb20gYWJ1c2luZywgYnV0
IHRoZXJlIGFyZSBzb21lIGFsbG9jYXRpb25zDQo+ICsJICogaW4gZnJvbnQgb2Ygc211IGZ3IGxv
YWRpbmcNCj4gKwkgKi8NCj4gKwlhbWRncHVfcmFzX3JlY292ZXJ5X2luaXQoYWRldik7DQoNCg0K
WW91IHByb2JhYmx5IHNob3VsZCBjaGVjayBmb3IgcmV0dXJuIHZhbHVlIGhlcmUuDQoNCg0KPiAr
DQo+ICAgCS8qIG11c3Qgc3VjY2VlZC4gKi8NCj4gICAJYW1kZ3B1X3Jhc19yZXN1bWUoYWRldik7
DQo+ICAgDQo+IEBAIC0zNjI3LDExICszNjM4LDYgQEAgc3RhdGljIGludCBhbWRncHVfZG9fYXNp
Y19yZXNldChzdHJ1Y3QgYW1kZ3B1X2hpdmVfaW5mbyAqaGl2ZSwNCj4gICAJCQkJCQlicmVhazsN
Cj4gICAJCQkJfQ0KPiAgIAkJCX0NCj4gLQ0KPiAtCQkJbGlzdF9mb3JfZWFjaF9lbnRyeSh0bXBf
YWRldiwgZGV2aWNlX2xpc3RfaGFuZGxlLA0KPiAtCQkJCQlnbWMueGdtaS5oZWFkKSB7DQo+IC0J
CQkJYW1kZ3B1X3Jhc19yZXNlcnZlX2JhZF9wYWdlcyh0bXBfYWRldik7DQo+IC0JCQl9DQo+ICAg
CQl9DQo+ICAgCX0NCj4gICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMu
Yw0KPiBpbmRleCAwMjEyMGFhM2NiNWQuLmFkNjdhMTA5MTIyZiAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KPiBAQCAtMTQ3NywxNCArMTQ3NywxMyBAQCBz
dGF0aWMgaW50IGFtZGdwdV9yYXNfcmVsZWFzZV9iYWRfcGFnZXMoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpDQo+ICAgCXJldHVybiAwOw0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyBpbnQgYW1k
Z3B1X3Jhc19yZWNvdmVyeV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAraW50
IGFtZGdwdV9yYXNfcmVjb3ZlcnlfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4g
ICB7DQo+ICAgCXN0cnVjdCBhbWRncHVfcmFzICpjb24gPSBhbWRncHVfcmFzX2dldF9jb250ZXh0
KGFkZXYpOw0KPiAgIAlzdHJ1Y3QgcmFzX2Vycl9oYW5kbGVyX2RhdGEgKipkYXRhID0gJmNvbi0+
ZWhfZGF0YTsNCj4gICAJaW50IHJldDsNCj4gICANCj4gLQkqZGF0YSA9IGttYWxsb2Moc2l6ZW9m
KCoqZGF0YSksDQo+IC0JCQlHRlBfS0VSTkVMfF9fR0ZQX1pFUk8pOw0KPiArCSpkYXRhID0ga21h
bGxvYyhzaXplb2YoKipkYXRhKSwgR0ZQX0tFUk5FTCB8IF9fR0ZQX1pFUk8pOw0KPiAgIAlpZiAo
ISpkYXRhKQ0KPiAgIAkJcmV0dXJuIC1FTk9NRU07DQo+ICAgDQo+IEBAIC0xNDk1LDE4ICsxNDk0
LDI5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Jhc19yZWNvdmVyeV9pbml0KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQ0KPiAgIA0KPiAgIAlyZXQgPSBhbWRncHVfcmFzX2VlcHJvbV9pbml0KCZh
ZGV2LT5wc3AucmFzLnJhcy0+ZWVwcm9tX2NvbnRyb2wpOw0KPiAgIAlpZiAocmV0KQ0KPiAtCQly
ZXR1cm4gcmV0Ow0KPiArCQlnb3RvIGNhbmNlbF93b3JrOw0KDQoNCldoeSB5b3UgbmVlZCBkbyBn
byB0byBjYW5jZWxfd29ya19zeW5jKCZjb24tPnJlY292ZXJ5X3dvcmspIGF0IHN1Y2ggDQplYXJs
eSBzdGFnZSBvZiBkZXZpY2UgaW5pdCwgaXMgUkFTIGFjdGl2ZSBhbHJlYWR5IGJ5IHRoaXMgdGlt
ZSBhbmQgUkFTIA0KaW50ZXJydXB0IG1pZ2h0IGZpcmUgdHJpZ2dlcmluZyByZXNldMKgID8NCg0K
QW5kcmV5DQoNCg0KPiAgIA0KPiAgIAlpZiAoYWRldi0+cHNwLnJhcy5yYXMtPmVlcHJvbV9jb250
cm9sLm51bV9yZWNzKSB7DQo+ICAgCQlyZXQgPSBhbWRncHVfcmFzX2xvYWRfYmFkX3BhZ2VzKGFk
ZXYpOw0KPiAgIAkJaWYgKHJldCkNCj4gLQkJCXJldHVybiByZXQ7DQo+ICsJCQlnb3RvIGNhbmNl
bF93b3JrOw0KPiAgIAkJcmV0ID0gYW1kZ3B1X3Jhc19yZXNlcnZlX2JhZF9wYWdlcyhhZGV2KTsN
Cj4gICAJCWlmIChyZXQpDQo+IC0JCQlyZXR1cm4gcmV0Ow0KPiArCQkJZ290byByZWxlYXNlOw0K
PiAgIAl9DQo+ICAgDQo+ICAgCXJldHVybiAwOw0KPiArDQo+ICtyZWxlYXNlOg0KPiArCWFtZGdw
dV9yYXNfcmVsZWFzZV9iYWRfcGFnZXMoYWRldik7DQo+ICtjYW5jZWxfd29yazoNCj4gKwljYW5j
ZWxfd29ya19zeW5jKCZjb24tPnJlY292ZXJ5X3dvcmspOw0KPiArCWNvbi0+ZWhfZGF0YSA9IE5V
TEw7DQo+ICsJa2ZyZWUoKCpkYXRhKS0+YnBzKTsNCj4gKwlrZnJlZSgoKmRhdGEpLT5icHNfYm8p
Ow0KPiArCWtmcmVlKCpkYXRhKTsNCj4gKw0KPiArCXJldHVybiByZXQ7DQo+ICAgfQ0KPiAgIA0K
PiAgIHN0YXRpYyBpbnQgYW1kZ3B1X3Jhc19yZWNvdmVyeV9maW5pKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQ0KPiBAQCAtMTUyMCw2ICsxNTMwLDcgQEAgc3RhdGljIGludCBhbWRncHVfcmFz
X3JlY292ZXJ5X2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAgCW11dGV4X2xv
Y2soJmNvbi0+cmVjb3ZlcnlfbG9jayk7DQo+ICAgCWNvbi0+ZWhfZGF0YSA9IE5VTEw7DQo+ICAg
CWtmcmVlKGRhdGEtPmJwcyk7DQo+ICsJa2ZyZWUoZGF0YS0+YnBzX2JvKTsNCj4gICAJa2ZyZWUo
ZGF0YSk7DQo+ICAgCW11dGV4X3VubG9jaygmY29uLT5yZWNvdmVyeV9sb2NrKTsNCj4gICANCj4g
QEAgLTE2MTEsOSArMTYyMiw2IEBAIGludCBhbWRncHVfcmFzX2luaXQoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpDQo+ICAgCQkJcmV0dXJuIHI7DQo+ICAgCX0NCj4gICANCj4gLQlpZiAoYW1k
Z3B1X3Jhc19yZWNvdmVyeV9pbml0KGFkZXYpKQ0KPiAtCQlnb3RvIHJlY292ZXJ5X291dDsNCj4g
LQ0KPiAgIAlhbWRncHVfcmFzX21hc2sgJj0gQU1ER1BVX1JBU19CTE9DS19NQVNLOw0KPiAgIA0K
PiAgIAlpZiAoYW1kZ3B1X3Jhc19mc19pbml0KGFkZXYpKQ0KPiBAQCAtMTYyOCw4ICsxNjM2LDYg
QEAgaW50IGFtZGdwdV9yYXNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gICAJ
CQljb24tPmh3X3N1cHBvcnRlZCwgY29uLT5zdXBwb3J0ZWQpOw0KPiAgIAlyZXR1cm4gMDsNCj4g
ICBmc19vdXQ6DQo+IC0JYW1kZ3B1X3Jhc19yZWNvdmVyeV9maW5pKGFkZXYpOw0KPiAtcmVjb3Zl
cnlfb3V0Og0KPiAgIAlhbWRncHVfcmFzX3NldF9jb250ZXh0KGFkZXYsIE5VTEwpOw0KPiAgIAlr
ZnJlZShjb24pOw0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Jhcy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5o
DQo+IGluZGV4IDQyZTFkMzc5ZTIxYy4uNmQwMGY3OWI2MTJiIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oDQo+IEBAIC00ODAsNiArNDgwLDcgQEAgc3RhdGlj
IGlubGluZSBpbnQgYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsDQo+ICAgCXJldHVybiByYXMgJiYgKHJhcy0+c3VwcG9ydGVkICYgKDEgPDwgYmxvY2sp
KTsNCj4gICB9DQo+ICAgDQo+ICtpbnQgYW1kZ3B1X3Jhc19yZWNvdmVyeV9pbml0KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KTsNCj4gICBpbnQgYW1kZ3B1X3Jhc19yZXF1ZXN0X3Jlc2V0X29u
X2Jvb3Qoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAgCQl1bnNpZ25lZCBpbnQgYmxv
Y2spOw0KPiAgIA0KPiBAQCAtNTAwLDYgKzUwMSwxMCBAQCBzdGF0aWMgaW5saW5lIGludCBhbWRn
cHVfcmFzX3Jlc2V0X2dwdShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gICB7DQo+ICAg
CXN0cnVjdCBhbWRncHVfcmFzICpyYXMgPSBhbWRncHVfcmFzX2dldF9jb250ZXh0KGFkZXYpOw0K
PiAgIA0KPiArCS8qIHNhdmUgYmFkIHBhZ2UgdG8gZWVwcm9tIGJlZm9yZSBncHUgcmVzZXQsDQo+
ICsJICogaTJjIG1heSBiZSB1bnN0YWJsZSBpbiBncHUgcmVzZXQNCj4gKwkgKi8NCj4gKwlhbWRn
cHVfcmFzX3Jlc2VydmVfYmFkX3BhZ2VzKGFkZXYpOw0KPiAgIAlpZiAoYXRvbWljX2NtcHhjaGco
JnJhcy0+aW5fcmVjb3ZlcnksIDAsIDEpID09IDApDQo+ICAgCQlzY2hlZHVsZV93b3JrKCZyYXMt
PnJlY292ZXJ5X3dvcmspOw0KPiAgIAlyZXR1cm4gMDsNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
