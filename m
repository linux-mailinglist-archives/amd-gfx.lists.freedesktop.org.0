Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9140BE0A66
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 19:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E34E6E89C;
	Tue, 22 Oct 2019 17:17:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720084.outbound.protection.outlook.com [40.107.72.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945436E89C
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Oct 2019 17:17:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WrPtKIs+EG39c3UO2I+AqP2+7lMaudFjrkcT4xKaOmKtxT57ZM3c9NLzhqV467UpGTW5lZeWfi/z1KSRbqz+ymOoCS2UhRv5UpqsRrbcaEpIDej89Ydyt/Yy4BP01gsBrTX8yYB2mJ7yG53jgW9zCaR5NDxTm59j18+LpwjICwSzFP0er9KtqJvJ9lQl0LwoF7Dv5wnPRx8e/AzhPWxvSCXTtpZGVLB1cnHkXNTUoBVXmZghqgoWTELe4KoctjbzODngEjW/ftVtQEBhuEUlwW64AdX5vYE5S1TkNHAB4c/eWsclKPffmo+HL3bHCy49Etubc1VQwR6+AwXT2AwWzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8U8AC6uqWIx9TCF+j+VPFMSjPmALhr6R90SfOq6kVs=;
 b=MxYZbptNnk6PS6Rm4yc1sDeMNnINJ+PU/NtdRIe6C91CPJvyXFhJIMjhWguDZBHTseT7Vq0XCmIjrKgwcEiSovw1r7v60KirTrTKEptTC+ywJwEvNnVtJ+mM8E3LTiCNNOs1S0X6DWhdq84JMyQaCkoXzShIWXtql3Cx0TCrhX9sYTdndNx66eBFXtmfFHBE3nvB1UeGWftl9mEC7y4myeeHxby1fmZA4FCFjZH95yonasJ5lrflRJSBksFrJ3UlfpxaC2mtwiXnuMt1iSBIAS6MMM2E0tQdrev3+s1gQ8tXdILtgb8j6FQRNB2PCcS8a/BC90pqIo8lH5iIuTXQ1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2370.namprd12.prod.outlook.com (52.132.8.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Tue, 22 Oct 2019 17:17:36 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::145c:4149:8b99:c3b4]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::145c:4149:8b99:c3b4%6]) with mapi id 15.20.2367.022; Tue, 22 Oct 2019
 17:17:36 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>
Subject: RE: Stack out of bounds in KFD on Arcturus
Thread-Topic: Stack out of bounds in KFD on Arcturus
Thread-Index: AQHVhSbPJxXevXoNDku355BSbMnne6dfWaOAgAATSQCAAXWEAIAACVlggAX7FgCAAAf/8A==
Date: Tue, 22 Oct 2019 17:17:35 +0000
Message-ID: <BL0PR12MB2580ED7FB1607624E3D884B280680@BL0PR12MB2580.namprd12.prod.outlook.com>
References: <a81a3f82-1f21-663f-150c-cdbbbf231ab3@amd.com>
 <31aa5ae0-5eb4-38ca-aed7-d807ab19e2ca@amd.com>
 <96393d3a-ebf7-3c2b-5b51-6a968ee9b4f8@amd.com>
 <134de413-61fe-a6ee-96ac-73b694fcb94c@amd.com>
 <BL0PR12MB25806E425A051EA059C805EF806C0@BL0PR12MB2580.namprd12.prod.outlook.com>
 <f865ffcd-2be0-0135-ba78-f78b370aa1fd@amd.com>
