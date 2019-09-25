Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693D6BDB1F
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 11:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC368897C5;
	Wed, 25 Sep 2019 09:37:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720045.outbound.protection.outlook.com [40.107.72.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C6F897C5
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 09:37:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9v1wxtJUxzD/ULowS1P8e0UPeTLTjAdZhEw8n4/OfKsrKbLC+8le8/fdBde2h+CiT5xJIhwt0XhvhlB6TWoOtsssNQ2wJ1bS+0ejdlfJTzc+3WrKeBGHHfzOEUMxBC1LLdiRajEDa6RUP1aKCJjC74SsTIWrnX1Mbi/yJpvoBZiQe+pqWsGgmB6LGI7SdV1yiC8XU2ZE7jXXP6fSQ8NcnDkPlMbImZ1uUH4irIf+p21FZ60ZBdWlO++71W+dEcRecXtLPFjf6Ecti02mIgYYBrw9ZN642eCBbiOdAuQALqTUB7N4MCouE45bdCweqIycFXp1U4uo7N1m7kGXOUtNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSnvrAXcz70+S+/CtozoNt2n8IBSqLaFtZjllCP0N2s=;
 b=n1N559DeCjPFVnPP9W6sJw6p7pM3gXf5MNGDrIDB+EfJkYPi+YgTn2j4oOYdKPtzYCuy3hqMxHxvrvKwrJhd+rCy3JjkybXRlyXFaH+dbEnAOCycUGwZnqNrafuQR7aLJZIIeMSHYa2lkFoEGqeqhBqqHTTlQLuZXlTiC3t6rYVpOZjg7fl145BgxVvxl6n/oLz5KTTP9pi44cOsaje5nw/CujyLx/6Ui1w9aAD/ZC9Gu9yj9BhuUhM6UAoyjDBnU4H9xURGUhlTiRfUgzYC1POsX/hE54BIKEgB9Dbh07I0T/8wK02bTJ/nZsYcbcfL06TzT5gaNWC9x5LsxdjSDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2975.namprd12.prod.outlook.com (20.178.243.142) by
 MN2PR12MB2896.namprd12.prod.outlook.com (20.179.80.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 09:37:45 +0000
Received: from MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::3dbc:12f8:fbba:1e7e]) by MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::3dbc:12f8:fbba:1e7e%7]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 09:37:45 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm7amdgpu: once more fix amdgpu_bo_create_kernel_at
Thread-Topic: [PATCH] drm7amdgpu: once more fix amdgpu_bo_create_kernel_at
Thread-Index: AQHVcs8ZKRxb/rd4+Uq0uYJDZ+KqBKc8IOLAgAACyICAAABq4A==
Date: Wed, 25 Sep 2019 09:37:44 +0000
Message-ID: <MN2PR12MB2975539D6F037F0CA39E21B58F870@MN2PR12MB2975.namprd12.prod.outlook.com>
References: <20190924115624.10949-1-christian.koenig@amd.com>
 <MN2PR12MB29750C8C515A2924B3454E488F870@MN2PR12MB2975.namprd12.prod.outlook.com>
 <05ae5f93-535b-96c9-9687-db9e8de456be@gmail.com>
