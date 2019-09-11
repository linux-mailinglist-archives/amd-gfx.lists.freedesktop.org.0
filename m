Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7CFAF496
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Sep 2019 05:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BAF86E9E7;
	Wed, 11 Sep 2019 03:09:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810074.outbound.protection.outlook.com [40.107.81.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB22A6E9E7
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Sep 2019 03:08:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZwgOi05HTut+jHGUICiYOaEV5VGAbORGxWhJD/NkjjURxZjU6m86ArbBNBOqfa7xcCefoaP0u5Pu+WPzSYdrQhO7PPQ/3q/9D0LKShozq0FULUKpODnz3yCqyqJKmD6mOJh/5r8+hkQjy2RSia90Y82TaNvjaOU9mNIQZLUMHgllLtQK30EETtLKaMp0oWi3CVzTG6FJdQ3CZdsEWuoVAPqM8d56WfOofJaQmqNwXidYPMSk/pxDUVHlznd4FEKaVY19XmYzfrOyn0PPCvIXUi1a+CGzlTUzwSVxwlgbhUvEWHgcPFCX4N91FvGB7Dabcyc/X0veb/KWZL1KSB6sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzoPiPdJ1v0MVXE7Dd+FDf0nafLRIbrrDf9LpZQk6FA=;
 b=Of2sYodgNvqpCFbPXmLe3brxhRpIOpzy+sE/1GEffLnLrMgBbhZkuTKpr4colhGDPvYQp678MII4NYjxMLuzs7FjdiAlsR5htvb4Q27lE3mfXQRzYOngKuFqxTT5Yb1LseCk0j8aEOv0HMFpv54lrC52QDiVFlnXqZzW/9Z3YlkxfRdlLqpdLb7pt1n95UZXLc7C7tX9onZyMty1LHSk6bUn6P5dS04o8U9K9Ag3F9kw9QkotkeesdLy3HBy1UFgknXlT+n91RQK0jhvPqxsvd6QNib9ck8G6n0UjMVeeecozDnm/il173eF3XBgYXdHnFw+zkNC2VwDI68z/wijcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3630.namprd12.prod.outlook.com (20.178.243.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Wed, 11 Sep 2019 03:08:58 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 03:08:58 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Fix mutex lock from atomic context.
Thread-Topic: [PATCH] drm/amdgpu: Fix mutex lock from atomic context.
Thread-Index: AQHVaA/AIusXbm4yfUGXHWnUs1JB1aclyi0w
Date: Wed, 11 Sep 2019 03:08:57 +0000
Message-ID: <MN2PR12MB3054A0B4D399377417213B76B0B10@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <1568144487-27802-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1568144487-27802-1-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7484366-d624-4c4d-e96a-08d73665633a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3630; 
x-ms-traffictypediagnostic: MN2PR12MB3630:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB36302A794B08EF188182722BB0B10@MN2PR12MB3630.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(13464003)(52314003)(189003)(199004)(6116002)(5660300002)(229853002)(33656002)(74316002)(2906002)(76116006)(8676002)(81156014)(305945005)(7736002)(8936002)(81166006)(11346002)(446003)(14454004)(476003)(486006)(102836004)(478600001)(53546011)(2501003)(14444005)(256004)(76176011)(9686003)(52536014)(99286004)(316002)(7696005)(6506007)(6436002)(6246003)(53936002)(25786009)(26005)(66446008)(71200400001)(71190400001)(86362001)(66946007)(66066001)(66556008)(66476007)(64756008)(4326008)(54906003)(110136005)(55016002)(3846002)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3630;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7WUeCe9QVBdoi5HvZ7D3vRV+3qzeN6p1aJldyDAa2BKPD6WnOKa2ixm5vFfM84d9VMQpFyQ0any/ZgmnZe3QZzjj9GxT2YJyZ1RngyndT737PMM3wA48QPkva4XXqjpikvGM8ONKoIuCyqCiLzrOUueu+lyWFbVuAwsUBMXQsQWyPTcdK6dZ7+KyuO4kZSSSjq6/9TcqWn1Fm3cPlzkB7Eo5BkXuDuaLVKBdLm3Yc5kq4gpuylrg1azzRcrBxdCyoSEq9hFuZdBrW7n3XolY2jMw9NF92Csz8W12CANhGvaGyk2wwheQPbeXAI13OHilhUkVt13rFp1PiIqOhNALeDPWV0Gb3URr3fjShAh/nU51T6ckXvSUPHA+dZ+btticUK5DUVk/R/pyU2t+g5kwI3oLO01xfExc14gSTCPLQi4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7484366-d624-4c4d-e96a-08d73665633a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 03:08:57.8757 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +tSc7j4ILI8joOOFiDy4NXJyMhrYRJ2truCCKd41c6dZvX2VwqtGSo6PdqsIwDiQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3630
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzoPiPdJ1v0MVXE7Dd+FDf0nafLRIbrrDf9LpZQk6FA=;
 b=aHToXrBdfsnCfWgD7ZuANpgdd4oDD5mIaL3tkekCmCaXG5ptT3RcBVNd5ANVwdl2DvLi1IYWWtNT/Jlm6++jIcopNyVbwc3p2GHAgWEfdvEh/HkWzWadGxBOVW0xKToQAJC0M3pSmh8T/dJTrc7HHDfQudpUDa3r1/0Tj3Bq24A=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Grodzovsky,
 Andrey" <Andrey.Grodzovsky@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YW1kZ3B1X3Jhc19yZXNlcnZlX2JhZF9wYWdlcyBpcyBvbmx5IHVzZWQgYnkgdW1jIGJsb2NrLCBz
byBhbm90aGVyIGFwcHJvYWNoIGlzIHRvIG1vdmUgaXQgaW50byBhbWRncHVfdW1jX3Byb2Nlc3Nf
cmFzX2RhdGFfY2IuDQpBbnl3YXksIGVpdGhlciB3YXkgaXMgT0sgYW5kIHRoZSBwYXRjaCBpczoN
Cg0KUmV2aWV3ZWQtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4NCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdy
b2R6b3Zza3lAYW1kLmNvbT4NCj4gU2VudDogMjAxOeW5tDnmnIgxMeaXpSAzOjQxDQo+IFRvOiBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogQ2hlbiwgR3VjaHVuIDxHdWNodW4u
Q2hlbkBhbWQuY29tPjsgWmhvdTEsIFRhbw0KPiA8VGFvLlpob3UxQGFtZC5jb20+OyBEZXVjaGVy
LCBBbGV4YW5kZXINCj4gPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBHcm9kem92c2t5LCBB
bmRyZXkNCj4gPEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0g
ZHJtL2FtZGdwdTogRml4IG11dGV4IGxvY2sgZnJvbSBhdG9taWMgY29udGV4dC4NCj4gDQo+IFBy
b2JsZW06DQo+IGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFnZXMgd2FzIG1vdmVkIHRvIGFtZGdw
dV9yYXNfcmVzZXRfZ3B1DQo+IGJlY2F1c2Ugd3JpdGluZyB0byBFRVBST00gZHVyaW5nIEFTSUMg
cmVzZXQgd2FzIHVuc3RhYmxlLg0KPiBCdXQgZm9yIEVSUkVWRU5UX0FUSFVCX0lOVEVSUlVQVCBh
bWRncHVfcmFzX3Jlc2V0X2dwdSBpcyBjYWxsZWQNCj4gZGlyZWN0bHkgZnJvbSBJU1IgY29udGV4
dCBhbmQgc28gbG9ja2luZyBpcyBub3QgYWxsb3dlZC4gQWxzbyBpdCdzIGlycmVsZXZhbnQgZm9y
DQo+IHRoaXMgcGFydGlsY3VsYXIgaW50ZXJydXB0IGFzIHRoaXMgaXMgZ2VuZXJpYyBSQVMgaW50
ZXJydXB0IGFuZCBub3QgbWVtb3J5DQo+IGVycm9ycyBzcGVjaWZpYy4NCj4gDQo+IEZpeDoNCj4g
QXZvaWQgY2FsbGluZyBhbWRncHVfcmFzX3Jlc2VydmVfYmFkX3BhZ2VzIGlmIG5vdCBpbiB0YXNr
IGNvbnRleHQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5
Lmdyb2R6b3Zza3lAYW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcmFzLmggfCA0ICsrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcmFzLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmFzLmgNCj4gaW5kZXggMDEyMDM0ZC4uZGQ1ZGEzYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaA0KPiBAQCAtNTA0LDcgKzUwNCw5IEBAIHN0YXRpYyBp
bmxpbmUgaW50IGFtZGdwdV9yYXNfcmVzZXRfZ3B1KHN0cnVjdA0KPiBhbWRncHVfZGV2aWNlICph
ZGV2LA0KPiAgCS8qIHNhdmUgYmFkIHBhZ2UgdG8gZWVwcm9tIGJlZm9yZSBncHUgcmVzZXQsDQo+
ICAJICogaTJjIG1heSBiZSB1bnN0YWJsZSBpbiBncHUgcmVzZXQNCj4gIAkgKi8NCj4gLQlhbWRn
cHVfcmFzX3Jlc2VydmVfYmFkX3BhZ2VzKGFkZXYpOw0KPiArCWlmIChpbl90YXNrKCkpDQo+ICsJ
CWFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFnZXMoYWRldik7DQo+ICsNCj4gIAlpZiAoYXRvbWlj
X2NtcHhjaGcoJnJhcy0+aW5fcmVjb3ZlcnksIDAsIDEpID09IDApDQo+ICAJCXNjaGVkdWxlX3dv
cmsoJnJhcy0+cmVjb3Zlcnlfd29yayk7DQo+ICAJcmV0dXJuIDA7DQo+IC0tDQo+IDIuNy40DQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
