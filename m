Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3017731E3
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 16:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FEED6E5B8;
	Wed, 24 Jul 2019 14:41:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740075.outbound.protection.outlook.com [40.107.74.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4DC86E5B8
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 14:41:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RA9S/jfk06D8Fue6n8vXykb8f6t0XrAvlPa0Eh3ap/R5/yb/ZR3lDJ1/PNTvhNADjic9Q7A3tI39SMuA4yBd80Elfj4xB0UJ5SPElkfVfdc4gbtvX7FwgBmJjfZsOALnwczCdfN8m4ShoArsORyl35A1yHmwr4bVb8QDt4EnqkdAjHdg4yVqhh7FhHOiA1RtEYl6j8iIdXKLYv0W5AGV890G2hn7BddLrYQBf6hC95jCU02rbnLpolAB1gFSUjF4zgxskpHG0yZVUFaZ3/16dGL61z2IaUtpXtUDZQAgbUMnQ7xagB2LtbkQ6QHxbPmEp1jZ0jRE2E4mFHg4LsIQfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j16tiVNMtsBDFdLa5YnkY+RFQMrbGK/XjSgXD0nqEpw=;
 b=BXS6WcmMnVHl5RaDjW9tN5oKhHOvj57z3nFQusOEYmK9y8m9I6Q6bKgVhble3+CIDcWj6Y0SLZBBr6G1K3GukLUrRwuu2DADHV/8IEE+7kzaMtXATQBJR/IxBsjFNSODApGFVdbGwARdlGDKzIUxvYscI6zjYaki69qSkyDDuHyHidH6Ruu1FbU2rnOjqvnsXMdjYixYXiyn0fRTbWQgyxl38LZUpNFq7VIp1c0ZwFSuVhjgVk9WRRJShBfIg7sDyI2k9kwzx1x4Qa8nH3r7NerHQy2oT+WmR4tZnUwlXB5p9RvzEgwZOuFZU7mHwy6TgpFNl2cUMJouC7SgcYEiZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1721.namprd12.prod.outlook.com (10.175.88.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Wed, 24 Jul 2019 14:41:10 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2094.013; Wed, 24 Jul
 2019 14:41:10 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/3] drm/amd: enable S/G for RAVEN chip
Thread-Topic: [PATCH v3 3/3] drm/amd: enable S/G for RAVEN chip
Thread-Index: AQHVQinFl8obpZfKfUm+Yt/IH6AjmabZ0skAgAACJoCAAAJigA==
Date: Wed, 24 Jul 2019 14:41:10 +0000
Message-ID: <fc3eb460-934a-afed-b654-b33021d32aa0@amd.com>
References: <1563977442-4809-1-git-send-email-andrey.grodzovsky@amd.com>
 <1563977442-4809-4-git-send-email-andrey.grodzovsky@amd.com>
 <492b52b5-36e0-f957-88e1-c2479f8c56c4@amd.com>
 <e8a4de40-e60c-152a-ba4b-9ef7b1b553c1@amd.com>
In-Reply-To: <e8a4de40-e60c-152a-ba4b-9ef7b1b553c1@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0005.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::17)
 To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03230632-4985-4dd3-f9b4-08d71044f7f5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1721; 
