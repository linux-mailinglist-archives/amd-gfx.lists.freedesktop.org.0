Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D2F76628
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 14:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BCDF6ED37;
	Fri, 26 Jul 2019 12:47:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690046.outbound.protection.outlook.com [40.107.69.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A486ED37
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 12:47:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MEguMfNcH9/2caTk3cOBwvyuggi7Svs65nwz7ky3fkEyhVB57iNeQFZE48szUv1BdKX6VAdj+N/BFOF6rs7Rw5/dyn0i2+MdYpS/EKqRzR85+GKE4SS7IP9TQ+uxkV80+NssquGulbvLYE8vLbgKJstoXPbDU7p9Io+ZJU238w4J3veLz9D8ZZBJx9AJV3WXhK6Gq/f22goVlfQB7CxAyYHKtq862DwfT3scC6yiIa+YOGR+Qp8LMBkrx8b+nYKA08CyTyamuIMTGLYvnSiKyZYqVb3qqjNs6UMYTwcDi6drBUA2k8Suy6XJKISGzQr8hbnzGFg0kbn8sBnCIgVikQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVKVPZ6Z2Vrj1CdfNOL8A0NceZLe7BZ2MIuQkNyOeMg=;
 b=Xiv0hLpR5hhUyqo/dYXGTc6XrxA1U/AhmhJbtZi8QIt+XswFsGgLMM5TN5KJkg/EPgtcr/vlLdc9mwH4CoyFVvtcqw4BU+Lzo8U70ghp00xbDEI9hRfDZAGkm4SNVZML4jqE/vI1B0aksWeYUon0mZdY0GZDiTuii3H2moHXs537IDVKri6hMRS0viQoFQtGkAOZp0hX9+8GTPg1EXROIZwzGDGxkjA7uqYZ7nFxJeMkSTlSh7s5Fi3wmxZU+vcsTKKqvVDT2N1WeH5T6QmTXc1Vg9CcApfy/DkLk5b8SFUCKo3SQUFQHIAHS7+o7VOGEdK8B26DCJajV/d+PGtk2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1743.namprd12.prod.outlook.com (10.175.55.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Fri, 26 Jul 2019 12:47:19 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::59df:2c5b:b1e2:8845]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::59df:2c5b:b1e2:8845%3]) with mapi id 15.20.2094.017; Fri, 26 Jul 2019
 12:47:18 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: [PATCH v5 4/4] drm/amd/display: enable S/G for RAVEN chip
Thread-Topic: [PATCH v5 4/4] drm/amd/display: enable S/G for RAVEN chip
Thread-Index: AQHVQvTP2dlvH7ToRkG9/sKZ0EFBFqbcfbqAgAAeTQCAAD6RAA==
Date: Fri, 26 Jul 2019 12:47:18 +0000
Message-ID: <1e82a2ab-60d2-f9c0-1a92-71bdce6d6858@amd.com>
References: <1564064683-31796-1-git-send-email-andrey.grodzovsky@amd.com>
 <1564064683-31796-5-git-send-email-andrey.grodzovsky@amd.com>
 <a1e2755c-142c-ceaf-9be4-1ffff4d25cea@gmail.com>
 <8046a45b-bf49-ad47-8902-ad928dcc97b4@daenzer.net>