In-Reply-To: <05ae5f93-535b-96c9-9687-db9e8de456be@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4ff1629-a39f-4e24-2605-08d7419c04f8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2896; 
x-ms-traffictypediagnostic: MN2PR12MB2896:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB289608AEB311D7653D39FF7D8F870@MN2PR12MB2896.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(189003)(13464003)(199004)(53546011)(3846002)(6506007)(66066001)(8936002)(6116002)(26005)(7696005)(186003)(25786009)(86362001)(102836004)(99286004)(14444005)(476003)(33656002)(76176011)(486006)(81166006)(11346002)(446003)(316002)(66946007)(64756008)(110136005)(81156014)(76116006)(2501003)(8676002)(66446008)(478600001)(256004)(2906002)(66574012)(66476007)(66556008)(229853002)(6246003)(14454004)(52536014)(55016002)(9686003)(6436002)(5660300002)(71190400001)(71200400001)(305945005)(7736002)(74316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2896;
 H:MN2PR12MB2975.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kF4USmSL44UpSC72ecGIrnmKU45YgrwVeLzKz2DsmV5abQTXWgb/5wCtlELBRMny4rOA32zA3qjKDWFT8pTaNwk2XpAtAMx4jSTZen8rFQ6szRg2NXxWVTOyJIjcVssowC6aNuLrKLrdOJQ9thHLUmmQB9opGR1/M9nXo0UefKhcQbLvm8/OPf64hg3KXtkvihNZgK1I0D/Z4byIp6GkiQIrvYCs+m8kv8A/iNQj7QgTgWQezYwtMxzdq0gXuYGLkQRpVdH8gixjBh+dhnspYrRmCr/hVNjFkjdpTj3LEx82jNkK1AOoFVHfCQ1QU15qgYuK0XkZRWYD8u89LkTurQphUiAHjk7Yfc2qDQox4bmPqoig/0/0I/6ZeoIq18rJYhTiktFL+uZsYAze+hw+iJucGGN6hKoqHcIuocNMQoI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ff1629-a39f-4e24-2605-08d7419c04f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 09:37:44.9420 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hqpaQRpHfRLthP+QGCe5bOQUg5LUimXiT0fKW4hh4m+/Rf8apqntPEs+7F3fT6Ud
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2896
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSnvrAXcz70+S+/CtozoNt2n8IBSqLaFtZjllCP0N2s=;
 b=l9MItIVvuyeQhRz+O9/m2P0QDRoqjOJosa7GqG3pXjb1aMFjiXW1NaFhvPqSPlAYj4KkbzeEp09wkUKmwVEgg7OUmZ7nb7cb/kbMphs2vu1mtuVSIxKwR8I5Zb/Mr0kFD5eZ1zm01wOkFjY8HBMq8E5s8Gdy/6pHkNPQ4kRZcZA=
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

WWVzLCBJIGhhdmUgYWxyZWFkeSB0ZXN0ZWQgaXQuDQoNCkJlc3Qgd2lzaGVzDQpFbWlseSBEZW5n
DQoNCg0KDQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBDaHJpc3RpYW4gS8O2
bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4NCj5TZW50OiBXZWRuZXNkYXks
IFNlcHRlbWJlciAyNSwgMjAxOSA1OjM2IFBNDQo+VG86IERlbmcsIEVtaWx5IDxFbWlseS5EZW5n
QGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPlN1YmplY3Q6IFJlOiBb
UEFUQ0hdIGRybTdhbWRncHU6IG9uY2UgbW9yZSBmaXgNCj5hbWRncHVfYm9fY3JlYXRlX2tlcm5l
bF9hdA0KPg0KPkhpIEVtaWx5LA0KPg0KPmhhdmUgeW91IGFsc28gdGVzdGVkIHRoaXM/IEkgZG9u
J3QgaGF2ZSB0aGUgaGFyZHdhcmUgdG8gdGVzdCBpdCBzbyB0aGF0IHdvdWxkDQo+YmUgcmF0aGVy
IG5pY2UgdG8gaGF2ZS4NCj4NCj5UaGFua3MsDQo+Q2hyaXN0aWFuLg0KPg0KPkFtIDI1LjA5LjE5
IHVtIDExOjMxIHNjaHJpZWIgRGVuZywgRW1pbHk6DQo+PiBSZXZpZXdlZC1ieTogRW1pbHkgRGVu
ZyA8RW1pbHkuRGVuZ0BhbWQuY29tPg0KPj4NCj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPj4+IEZyb206IENocmlzdGlhbiBLw7ZuaWcgPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21h
aWwuY29tPg0KPj4+IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAyNCwgMjAxOSA3OjU2IFBNDQo+
Pj4gVG86IERlbmcsIEVtaWx5IDxFbWlseS5EZW5nQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPj4+IFN1YmplY3Q6IFtQQVRDSF0gZHJtN2FtZGdwdTogb25jZSBtb3Jl
IGZpeA0KPmFtZGdwdV9ib19jcmVhdGVfa2VybmVsX2F0DQo+Pj4NCj4+PiBXaGVuIENQVSBhY2Nl
c3MgaXMgbmVlZGVkIHdlIHNob3VsZCB0ZWxsIHRoYXQgdG8NCj4+PiBhbWRncHVfYm9fY3JlYXRl
X3Jlc2VydmVkKCkgb3Igb3RoZXJ3aXNlIHRoZSBhY2Nlc3MgaXMgZGVuaWVkIGxhdGVyIG9uLg0K
Pj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPg0KPj4+IC0tLQ0KPj4+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9vYmplY3QuYyB8IDkgKysrKysrLS0tDQo+Pj4gMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMNCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9vYmplY3QuYw0KPj4+IGluZGV4IDEyZDJhZGNkZjE0ZS4uZjEwYjYxNzVl
MjBjIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9v
YmplY3QuYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmpl
Y3QuYw0KPj4+IEBAIC0zNjksNyArMzY5LDcgQEAgaW50IGFtZGdwdV9ib19jcmVhdGVfa2VybmVs
X2F0KHN0cnVjdA0KPj4+IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+Pj4gCXNpemUgPSBBTElHTihz
aXplLCBQQUdFX1NJWkUpOw0KPj4+DQo+Pj4gCXIgPSBhbWRncHVfYm9fY3JlYXRlX3Jlc2VydmVk
KGFkZXYsIHNpemUsIFBBR0VfU0laRSwgZG9tYWluLA0KPmJvX3B0ciwNCj4+PiAtCQkJCSAgICAg
IE5VTEwsIE5VTEwpOw0KPj4+ICsJCQkJICAgICAgTlVMTCwgY3B1X2FkZHIpOw0KPj4+IAlpZiAo
cikNCj4+PiAJCXJldHVybiByOw0KPj4+DQo+Pj4gQEAgLTM3NywxMiArMzc3LDE1IEBAIGludCBh
bWRncHVfYm9fY3JlYXRlX2tlcm5lbF9hdChzdHJ1Y3QNCj4+PiBhbWRncHVfZGV2aWNlICphZGV2
LA0KPj4+IAkgKiBSZW1vdmUgdGhlIG9yaWdpbmFsIG1lbSBub2RlIGFuZCBjcmVhdGUgYSBuZXcg
b25lIGF0IHRoZQ0KPnJlcXVlc3QNCj4+PiAJICogcG9zaXRpb24uDQo+Pj4gCSAqLw0KPj4+ICsJ
aWYgKGNwdV9hZGRyKQ0KPj4+ICsJCWFtZGdwdV9ib19rdW5tYXAoKmJvX3B0cik7DQo+Pj4gKw0K
Pj4+ICsJdHRtX2JvX21lbV9wdXQoJigqYm9fcHRyKS0+dGJvLCAmKCpib19wdHIpLT50Ym8ubWVt
KTsNCj4+PiArDQo+Pj4gCWZvciAoaSA9IDA7IGkgPCAoKmJvX3B0ciktPnBsYWNlbWVudC5udW1f
cGxhY2VtZW50OyArK2kpIHsNCj4+PiAJCSgqYm9fcHRyKS0+cGxhY2VtZW50c1tpXS5mcGZuID0g
b2Zmc2V0ID4+IFBBR0VfU0hJRlQ7DQo+Pj4gCQkoKmJvX3B0ciktPnBsYWNlbWVudHNbaV0ubHBm
biA9IChvZmZzZXQgKyBzaXplKSA+PiBQQUdFX1NISUZUOw0KPj4+IAl9DQo+Pj4gLQ0KPj4+IC0J
dHRtX2JvX21lbV9wdXQoJigqYm9fcHRyKS0+dGJvLCAmKCpib19wdHIpLT50Ym8ubWVtKTsNCj4+
PiAJciA9IHR0bV9ib19tZW1fc3BhY2UoJigqYm9fcHRyKS0+dGJvLCAmKCpib19wdHIpLT5wbGFj
ZW1lbnQsDQo+Pj4gCQkJICAgICAmKCpib19wdHIpLT50Ym8ubWVtLCAmY3R4KTsNCj4+PiAJaWYg
KHIpDQo+Pj4gLS0NCj4+PiAyLjE0LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
