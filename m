Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 180F210F50E
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Dec 2019 03:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B676E36F;
	Tue,  3 Dec 2019 02:40:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730045.outbound.protection.outlook.com [40.107.73.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9101F6E36F
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Dec 2019 02:40:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRpDjtoj+ah22GNiEs5PeNIbBIXOOagrmfU4WWzSihdWbXMOJTA80X8IBG9gvLDGPjI+7tBe1C2uj2PETxw3Kp6moo2IAWavVysSM+oRJWg6dsCZIr+92+i1iNHc/DUjblOEVLLzrfLno5nNcMpqQfJpAsBDhoEwZULlYf+Kq2o+fP3oEbucTlxgWya4lSgBX8Wi4mXif9vxLR0QVwNv7/+EN4YfVxzDdEaq8Wtbzc0pM76RKi7wDuvK35Fd+OSfMlgMPSExsMhx/oO8dLxqkCfxb2M0qbzD5FuQk4HEyMPsvS1sJV0UfOhueXIaSUs4oqvFR+OVjHVzLgmaapq8ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhY1T1xpIxNh4oqcIKURgQDLLro7dCSmPGrwrYR0Td4=;
 b=A1hHnLSTAcFxm5T12ThkLASzrLDacpqDlSzXLKYaOyt/xq0AxklHU1tiUSHCKSOf7egBs3eU1pUsUWkgYiX8yfoRlk4+BVFTfRTJUBeCit9wI71xBTbUfXI8Mpsu0I9orPAFzIW0aZb04eOfh/0nPoItcq3X/uEX0z0vkarGJI/hztFogRPqCLiJPjtjJ1magRBotMq/9m3Ae6cJP3vKjLsQPlfWQOFV6bbX378eLS49yhp96LaIudAoxM4C9asU1w1nE22kjwP1bdzIqp0UsWT9blGXkeohfa9Mq1V8T+W/lHqB/2CJ2EjsZchS+KK4WcnPQTPW7hPzT7hLjO51DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3053.namprd12.prod.outlook.com (20.178.241.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.22; Tue, 3 Dec 2019 02:40:36 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::3cb6:a512:f4e1:5d9d]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::3cb6:a512:f4e1:5d9d%4]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 02:40:36 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Gao, Likun" <Likun.Gao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/powerplay: unify smu send message function
