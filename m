Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A949F7F241
	for <lists+amd-gfx@lfdr.de>; Fri,  2 Aug 2019 11:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1D36ED9D;
	Fri,  2 Aug 2019 09:49:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700065.outbound.protection.outlook.com [40.107.70.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC716ED9D
 for <amd-gfx@lists.freedesktop.org>; Fri,  2 Aug 2019 09:49:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMUNlgim4DlgyQPgInK8YctQejnRE6ZeWGP/6bFHohEtqUyqrtQ43Z8vY0dNMDo5vT/1q/5o8yVHRubg9/WEJ3xmIdov5wmE2Qsv+fLu/CazZOJ1RgUhjleWi9ecv1cElV9T+DmL7A2rEN/ZSNGURJoV7RDs+x9V91kUWkkXR20QQfxDtDnTolbEMNf5GFIvVIhZ5nqVBifixb0fKKa1+2hEiEL8StRiaGxHLh1v9hIf7dkF9lusRkPqsgJ4u6xhB54/TlDZm0QadrB5t9let33iMyhPOA43N6lcCB1MvkJy5mMrPhllFpl+l4IDG7e4yxs20jUp/rF9LZtpmAtGYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VXZNWU0QZUwC9uHn/DSKhsrSr/6SuL+6aEx4AjMWuY=;
 b=GCIBGK8mCsw3nJ46Ec25WCi5tj3Wx3wwLuAi3ZDB2CfTszOZiGI1uBxKRisbtGn2R8KETHkJxEUlYReR9fwJTYXZ5R7n0M2a6OdRmPTYxUSPgUBCxLlNIP/C17gEUsh0bX0SGzwakaHswFvOQxjLwVw7ebiHOUrg1cEwoP2HNhkbi8KevZAYpI2GR0qa/s5SIrTXDacx7TamicouQ2vThsnV9nd77sl6sJLKTLcz2lcgwbFsDqowjyIlMk/NcUGSruhudOVnsZ8MguHGKwGd0TIcZpU1qghoCMtQHW1OVHY89j/tnN967Sf0Jc0TfRwL0sSOCFiTqgSx3gcHXpoMpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3866.namprd12.prod.outlook.com (10.255.173.211) by
 DM6PR12MB3116.namprd12.prod.outlook.com (20.178.31.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Fri, 2 Aug 2019 09:49:06 +0000
Received: from DM6PR12MB3866.namprd12.prod.outlook.com
 ([fe80::b15f:a397:7816:93b3]) by DM6PR12MB3866.namprd12.prod.outlook.com
 ([fe80::b15f:a397:7816:93b3%5]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 09:49:05 +0000
From: "Gao, Likun" <Likun.Gao@amd.com>
To: "Huang, Ray" <Ray.Huang@amd.com>, "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: remove unpin clear_state_obj for gfx v8
Thread-Topic: [PATCH] drm/amdgpu: remove unpin clear_state_obj for gfx v8
Thread-Index: AQHVSPJqhI5sjcdUqE2jgISYw06F5abnYIWAgAA44oCAAAMqwA==
Date: Fri, 2 Aug 2019 09:49:05 +0000
Message-ID: <DM6PR12MB38665E09C62DC1EA67297B88EFD90@DM6PR12MB3866.namprd12.prod.outlook.com>
References: <1564723334-18375-1-git-send-email-likun.gao@amd.com>
 <BN8PR12MB3602D2293EFA72B3A3545EE389D90@BN8PR12MB3602.namprd12.prod.outlook.com>
 <MN2PR12MB3309BB83CBB215AA393EDEF7ECD90@MN2PR12MB3309.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3309BB83CBB215AA393EDEF7ECD90@MN2PR12MB3309.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61e1bfc5-b66c-4e37-1c6a-08d7172ea889
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3116; 
x-ms-traffictypediagnostic: DM6PR12MB3116:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB3116A4BABB045EC5E4AC5507EFD90@DM6PR12MB3116.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:862;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(13464003)(199004)(189003)(6246003)(102836004)(476003)(6436002)(66476007)(66946007)(76116006)(66556008)(76176011)(2906002)(33656002)(11346002)(6506007)(53546011)(446003)(229853002)(64756008)(9686003)(6306002)(486006)(55016002)(966005)(71190400001)(53936002)(71200400001)(26005)(86362001)(4326008)(14454004)(66446008)(186003)(25786009)(305945005)(52536014)(68736007)(110136005)(2501003)(7736002)(66066001)(3846002)(81166006)(6116002)(81156014)(74316002)(99286004)(5660300002)(256004)(14444005)(54906003)(8936002)(478600001)(8676002)(7696005)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3116;
 H:DM6PR12MB3866.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QNHYTFbSkvibyNm2wZJUyYUwnprcaVZH6cBQ3r9K3paz8/wunWVPeFbkGGMOqRG+MlrwzCntMP8B1axTHuoPUqA1ocoC56Y5C8ksI1Co/ruXoqxnLuff95yGsUKdLLep4w3kz4rNnqcUP/fihzbOHO4uo068JPGefOcvyXNPS4qGRSZy7VAA/NdcYBGQQwNTOij4I8GRf/3fVnoM8OXpKYfHi4E38OmZFjFUgciSvbzuk2itH01q1+ncGxE7RAd0irRi8lQxFSQU/hisngguM2lOJ6jJM8C416vIn/Lp2dnDObUK2GQt3tCnNrxR9e3RLdEOhZc+OyB1fYsaJpyN+O8rn9CwvCh+JRZNBL353nqQ7CgsAuiDcJW5wWpRn55nrmdVSMR34oB5OBiPzr66ohdUM5Bp2v2P4nxcSPNzmCo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e1bfc5-b66c-4e37-1c6a-08d7172ea889
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 09:49:05.8577 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: likgao@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3116
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VXZNWU0QZUwC9uHn/DSKhsrSr/6SuL+6aEx4AjMWuY=;
 b=O9Qyx2bO5s0F92RJ0zKs3X/uA2ODiYds2h/q34OnGpLWlboVtkQPIo5315PwyhRsw05cnqsVLUL4tiRlCq3K4X4A934rML24wsrOWS3rXKbvWlpY2GbuMkG+Qv34oOG13EskpAMgtnQnKlZeJoRRRpKHT744CyTFvo0kHKof2jQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Likun.Gao@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Paul Gover <pmw.gover@yahoo.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBpc3N1ZSBvY2N1cnJlZCBvbiBTdG9uZXkuDQoNClJlZ2FyZHMsDQpMaWt1bg0KDQotLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5j
b20+IA0KU2VudDogRnJpZGF5LCBBdWd1c3QgMiwgMjAxOSA1OjM2IFBNDQpUbzogWXVhbiwgWGlh
b2ppZSA8WGlhb2ppZS5ZdWFuQGFtZC5jb20+OyBHYW8sIExpa3VuIDxMaWt1bi5HYW9AYW1kLmNv
bT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogRGV1Y2hlciwgQWxleGFuZGVy
IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgUGF1bCBHb3ZlciA8cG13LmdvdmVyQHlhaG9v
LmNvLnVrPg0KU3ViamVjdDogUkU6IFtQQVRDSF0gZHJtL2FtZGdwdTogcmVtb3ZlIHVucGluIGNs
ZWFyX3N0YXRlX29iaiBmb3IgZ2Z4IHY4DQoNCklzIHRoZSBpc3N1ZSB0cmlnZ2VyZWQgb24gQVBV
Pw0KDQpBY3R1YWxseSwgd2hpbGUgd2UgZG8gUzMsIHRoZSB2cmFtIGJvIHdvbid0IGJlIGNsZWFy
ZWQgb24gQVBVLiBUaGlzIHBhdGNoIGlzIHRvIGZpeCB0aGUgdnJhbSBibyBjbGVhcmluZyBvbiB0
aGUgREdQVSBzaWRlLg0KDQpUaGFua3MsDQpSYXkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnPiBPbiBCZWhhbGYgT2YgDQo+IFl1YW4sIFhpYW9qaWUNCj4gU2VudDogRnJpZGF5LCBBdWd1
c3QgMDIsIDIwMTkgMjoxMiBQTQ0KPiBUbzogR2FvLCBMaWt1biA8TGlrdW4uR2FvQGFtZC5jb20+
OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogRGV1Y2hlciwgQWxleGFuZGVy
IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgUGF1bCBHb3ZlciANCj4gPHBtdy5nb3ZlckB5
YWhvby5jby51az4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogcmVtb3ZlIHVu
cGluIGNsZWFyX3N0YXRlX29iaiBmb3IgZ2Z4IA0KPiB2OA0KPiANCj4gSGkgTGlrdW4sDQo+IA0K
PiBMb29rcyBsaWtlIHlvdSBjYW4gcGluIGNzYiBidWZmZXIgQGdmeF92OF8wX2h3X2luaXQoKSBq
dXN0IGxpa2Ugd2hhdCANCj4gZm9sbG93aW5nIHBhdGNoIGRvZXMgZm9yIGdmeDksIHNvIHRoYXQg
d2UgY2FuIHN0aWxsIHVzZSB0aGUgY29tbW9uIA0KPiBmdW5jdGlvbg0KPiBhbWRncHVfZ2Z4X3Js
Y19pbml0X2NzYigpOg0KPiANCj4gY29tbWl0IDEzN2RjNGI5MDYwZTk5YTIyZGNlNTliNDJjYTcx
OTEyY2YwMTgwZjMNCj4gQXV0aG9yOiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPg0KPiBE
YXRlOiAgIFdlZCBKdWwgNCAxNjoyMTo1MiAyMDE4ICswODAwDQo+IA0KPiAgICAgZHJtL2FtZGdw
dTogcGluIHRoZSBjc2IgYnVmZmVyIG9uIGh3IGluaXQgdjINCj4gDQo+ICAgICBXaXRob3V0IHRo
aXMgcGluLCB0aGUgY3NiIGJ1ZmZlciB3aWxsIGJlIGZpbGxlZCB3aXRoIGluY29uc2lzdGVudA0K
PiAgICAgZGF0YSBhZnRlciBTMyByZXN1bWUuIEFuZCB0aGF0IHdpbGwgY2F1c2VzIGdmeCBoYW5n
IG9uIGdmeG9mZg0KPiAgICAgZXhpdCBzaW5jZSB0aGlzIGNzYiB3aWxsIGJlIGV4ZWN1dGVkIHRo
ZW4uDQo+IA0KPiAgICAgdjI6IGZpdCBhbWRncHVfYm9fcGluIGNoYW5nZSh0YWtlIG9uZSBsZXNz
IGFyZ3VtZW50KQ0KPiANCj4gICAgIFNpZ25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFu
QGFtZC5jb20+DQo+ICAgICBSZXZpZXdlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNv
bT4NCj4gICAgIFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4NCj4gDQo+IEJSLA0KPiBYaWFvamllDQo+IA0KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQo+IEZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0Bs
aXN0cy5mcmVlZGVza3RvcC5vcmc+IG9uIGJlaGFsZiBvZiANCj4gbGlrdW4gR2FvIDxsaWt1bi5n
YW9AYW1kLmNvbT4NCj4gU2VudDogRnJpZGF5LCBBdWd1c3QgMiwgMjAxOSAxOjIyIFBNDQo+IFRv
OiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogRGV1Y2hlciwgQWxleGFuZGVy
OyBHYW8sIExpa3VuOyBQYXVsIEdvdmVyDQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdTog
cmVtb3ZlIHVucGluIGNsZWFyX3N0YXRlX29iaiBmb3IgZ2Z4IHY4DQo+IA0KPiBGcm9tOiBMaWt1
biBHYW8gPExpa3VuLkdhb0BhbWQuY29tPg0KPiANCj4gUmVtb3ZlIHVucGluIHJsYyBjbGVhcl9z
dGF0ZV9vYmogZm9yIGdmeCB2OCB3aGVuIHJsYyBpbml0LCB3aGljaCB3aWxsIA0KPiBtYWtlIFN0
b25leSBwbV9zdXNwZW5kIGhhbmcuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMaWt1biBHYW8gPExp
a3VuLkdhb0BhbWQuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92OF8wLmMgfCAyMiArKysrKysrKysrKysrKysrKysrLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwg
MTkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjhfMC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y4XzAuYw0KPiBpbmRleCBkMjkwNzE4Li4wYjczYzZlIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjhfMC5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMNCj4gQEAgLTEyOTIsNiArMTI5Miw4IEBA
IHN0YXRpYyBpbnQgZ2Z4X3Y4XzBfY3BfanVtcF90YWJsZV9udW0oc3RydWN0IA0KPiBhbWRncHVf
ZGV2aWNlICphZGV2KQ0KPiANCj4gIHN0YXRpYyBpbnQgZ2Z4X3Y4XzBfcmxjX2luaXQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpICB7DQo+ICsgICAgICAgdm9sYXRpbGUgdTMyICpkc3RfcHRy
Ow0KPiArICAgICAgIHUzMiBkd3M7DQo+ICAgICAgICAgY29uc3Qgc3RydWN0IGNzX3NlY3Rpb25f
ZGVmICpjc19kYXRhOw0KPiAgICAgICAgIGludCByOw0KPiANCj4gQEAgLTEzMDAsMTAgKzEzMDIs
MjQgQEAgc3RhdGljIGludCBnZnhfdjhfMF9ybGNfaW5pdChzdHJ1Y3QgDQo+IGFtZGdwdV9kZXZp
Y2UNCj4gKmFkZXYpDQo+ICAgICAgICAgY3NfZGF0YSA9IGFkZXYtPmdmeC5ybGMuY3NfZGF0YTsN
Cj4gDQo+ICAgICAgICAgaWYgKGNzX2RhdGEpIHsNCj4gLSAgICAgICAgICAgICAgIC8qIGluaXQg
Y2xlYXIgc3RhdGUgYmxvY2sgKi8NCj4gLSAgICAgICAgICAgICAgIHIgPSBhbWRncHVfZ2Z4X3Js
Y19pbml0X2NzYihhZGV2KTsNCj4gLSAgICAgICAgICAgICAgIGlmIChyKQ0KPiArICAgICAgICAg
ICAgICAgLyogY2xlYXIgc3RhdGUgYmxvY2sgKi8NCj4gKyAgICAgICAgICAgICAgIGFkZXYtPmdm
eC5ybGMuY2xlYXJfc3RhdGVfc2l6ZSA9IGR3cyA9IA0KPiArIGFkZXYtPmdmeC5ybGMuZnVuY3Mt
DQo+ID5nZXRfY3NiX3NpemUoYWRldik7DQo+ICsgICAgICAgICAgICAgICByID0gYW1kZ3B1X2Jv
X2NyZWF0ZV9yZXNlcnZlZChhZGV2LCBkd3MgKiA0LCBQQUdFX1NJWkUsDQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBTURHUFVfR0VNX0RPTUFJTl9WUkFN
LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmFkZXYt
PmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgJmFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfZ3B1X2FkZHIsDQo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodm9pZCAqKikm
YWRldi0+Z2Z4LnJsYy5jc19wdHIpOw0KPiArICAgICAgICAgICAgICAgaWYgKHIpIHsNCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgZGV2X3dhcm4oYWRldi0+ZGV2LCAiKCVkKSBjcmVhdGUgUkxD
IGMgYm8gZmFpbGVkXG4iLCByKTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgYW1kZ3B1X2dm
eF9ybGNfZmluaShhZGV2KTsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHI7DQo+
ICsgICAgICAgICAgICAgICB9DQo+ICsNCj4gKyAgICAgICAgICAgICAgIC8qIHNldCB1cCB0aGUg
Y3MgYnVmZmVyICovDQo+ICsgICAgICAgICAgICAgICBkc3RfcHRyID0gYWRldi0+Z2Z4LnJsYy5j
c19wdHI7DQo+ICsgICAgICAgICAgICAgICBhZGV2LT5nZngucmxjLmZ1bmNzLT5nZXRfY3NiX2J1
ZmZlcihhZGV2LCBkc3RfcHRyKTsNCj4gKyAgICAgICAgICAgICAgIGFtZGdwdV9ib19rdW5tYXAo
YWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmopOw0KPiArICAgICAgICAgICAgICAgYW1kZ3B1
X2JvX3VucmVzZXJ2ZShhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaik7DQo+ICAgICAgICAg
fQ0KPiANCj4gICAgICAgICBpZiAoKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX0NBUlJJWk8pIHx8
DQo+IC0tDQo+IDIuNy40DQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngNCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