x-ms-traffictypediagnostic: DM5PR12MB1721:
x-microsoft-antispam-prvs: <DM5PR12MB17217E8E5EC0E1E146D55D3383C60@DM5PR12MB1721.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(199004)(189003)(58126008)(478600001)(11346002)(76176011)(25786009)(256004)(66946007)(476003)(446003)(65826007)(316002)(64756008)(66446008)(53546011)(486006)(6506007)(54906003)(64126003)(99286004)(8676002)(66476007)(46003)(66556008)(2616005)(386003)(2501003)(102836004)(6116002)(2906002)(6436002)(6486002)(110136005)(81166006)(6246003)(36756003)(305945005)(6512007)(4326008)(86362001)(186003)(31696002)(14454004)(71190400001)(71200400001)(65956001)(81156014)(229853002)(14444005)(5660300002)(8936002)(65806001)(31686004)(68736007)(53936002)(52116002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1721;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CAR7X9jT9xLsaHaUjNquV+GuDi3XZlD78hS1AKETaFyhMWWpwChHClKa05w8nEpX6Di2cd8iQbZbfwmVz9WQaIWcPCU7HkTR2MJXJ/MGKUu3qtCu39PYVopc6QVJe2sdkOyrtVjhJlXAZkzusaKZAPBgQHHL6qIVqTApxmhmj3SgQDVuweBn1jg7Fue/6WmFlLYqcQfTE1kgp+5yebJYZh3i4EIhLOTrDXbaSqcnYkNPGX5NO9ioiWnKBD2Z/4Vz9vHsnzmmR9Nv3Wow4TVxarNOM4PRojyp1UOy4Zsu3cX1gCP7NegM/Q6shzV+n7KgsGJzKtwT+eDIe3HRL1+e9NL2GlAmMYaH9PQx74hoKXL0GwWkYakUgR4LxoEzVguwdhrO7FQK2HUGay5BskDGSlGtZVcdlvPNHPe9umLv+xQ=
Content-ID: <E920F798B095BD47B25A5C04477987DD@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03230632-4985-4dd3-f9b4-08d71044f7f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 14:41:10.1909 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1721
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j16tiVNMtsBDFdLa5YnkY+RFQMrbGK/XjSgXD0nqEpw=;
 b=HNgeevmC2o7dQCxqnoZ34xJhVVtMXxyqCYUkHG/LRa0cjZyIIoCLNEelHaqwQm//HgDWtfLoqDK46A7twRQszi1oU1hq5Pe/ELT9xWPek1Hgsi+LTUuamB6QcIkJpG0XgZaoOby0GbeGSedA229Dt4Ed20EeQurFMstzcz4DvQI=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Wu,
 Hersen" <hersenxs.wu@amd.com>, "S, Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjQuMDcuMTkgdW0gMTY6MzIgc2NocmllYiBHcm9kem92c2t5LCBBbmRyZXk6DQo+IE9uIDcv
MjQvMTkgMTA6MjUgQU0sIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPj4gQW0gMjQuMDcuMTkg
dW0gMTY6MTAgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToNCj4+PiBGcm9tOiBTaGlyaXNoIFMg
PHNoaXJpc2guc0BhbWQuY29tPg0KPj4+DQo+Pj4gZW5hYmxlcyBncHVfdm1fc3VwcG9ydCBpbiBk
bSBhbmQgYWRkcw0KPj4+IEFNREdQVV9HRU1fRE9NQUlOX0dUVCBhcyBzdXBwb3J0ZWQgZG9tYWlu
DQo+Pj4NCj4+PiB2MjoNCj4+PiBNb3ZlIEJPIHBsYWNlbWVudCBsb2dpYyBpbnRvIGFtZGdwdV9k
aXNwbGF5X3N1cHBvcnRlZF9kb21haW5zDQo+Pj4NCj4+PiB2MzoNCj4+PiBVc2UgYW1kZ3B1X2Jv
X3ZhbGlkYXRlX3Vzd2MgaW4gYW1kZ3B1X2Rpc3BsYXlfc3VwcG9ydGVkX2RvbWFpbnMuDQo+Pj4N
Cj4+PiBDaGFuZ2UtSWQ6IElmMzQzMDBiZWFhNjBiZTJkMzYxNzBiN2I1YjA5NmVjNjQ0NTAyYjIw
DQo+Pj4gU2lnbmVkLW9mZi1ieTogU2hpcmlzaCBTIDxzaGlyaXNoLnNAYW1kLmNvbT4NCj4+PiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNv
bT4NCj4+IEFjdHVhbGx5IHRoYXQgZG9lc24ndCBsb29rIGxpa2UgYSBnb29kIGlkZWEgdG8gbWUu
DQo+Pg0KPj4gSXQgaXMgc3RpbGwgcGVyZmVjdGx5IHBvc3NpYmxlIChhbmQgd2FudGVkISkgdGhh
dCB0aGUgVVNXQyBmbGFnIHdhcyBub3QNCj4+IHNldCBpbiB0aGUgZmlyc3QgcGxhY2UgYnkgdXNl
cnNwYWNlLg0KPj4NCj4+IElzIHRoYXQgc3RpbGwgY2hlY2tlZCBzb21ld2hlcmU/DQo+Pg0KPj4g
UmVnYXJkcywNCj4+IENocmlzdGlhbi4NCj4NCj4gTm90IHN1cmUgSSB1bmRlcnN0YW5kIGhlcmUs
IGNhbiB5b3UgZWxhYm9yYXRlID8NCg0KSXQncyBzdGlsbCBwb3NzaWJsZSB0aGF0IHVzZXJzcGFj
ZSBkb2Vzbid0IHNldCB0aGUgVVNXQyBmbGFnIGFuZCB0aGVyZSANCmFjdHVhbGx5IG1pZ2h0IGJl
IGdvb2QgcmVhc29ucyBmb3IgdGhhdC4NCg0KRG8gd2Ugc3RpbGwgaGF2ZSBhIGNoZWNrIGZvciB0
aGlzIGNhc2Ugc29tZXdoZXJlPw0KDQpDaHJpc3RpYW4uDQoNCg0KPg0KPiBBbmRyZXkNCj4NCj4N
Cj4+PiAtLS0NCj4+PiAgICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3Bs
YXkuYyAgICAgICB8IDE2ICsrKysrKysrKysrKysrLS0NCj4+PiAgICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8ICAyICstDQo+Pj4gICAgIDIgZmls
ZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3BsYXkuYw0KPj4+IGluZGV4IDc2
N2VlNjk5Li4yM2I4MDQ2IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kaXNwbGF5LmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGlzcGxheS5jDQo+Pj4gQEAgLTM3LDYgKzM3LDcgQEANCj4+PiAgICAgI2luY2x1
ZGUgPGRybS9kcm1fZWRpZC5oPg0KPj4+ICAgICAjaW5jbHVkZSA8ZHJtL2RybV9nZW1fZnJhbWVi
dWZmZXJfaGVscGVyLmg+DQo+Pj4gICAgICNpbmNsdWRlIDxkcm0vZHJtX2ZiX2hlbHBlci5oPg0K
Pj4+ICsjaW5jbHVkZSA8ZHJtL2RybV9jYWNoZS5oPg0KPj4+ICAgICANCj4+PiAgICAgc3RhdGlj
IHZvaWQgYW1kZ3B1X2Rpc3BsYXlfZmxpcF9jYWxsYmFjayhzdHJ1Y3QgZG1hX2ZlbmNlICpmLA0K
Pj4+ICAgICAJCQkJCSBzdHJ1Y3QgZG1hX2ZlbmNlX2NiICpjYikNCj4+PiBAQCAtNDk2LDEwICs0
OTcsMjEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZnJhbWVidWZmZXJfZnVuY3MgYW1kZ3B1
X2ZiX2Z1bmNzID0gew0KPj4+ICAgICB1aW50MzJfdCBhbWRncHVfZGlzcGxheV9zdXBwb3J0ZWRf
ZG9tYWlucyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4+PiAgICAgew0KPj4+ICAgICAJ
dWludDMyX3QgZG9tYWluID0gQU1ER1BVX0dFTV9ET01BSU5fVlJBTTsNCj4+PiArCXU2NCB1c3dj
X2ZsYWcgPSBBTURHUFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0M7DQo+Pj4gICAgIA0KPj4+ICAg
ICAjaWYgZGVmaW5lZChDT05GSUdfRFJNX0FNRF9EQykNCj4+PiAtCWlmIChhZGV2LT5hc2ljX3R5
cGUgPj0gQ0hJUF9DQVJSSVpPICYmIGFkZXYtPmFzaWNfdHlwZSA8IENISVBfUkFWRU4gJiYNCj4+
PiAtCSAgICBhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUgJiYNCj4+PiArCS8qDQo+Pj4gKwkgKiBp
ZiBhbWRncHVfYm9fdmFsaWRhdGVfdXN3YyBjbGVhcnMgQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dU
VF9VU1dDIGl0DQo+Pj4gKwkgKiBtZWFucyB0aGF0IFVTV0MgbWFwcGluZ3MNCj4+PiArCSAqIGlz
IG5vdCBzdXBwb3J0ZWQgZm9yIHRoaXMgYm9hcmQuIEJ1dCB0aGlzIG1hcHBpbmcgaXMgcmVxdWly
ZWQNCj4+PiArCSAqIHRvIGF2b2lkIGhhbmcgY2F1c2VkIGJ5IHBsYWNlbWVudCBvZiBzY2Fub3V0
IEJPIGluIEdUVCBvbiBjZXJ0YWluDQo+Pj4gKwkgKiBBUFVzLiBTbyBmb3JjZSB0aGUgQk8gcGxh
Y2VtZW50IHRvIFZSQU0gaW4gY2FzZSB0aGlzIGFyY2hpdGVjdHVyZQ0KPj4+ICsJICogd2lsbCBu
b3QgYWxsb3cgVVNXQyBtYXBwaW5ncy4NCj4+PiArCSAqLw0KPj4+ICsJYW1kZ3B1X2JvX3ZhbGlk
YXRlX3Vzd2MoJnVzd2NfZmxhZyk7DQo+Pj4gKw0KPj4+ICsJaWYgKGFkZXYtPmFzaWNfdHlwZSA+
PSBDSElQX0NBUlJJWk8gJiYgYWRldi0+YXNpY190eXBlIDw9IENISVBfUkFWRU4gJiYNCj4+PiAr
CSAgICBhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUgJiYgdXN3Y19mbGFnICYmDQo+Pj4gICAgIAkg
ICAgYW1kZ3B1X2RldmljZV9hc2ljX2hhc19kY19zdXBwb3J0KGFkZXYtPmFzaWNfdHlwZSkpDQo+
Pj4gICAgIAkJZG9tYWluIHw9IEFNREdQVV9HRU1fRE9NQUlOX0dUVDsNCj4+PiAgICAgI2VuZGlm
DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5jDQo+Pj4gaW5kZXggNDkyMjU4OS4uZjAzODdjZTEgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4+PiBA
QCAtNjg2LDcgKzY4Niw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX2luaXQoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpDQo+Pj4gICAgIAkgKi8NCj4+PiAgICAgCWlmIChhZGV2LT5mbGFncyAm
IEFNRF9JU19BUFUgJiYNCj4+PiAgICAgCSAgICBhZGV2LT5hc2ljX3R5cGUgPj0gQ0hJUF9DQVJS
SVpPICYmDQo+Pj4gLQkgICAgYWRldi0+YXNpY190eXBlIDwgQ0hJUF9SQVZFTikNCj4+PiArCSAg
ICBhZGV2LT5hc2ljX3R5cGUgPD0gQ0hJUF9SQVZFTikNCj4+PiAgICAgCQlpbml0X2RhdGEuZmxh
Z3MuZ3B1X3ZtX3N1cHBvcnQgPSB0cnVlOw0KPj4+ICAgICANCj4+PiAgICAgCWlmIChhbWRncHVf
ZGNfZmVhdHVyZV9tYXNrICYgRENfRkJDX01BU0spDQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