In-Reply-To: <f865ffcd-2be0-0135-ba78-f78b370aa1fd@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 49621011-2c01-42aa-d432-08d75713bbae
x-ms-traffictypediagnostic: BL0PR12MB2370:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR12MB2370B426E038D1BBC655BA3F80680@BL0PR12MB2370.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(189003)(199004)(13464003)(446003)(476003)(4001150100001)(186003)(11346002)(6116002)(110136005)(316002)(71190400001)(71200400001)(486006)(26005)(3846002)(2906002)(33656002)(6636002)(66066001)(5660300002)(52536014)(6306002)(55016002)(6436002)(9686003)(229853002)(305945005)(6246003)(81156014)(66446008)(64756008)(66556008)(81166006)(7736002)(8676002)(8936002)(4326008)(74316002)(76116006)(66476007)(66946007)(25786009)(53546011)(6506007)(478600001)(102836004)(5024004)(256004)(7696005)(99286004)(14444005)(14454004)(966005)(86362001)(76176011)(505234006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2370;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pdee4szH047LEsvT/bHvU4Z6B4G0gMb3EqL1yGGB5rvqtB4FDdpZuisRYg8FM4aMWcKX4D98oaFBAeb6bXHMJe0eQaba2G3EWAkPlBrJi0KgRXWTEUP5IbAmGRrclN4ga9ixVlETXvrSekwDtl2D5XnBNVdmpgFw4APkMu/8AJWafamUSbkWYfPq2KfH4lrsyOITnD34vTAK5gWM3kc3G3AhZIkjUiRRfpCAWbxS3DN8KoW9GrV2pBZq1B4sqX9Eyj713a/jGQzmYb/dgi9D9+qyr/PhYfK9mXD9+LEF90yCczjmqC9VeTC2cS8FY9//DUR9x9eZtT1sFh5uH6pIcm3sSwN7WqQ8MPqFaG86DQP071y9sU2z3GtHBI6y6kS9jZQpJIeumZsew8cDeA8IwNfQ26G10aRs1AzG5vxLr+Ref/DPMiJcHjKlneIiKyaeZlmvBRpv6zuIj68m4JC63tyPTBhd/mBdaLaPan5RfJ4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49621011-2c01-42aa-d432-08d75713bbae
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 17:17:35.9227 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GafhJIWyBfH+hQcxAwiSnTfdBVsLdZR4kLySKgbbwPtvCaR4RE9AnLXUt/lvNATe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2370
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8U8AC6uqWIx9TCF+j+VPFMSjPmALhr6R90SfOq6kVs=;
 b=KWvfavQ6a+RmdExwkV73D0Xl56pyc2Ig5zyi7L6xlMaoNb/gKysOspbUBcq5pMW4Hf2ue/Y/XpU+Qi2O+zSFJqYQibssJ96Kxgtf90jPFTBh7ngHh4tgqamy+itF2th4AqrhL/e6+KRrCxuy43gmnyRugI4WW+b6KvXrTweLi3c=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U29ycnkgSSBtZWFudCBpcyB0aGUga2VybmVsIHN0YWNrIHNpemUgMTZLQiBpbiB5b3VyIGtjb25m
aWc/DQoNCk9haw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogR3JvZHpvdnNr
eSwgQW5kcmV5IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQuY29tPiANClNlbnQ6IFR1ZXNkYXksIE9j
dG9iZXIgMjIsIDIwMTkgMTI6NDkgUE0NClRvOiBaZW5nLCBPYWsgPE9hay5aZW5nQGFtZC5jb20+
OyBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQpDYzogYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiBTdGFjayBvdXQgb2YgYm91bmRzIGlu
IEtGRCBvbiBBcmN0dXJ1cw0KDQpPbiAxMC8xOC8xOSA1OjMxIFBNLCBaZW5nLCBPYWsgd3JvdGU6
DQoNCj4gSGkgQW5kcmV5LA0KPg0KPiBXaGF0IGlzIHlvdXIgc3lzdGVtIGNvbmZpZ3VyYXRpb24/
IEkgZGlkbuKAmXQgc2VlIHRoaXMgaXNzdWUgYmVmb3JlLiBBbHNvIHNlZSBhdHRhY2hlZCBRQSdz
IGNvbmZpZ3VyYXRpb24gLSB5b3UgY2FuIGNvbXBhcmUgdG8gc2VlIGFueSBkaWZmZXJlbmNlLg0K
DQoNCkF0dGFjaGVkIGlzIG15IGxzaHcNCg0KPg0KPiBBbHNvIEkgYmVsaWV2ZSBmb3IgeDg2LTY0
LCB0aGUgZGVmYXVsdCBrZXJuZWwgc3RhY2sgc2l6ZSBpcyAxNmtiPyBJcyB0aGlzIHlvdXIgS2Nv
bmZpZz8NCg0KDQpXaGF0IGRvIHlvdSBtZWFuIGlmIHRoaXMgaXMgbXkgS2NvbmZpZyA/IElzIHRo
ZXJlIHBhcnRpY3VsYXIgS2NvbmZpZyBmbGFnIHlvdSBrbm93IHRoYXQgaSBjYW4gbG9vayBmb3Ig
Pw0KDQpBbmRyZXkNCg0KDQo+DQo+IFJlZ2FyZHMsDQo+IE9haw0KPg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgDQo+IEt1ZWhsaW5nLCBGZWxpeA0KPiBTZW50OiBG
cmlkYXksIE9jdG9iZXIgMTgsIDIwMTkgNDo1NSBQTQ0KPiBUbzogR3JvZHpvdnNreSwgQW5kcmV5
IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQuY29tPg0KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFN0YWNrIG91dCBvZiBib3VuZHMgaW4gS0ZEIG9uIEFy
Y3R1cnVzDQo+DQo+IE9uIDIwMTktMTAtMTcgNjozOCBwLm0uLCBHcm9kem92c2t5LCBBbmRyZXkg
d3JvdGU6DQo+PiBOb3QgdGhhdCBJIGF3YXJlIG9mLCBpcyB0aGVyZSBhIHNwZWNpYWwgS2NvbmZp
ZyBmbGFnIHRvIGRldGVybWluZSANCj4+IHN0YWNrIHNpemUgPw0KPiBJIHJlbWVtYmVyIHRoZXJl
IHVzZWQgdG8gYmUgYSBLY29uZmlnIG9wdGlvbiB0byBmb3JjZSBhIDRLQiBrZXJuZWwgc3RhY2su
IEkgZG9uJ3Qgc2VlIGl0IGluIHRoZSBjdXJyZW50IGtlcm5lbCBhbnkgbW9yZS4NCj4NCj4gSSBk
b24ndCBoYXZlIHRpbWUgdG8gd29yayBvbiB0aGlzIG15c2VsZi4gSSdsbCBjcmVhdGUgYSB0aWNr
ZXQgYW5kIHNlZSBpZiBJIGNhbiBmaW5kIHNvbWVvbmUgdG8gaW52ZXN0aWdhdGUuDQo+DQo+IFRo
YW5rcywNCj4gICDCoCBGZWxpeA0KPg0KPg0KPj4gQW5kcmV5DQo+Pg0KPj4gT24gMTAvMTcvMTkg
NToyOSBQTSwgS3VlaGxpbmcsIEZlbGl4IHdyb3RlOg0KPj4+IEkgZG9uJ3Qgc2VlIHdoeSB0aGlz
IHByb2JsZW0gd291bGQgYmUgc3BlY2lmaWMgdG8gQXJjdHVydXMuIEkgZG9uJ3QgDQo+Pj4gc2Vl
IGFueSBleGNlc3NpdmUgYWxsb2NhdGlvbnMgb24gdGhlIHN0YWNrIGVpdGhlci4gQWxzbyB0aGUg
Y29kZSANCj4+PiBpbnZvbHZlZCBoZXJlIGhhc24ndCBjaGFuZ2VkIHJlY2VudGx5Lg0KPj4+DQo+
Pj4gQXJlIHlvdSB1c2luZyBzb21lIHdlaXJkIGtlcm5lbCBjb25maWcgd2l0aCBhIHNtYWxsZXIg
c3RhY2s/IElzIGl0IA0KPj4+IHNwZWNpZmljIHRvIGEgY29tcGlsZXIgdmVyc2lvbiBvciBzb21l
IG9wdGltaXphdGlvbiBmbGFncz8gSSd2ZSANCj4+PiBzb21ldGltZXMgc2VlbiBmdW5jdGlvbiBp
bmxpbmluZyBjYXVzZSBleGNlc3NpdmUgc3RhY2sgdXNhZ2UuDQo+Pj4NCj4+PiBSZWdhcmRzLA0K
Pj4+ICAgICDCoCBGZWxpeA0KPj4+DQo+Pj4gT24gMjAxOS0xMC0xNyA0OjA5IHAubS4sIEdyb2R6
b3Zza3ksIEFuZHJleSB3cm90ZToNCj4+Pj4gSGUgRmVsaXggLSBJIHNlZSB0aGlzIG9uIGJvb3Qg
d2hlbiB3b3JraW5nIHdpdGggQXJjdHVydXMuDQo+Pj4+DQo+Pj4+IEFuZHJleQ0KPj4+Pg0KPj4+
Pg0KPj4+PiBbwqAgMTAzLjYwMjA5Ml0ga2ZkIGtmZDogQWxsb2NhdGVkIDM5NjkwNTYgYnl0ZXMg
b24gZ2FydCBbIA0KPj4+PiAxMDMuNjEwNzY5XSANCj4+Pj4gPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+Pj4+IFvCoCAx
MDMuNjExNDY5XSBCVUc6IEtBU0FOOiBzdGFjay1vdXQtb2YtYm91bmRzIGluDQo+Pj4+IGtmZF9j
cmVhdGVfdmNyYXRfaW1hZ2VfZ3B1KzB4NWRiLzB4YjgwIFthbWRncHVdIFvCoCAxMDMuNjExNjQ2
XSBSZWFkIA0KPj4+PiBvZiBzaXplIDQgYXQgYWRkciBmZmZmODg4M2NiMTllZTM4IGJ5IHRhc2sg
bW9kcHJvYmUvMTEyMg0KPj4+Pg0KPj4+PiBbwqAgMTAzLjYxMTgzNl0gQ1BVOiAzIFBJRDogMTEy
MiBDb21tOiBtb2Rwcm9iZSBUYWludGVkOiBHIE8gDQo+Pj4+IDUuMy4wLXJjMysgIzQ1IFvCoCAx
MDMuNjExODQ3XSBIYXJkd2FyZSBuYW1lOiBTeXN0ZW0gbWFudWZhY3R1cmVyIA0KPj4+PiBTeXN0
ZW0gUHJvZHVjdCBOYW1lL1oxNzAtUFJPLCBCSU9TIDE5MDIgMDYvMjcvMjAxNiBbwqAgMTAzLjYx
MTg1Nl0gDQo+Pj4+IENhbGwgVHJhY2U6DQo+Pj4+IFvCoCAxMDMuNjExODc5XcKgIGR1bXBfc3Rh
Y2srMHg3MS8weGFiIFvCoCAxMDMuNjExOTA3XQ0KPj4+PiBwcmludF9hZGRyZXNzX2Rlc2NyaXB0
aW9uKzB4MWRhLzB4M2MwDQo+Pj4+IFvCoCAxMDMuNjEyNDUzXcKgID8ga2ZkX2NyZWF0ZV92Y3Jh
dF9pbWFnZV9ncHUrMHg1ZGIvMHhiODAgW2FtZGdwdV0gWyANCj4+Pj4gMTAzLjYxMjQ3OV3CoCBf
X2thc2FuX3JlcG9ydCsweDEzZi8weDFhMCBbwqAgMTAzLjYxMzAyMl3CoCA/DQo+Pj4+IGtmZF9j
cmVhdGVfdmNyYXRfaW1hZ2VfZ3B1KzB4NWRiLzB4YjgwIFthbWRncHVdIFvCoCAxMDMuNjEzNTgw
XcKgID8NCj4+Pj4ga2ZkX2NyZWF0ZV92Y3JhdF9pbWFnZV9ncHUrMHg1ZGIvMHhiODAgW2FtZGdw
dV0gW8KgIDEwMy42MTM2MDRdDQo+Pj4+IGthc2FuX3JlcG9ydCsweGUvMHgyMCBbwqAgMTAzLjYx
NDE0OV0NCj4+Pj4ga2ZkX2NyZWF0ZV92Y3JhdF9pbWFnZV9ncHUrMHg1ZGIvMHhiODAgW2FtZGdw
dV0gW8KgIDEwMy42MTQ3NjJdwqAgPw0KPj4+PiBrZmRfZmlsbF9ncHVfbWVtb3J5X2FmZmluaXR5
KzB4MTEwLzB4MTEwIFthbWRncHVdIFvCoCAxMDMuNjE0Nzk2XcKgID8NCj4+Pj4gX19hbGxvY19w
YWdlc19ub2RlbWFzaysweDJjOS8weDU2MA0KPj4+PiBbwqAgMTAzLjYxNDgyNF3CoCA/IF9fYWxs
b2NfcGFnZXNfc2xvd3BhdGgrMHgxMzkwLzB4MTM5MA0KPj4+PiBbwqAgMTAzLjYxNDg5OF3CoCA/
IGttYWxsb2Nfb3JkZXIrMHg2My8weDcwIFvCoCAxMDMuNjE1NDY5XQ0KPj4+PiBrZmRfY3JlYXRl
X2NyYXRfaW1hZ2VfdmlydHVhbCsweDcwYy8weDc3MCBbYW1kZ3B1XSBbwqAgMTAzLjYxNjA1NF3C
oCA/DQo+Pj4+IGtmZF9jcmVhdGVfY3JhdF9pbWFnZV9hY3BpKzB4MWMwLzB4MWMwIFthbWRncHVd
IFvCoCAxMDMuNjE2MDk1XcKgID8NCj4+Pj4gdXBfd3JpdGUrMHg0Yi8weDcwIFvCoCAxMDMuNjE2
NjQ5XQ0KPj4+PiBrZmRfdG9wb2xvZ3lfYWRkX2RldmljZSsweDk4ZC8weGIxMCBbYW1kZ3B1XSBb
wqAgMTAzLjYxNzIwN13CoCA/DQo+Pj4+IGtmZF90b3BvbG9neV9zaHV0ZG93bisweDYwLzB4NjAg
W2FtZGdwdV0gW8KgIDEwMy42MTc3NDNdwqAgPw0KPj4+PiBzdGFydF9jcHNjaCsweDJmZi8weDNh
MCBbYW1kZ3B1XSBbwqAgMTAzLjYxNzc3N13CoCA/DQo+Pj4+IG11dGV4X2xvY2tfaW9fbmVzdGVk
KzB4YWMwLzB4YWMwIFvCoCAxMDMuNjE3ODA3XcKgID8NCj4+Pj4gX19tdXRleF91bmxvY2tfc2xv
d3BhdGgrMHhkYS8weDQyMA0KPj4+PiBbwqAgMTAzLjYxNzg0OF3CoCA/IF9fbXV0ZXhfdW5sb2Nr
X3Nsb3dwYXRoKzB4ZGEvMHg0MjANCj4+Pj4gW8KgIDEwMy42MTc4NzddwqAgPyB3YWl0X2Zvcl9j
b21wbGV0aW9uKzB4MjAwLzB4MjAwIFvCoCAxMDMuNjE4NDYxXcKgID8NCj4+Pj4gc3RhcnRfY3Bz
Y2grMHgzOGIvMHgzYTAgW2FtZGdwdV0gW8KgIDEwMy42MTkwMTFdwqAgPw0KPj4+PiBjcmVhdGVf
cXVldWVfY3BzY2grMHg2NzAvMHg2NzAgW2FtZGdwdV0gW8KgIDEwMy42MTk1NzNdwqAgPw0KPj4+
PiBrZmRfaW9tbXVfZGV2aWNlX2luaXQrMHg5Mi8weDFlMCBbYW1kZ3B1XSBbwqAgMTAzLjYyMDEx
Ml3CoCA/DQo+Pj4+IGtmZF9pb21tdV9yZXN1bWUrMHgyYy8weDJjMCBbYW1kZ3B1XSBbwqAgMTAz
LjYyMDY1NV3CoCA/DQo+Pj4+IGtmZF9pb21tdV9jaGVja19kZXZpY2UrMHhmMC8weGYwIFthbWRn
cHVdIFvCoCAxMDMuNjIxMjI4XQ0KPj4+PiBrZ2Qya2ZkX2RldmljZV9pbml0KzB4NDc0LzB4ODcw
IFthbWRncHVdIFvCoCAxMDMuNjIxNzgxXQ0KPj4+PiBhbWRncHVfYW1ka2ZkX2RldmljZV9pbml0
KzB4MjkxLzB4MzkwIFthbWRncHVdIFvCoCAxMDMuNjIyMzI5XcKgID8NCj4+Pj4gYW1kZ3B1X2Ft
ZGtmZF9kZXZpY2VfcHJvYmUrMHg5MC8weDkwIFthbWRncHVdIFvCoCAxMDMuNjIyMzQ0XcKgID8N
Cj4+Pj4ga21zZ19kdW1wX3Jld2luZF9ub2xvY2srMHg1OS8weDU5IFvCoCAxMDMuNjIyODk1XcKg
ID8NCj4+Pj4gYW1kZ3B1X3Jhc19lZXByb21fdGVzdCsweDcxLzB4OTAgW2FtZGdwdV0gW8KgIDEw
My42MjM0MjRdDQo+Pj4+IGFtZGdwdV9kZXZpY2VfaW5pdCsweDFiYmUvMHgyZjAwIFthbWRncHVd
IFvCoCAxMDMuNjIzODE5XcKgID8NCj4+Pj4gYW1kZ3B1X2RldmljZV9oYXNfZGNfc3VwcG9ydCsw
eDMwLzB4MzAgW2FtZGdwdV0gW8KgIDEwMy42MjM4NDJdwqAgPw0KPj4+PiBfX2lzb2xhdGVfZnJl
ZV9wYWdlKzB4MjkwLzB4MjkwIFvCoCAxMDMuNjIzODUyXcKgID8NCj4+Pj4gZnNfcmVjbGFpbV9h
Y3F1aXJlLnBhcnQuOTcrMHg1LzB4MzANCj4+Pj4gW8KgIDEwMy42MjM4OTFdwqAgPyBfX2FsbG9j
X3BhZ2VzX25vZGVtYXNrKzB4MmM5LzB4NTYwDQo+Pj4+IFvCoCAxMDMuNjIzOTEyXcKgID8gX19h
bGxvY19wYWdlc19zbG93cGF0aCsweDEzOTAvMHgxMzkwDQo+Pj4+IFvCoCAxMDMuNjIzOTQ1XcKg
ID8ga2FzYW5fdW5wb2lzb25fc2hhZG93KzB4MzEvMHg0MCBbwqAgMTAzLjYyMzk3MF3CoCA/DQo+
Pj4+IGttYWxsb2Nfb3JkZXIrMHg2My8weDcwIFvCoCAxMDMuNjI0MzM3XQ0KPj4+PiBhbWRncHVf
ZHJpdmVyX2xvYWRfa21zKzB4ZDkvMHg0MzAgW2FtZGdwdV0gW8KgIDEwMy42MjQ2OTBdwqAgPw0K
Pj4+PiBhbWRncHVfcmVnaXN0ZXJfZ3B1X2luc3RhbmNlKzB4ZTAvMHhlMCBbYW1kZ3B1XSBbwqAg
MTAzLjYyNDc1Nl3CoCA/DQo+Pj4+IGRybV9kZXZfcmVnaXN0ZXIrMHgxOWMvMHgzMTAgW2RybV0g
W8KgIDEwMy42MjQ3NjhdwqAgPw0KPj4+PiBfX2thc2FuX3NsYWJfZnJlZSsweDEzMy8weDE2MCBb
wqAgMTAzLjYyNDg0OV0NCj4+Pj4gZHJtX2Rldl9yZWdpc3RlcisweDFmNS8weDMxMCBbZHJtXSBb
wqAgMTAzLjYyNTIxMl0NCj4+Pj4gYW1kZ3B1X3BjaV9wcm9iZSsweDEwOS8weDFmMCBbYW1kZ3B1
XSBbwqAgMTAzLjYyNTU2NV3CoCA/DQo+Pj4+IGFtZGdwdV9wbW9wc19ydW50aW1lX2lkbGUrMHhl
MC8weGUwIFthbWRncHVdIFvCoCAxMDMuNjI1NTgwXQ0KPj4+PiBsb2NhbF9wY2lfcHJvYmUrMHg3
NC8weGQwIFvCoCAxMDMuNjI1NjAzXQ0KPj4+PiBwY2lfZGV2aWNlX3Byb2JlKzB4MWZhLzB4MzEw
IFvCoCAxMDMuNjI1NjIwXcKgID8NCj4+Pj4gcGNpX2RldmljZV9yZW1vdmUrMHgxYzAvMHgxYzAg
W8KgIDEwMy42MjU2NDBdwqAgPw0KPj4+PiBzeXNmc19kb19jcmVhdGVfbGlua19zZC5pc3JhLjIr
MHg3NC8weGUwDQo+Pj4+IFvCoCAxMDMuNjI1NjczXcKgIHJlYWxseV9wcm9iZSsweDM2Ny8weDVk
MCBbwqAgMTAzLjYyNTcwMF0NCj4+Pj4gZHJpdmVyX3Byb2JlX2RldmljZSsweDE3Ny8weDFiMCBb
wqAgMTAzLjYyNTcyMV0NCj4+Pj4gZGV2aWNlX2RyaXZlcl9hdHRhY2grMHg4YS8weDkwIFvCoCAx
MDMuNjI1NzM3XcKgID8NCj4+Pj4gZGV2aWNlX2RyaXZlcl9hdHRhY2grMHg5MC8weDkwIFvCoCAx
MDMuNjI1NzQ2XQ0KPj4+PiBfX2RyaXZlcl9hdHRhY2grMHhlYi8weDE5MCBbwqAgMTAzLjYyNTc2
NV3CoCA/DQo+Pj4+IGRldmljZV9kcml2ZXJfYXR0YWNoKzB4OTAvMHg5MCBbwqAgMTAzLjYyNTc3
M10NCj4+Pj4gYnVzX2Zvcl9lYWNoX2RldisweGU0LzB4MTYwIFvCoCAxMDMuNjI1Nzg5XcKgID8N
Cj4+Pj4gc3Vic3lzX2Rldl9pdGVyX2V4aXQrMHgxMC8weDEwIFvCoCAxMDMuNjI1ODI5XQ0KPj4+
PiBidXNfYWRkX2RyaXZlcisweDI3Ny8weDMzMCBbwqAgMTAzLjYyNTg1NV0NCj4+Pj4gZHJpdmVy
X3JlZ2lzdGVyKzB4YzYvMHgxYTAgW8KgIDEwMy42MjU4NjZdwqAgPyAweGZmZmZmZmZmYTBkODgw
MDAgWyANCj4+Pj4gMTAzLjYyNTg4MF3CoCBkb19vbmVfaW5pdGNhbGwrMHhkMy8weDMzNCBbwqAg
MTAzLjYyNTg5NV3CoCA/DQo+Pj4+IHRyYWNlX2V2ZW50X3Jhd19ldmVudF9pbml0Y2FsbF9maW5p
c2grMHgxNTAvMHgxNTANCj4+Pj4gW8KgIDEwMy42MjU5MTFdwqAgPyBrYXNhbl91bnBvaXNvbl9z
aGFkb3crMHgzMS8weDQwIFvCoCAxMDMuNjI1OTI0XcKgID8NCj4+Pj4gX19rYXNhbl9rbWFsbG9j
KzB4ZDUvMHhmMCBbwqAgMTAzLjYyNTk0Nl3CoCA/DQo+Pj4+IGttZW1fY2FjaGVfYWxsb2NfdHJh
Y2UrMHgxNTQvMHgzMDANCj4+Pj4gW8KgIDEwMy42MjU5NTVdwqAgPyBrYXNhbl91bnBvaXNvbl9z
aGFkb3crMHgzMS8weDQwIFvCoCAxMDMuNjI1OTg1XQ0KPj4+PiBkb19pbml0X21vZHVsZSsweGVj
LzB4MzU0IFvCoCAxMDMuNjI2MDExXcKgIGxvYWRfbW9kdWxlKzB4M2M5MS8weDQ5ODAgDQo+Pj4+
IFvCoCAxMDMuNjI2MTE4XcKgID8gbW9kdWxlX2Zyb2JfYXJjaF9zZWN0aW9ucysweDIwLzB4MjAN
Cj4+Pj4gW8KgIDEwMy42MjYxMzJdwqAgPyBpbWFfcmVhZF9maWxlKzB4MTAvMHgxMCBbwqAgMTAz
LjYyNjE0Ml3CoCA/DQo+Pj4+IHZmc19yZWFkKzB4MTI3LzB4MTkwIFvCoCAxMDMuNjI2MTYzXcKg
ID8ga2VybmVsX3JlYWQrMHg5NS8weGIwIFsgDQo+Pj4+IDEwMy42MjYxODddwqAgPyBrZXJuZWxf
cmVhZF9maWxlKzB4MWE1LzB4MzQwIFvCoCAxMDMuNjI2Mjc3XcKgID8NCj4+Pj4gX19kb19zeXNf
ZmluaXRfbW9kdWxlKzB4MTc1LzB4MWIwIFvCoCAxMDMuNjI2Mjg3XQ0KPj4+PiBfX2RvX3N5c19m
aW5pdF9tb2R1bGUrMHgxNzUvMHgxYjAgW8KgIDEwMy42MjYzMDFdwqAgPw0KPj4+PiBfX2lhMzJf
c3lzX2luaXRfbW9kdWxlKzB4NDAvMHg0MCBbwqAgMTAzLjYyNjMzOF3CoCA/DQo+Pj4+IGxvY2tf
ZG93bmdyYWRlKzB4MzkwLzB4MzkwIFvCoCAxMDMuNjI2Mzk2XcKgID8NCj4+Pj4gdnRpbWVfdXNl
cl9leGl0KzB4YzgvMHhlMCBbwqAgMTAzLjYyNjQyM13CoCBkb19zeXNjYWxsXzY0KzB4N2QvMHgy
NTAgDQo+Pj4+IFsgMTAzLjYyNjQ0MF3CoCBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUr
MHg0NC8weGE5DQo+Pj4+IFvCoCAxMDMuNjI2NDUwXSBSSVA6IDAwMzM6MHg3ZjA5OTg0ODU0ZDkg
W8KgIDEwMy42MjY0NjFdIENvZGU6IDAwIGYzDQo+Pj4+IGMzIDY2IDJlIDBmIDFmIDg0IDAwIDAw
IDAwIDAwIDAwIDBmIDFmIDQwIDAwDQo+Pj4+IDQ4IDg5IGY4IDQ4IDg5IGY3IDQ4IDg5IGQ2IDQ4
IDg5IGNhIDRkIDg5IGMyIDRkIDg5IGM4IDRjIDhiIDRjIDI0IA0KPj4+PiAwOCAwZg0KPj4+PiAw
NSA8NDg+IDNkIDAxIGYwIGZmIGZmIDczIDAxIGMzIDQ4IDhiIDBkIDhmIDI5IDJjIDAwIGY3IGQ4
IDY0IDg5IDAxDQo+Pj4+IDQ4IFvCoCAxMDMuNjI2NDY4XSBSU1A6IDAwMmI6MDAwMDdmZmM0Mjg5
NjAwOCBFRkxBR1M6IDAwMDAwMjQ2IE9SSUdfUkFYOg0KPj4+PiAwMDAwMDAwMDAwMDAwMTM5DQo+
Pj4+IFvCoCAxMDMuNjI2NDc5XSBSQVg6IGZmZmZmZmZmZmZmZmZmZGEgUkJYOiAwMDAwNTU5YTUy
NDk1NDAwIFJDWDoNCj4+Pj4gMDAwMDdmMDk5ODQ4NTRkOQ0KPj4+PiBbwqAgMTAzLjYyNjQ4Nl0g
UkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogMDAwMDU1OWE1MjQ5OTkwMCBSREk6DQo+Pj4+IDAw
MDAwMDAwMDAwMDAwMDYNCj4+Pj4gW8KgIDEwMy42MjY0OTNdIFJCUDogMDAwMDU1OWE1MjQ5OTkw
MCBSMDg6IDAwMDAwMDAwMDAwMDAwMDAgUjA5Og0KPj4+PiAwMDAwMDAwMDAwMDAwMDAwDQo+Pj4+
IFvCoCAxMDMuNjI2NTAwXSBSMTA6IDAwMDAwMDAwMDAwMDAwMDYgUjExOiAwMDAwMDAwMDAwMDAw
MjQ2IFIxMjoNCj4+Pj4gMDAwMDAwMDAwMDAwMDAwMA0KPj4+PiBbwqAgMTAzLjYyNjUwOF0gUjEz
OiAwMDAwNTU5YTUyNDk5YjMwIFIxNDogMDAwMDAwMDAwMDA0MDAwMCBSMTU6DQo+Pj4+IDAwMDAw
MDAwMDAwMDAwMTMNCj4+Pj4NCj4+Pj4gW8KgIDEwMy42MjY1OTJdIFRoZSBidWdneSBhZGRyZXNz
IGJlbG9uZ3MgdG8gdGhlIHBhZ2U6DQo+Pj4+IFvCoCAxMDMuNjI2NjY1XSBwYWdlOmZmZmZlYTAw
MGYyYzY3ODAgcmVmY291bnQ6MCBtYXBjb3VudDowDQo+Pj4+IG1hcHBpbmc6MDAwMDAwMDAwMDAw
MDAwMCBpbmRleDoweDANCj4+Pj4gW8KgIDEwMy42MjY2NzVdIGZsYWdzOiAweDJmZmZmMDAwMDAw
MDAwMCgpIFvCoCAxMDMuNjI2Njg2XSByYXc6DQo+Pj4+IDAyZmZmZjAwMDAwMDAwMDAgMDAwMDAw
MDAwMDAwMDAwMCBmZmZmZWEwMDBmMmM2Nzg4DQo+Pj4+IDAwMDAwMDAwMDAwMDAwMDANCj4+Pj4g
W8KgIDEwMy42MjY2OTZdIHJhdzogMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIA0K
Pj4+PiAwMDAwMDAwMGZmZmZmZmZmDQo+Pj4+IDAwMDAwMDAwMDAwMDAwMDANCj4+Pj4gW8KgIDEw
My42MjY3MDJdIHBhZ2UgZHVtcGVkIGJlY2F1c2U6IGthc2FuOiBiYWQgYWNjZXNzIGRldGVjdGVk
DQo+Pj4+DQo+Pj4+IFvCoCAxMDMuNjI2NzQyXSBhZGRyIGZmZmY4ODgzY2IxOWVlMzggaXMgbG9j
YXRlZCBpbiBzdGFjayBvZiB0YXNrDQo+Pj4+IG1vZHByb2JlLzExMjIgYXQgb2Zmc2V0IDI2NCBp
biBmcmFtZToNCj4+Pj4gW8KgIDEwMy42MjcyMzNdwqAga2ZkX2NyZWF0ZV92Y3JhdF9pbWFnZV9n
cHUrMHgwLzB4YjgwIFthbWRncHVdDQo+Pj4+DQo+Pj4+IFvCoCAxMDMuNjI3MzQ2XSB0aGlzIGZy
YW1lIGhhcyAzIG9iamVjdHM6DQo+Pj4+IFvCoCAxMDMuNjI3NDA1XcKgIFszMiwgMzYpICdhdmFp
bF9zaXplJw0KPj4+PiBbwqAgMTAzLjYyNzQxMF3CoCBbOTYsIDEyMCkgJ2xvY2FsX21lbV9pbmZv
Jw0KPj4+PiBbwqAgMTAzLjYyNzQ2Nl3CoCBbMTYwLCAyNjQpICdjdV9pbmZvJw0KPj4+Pg0KPj4+
PiBbwqAgMTAzLjYyNzYwMl0gTWVtb3J5IHN0YXRlIGFyb3VuZCB0aGUgYnVnZ3kgYWRkcmVzczoN
Cj4+Pj4gW8KgIDEwMy42Mjc2NzVdwqAgZmZmZjg4ODNjYjE5ZWQwMDogMDAgMDAgMDAgMDAgMDAg
MDAgZjEgZjEgZjEgZjEgMDQNCj4+Pj4gZjQgZjQNCj4+Pj4gZjQgZjIgZjINCj4+Pj4gW8KgIDEw
My42Mjc3ODBdwqAgZmZmZjg4ODNjYjE5ZWQ4MDogZjIgZjIgMDAgMDAgMDAgZjQgZjIgZjIgZjIg
ZjIgMDANCj4+Pj4gMDAgMDANCj4+Pj4gMDAgMDAgMDANCj4+Pj4gW8KgIDEwMy42Mjc4ODVdID5m
ZmZmODg4M2NiMTllZTAwOiAwMCAwMCAwMCAwMCAwMCAwMCAwMCBmNCBmNCBmNCBmMw0KPj4+PiBm
MyBmMw0KPj4+PiBmMyAwMCAwMA0KPj4+PiBbwqAgMTAzLjYyNzk4OV3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBeIFsgDQo+Pj4+IDEwMy42MjgwNjVdwqAgZmZmZjg4ODNjYjE5ZWU4MDogMDAgMDAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDANCj4+Pj4gMDANCj4+Pj4gMDAgMDAgMDANCj4+
Pj4gW8KgIDEwMy42MjgxNjldwqAgZmZmZjg4ODNjYjE5ZWYwMDogZjEgZjEgZjEgZjEgMDAgZjQg
ZjQgZjQgZjMgZjMgZjMNCj4+Pj4gZjMgMDANCj4+Pj4gMDAgMDAgMDANCj4+Pj4gW8KgIDEwMy42
MjgyNzNdDQo+Pj4+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQ0KPj4+Pg0KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