In-Reply-To: <8046a45b-bf49-ad47-8902-ad928dcc97b4@daenzer.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0013.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::26) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e975bbef-68be-4909-75c1-08d711c764d1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1743; 
x-ms-traffictypediagnostic: MWHPR12MB1743:
x-microsoft-antispam-prvs: <MWHPR12MB17435E186F3C737825BE94C9EAC00@MWHPR12MB1743.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(199004)(189003)(76176011)(5660300002)(478600001)(52116002)(102836004)(6436002)(68736007)(26005)(11346002)(6246003)(2616005)(4326008)(6486002)(31686004)(3846002)(54906003)(2906002)(6512007)(81166006)(6116002)(53546011)(305945005)(386003)(36756003)(6506007)(53936002)(66556008)(99286004)(66946007)(110136005)(71190400001)(14444005)(8936002)(8676002)(14454004)(71200400001)(229853002)(66476007)(64756008)(66066001)(7736002)(66446008)(66574012)(25786009)(486006)(476003)(6636002)(186003)(316002)(86362001)(31696002)(446003)(81156014)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1743;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gQyXOLKCRIokE27LB0RJFy65wajEG50Ohp85iYDZ94lRvmdxo2JusqkzQGXGwzwVU3w1ZahfsMf1EC5o2u7P6f1wtH/THyfP/aEH/Q2RsmK7BqNuTodUV9U+guzxJ90FWeWbt/mMkPG3mk32g0zLlDSm83CLFEwfj5PdGTQgboWc+6UqhgsImG70NDo5TzfSs5k4cuFMVfhq3LWD2OgqyWHPCdlR0YGykaJl8PSZhq9u8kCnEqJjkBADfaEfNVlZRo0Bf2hoSAPNPEjyJzuF75cMPTvPq+abES0Kd93WVByXnxv+CIapoqkEPC07+D2ccMTbQlRKbHRek5UTsjRNJ59W1jiKgXIXzyIyaI7G6xZnqDow9vFqCvVQq9HvbWCsiKPzNTs/xIoGLz+rlvTBdR414toQTzlUPpXc3xrJ3II=
Content-ID: <009563186E589A4FAD53D95DABCEDCEF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e975bbef-68be-4909-75c1-08d711c764d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 12:47:18.7100 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agrodzov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1743
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVKVPZ6Z2Vrj1CdfNOL8A0NceZLe7BZ2MIuQkNyOeMg=;
 b=EruzWNOc47fDn9lnZp+ckRpF2u0c+typhv+QTYD7zhS5Mof5Sljd7baRvfpRNrwMYfdEWstpxdGgZDKum/Wknw52UXGWSJmZqqmhzd7ZzKSNJ9Yh8YUiAu+EoTyr+U3wP+xz09USiCHATKdLfVopLXVo0PDtb8YzTn81TbbiV0U=
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
Cc: "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Wu, Hersen" <hersenxs.wu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "S,
 Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VG90YWxseSBhZ3JlZSwgbWUgb3IgU2hpcmlzaCB3aWxsIGFkZCBhIG5ldyBwYXRjaCBmb3IgdGhp
