Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A236D7E54
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Oct 2019 20:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E837B6E392;
	Tue, 15 Oct 2019 18:01:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820050.outbound.protection.outlook.com [40.107.82.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BFF6E87F
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 18:01:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bamHYLYRbbwIxhcrAZn8HK9BjJdg+ZtAc+L6APnwL9aclOhbktMZn70VlkEXxv1O0swVnWWwmc/NBVQsJy8JArETnWK3VDMIXbJ/xtuWjhC2jLYV04Mm9sQSvkLWTT1ZiLjw6/WoWt+8IFoccYRIXWQ6NBZUlyGKl5INb35QX0l4TjX4W/4ei+W3LiCX0W768dyWkpkt38fYqfgIpNHRFZhzBLb77WkrwCHjGRBX3s0nNzlqA/54pdDC4uo3KXTgaIyGUbi9EVaF3VyIpXeB/xjJQqYt5Sc0514SSrPauQx+YySEI/MZ5vHUfGUf0I7zZL1hQjOlFfqFtghlLRe6Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zV4zFI3bDbE0+I1bZQKZmMegT3Y2lTHNLaCfCXqga5E=;
 b=SAjRriC9NMGvJ9rmkaXDQx6vdSi8QZK7+4lxKJQUGInZ5t8Zsq9izZP6Nfy3BcMOQa7ocF/jbtH4OrzNWqLwFC3U1RhOlRL81i53Pu/wicyOd8QyMKz1mDcTiXF4+1ZUjaK8ZGQvk06vEDzkfXbf85PsUAucWuTY/SZ9G9NILbbI7QX6JH1leKgMJel5bPAh2BJQRN9h0ylG7hT5aA8dFefDXKBpyA1P8gDsUzyP/0sk5ZEVhd3dyevGHzPnWSGWBWtYxMvQvbViXVSMfabJtk1wxs/eoaXvfgoIz8YWKttzahG7c0wjgdl2BYDtHSncCD5EVLg01hsxJaGq1XyOKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3355.namprd12.prod.outlook.com (20.178.198.10) by
 DM6PR12MB4281.namprd12.prod.outlook.com (10.141.187.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Tue, 15 Oct 2019 18:01:16 +0000
Received: from DM6PR12MB3355.namprd12.prod.outlook.com
 ([fe80::6006:422c:ecdf:e550]) by DM6PR12MB3355.namprd12.prod.outlook.com
 ([fe80::6006:422c:ecdf:e550%6]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 18:01:16 +0000
From: "Tuikov, Luben" <Luben.Tuikov@amd.com>
To: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/8] drm/amdgpu: update amdgpu_discovery to handle revision
Thread-Topic: [PATCH 1/8] drm/amdgpu: update amdgpu_discovery to handle
 revision
Thread-Index: AQHVgj54FNVDMnhlukqSPkBzTeApzqdcAJQA
Date: Tue, 15 Oct 2019 18:01:15 +0000
Message-ID: <e4b046e5-b91a-997c-e47c-dae0360d3a27@amd.com>
References: <20191014032118.14020-1-tianci.yin@amd.com>
In-Reply-To: <20191014032118.14020-1-tianci.yin@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::17) To DM6PR12MB3355.namprd12.prod.outlook.com
 (2603:10b6:5:38::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ecffc805-23bc-41f0-e7bd-08d75199ac21
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB4281:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB428199E12428CF3F54F4CCD199930@DM6PR12MB4281.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(346002)(39860400002)(366004)(189003)(199004)(186003)(14444005)(476003)(2616005)(3846002)(66446008)(64756008)(256004)(66556008)(305945005)(52116002)(7736002)(76176011)(6436002)(86362001)(2501003)(8676002)(25786009)(4326008)(486006)(446003)(81156014)(11346002)(4001150100001)(81166006)(15650500001)(66946007)(71200400001)(6512007)(99286004)(6116002)(66476007)(229853002)(8936002)(14454004)(31686004)(71190400001)(110136005)(478600001)(5660300002)(6486002)(2906002)(316002)(66066001)(6246003)(36756003)(102836004)(26005)(54906003)(53546011)(6506007)(386003)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4281;
 H:DM6PR12MB3355.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5F+b7b8pXZGV27yQOWqhyQyvCzuXnRgwkMovHoTtQoouqMl+VQaBHjhDQxzqzSIqaulsa7mM/BJDU/dR++0S9BK4nSabS8iBC5YwMgVhUXDPk0t9RsAGiq9qYRTjMeN8eogRpV3RKqzib01qRE5558ZB8QPZBGQFp3pBMGiVPa5KjsyXTNgi+jHd+hIzWUYGENHuRGmVeIOmbgk1uYg2sMWwYvNLEW7t8cUnRMDvO0Sr9rC2SagWfEavLbEkFKtClXEE6QyWYoe0z2J3yV5oDFvQqS2zZYKYGqPxV5ay4p+K5Hmuer/3Qtzoqr/iIaC/zMgnsgCYfsKOWyDzh7rcXfh7T3rGMwr4gAOFeN1es6A1qYfwgNrU4o04p2FYipiIFx9OLxK8xl2f1+SstisRalxzVM6hewuPz3RI5OY4Mu4=
Content-ID: <A693A449935FA94D8BF5F3F92EBECDA3@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecffc805-23bc-41f0-e7bd-08d75199ac21
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 18:01:15.7373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GHdw7D6NlnOSPgtELGTOp9qIfMGk02zvhbwLSo0lKs7Sdk+ecoXJKw5qEhUbPgwf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4281
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zV4zFI3bDbE0+I1bZQKZmMegT3Y2lTHNLaCfCXqga5E=;
 b=E/xrcljQoD+Ngeb0vxYMFJ7nG0EcaY3gKsEHKrniiaxQKs6RBzDGiTs0i3bXKrw9dY8ABnt/A+4TV74SCrlEpEklVo92UvmbcJYeBhLQVfsq80UTgUsKNWgbjsosvfIJmbQtICKsZofNIfj6ITFgCQssQelHo/hJ2ZjTi1F/VxU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luben.Tuikov@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGF0Y2hlcyAxLTc6IExvb2tzIGdvb2QuDQpSZXZpZXdlZC1ieTogTHViZW4gVHVpa292IDxsdWJl
bi50dWlrb3ZAYW1kLmNvbT4NCg0KUGF0Y2ggODogTkFLISBmb3IgdGhlIHNhbWUgZXhhY3QgcmVh
c29uIGFzIHRoZSBwcmV2aW91cyByZXZpZXcuIE5vIGNoYW5nZXMgdG8gTkFLIHJlYXNvbmluZyBm
cm9tIHByZXZpb3VzIHJldmlldy4NCg0KUmVnYXJkcywNCkx1YmVuDQoNCk9uIDIwMTktMTAtMTMg
MTE6MjEgcC5tLiwgVGlhbmNpIFlpbiB3cm90ZToNCj4gRnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFu
Y2kueWluQGFtZC5jb20+DQo+IA0KPiB1cGRhdGUgYW1kZ3B1X2Rpc2NvdmVyeSB0byBnZXQgSVAg
cmV2aXNpb24uDQo+IA0KPiBDaGFuZ2UtSWQ6IElmODE1MjEwM2QwM2I1OGUxZGMwZjMyZGI2MzYy
NWUyOTBmNWYwOGEwDQo+IFJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFRpYW5jaS5ZaW4gPHRpYW5jaS55aW5AYW1k
LmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzY292
ZXJ5LmMgfCA0ICsrKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNj
b3ZlcnkuaCB8IDIgKy0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kaXNjb3ZlcnkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
aXNjb3ZlcnkuYw0KPiBpbmRleCA3MTE5OGM1MzE4ZTEuLmRkZDgzNjQxMDJhMiAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNjb3ZlcnkuYw0KPiBAQCAt
MzMzLDcgKzMzMyw3IEBAIGludCBhbWRncHVfZGlzY292ZXJ5X3JlZ19iYXNlX2luaXQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICB9DQo+ICANCj4gIGludCBhbWRncHVfZGlzY292ZXJ5
X2dldF9pcF92ZXJzaW9uKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBpbnQgaHdfaWQsDQo+
IC0JCQkJICAgIGludCAqbWFqb3IsIGludCAqbWlub3IpDQo+ICsJCQkJICAgIGludCAqbWFqb3Is
IGludCAqbWlub3IsIGludCAqcmV2aXNpb24pDQo+ICB7DQo+ICAJc3RydWN0IGJpbmFyeV9oZWFk
ZXIgKmJoZHI7DQo+ICAJc3RydWN0IGlwX2Rpc2NvdmVyeV9oZWFkZXIgKmloZHI7DQo+IEBAIC0z
NjksNiArMzY5LDggQEAgaW50IGFtZGdwdV9kaXNjb3ZlcnlfZ2V0X2lwX3ZlcnNpb24oc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGludCBod19pZCwNCj4gIAkJCQkJKm1ham9yID0gaXAtPm1h
am9yOw0KPiAgCQkJCWlmIChtaW5vcikNCj4gIAkJCQkJKm1pbm9yID0gaXAtPm1pbm9yOw0KPiAr
CQkJCWlmIChyZXZpc2lvbikNCj4gKwkJCQkJKnJldmlzaW9uID0gaXAtPnJldmlzaW9uOw0KPiAg
CQkJCXJldHVybiAwOw0KPiAgCQkJfQ0KPiAgCQkJaXBfb2Zmc2V0ICs9IHNpemVvZigqaXApICsg
NCAqIChpcC0+bnVtX2Jhc2VfYWRkcmVzcyAtIDEpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5oIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5oDQo+IGluZGV4IDVhNjY5M2Q3ZDI2OS4uYmE3OGUx
NWQ5YjA1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGlzY292ZXJ5LmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rp
c2NvdmVyeS5oDQo+IEBAIC0zMCw3ICszMCw3IEBAIGludCBhbWRncHVfZGlzY292ZXJ5X2luaXQo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOw0KPiAgdm9pZCBhbWRncHVfZGlzY292ZXJ5X2Zp
bmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOw0KPiAgaW50IGFtZGdwdV9kaXNjb3Zlcnlf
cmVnX2Jhc2VfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7DQo+ICBpbnQgYW1kZ3B1
X2Rpc2NvdmVyeV9nZXRfaXBfdmVyc2lvbihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50
IGh3X2lkLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ICptYWpv
ciwgaW50ICptaW5vcik7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBp
bnQgKm1ham9yLCBpbnQgKm1pbm9yLCBpbnQgKnJldmlzaW9uKTsNCj4gIGludCBhbWRncHVfZGlz
Y292ZXJ5X2dldF9nZnhfaW5mbyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7DQo+ICANCj4g
ICNlbmRpZiAvKiBfX0FNREdQVV9ESVNDT1ZFUllfXyAqLw0KPiANCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