Thread-Topic: [PATCH] drm/amdgpu/powerplay: unify smu send message function
Thread-Index: AQHVqPf9zw8KaMt8oEuBKI7QPGK4Daens7nQ
Date: Tue, 3 Dec 2019 02:40:36 +0000
Message-ID: <MN2PR12MB334442336DCB966D71EBA581E4420@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1575281023-2993-1-git-send-email-likun.gao@amd.com>
In-Reply-To: <1575281023-2993-1-git-send-email-likun.gao@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=52e26c53-2682-4d75-a767-000090ea7fd0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Use Only - Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2019-12-03T02:39:07Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 10edcb71-56a5-497a-9b80-08d7779a2d84
x-ms-traffictypediagnostic: MN2PR12MB3053:|MN2PR12MB3053:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3053B3AF102325EC47F6EFD7E4420@MN2PR12MB3053.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 02408926C4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(13464003)(199004)(189003)(45080400002)(71200400001)(66556008)(305945005)(186003)(74316002)(76176011)(14454004)(66946007)(966005)(76116006)(66476007)(64756008)(66446008)(86362001)(8676002)(66066001)(33656002)(2501003)(6116002)(3846002)(99286004)(2906002)(11346002)(26005)(15650500001)(446003)(6506007)(229853002)(102836004)(6306002)(25786009)(9686003)(30864003)(7736002)(8936002)(14444005)(4326008)(316002)(6246003)(53546011)(256004)(81156014)(81166006)(5660300002)(478600001)(110136005)(54906003)(6436002)(71190400001)(52536014)(7696005)(55016002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3053;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bdiXAV1bUB9S9qNoVvvZs0S6LDak8Ym/gZ/Alo8mo0vLsOhX+bIz7sw7bVrStrBHiqBoe8cVFO5liqxftBwIh1DQrHU3vMpCebtwJLyA5gpJrr+ccIcZUpNwcVZ1IwFRGCwvtuZvtSUo/J4vVv1s9EP3r9cPq0JGTlBNij1s/9lG6IwRHY7ni1eCQ4mT0ZlyiflqLq8b4t1Aybb0WcbHiHq/mvt85Q62cSSHPa0xf6cLR+764VGFzyrc5Yxbi7bARJ7Sefub6HI+xxZwhXyZiE9LWgsNEbKF4TnPf4N7lvQXJa6ZbYaBFJBMcuBypkDZFmrku65XNQdCHsC2JGOquO5dst2MFTP4Rf4HPLI4aOx8T8/8ISKpAeNY3KWETJbf/2kN1vM6XUurd1oMzaDuz0UUK7C5C5Evjcem6kDrCo4jftr8kLf49BCVS5R3uETOo9JyCM/1DmUiryDJuhXgkO4dPMy/bmjnRvJW5mF/FZY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10edcb71-56a5-497a-9b80-08d7779a2d84
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 02:40:36.7219 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XA0XDVP3cjryI8bH99GdTFeYODo7FBj5kUSF0qF6F8x53PXcr8XyWWfbYAFZUjqk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3053
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhY1T1xpIxNh4oqcIKURgQDLLro7dCSmPGrwrYR0Td4=;
 b=oACLgB4bIecVGE89Jgn8u+d0dP+4iLPhQAU6paTKTFV7zTzCsc0cVpPN/0vOMSXopDhv0291EEfxHfFRq+OF0PUO/A4JCLzn5Zpfl/6/nBDyxNoTxzcl56YYpgpy7UxUvqtu7o1Ac0FnxA6qyufRJv6x5ThMPlOOS7YIQRQWKAY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Gao, Likun" <Likun.Gao@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIExpa3VuDQo+IEdh
bw0KPiBTZW50OiBNb25kYXksIERlY2VtYmVyIDIsIDIwMTkgNjowNCBQTQ0KPiBUbzogYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEdhbywgTGlrdW4gPExpa3VuLkdhb0BhbWQu
Y29tPjsgV2FuZywgS2V2aW4oWWFuZykNCj4gPEtldmluMS5XYW5nQGFtZC5jb20+OyBGZW5nLCBL
ZW5uZXRoIDxLZW5uZXRoLkZlbmdAYW1kLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1k
Z3B1L3Bvd2VycGxheTogdW5pZnkgc211IHNlbmQgbWVzc2FnZSBmdW5jdGlvbg0KPiANCj4gRnJv
bTogTGlrdW4gR2FvIDxMaWt1bi5HYW9AYW1kLmNvbT4NCj4gDQo+IERyb3Agc211X3NlbmRfc21j
X21zZyBmdW5jdGlvbiBmcm9tIEFTSUMgc3BlY2lmeSBzdHJ1Y3R1cmUuDQo+IFJldXNlIHNtdV9z
ZW5kX3NtY19tc2dfd2l0aF9wYXJhbSBmdW5jdGlvbiBmb3Igc211X3NlbmRfc21jX21zZy4NCj4g
U2V0IHBhcmFtZXIgdG8gMCBmb3Igc211X3NlbmRfbXNnIGZ1bmN0aW9uLCBvdGhlcndpc2UgaXQg
d2lsbCBzZW5kDQo+IHdpdGggcHJldmlvdXMgcGFyYW1lciB2YWx1ZSAoTm90IGEgY2VydGFpbiB2
YWx1ZSkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMaWt1biBHYW8gPExpa3VuLkdhb0BhbWQuY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyAg
ICAgfCAgOCArKysrKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVy
dXNfcHB0LmMgICB8ICAxIC0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9h
bWRncHVfc211LmggfCAgMyArKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2lu
Yy9zbXVfdjExXzAuaCAgfCAgMiAtLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
aW5jL3NtdV92MTJfMC5oICB8ICAyIC0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9uYXZpMTBfcHB0LmMgICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvcmVub2lyX3BwdC5jICAgICB8ICAxIC0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L3NtdV9pbnRlcm5hbC5oICAgfCAgMiAtLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvc211X3YxMV8wLmMgICAgICB8IDI2IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjEyXzAuYyAgICAgIHwgMjUgLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
dmVnYTIwX3BwdC5jICAgICB8ICAxIC0NCj4gIDExIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlv
bnMoKyksIDYyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2FtZGdwdV9zbXUuYw0KPiBpbmRleCAzNjAwMWE0Li5lMDM5OTA0IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jDQo+IEBAIC0yNTY3LDMg
KzI1NjcsMTEgQEAgdWludDMyX3Qgc211X2dldF9wcHRhYmxlX3Bvd2VyX2xpbWl0KHN0cnVjdA0K
PiBzbXVfY29udGV4dCAqc211KQ0KPiANCj4gIAlyZXR1cm4gcmV0Ow0KPiAgfQ0KPiArDQo+ICtp
bnQgc211X3NlbmRfc21jX21zZyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDE2X3QgbXNn
KQ0KPiArew0KPiArCWludCByZXQ7DQo+ICsNCj4gKwlyZXQgPSBzbXUtPnBwdF9mdW5jcy0+c2Vu
ZF9zbWNfbXNnX3dpdGhfcGFyYW0oc211LCBtc2csIDApOw0KPiArCXJldHVybiByZXQ7DQo+ICt9
DQpbUXVhbiwgRXZhbl0gQmV0dGVyIHRvIHN0aWxsIGtlZXAgdGhlIHNtdV9zZW5kX3NtY19tc2cg
ZGVmaW5pdGlvbiBpbiBzbXVfaW50ZXJuYWwuaCBhcyBpdCdzIHVzZWQgaW50ZXJuYWxseS4NCk90
aGVyIHRoYW4gdGhpcywgdGhlIHBhdGNoIGlzIHJldmlld2VkLWJ5OiBFdmFuIFF1YW4gPGV2YW4u
cXVhbkBhbWQuY29tPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvYXJjdHVydXNfcHB0LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0
dXJ1c19wcHQuYw0KPiBpbmRleCA2ODEwN2RlLi4zZjEzOTg2IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYw0KPiBAQCAtMjEzNyw3ICsyMTM3
LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIGFyY3R1cnVzX3BwdF9mdW5j
cw0KPiA9IHsNCj4gIAkuc2V0X3Rvb2xfdGFibGVfbG9jYXRpb24gPSBzbXVfdjExXzBfc2V0X3Rv
b2xfdGFibGVfbG9jYXRpb24sDQo+ICAJLm5vdGlmeV9tZW1vcnlfcG9vbF9sb2NhdGlvbiA9DQo+
IHNtdV92MTFfMF9ub3RpZnlfbWVtb3J5X3Bvb2xfbG9jYXRpb24sDQo+ICAJLnN5c3RlbV9mZWF0
dXJlc19jb250cm9sID0gc211X3YxMV8wX3N5c3RlbV9mZWF0dXJlc19jb250cm9sLA0KPiAtCS5z
ZW5kX3NtY19tc2cgPSBzbXVfdjExXzBfc2VuZF9tc2csDQo+ICAJLnNlbmRfc21jX21zZ193aXRo
X3BhcmFtID0gc211X3YxMV8wX3NlbmRfbXNnX3dpdGhfcGFyYW0sDQo+ICAJLnJlYWRfc21jX2Fy
ZyA9IHNtdV92MTFfMF9yZWFkX2FyZywNCj4gIAkuaW5pdF9kaXNwbGF5X2NvdW50ID0gc211X3Yx
MV8wX2luaXRfZGlzcGxheV9jb3VudCwNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oDQo+IGluZGV4IGFkYTRhOGQuLmZhZTEwMjYgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaA0K
PiBAQCAtNTAwLDcgKzUwMCw2IEBAIHN0cnVjdCBwcHRhYmxlX2Z1bmNzIHsNCj4gIAlpbnQgKCpu
b3RpZnlfbWVtb3J5X3Bvb2xfbG9jYXRpb24pKHN0cnVjdCBzbXVfY29udGV4dCAqc211KTsNCj4g
IAlpbnQgKCpzZXRfbGFzdF9kY2VmX21pbl9kZWVwX3NsZWVwX2Nsaykoc3RydWN0IHNtdV9jb250
ZXh0ICpzbXUpOw0KPiAgCWludCAoKnN5c3RlbV9mZWF0dXJlc19jb250cm9sKShzdHJ1Y3Qgc211
X2NvbnRleHQgKnNtdSwgYm9vbCBlbik7DQo+IC0JaW50ICgqc2VuZF9zbWNfbXNnKShzdHJ1Y3Qg
c211X2NvbnRleHQgKnNtdSwgdWludDE2X3QgbXNnKTsNCj4gIAlpbnQgKCpzZW5kX3NtY19tc2df
d2l0aF9wYXJhbSkoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQxNl90DQo+IG1zZywgdWlu
dDMyX3QgcGFyYW0pOw0KPiAgCWludCAoKnJlYWRfc21jX2FyZykoc3RydWN0IHNtdV9jb250ZXh0
ICpzbXUsIHVpbnQzMl90ICphcmcpOw0KPiAgCWludCAoKmluaXRfZGlzcGxheV9jb3VudCkoc3Ry
dWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQzMl90IGNvdW50KTsNCj4gQEAgLTcyNSw0ICs3MjQs
NiBAQCBpbnQgc211X2dldF9kcG1fY2xvY2tfdGFibGUoc3RydWN0IHNtdV9jb250ZXh0DQo+ICpz
bXUsDQo+IA0KPiAgdWludDMyX3Qgc211X2dldF9wcHRhYmxlX3Bvd2VyX2xpbWl0KHN0cnVjdCBz
bXVfY29udGV4dCAqc211KTsNCj4gDQo+ICtpbnQgc211X3NlbmRfc21jX21zZyhzdHJ1Y3Qgc211
X2NvbnRleHQgKnNtdSwgdWludDE2X3QgbXNnKTsNCj4gKw0KPiAgI2VuZGlmDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3YxMV8wLmgNCj4gYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3YxMV8wLmgNCj4gaW5kZXggNWEy
NzcxMy4uODBiMWQyMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvaW5jL3NtdV92MTFfMC5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2luYy9zbXVfdjExXzAuaA0KPiBAQCAtMTc3LDggKzE3Nyw2IEBAIGludCBzbXVfdjExXzBfbm90
aWZ5X21lbW9yeV9wb29sX2xvY2F0aW9uKHN0cnVjdA0KPiBzbXVfY29udGV4dCAqc211KTsNCj4g
IGludCBzbXVfdjExXzBfc3lzdGVtX2ZlYXR1cmVzX2NvbnRyb2woc3RydWN0IHNtdV9jb250ZXh0
ICpzbXUsDQo+ICAJCQkJCSAgICAgYm9vbCBlbik7DQo+IA0KPiAtaW50IHNtdV92MTFfMF9zZW5k
X21zZyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDE2X3QgbXNnKTsNCj4gLQ0KPiAgaW50
DQo+ICBzbXVfdjExXzBfc2VuZF9tc2dfd2l0aF9wYXJhbShzdHJ1Y3Qgc211X2NvbnRleHQgKnNt
dSwgdWludDE2X3QgbXNnLA0KPiAgCQkJICAgICAgdWludDMyX3QgcGFyYW0pOw0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTJfMC5oDQo+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTJfMC5oDQo+IGluZGV4IDQ0
YzY1ZGQuLmY3MDlmNmUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2luYy9zbXVfdjEyXzAuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9pbmMvc211X3YxMl8wLmgNCj4gQEAgLTQ0LDggKzQ0LDYgQEAgaW50IHNtdV92MTJfMF9yZWFk
X2FyZyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwNCj4gdWludDMyX3QgKmFyZyk7DQo+IA0KPiAg
aW50IHNtdV92MTJfMF93YWl0X2Zvcl9yZXNwb25zZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSk7
DQo+IA0KPiAtaW50IHNtdV92MTJfMF9zZW5kX21zZyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwg
dWludDE2X3QgbXNnKTsNCj4gLQ0KPiAgaW50DQo+ICBzbXVfdjEyXzBfc2VuZF9tc2dfd2l0aF9w
YXJhbShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDE2X3QgbXNnLA0KPiAgCQkJICAgICAg
dWludDMyX3QgcGFyYW0pOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvbmF2aTEwX3BwdC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2
aTEwX3BwdC5jDQo+IGluZGV4IGY4NDIyNDYuLjE1NDAzYjcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMNCj4gQEAgLTIwODMsNyArMjA4Myw2IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyBuYXZpMTBfcHB0X2Z1bmNzID0NCj4g
ew0KPiAgCS5zZXRfdG9vbF90YWJsZV9sb2NhdGlvbiA9IHNtdV92MTFfMF9zZXRfdG9vbF90YWJs
ZV9sb2NhdGlvbiwNCj4gIAkubm90aWZ5X21lbW9yeV9wb29sX2xvY2F0aW9uID0NCj4gc211X3Yx
MV8wX25vdGlmeV9tZW1vcnlfcG9vbF9sb2NhdGlvbiwNCj4gIAkuc3lzdGVtX2ZlYXR1cmVzX2Nv
bnRyb2wgPSBzbXVfdjExXzBfc3lzdGVtX2ZlYXR1cmVzX2NvbnRyb2wsDQo+IC0JLnNlbmRfc21j
X21zZyA9IHNtdV92MTFfMF9zZW5kX21zZywNCj4gIAkuc2VuZF9zbWNfbXNnX3dpdGhfcGFyYW0g
PSBzbXVfdjExXzBfc2VuZF9tc2dfd2l0aF9wYXJhbSwNCj4gIAkucmVhZF9zbWNfYXJnID0gc211
X3YxMV8wX3JlYWRfYXJnLA0KPiAgCS5pbml0X2Rpc3BsYXlfY291bnQgPSBzbXVfdjExXzBfaW5p
dF9kaXNwbGF5X2NvdW50LA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvcmVub2lyX3BwdC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVu
b2lyX3BwdC5jDQo+IGluZGV4IGI0NGNlMTQuLmIwNzY1ODkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMNCj4gQEAgLTgwMCw3ICs4MDAsNiBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IHBwdGFibGVfZnVuY3MgcmVub2lyX3BwdF9mdW5jcyA9IHsNCj4g
IAkucG93ZXJnYXRlX3NkbWEgPSBzbXVfdjEyXzBfcG93ZXJnYXRlX3NkbWEsDQo+ICAJLnBvd2Vy
Z2F0ZV92Y24gPSBzbXVfdjEyXzBfcG93ZXJnYXRlX3ZjbiwNCj4gIAkucG93ZXJnYXRlX2pwZWcg
PSBzbXVfdjEyXzBfcG93ZXJnYXRlX2pwZWcsDQo+IC0JLnNlbmRfc21jX21zZyA9IHNtdV92MTJf
MF9zZW5kX21zZywNCj4gIAkuc2VuZF9zbWNfbXNnX3dpdGhfcGFyYW0gPSBzbXVfdjEyXzBfc2Vu
ZF9tc2dfd2l0aF9wYXJhbSwNCj4gIAkucmVhZF9zbWNfYXJnID0gc211X3YxMl8wX3JlYWRfYXJn
LA0KPiAgCS5zZXRfZ2Z4X2NncGcgPSBzbXVfdjEyXzBfc2V0X2dmeF9jZ3BnLA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X2ludGVybmFsLmgNCj4gYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfaW50ZXJuYWwuaA0KPiBpbmRleCBiMmQ4
MWQzLi5kZDM2NDJkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9zbXVfaW50ZXJuYWwuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9z
bXVfaW50ZXJuYWwuaA0KPiBAQCAtNzcsOCArNzcsNiBAQA0KPiAgI2RlZmluZSBzbXVfc2V0X2Rl
ZmF1bHRfb2Rfc2V0dGluZ3Moc211LCBpbml0aWFsaXplKSBcDQo+ICAJKChzbXUpLT5wcHRfZnVu
Y3MtPnNldF9kZWZhdWx0X29kX3NldHRpbmdzID8gKHNtdSktPnBwdF9mdW5jcy0NCj4gPnNldF9k
ZWZhdWx0X29kX3NldHRpbmdzKChzbXUpLCAoaW5pdGlhbGl6ZSkpIDogMCkNCj4gDQo+IC0jZGVm
aW5lIHNtdV9zZW5kX3NtY19tc2coc211LCBtc2cpIFwNCj4gLQkoKHNtdSktPnBwdF9mdW5jcy0+
c2VuZF9zbWNfbXNnPyAoc211KS0+cHB0X2Z1bmNzLQ0KPiA+c2VuZF9zbWNfbXNnKChzbXUpLCAo
bXNnKSkgOiAwKQ0KPiAgI2RlZmluZSBzbXVfc2VuZF9zbWNfbXNnX3dpdGhfcGFyYW0oc211LCBt
c2csIHBhcmFtKSBcDQo+ICAJKChzbXUpLT5wcHRfZnVuY3MtPnNlbmRfc21jX21zZ193aXRoX3Bh
cmFtPyAoc211KS0+cHB0X2Z1bmNzLQ0KPiA+c2VuZF9zbWNfbXNnX3dpdGhfcGFyYW0oKHNtdSks
IChtc2cpLCAocGFyYW0pKSA6IDApDQo+ICAjZGVmaW5lIHNtdV9yZWFkX3NtY19hcmcoc211LCBh
cmcpIFwNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92
MTFfMC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMNCj4g
aW5kZXggYjkwZWI4MS4uYWNkYmI4ZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvc211X3YxMV8wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvc211X3YxMV8wLmMNCj4gQEAgLTkxLDM2ICs5MSwxMCBAQCBzdGF0aWMgaW50IHNtdV92
MTFfMF93YWl0X2Zvcl9yZXNwb25zZShzdHJ1Y3QNCj4gc211X2NvbnRleHQgKnNtdSkNCj4gIAly
ZXR1cm4gUlJFRzMyX1NPQzE1KE1QMSwgMCwgbW1NUDFfU01OX0MyUE1TR185MCkgPT0gMHgxID8N
Cj4gMCA6IC1FSU87DQo+ICB9DQo+IA0KPiAtaW50IHNtdV92MTFfMF9zZW5kX21zZyhzdHJ1Y3Qg
c211X2NvbnRleHQgKnNtdSwgdWludDE2X3QgbXNnKQ0KPiAtew0KPiAtCXN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2ID0gc211LT5hZGV2Ow0KPiAtCWludCByZXQgPSAwLCBpbmRleCA9IDA7DQo+
IC0NCj4gLQlpbmRleCA9IHNtdV9tc2dfZ2V0X2luZGV4KHNtdSwgbXNnKTsNCj4gLQlpZiAoaW5k
ZXggPCAwKQ0KPiAtCQlyZXR1cm4gaW5kZXg7DQo+IC0NCj4gLQlzbXVfdjExXzBfd2FpdF9mb3Jf
cmVzcG9uc2Uoc211KTsNCj4gLQ0KPiAtCVdSRUczMl9TT0MxNShNUDEsIDAsIG1tTVAxX1NNTl9D
MlBNU0dfOTAsIDApOw0KPiAtDQo+IC0Jc211X3YxMV8wX3NlbmRfbXNnX3dpdGhvdXRfd2FpdGlu
ZyhzbXUsICh1aW50MTZfdClpbmRleCk7DQo+IC0NCj4gLQlyZXQgPSBzbXVfdjExXzBfd2FpdF9m
b3JfcmVzcG9uc2Uoc211KTsNCj4gLQ0KPiAtCWlmIChyZXQpDQo+IC0JCXByX2VycigiZmFpbGVk
IHNlbmQgbWVzc2FnZTogJTEwcyAoJWQpIHJlc3BvbnNlICUjeFxuIiwNCj4gLQkJICAgICAgIHNt
dV9nZXRfbWVzc2FnZV9uYW1lKHNtdSwgbXNnKSwgaW5kZXgsIHJldCk7DQo+IC0NCj4gLQlyZXR1
cm4gcmV0Ow0KPiAtDQo+IC19DQo+IC0NCj4gIGludA0KPiAgc211X3YxMV8wX3NlbmRfbXNnX3dp
dGhfcGFyYW0oc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQxNl90IG1zZywNCj4gIAkJCSAg
ICAgIHVpbnQzMl90IHBhcmFtKQ0KPiAgew0KPiAtDQo+ICAJc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYgPSBzbXUtPmFkZXY7DQo+ICAJaW50IHJldCA9IDAsIGluZGV4ID0gMDsNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjEyXzAuYw0KPiBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTJfMC5jDQo+IGluZGV4IDA0NTE2
NzMuLjE0MzY1MGMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L3NtdV92MTJfMC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92
MTJfMC5jDQo+IEBAIC03NywzMSArNzcsNiBAQCBpbnQgc211X3YxMl8wX3dhaXRfZm9yX3Jlc3Bv
bnNlKHN0cnVjdCBzbXVfY29udGV4dA0KPiAqc211KQ0KPiAgCXJldHVybiBSUkVHMzJfU09DMTUo
TVAxLCAwLCBtbU1QMV9TTU5fQzJQTVNHXzkwKSA9PSAweDEgPw0KPiAwIDogLUVJTzsNCj4gIH0N
Cj4gDQo+IC1pbnQgc211X3YxMl8wX3NlbmRfbXNnKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1
aW50MTZfdCBtc2cpDQo+IC17DQo+IC0Jc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBzbXUt
PmFkZXY7DQo+IC0JaW50IHJldCA9IDAsIGluZGV4ID0gMDsNCj4gLQ0KPiAtCWluZGV4ID0gc211
X21zZ19nZXRfaW5kZXgoc211LCBtc2cpOw0KPiAtCWlmIChpbmRleCA8IDApDQo+IC0JCXJldHVy
biBpbmRleDsNCj4gLQ0KPiAtCXNtdV92MTJfMF93YWl0X2Zvcl9yZXNwb25zZShzbXUpOw0KPiAt
DQo+IC0JV1JFRzMyX1NPQzE1KE1QMSwgMCwgbW1NUDFfU01OX0MyUE1TR185MCwgMCk7DQo+IC0N
Cj4gLQlzbXVfdjEyXzBfc2VuZF9tc2dfd2l0aG91dF93YWl0aW5nKHNtdSwgKHVpbnQxNl90KWlu
ZGV4KTsNCj4gLQ0KPiAtCXJldCA9IHNtdV92MTJfMF93YWl0X2Zvcl9yZXNwb25zZShzbXUpOw0K
PiAtDQo+IC0JaWYgKHJldCkNCj4gLQkJcHJfZXJyKCJGYWlsZWQgdG8gc2VuZCBtZXNzYWdlIDB4
JXgsIHJlc3BvbnNlIDB4JXhcbiIsIGluZGV4LA0KPiAtCQkgICAgICAgcmV0KTsNCj4gLQ0KPiAt
CXJldHVybiByZXQ7DQo+IC0NCj4gLX0NCj4gLQ0KPiAgaW50DQo+ICBzbXVfdjEyXzBfc2VuZF9t
c2dfd2l0aF9wYXJhbShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDE2X3QgbXNnLA0KPiAg
CQkJICAgICAgdWludDMyX3QgcGFyYW0pDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS92ZWdhMjBfcHB0LmMNCj4gaW5kZXggMDJlZGU1Yy4uMTJiY2MzZSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYw0KPiBAQCAtMzIzMSw3ICsz
MjMxLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIHZlZ2EyMF9wcHRfZnVu
Y3MgPQ0KPiB7DQo+ICAJLnNldF90b29sX3RhYmxlX2xvY2F0aW9uID0gc211X3YxMV8wX3NldF90
b29sX3RhYmxlX2xvY2F0aW9uLA0KPiAgCS5ub3RpZnlfbWVtb3J5X3Bvb2xfbG9jYXRpb24gPQ0K
PiBzbXVfdjExXzBfbm90aWZ5X21lbW9yeV9wb29sX2xvY2F0aW9uLA0KPiAgCS5zeXN0ZW1fZmVh
dHVyZXNfY29udHJvbCA9IHNtdV92MTFfMF9zeXN0ZW1fZmVhdHVyZXNfY29udHJvbCwNCj4gLQku
c2VuZF9zbWNfbXNnID0gc211X3YxMV8wX3NlbmRfbXNnLA0KPiAgCS5zZW5kX3NtY19tc2dfd2l0
aF9wYXJhbSA9IHNtdV92MTFfMF9zZW5kX21zZ193aXRoX3BhcmFtLA0KPiAgCS5yZWFkX3NtY19h
cmcgPSBzbXVfdjExXzBfcmVhZF9hcmcsDQo+ICAJLmluaXRfZGlzcGxheV9jb3VudCA9IHNtdV92
MTFfMF9pbml0X2Rpc3BsYXlfY291bnQsDQo+IC0tDQo+IDIuNy40DQo+IA0KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcg
bGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL25hbTExLnNh
ZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5m
cmVlDQo+IGRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGYW1kLQ0KPiBnZngmYW1w
O2RhdGE9MDIlN0MwMSU3Q2V2YW4ucXVhbiU0MGFtZC5jb20lN0MwMTkxZTI4YzMzYTg0NTc1NGQN
Cj4gM2UwOGQ3NzcwZWZmMjclN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAl
N0MwJTdDNjM3MQ0KPiAwODc3OTE0MzE3Njc5OSZhbXA7c2RhdGE9eUVsU2drdmpVeUpWQlJxQnMw
N0ZGa0dXRGlUY2VXSExnbSUyQjBJDQo+IGt3MjN3NCUzRCZhbXA7cmVzZXJ2ZWQ9MA0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
