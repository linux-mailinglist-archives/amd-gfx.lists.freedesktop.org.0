Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0F8A75C1
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 22:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29DB89B61;
	Tue,  3 Sep 2019 20:55:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820058.outbound.protection.outlook.com [40.107.82.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA57889B61
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 20:55:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mw8xqAEn40VX6U0wQJ1XZ+sdZSFuUOv6xFbZWF5Fe9f1e1vQuPhYxlvpDnJvl6llapclBATjSnGWlPlzeBT38VSh+fDckSQiPuB+pWVj7Mu30ZSqpnNTzMpSOVbGOaTwVxZ7jXCNR5USW+jGbyrk3ZV432MwsO3gJjADHoQLtJzlrqE/2EsMyF0Noy2/B07pdZiUTSZ3yuw+VP+WxCDtp7J8GFRm6kwhRK1aIvCXknp15azCqAXjzAnEPvo3+7m7CFPskf8W34S6rYaU3b8OFw1JmOyoAFS+c92vakPwXP/5i4tsS87Hh+AVDLJzVtgRkeexwqSmn+iN6QwycZ0rQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJ/0+P/KBT/yHqrYzx3LeNVk217aJmQKi1S93n/H+dg=;
 b=TqoCF54MTU705ahaZwzV7JQI2jrdvNkgAJYOsnjCp3V6SZ7YucKHsxQEHDGQjUNHGxzxvnvqOxov1TzdHOGdTVdcv5ly7pHcKSCkvkzlpXdn2SOFtRLJaDVoLs0eNGxR3ZoIzE8vKE15akNR34vcbEy0arVJ2MP6qErzFYMfR95oV+wPT8VBN7bR7OvFMdyGEruWjAxLpNoZZWbGpQeLaNrbh6IfsuxWyDl5azE6KXnAOD1u4CkfiRsUA0dLSqZ4K+MwZET2nG0Fvy2X9NQ5sMQkvReePqWKUJXwkaDYMkLmpzhfrLOjvA/lxvk+NaCqdAos8xwbjyvnP2tvF1WIwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3163.namprd12.prod.outlook.com (20.179.104.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Tue, 3 Sep 2019 20:55:08 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2220.022; Tue, 3 Sep 2019
 20:55:08 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/amdgpu: reserve at least 4MB of VRAM for page
 tables v2
Thread-Topic: [PATCH 2/3] drm/amdgpu: reserve at least 4MB of VRAM for page
 tables v2
Thread-Index: AQHVYjdBdwFkYBkKr0SE/h/rSHVEKKcab02A
Date: Tue, 3 Sep 2019 20:55:08 +0000
Message-ID: <06f1fc07-ccd3-fd5e-dd71-cdf7c6db60eb@amd.com>
References: <20190903090904.30747-1-christian.koenig@amd.com>
 <20190903090904.30747-2-christian.koenig@amd.com>
In-Reply-To: <20190903090904.30747-2-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::34) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 832b55ac-0af8-463f-84c8-08d730b10142
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3163; 
x-ms-traffictypediagnostic: DM6PR12MB3163:
x-microsoft-antispam-prvs: <DM6PR12MB3163961A8D163D98D34A48A492B90@DM6PR12MB3163.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:513;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(346002)(366004)(39860400002)(199004)(189003)(6512007)(478600001)(66476007)(6436002)(7736002)(102836004)(5660300002)(66446008)(64756008)(66946007)(53546011)(66556008)(81156014)(6246003)(386003)(53936002)(66574012)(256004)(305945005)(186003)(26005)(81166006)(8936002)(8676002)(14444005)(52116002)(6506007)(31686004)(2501003)(36756003)(2616005)(316002)(11346002)(58126008)(110136005)(476003)(71190400001)(71200400001)(3846002)(2906002)(446003)(25786009)(65956001)(6486002)(229853002)(65806001)(6116002)(66066001)(99286004)(76176011)(486006)(14454004)(31696002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3163;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nOEFpRC+lMSQs4WPoh7mFqH7P5r9IER0amuRGYPDGHxnPSbB5c6sXhyAdeVv6XpD7UjypAbsE+XfX5zZgb/BTt6SLmUjF8+AZOd9bTNpbooY+hkiOfjhMSf7ODV7g1vduLq4C62s+q874UbDKTggTRWLSWpoLOZx/LcURrfslfK7UWm0W3ZZidjHT8IZ10fRprRAJOmUEXaz3B2yfMl9kJfRmoeeB9O3K86zU2xCj8SffBmbNqRk3ecEYONLCtFCAzM45W5tMfOsnAeykgqIXC4HBqXKAjSOIUbeR3GDbaiq+cnZ3ba33xsq6sUafKJaruSozaCoXu1dEcU6wpV7hbmsyOJN8DVlFE30pr5KheStY/X1n/rFWIBwHzJep11VbUDlkwIJy/t2PNpqLNRyfvnjVCFS0Rwfj+JLsg4MNL8=
x-ms-exchange-transport-forked: True
Content-ID: <403B33C6978C6F479B49C89E0B90A028@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 832b55ac-0af8-463f-84c8-08d730b10142
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 20:55:08.6524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8eUYHMYziWqji8MINHBNzZJB8Wm+9CwGcHs1cr/foAM48nKBjfXmTgJKFDIWdu6nfvRbwMfj4mr65d5uSydZ+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3163
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJ/0+P/KBT/yHqrYzx3LeNVk217aJmQKi1S93n/H+dg=;
 b=nGyK04fHYCnEgNmhDKFhlljxD+QuYHPoOvqOlyfWMSG3d+iX7uhEv7rLkOjtlpFjSt7wTp0cPs8qXompp9aWeQ1uF757fzQeuy8dSOnB1veyHOj34abKFDDGMrBwDE9Rbo+HCg1W+VqkXUDk6uJdjhmMDsWps1JF+5HHsmg9CiI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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

T24gMjAxOS0wOS0wMyA1OjA5IGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+IFRoaXMg
aG9wZWZ1bGx5IGhlbHBzIHJlZHVjZSB0aGUgY29udGVudGlvbiBmb3IgcGFnZSB0YWJsZXMuDQo+
DQo+IHYyOiBhZGp1c3QgbWF4aW11bSByZXBvcnRlZCBWUkFNIHNpemUgYXMgd2VsbA0KPg0KPiBT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
DQoNCkknbGwgbmVlZCB0byBkbyBzb21ldGhpbmcgc2ltaWxhciAoYW5kIGFsc28gdGFrZSB0aGUg
dnJhbV9waW5fc2l6ZSBpbnRvIA0KYWNjb3VudCkgaW4gYW1kZ3B1X2FtZGtmZF9yZXNlcnZlX21l
bV9saW1pdC4gSXQgZG9lc24ndCBldmVuIGFjY291bnQgZm9yIA0KdGhlIHZyYW1fcGluX3NpemUg
YXQgdGhlIG1vbWVudCwgd2hpY2ggSSBzaG91bGQgZml4IHRvby4gT3RoZXJ3aXNlIHRoaXMgDQpj
b21taXQgbG9va3MgZ29vZCB0byBtZS4NCg0KUmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxG
ZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2ttcy5jICAgICAgfCAxOCArKysrKysrKysrKystLS0tLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaCAgICAgICB8ICAzICsrKw0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jIHwgIDkgKysrKysr
Ky0tDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2tt
cy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jDQo+IGluZGV4IDZj
ZjYxZTAxMDQxZi4uNWJjMjBkODQzNTFkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfa21zLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2ttcy5jDQo+IEBAIC02MTYsOSArNjE2LDEyIEBAIHN0YXRpYyBpbnQgYW1kZ3B1
X2luZm9faW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwgc3RydWN0IGRy
bV9maWxlDQo+ICAgCQlzdHJ1Y3QgZHJtX2FtZGdwdV9pbmZvX3ZyYW1fZ3R0IHZyYW1fZ3R0Ow0K
PiAgIA0KPiAgIAkJdnJhbV9ndHQudnJhbV9zaXplID0gYWRldi0+Z21jLnJlYWxfdnJhbV9zaXpl
IC0NCj4gLQkJCWF0b21pYzY0X3JlYWQoJmFkZXYtPnZyYW1fcGluX3NpemUpOw0KPiAtCQl2cmFt
X2d0dC52cmFtX2NwdV9hY2Nlc3NpYmxlX3NpemUgPSBhZGV2LT5nbWMudmlzaWJsZV92cmFtX3Np
emUgLQ0KPiAtCQkJYXRvbWljNjRfcmVhZCgmYWRldi0+dmlzaWJsZV9waW5fc2l6ZSk7DQo+ICsJ
CQlhdG9taWM2NF9yZWFkKCZhZGV2LT52cmFtX3Bpbl9zaXplKSAtDQo+ICsJCQlBTURHUFVfVk1f
UkVTRVJWRURfVlJBTTsNCj4gKwkJdnJhbV9ndHQudnJhbV9jcHVfYWNjZXNzaWJsZV9zaXplID0N
Cj4gKwkJCW1pbihhZGV2LT5nbWMudmlzaWJsZV92cmFtX3NpemUgLQ0KPiArCQkJICAgIGF0b21p
YzY0X3JlYWQoJmFkZXYtPnZpc2libGVfcGluX3NpemUpLA0KPiArCQkJICAgIHZyYW1fZ3R0LnZy
YW1fc2l6ZSk7DQo+ICAgCQl2cmFtX2d0dC5ndHRfc2l6ZSA9IGFkZXYtPm1tYW4uYmRldi5tYW5b
VFRNX1BMX1RUXS5zaXplOw0KPiAgIAkJdnJhbV9ndHQuZ3R0X3NpemUgKj0gUEFHRV9TSVpFOw0K
PiAgIAkJdnJhbV9ndHQuZ3R0X3NpemUgLT0gYXRvbWljNjRfcmVhZCgmYWRldi0+Z2FydF9waW5f
c2l6ZSk7DQo+IEBAIC02MzEsMTUgKzYzNCwxOCBAQCBzdGF0aWMgaW50IGFtZGdwdV9pbmZvX2lv
Y3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsIHN0cnVjdCBkcm1fZmlsZQ0K
PiAgIAkJbWVtc2V0KCZtZW0sIDAsIHNpemVvZihtZW0pKTsNCj4gICAJCW1lbS52cmFtLnRvdGFs
X2hlYXBfc2l6ZSA9IGFkZXYtPmdtYy5yZWFsX3ZyYW1fc2l6ZTsNCj4gICAJCW1lbS52cmFtLnVz
YWJsZV9oZWFwX3NpemUgPSBhZGV2LT5nbWMucmVhbF92cmFtX3NpemUgLQ0KPiAtCQkJYXRvbWlj
NjRfcmVhZCgmYWRldi0+dnJhbV9waW5fc2l6ZSk7DQo+ICsJCQlhdG9taWM2NF9yZWFkKCZhZGV2
LT52cmFtX3Bpbl9zaXplKSAtDQo+ICsJCQlBTURHUFVfVk1fUkVTRVJWRURfVlJBTTsNCj4gICAJ
CW1lbS52cmFtLmhlYXBfdXNhZ2UgPQ0KPiAgIAkJCWFtZGdwdV92cmFtX21ncl91c2FnZSgmYWRl
di0+bW1hbi5iZGV2Lm1hbltUVE1fUExfVlJBTV0pOw0KPiAgIAkJbWVtLnZyYW0ubWF4X2FsbG9j
YXRpb24gPSBtZW0udnJhbS51c2FibGVfaGVhcF9zaXplICogMyAvIDQ7DQo+ICAgDQo+ICAgCQlt
ZW0uY3B1X2FjY2Vzc2libGVfdnJhbS50b3RhbF9oZWFwX3NpemUgPQ0KPiAgIAkJCWFkZXYtPmdt
Yy52aXNpYmxlX3ZyYW1fc2l6ZTsNCj4gLQkJbWVtLmNwdV9hY2Nlc3NpYmxlX3ZyYW0udXNhYmxl
X2hlYXBfc2l6ZSA9IGFkZXYtPmdtYy52aXNpYmxlX3ZyYW1fc2l6ZSAtDQo+IC0JCQlhdG9taWM2
NF9yZWFkKCZhZGV2LT52aXNpYmxlX3Bpbl9zaXplKTsNCj4gKwkJbWVtLmNwdV9hY2Nlc3NpYmxl
X3ZyYW0udXNhYmxlX2hlYXBfc2l6ZSA9DQo+ICsJCQltaW4oYWRldi0+Z21jLnZpc2libGVfdnJh
bV9zaXplIC0NCj4gKwkJCSAgICBhdG9taWM2NF9yZWFkKCZhZGV2LT52aXNpYmxlX3Bpbl9zaXpl
KSwNCj4gKwkJCSAgICBtZW0udnJhbS51c2FibGVfaGVhcF9zaXplKTsNCj4gICAJCW1lbS5jcHVf
YWNjZXNzaWJsZV92cmFtLmhlYXBfdXNhZ2UgPQ0KPiAgIAkJCWFtZGdwdV92cmFtX21ncl92aXNf
dXNhZ2UoJmFkZXYtPm1tYW4uYmRldi5tYW5bVFRNX1BMX1ZSQU1dKTsNCj4gICAJCW1lbS5jcHVf
YWNjZXNzaWJsZV92cmFtLm1heF9hbGxvY2F0aW9uID0NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3ZtLmgNCj4gaW5kZXggMmVkYTNhOGMzMzBkLi4zMzUyYTg3YjgyMmUgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oDQo+IEBAIC05OSw2ICs5OSw5
IEBAIHN0cnVjdCBhbWRncHVfYm9fbGlzdF9lbnRyeTsNCj4gICAjZGVmaW5lIEFNREdQVV9WTV9G
QVVMVF9TVE9QX0ZJUlNUCTENCj4gICAjZGVmaW5lIEFNREdQVV9WTV9GQVVMVF9TVE9QX0FMV0FZ
UwkyDQo+ICAgDQo+ICsvKiBSZXNlcnZlIDRNQiBWUkFNIGZvciBwYWdlIHRhYmxlcyAqLw0KPiAr
I2RlZmluZSBBTURHUFVfVk1fUkVTRVJWRURfVlJBTQkJKDRVTEwgPDwgMjApDQo+ICsNCj4gICAv
KiBtYXggbnVtYmVyIG9mIFZNSFVCICovDQo+ICAgI2RlZmluZSBBTURHUFVfTUFYX1ZNSFVCUwkJ
CTMNCj4gICAjZGVmaW5lIEFNREdQVV9HRlhIVUJfMAkJCQkwDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jDQo+IGluZGV4IDExNTBlMzRiYzI4Zi4uNTk0
NDBmNzFkMzA0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdnJhbV9tZ3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dnJhbV9tZ3IuYw0KPiBAQCAtMjQsNiArMjQsNyBAQA0KPiAgIA0KPiAgICNpbmNsdWRlIDxkcm0v
ZHJtUC5oPg0KPiAgICNpbmNsdWRlICJhbWRncHUuaCINCj4gKyNpbmNsdWRlICJhbWRncHVfdm0u
aCINCj4gICANCj4gICBzdHJ1Y3QgYW1kZ3B1X3ZyYW1fbWdyIHsNCj4gICAJc3RydWN0IGRybV9t
bSBtbTsNCj4gQEAgLTI3Niw3ICsyNzcsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV92cmFtX21ncl9u
ZXcoc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4sDQo+ICAgCXN0cnVjdCBkcm1fbW1f
bm9kZSAqbm9kZXM7DQo+ICAgCWVudW0gZHJtX21tX2luc2VydF9tb2RlIG1vZGU7DQo+ICAgCXVu
c2lnbmVkIGxvbmcgbHBmbiwgbnVtX25vZGVzLCBwYWdlc19wZXJfbm9kZSwgcGFnZXNfbGVmdDsN
Cj4gLQl1aW50NjRfdCB2aXNfdXNhZ2UgPSAwLCBtZW1fYnl0ZXM7DQo+ICsJdWludDY0X3Qgdmlz
X3VzYWdlID0gMCwgbWVtX2J5dGVzLCBtYXhfYnl0ZXM7DQo+ICAgCXVuc2lnbmVkIGk7DQo+ICAg
CWludCByOw0KPiAgIA0KPiBAQCAtMjg0LDkgKzI4NSwxMyBAQCBzdGF0aWMgaW50IGFtZGdwdV92
cmFtX21ncl9uZXcoc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4sDQo+ICAgCWlmICgh
bHBmbikNCj4gICAJCWxwZm4gPSBtYW4tPnNpemU7DQo+ICAgDQo+ICsJbWF4X2J5dGVzID0gYWRl
di0+Z21jLm1jX3ZyYW1fc2l6ZTsNCj4gKwlpZiAodGJvLT50eXBlICE9IHR0bV9ib190eXBlX2tl
cm5lbCkNCj4gKwkJbWF4X2J5dGVzIC09IEFNREdQVV9WTV9SRVNFUlZFRF9WUkFNOw0KPiArDQo+
ICAgCS8qIGJhaWwgb3V0IHF1aWNrbHkgaWYgdGhlcmUncyBsaWtlbHkgbm90IGVub3VnaCBWUkFN
IGZvciB0aGlzIEJPICovDQo+ICAgCW1lbV9ieXRlcyA9ICh1NjQpbWVtLT5udW1fcGFnZXMgPDwg
UEFHRV9TSElGVDsNCj4gLQlpZiAoYXRvbWljNjRfYWRkX3JldHVybihtZW1fYnl0ZXMsICZtZ3It
PnVzYWdlKSA+IGFkZXYtPmdtYy5tY192cmFtX3NpemUpIHsNCj4gKwlpZiAoYXRvbWljNjRfYWRk
X3JldHVybihtZW1fYnl0ZXMsICZtZ3ItPnVzYWdlKSA+IG1heF9ieXRlcykgew0KPiAgIAkJYXRv
bWljNjRfc3ViKG1lbV9ieXRlcywgJm1nci0+dXNhZ2UpOw0KPiAgIAkJbWVtLT5tbV9ub2RlID0g
TlVMTDsNCj4gICAJCXJldHVybiAwOw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