cyBhcyBJJ3ZlIA0KYWxyZWFkeSBjb21tdXRlZCB0aGUgc2VyaWVzLg0KDQpBbmRyZXkNCg0KT24g
Ny8yNi8xOSA1OjAzIEFNLCBNaWNoZWwgRMOkbnplciB3cm90ZToNCj4gT24gMjAxOS0wNy0yNiA5
OjE0IGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+PiBBbSAyNS4wNy4xOSB1bSAxNjoy
NCBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Og0KPj4+IEZyb206IFNoaXJpc2ggUyA8c2hpcmlz
aC5zQGFtZC5jb20+DQo+Pj4NCj4+PiBlbmFibGVzIGdwdV92bV9zdXBwb3J0IGluIGRtIGFuZCBh
ZGRzDQo+Pj4gQU1ER1BVX0dFTV9ET01BSU5fR1RUIGFzIHN1cHBvcnRlZCBkb21haW4NCj4+Pg0K
Pj4+IHYyOg0KPj4+IE1vdmUgQk8gcGxhY2VtZW50IGxvZ2ljIGludG8gYW1kZ3B1X2Rpc3BsYXlf
c3VwcG9ydGVkX2RvbWFpbnMNCj4+Pg0KPj4+IHYzOg0KPj4+IFVzZSBhbWRncHVfYm9fdmFsaWRh
dGVfdXN3YyBpbiBhbWRncHVfZGlzcGxheV9zdXBwb3J0ZWRfZG9tYWlucy4NCj4+Pg0KPj4+IHY0
Og0KPj4+IGFtZGdwdV9ib192YWxpZGF0ZV91c3djIG1vdmVkIHRvIHNlcHBlcmF0ZSBwYXRjaC4N
Cj4+Pg0KPj4+IENoYW5nZS1JZDogSWYzNDMwMGJlYWE2MGJlMmQzNjE3MGI3YjViMDk2ZWM2NDQ1
MDJiMjANCj4+PiBTaWduZWQtb2ZmLWJ5OiBTaGlyaXNoIFMgPHNoaXJpc2guc0BhbWQuY29tPg0K
Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBh
bWQuY29tPg0KPj4+IC0tLQ0KPj4+ICDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGlzcGxheS5jwqDCoMKgwqDCoMKgIHwgMiArLQ0KPj4+ICDCoCBkcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMiArLQ0KPj4+ICDCoCAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jDQo+Pj4g
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jDQo+Pj4gaW5kZXgg
Y2FjOTk3NS4uNzMwNDVhMyAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGlzcGxheS5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2Rpc3BsYXkuYw0KPj4+IEBAIC01MDUsNyArNTA1LDcgQEAgdWludDMyX3QgYW1k
Z3B1X2Rpc3BsYXlfc3VwcG9ydGVkX2RvbWFpbnMoc3RydWN0DQo+Pj4gYW1kZ3B1X2RldmljZSAq
YWRldikNCj4+PiAgwqDCoMKgwqDCoMKgICogQVBVcy4gU28gZm9yY2UgdGhlIEJPIHBsYWNlbWVu
dCB0byBWUkFNIGluIGNhc2UgdGhpcw0KPj4+IGFyY2hpdGVjdHVyZQ0KPj4+ICDCoMKgwqDCoMKg
wqAgKiB3aWxsIG5vdCBhbGxvdyBVU1dDIG1hcHBpbmdzLg0KPj4+ICDCoMKgwqDCoMKgwqAgKi8N
Cj4+PiAtwqDCoMKgIGlmIChhZGV2LT5hc2ljX3R5cGUgPj0gQ0hJUF9DQVJSSVpPICYmIGFkZXYt
PmFzaWNfdHlwZSA8DQo+Pj4gQ0hJUF9SQVZFTiAmJg0KPj4+ICvCoMKgwqAgaWYgKGFkZXYtPmFz
aWNfdHlwZSA+PSBDSElQX0NBUlJJWk8gJiYgYWRldi0+YXNpY190eXBlIDw9DQo+Pj4gQ0hJUF9S
QVZFTiAmJg0KPj4gVGhpcyB3aG9sZSBhcHByb2FjaCBpcyBpbmNvcnJlY3Qgc2luY2Ugd2UgZG9u
J3QgY2hlY2sgdGhlIGZsYWdzIG9mIHRoZQ0KPj4gYWN0dWFsbHkgQk8gdXNlZCBmb3Igc2Nhbm91
dCBhbnkgbW9yZS4NCj4+DQo+PiBBcyBJIHdyb3RlIGJlZm9yZSBpdCBpcyBzdGlsbCBwZXJmZWN0
bHkgcG9zc2libGUgYW5kIHZhbGlkIHRoYXQNCj4+IHVzZXJzcGFjZSBuZXZlciBzZXRzIHRoaXMg
ZmxhZy4NCj4gT2ggcmlnaHQsIG5vdyBJIGdldCB3aGF0IHlvdSBtZWFudCBiZWZvcmUhDQo+DQo+
IEkgZ3Vlc3MgYW1kZ3B1X2Rpc3BsYXlfc3VwcG9ydGVkX2RvbWFpbnMgbmVlZHMgdG8gdGFrZSB0
aGUgQk8gZmxhZ3MgYXMgYQ0KPiBwYXJhbWV0ZXIsIGFuZCBhbHNvIGNoZWNrIHRoYXQgQU1ER1BV
X0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dDIGlzDQo+IGFjdHVhbGx5IHNldC4NCj4NCj4NCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
