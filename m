Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A366DA336
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 03:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AF46E9E6;
	Thu, 17 Oct 2019 01:34:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800080.outbound.protection.outlook.com [40.107.80.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90EB6E9E6
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 01:34:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YqY4u+RDye9kV2dIQEKxipIvh5+Yxo0xkgqFfNLbbRuWHAqlt7XE6PE28ABj3AcuS/9koyg8US1UEu/IUCrKNtHIQ5l1HAo7+JZQSqk34O3CIXKXAgHBHi3DfvcGctUynRU07jEcQ1Co+4W11h4jbPGaAQI51FlQjrjr4PFYJUbal0NHpPHCSkZWnDMZqRbBWU5x0v/CckOR6wKhvz8WqmI42A5kl4rkbbGCcwfyCDxFfgBPMzCYhQ9JuR7In2zADQljBXnI46F5+wgXGuKCOEiZjlxXaNXHW/66Rpakk576eftbtMs8pX7vCNA7b5CYoTSpE9BQqZGmhjG85zsQ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2Wjs4w66345ypJgtMMYaaiex8Ht2TOQJc4Pm/4bKrc=;
 b=XcdAv4WCIzbbUwkX2xVNjy6PTXMRJ1QrTbn4ilkfOOFo1v9jnSxGmFrlI3l17RqLOLDG9vv1tGtTbdyeES9ByTzL+FZGy+vsoznjV9OIGg8SF2yceBZSomXBS6cU/dHsWa/uJk6/lgTxhPJKLF7auFEeuVvicV7Jy1Vkj1qatz8Mcxm31Njjt7GEgvj0A+yjZhsydymcrFzSW8eFfa9rZY6Fhxz3Me90DkQxuQ/FRfxGDu/Fbe8enjOvNQ+bL0iso6xBzfv4IkbBM0IRPA2RXr2PQ26X3XtWHBxxj/TOKRbjxVeaXt5bY7SWCj1K+6rTKkmWWvoHD+Q2vQmPJqHNXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3744.namprd12.prod.outlook.com (10.255.236.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Thu, 17 Oct 2019 01:33:59 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::435:bdca:bac1:a26d]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::435:bdca:bac1:a26d%5]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 01:33:59 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Kim, Jonathan" <Jonathan.Kim@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: disable c-states on xgmi perfmons
Thread-Topic: [PATCH] drm/amdgpu: disable c-states on xgmi perfmons
Thread-Index: AQHVhISs0+WbYrMUA0mDJHHtV//DAqdeAH+ggAALO1A=
Date: Thu, 17 Oct 2019 01:33:59 +0000
Message-ID: <MN2PR12MB33447415EFBE3B6EBB29B75AE46D0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20191017004852.6230-1-jonathan.kim@amd.com>
 <CH2PR12MB38317C33470907FA76768B47856D0@CH2PR12MB3831.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB38317C33470907FA76768B47856D0@CH2PR12MB3831.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40c1601c-2e96-4f86-95ad-08d752a21574
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3744:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3744B77BE79AF2295C9BED75E46D0@MN2PR12MB3744.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(13464003)(189003)(199004)(66446008)(7736002)(305945005)(76116006)(446003)(71200400001)(74316002)(66066001)(11346002)(66946007)(71190400001)(86362001)(66476007)(81156014)(8676002)(81166006)(186003)(476003)(8936002)(64756008)(66556008)(102836004)(26005)(486006)(2906002)(33656002)(53546011)(316002)(110136005)(99286004)(5660300002)(14454004)(7696005)(76176011)(478600001)(6246003)(3846002)(6116002)(14444005)(2501003)(25786009)(9686003)(55016002)(6506007)(52536014)(4326008)(229853002)(6436002)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3744;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9iA+7r5Ec1qDMcy9er5qPAdJlWmREiOT/yzdPk1L51l2HFszuEOygt11MXSBMApEvbtCO5l7vo6ZxHNgm/QRTSkcLe33R3033mND9sIp5vKgO+j0CPKzZdTQQi/EgSSeROVYveePNbYmD6yyMabmcKLhPX0k3u7oupg001E9VVp+XJ+GOk/UlEImR7O6cuoX9LEjvlQE04Yg22LwGho2oWwofaK6wPDYjgOW18CAtPwT4GVNAXKfh9WrSFWzZ20faK+2KwtvHGGyeb2U2bhkyBt8x1PjzMHt47Yj0K4vE7Etm5ofSLQ6dcVJZEJievHToorWnthJfojQNDk/5eL0zsXMtysYd/mTiaS4gLvkWiQ6hoYnyHWmsQ3SrHrqRXqThKGSkwgLqXWy+sS1acFN8TE1/h4ETOy2Rqg3TE9LTPw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c1601c-2e96-4f86-95ad-08d752a21574
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 01:33:59.2247 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GhWOaq2pLSdrDnkU0804I+uVzBpgD+GEyunbxJ9APU1cibOvwva4jwHIWronzhmB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3744
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2Wjs4w66345ypJgtMMYaaiex8Ht2TOQJc4Pm/4bKrc=;
 b=q3YTv/n9abPzXwr4TnbmofxigzwKv2WKuSef0VDTphFGGdPbi1CFl+padTK5QsUK7S1NvhRGP9Bub4kzmaZxmPfO3gcpQ7zytC4KKcDeMpvnsrQ03FivDjhshfGDodzIpFFl/YGOZX+gCkrJvBWPB6DZlvkk1jsVsWu2WYAc8uw=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgSm9uYXRoYW4sDQoNCkF0IGRlZmF1bHQsIHZlZ2EyMCBzdGlsbCB0YWtlcyBvbGQgcG93ZXJw
bGF5IHJvdXRpbmVzLiBTbywgdGhpcyB3aWxsIG5vdCB3b3JrIG9uIFZlZ2EyMC4NCkFzIHByb3Bv
c2VkIGJlZm9yZSwgdGhlIGxvZ2ljcyBzaW1pbGFyIGFzIGJlbG93IHNob3VsZCBiZSB1c2VkOiAN
Ci8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8v
Ly8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLw0KaWYgKGlzX3N1cHBvcnRfc3df
c211KGFkZXYpKSB7DQogICAgICAgIHIgPSBzbXVfc2V0X2RmX2NzdGF0ZSgmYWRldi0+c211LCBE
Rl9DU1RBVEVfRElTQUxMT1cgb3IgREZfQ1NUQVRFX0FMTE9XKTsNCn0gZWxzZSBpZiAoYWRldi0+
cG93ZXJwbGF5LnBwX2Z1bmNzICYmDQogICAgICAgICAgICAgICAgICAgYWRldi0+cG93ZXJwbGF5
LnBwX2Z1bmNzLT5zZXRfZGZfY3N0YXRlKSB7DQogICAgICAgIHIgPSBhZGV2LT5wb3dlcnBsYXku
cHBfZnVuY3MtPnNldF9kZl9jc3RhdGUoDQogICAgICAgICAgICAgICAgYWRldi0+cG93ZXJwbGF5
LnBwX2hhbmRsZSwNCiAgICAgICAgICAgICAgICBERl9DU1RBVEVfRElTQUxMT1cgb3IgREZfQ1NU
QVRFX0FMTE9XKTsNCn0NCi8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8v
Ly8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vDQoNClJl
Z2FyZHMsDQpFdmFuDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEtpbSwg
Sm9uYXRoYW4gPEpvbmF0aGFuLktpbUBhbWQuY29tPg0KPiBTZW50OiAyMDE55bm0MTDmnIgxN+aX
pSA4OjUwDQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogS3VlaGxp
bmcsIEZlbGl4IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPjsgUXVhbiwgRXZhbg0KPiA8RXZhbi5R
dWFuQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIGRybS9hbWRncHU6IGRpc2FibGUg
Yy1zdGF0ZXMgb24geGdtaSBwZXJmbW9ucw0KPiANCj4gKyBGZWxpeA0KPiANCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2ltLCBKb25hdGhhbiA8Sm9uYXRoYW4uS2ltQGFt
ZC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAxNiwgMjAxOSA4OjQ5IFBNDQo+IFRv
OiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogRmVsaXguS2V1aGxpbmdAYW1k
LmNvbTsgUXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+OyBLaW0sDQo+IEpvbmF0aGFuIDxK
b25hdGhhbi5LaW1AYW1kLmNvbT47IEtpbSwgSm9uYXRoYW4NCj4gPEpvbmF0aGFuLktpbUBhbWQu
Y29tPg0KPiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IGRpc2FibGUgYy1zdGF0ZXMgb24g
eGdtaSBwZXJmbW9ucw0KPiANCj4gcmVhZCBvciB3cml0ZXMgdG8gZGYgcmVnaXN0ZXJzIHdoZW4g
Z3B1IGRmIGlzIGluIGMtc3RhdGVzIHdpbGwgcmVzdWx0IGluIGhhbmcuICBkZg0KPiBjLXN0YXRl
cyBzaG91bGQgYmUgZGlzYWJsZWQgcHJpb3IgdG8gcmVhZCBvciB3cml0ZXMgdGhlbiByZS1lbmFi
bGVkIGFmdGVyIHJlYWQNCj4gb3Igd3JpdGVzLg0KPiANCj4gQ2hhbmdlLUlkOiBJNmQ1YTgzZTRm
ZTEzZTI5YzczZGZiMDNhOTRmZTdjNjExZTg2N2ZlYw0KPiBTaWduZWQtb2ZmLWJ5OiBKb25hdGhh
biBLaW0gPEpvbmF0aGFuLktpbUBhbWQuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2RmX3YzXzYuYyB8IDIxICsrKysrKysrKysrKysrKysrKysrLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMNCj4gYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMNCj4gaW5kZXggMTZmYmQyYmM4YWQxLi45YTU4NDE2
NjYyZTAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMNCj4gQEAgLTEw
Miw2ICsxMDIsOSBAQCBzdGF0aWMgdWludDY0X3QgZGZfdjNfNl9nZXRfZmljYShzdHJ1Y3QNCj4g
YW1kZ3B1X2RldmljZSAqYWRldiwNCj4gIAlhZGRyZXNzID0gYWRldi0+bmJpby5mdW5jcy0+Z2V0
X3BjaWVfaW5kZXhfb2Zmc2V0KGFkZXYpOw0KPiAgCWRhdGEgPSBhZGV2LT5uYmlvLmZ1bmNzLT5n
ZXRfcGNpZV9kYXRhX29mZnNldChhZGV2KTsNCj4gDQo+ICsJaWYgKHNtdV9zZXRfZGZfY3N0YXRl
KCZhZGV2LT5zbXUsIDApKQ0KPiArCQlyZXR1cm4gMHhGRkZGRkZGRkZGRkZGRkZGOw0KPiArDQo+
ICAJc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnBjaWVfaWR4X2xvY2ssIGZsYWdzKTsNCj4gIAlX
UkVHMzIoYWRkcmVzcywNCj4gc21uREZfUElFX0FPTl9GYWJyaWNJbmRpcmVjdENvbmZpZ0FjY2Vz
c0FkZHJlc3MzKTsNCj4gIAlXUkVHMzIoZGF0YSwgZmljYWFfdmFsKTsNCj4gQEAgLTExNCw2ICsx
MTcsOCBAQCBzdGF0aWMgdWludDY0X3QgZGZfdjNfNl9nZXRfZmljYShzdHJ1Y3QNCj4gYW1kZ3B1
X2RldmljZSAqYWRldiwNCj4gDQo+ICAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+cGNp
ZV9pZHhfbG9jaywgZmxhZ3MpOw0KPiANCj4gKwlzbXVfc2V0X2RmX2NzdGF0ZSgmYWRldi0+c211
LCAxKTsNCj4gKw0KPiAgCXJldHVybiAoKChmaWNhZGhfdmFsICYgMHhGRkZGRkZGRkZGRkZGRkZG
KSA8PCAzMikgfCBmaWNhZGxfdmFsKTsgIH0NCj4gDQo+IEBAIC0xMjUsNiArMTMwLDkgQEAgc3Rh
dGljIHZvaWQgZGZfdjNfNl9zZXRfZmljYShzdHJ1Y3QgYW1kZ3B1X2RldmljZQ0KPiAqYWRldiwg
dWludDMyX3QgZmljYWFfdmFsLA0KPiAgCWFkZHJlc3MgPSBhZGV2LT5uYmlvLmZ1bmNzLT5nZXRf
cGNpZV9pbmRleF9vZmZzZXQoYWRldik7DQo+ICAJZGF0YSA9IGFkZXYtPm5iaW8uZnVuY3MtPmdl
dF9wY2llX2RhdGFfb2Zmc2V0KGFkZXYpOw0KPiANCj4gKwlpZiAoc211X3NldF9kZl9jc3RhdGUo
JmFkZXYtPnNtdSwgMCkpDQo+ICsJCXJldHVybjsNCj4gKw0KPiAgCXNwaW5fbG9ja19pcnFzYXZl
KCZhZGV2LT5wY2llX2lkeF9sb2NrLCBmbGFncyk7DQo+ICAJV1JFRzMyKGFkZHJlc3MsDQo+IHNt
bkRGX1BJRV9BT05fRmFicmljSW5kaXJlY3RDb25maWdBY2Nlc3NBZGRyZXNzMyk7DQo+ICAJV1JF
RzMyKGRhdGEsIGZpY2FhX3ZhbCk7DQo+IEBAIC0xMzQsOCArMTQyLDkgQEAgc3RhdGljIHZvaWQg
ZGZfdjNfNl9zZXRfZmljYShzdHJ1Y3QgYW1kZ3B1X2RldmljZQ0KPiAqYWRldiwgdWludDMyX3Qg
ZmljYWFfdmFsLA0KPiANCj4gIAlXUkVHMzIoYWRkcmVzcywNCj4gc21uREZfUElFX0FPTl9GYWJy
aWNJbmRpcmVjdENvbmZpZ0FjY2Vzc0RhdGFIaTMpOw0KPiAgCVdSRUczMihkYXRhLCBmaWNhZGhf
dmFsKTsNCj4gLQ0KPiAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmFkZXYtPnBjaWVfaWR4X2xv
Y2ssIGZsYWdzKTsNCj4gKw0KPiArCXNtdV9zZXRfZGZfY3N0YXRlKCZhZGV2LT5zbXUsIDEpOw0K
PiAgfQ0KPiANCj4gIC8qDQo+IEBAIC0xNTMsMTIgKzE2MiwxNyBAQCBzdGF0aWMgdm9pZCBkZl92
M182X3BlcmZtb25fcnJlZyhzdHJ1Y3QNCj4gYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gIAlhZGRy
ZXNzID0gYWRldi0+bmJpby5mdW5jcy0+Z2V0X3BjaWVfaW5kZXhfb2Zmc2V0KGFkZXYpOw0KPiAg
CWRhdGEgPSBhZGV2LT5uYmlvLmZ1bmNzLT5nZXRfcGNpZV9kYXRhX29mZnNldChhZGV2KTsNCj4g
DQo+ICsJaWYgKHNtdV9zZXRfZGZfY3N0YXRlKCZhZGV2LT5zbXUsIDApKQ0KPiArCQlyZXR1cm47
DQo+ICsNCj4gIAlzcGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+cGNpZV9pZHhfbG9jaywgZmxhZ3Mp
Ow0KPiAgCVdSRUczMihhZGRyZXNzLCBsb19hZGRyKTsNCj4gIAkqbG9fdmFsID0gUlJFRzMyKGRh
dGEpOw0KPiAgCVdSRUczMihhZGRyZXNzLCBoaV9hZGRyKTsNCj4gIAkqaGlfdmFsID0gUlJFRzMy
KGRhdGEpOw0KPiAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmFkZXYtPnBjaWVfaWR4X2xvY2ss
IGZsYWdzKTsNCj4gKw0KPiArCXNtdV9zZXRfZGZfY3N0YXRlKCZhZGV2LT5zbXUsIDEpOw0KPiAg
fQ0KPiANCj4gIC8qDQo+IEBAIC0xNzUsMTIgKzE4OSwxNyBAQCBzdGF0aWMgdm9pZCBkZl92M182
X3BlcmZtb25fd3JlZyhzdHJ1Y3QNCj4gYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgbG9f
YWRkciwNCj4gIAlhZGRyZXNzID0gYWRldi0+bmJpby5mdW5jcy0+Z2V0X3BjaWVfaW5kZXhfb2Zm
c2V0KGFkZXYpOw0KPiAgCWRhdGEgPSBhZGV2LT5uYmlvLmZ1bmNzLT5nZXRfcGNpZV9kYXRhX29m
ZnNldChhZGV2KTsNCj4gDQo+ICsJaWYgKHNtdV9zZXRfZGZfY3N0YXRlKCZhZGV2LT5zbXUsIDAp
KQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gIAlzcGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+cGNpZV9p
ZHhfbG9jaywgZmxhZ3MpOw0KPiAgCVdSRUczMihhZGRyZXNzLCBsb19hZGRyKTsNCj4gIAlXUkVH
MzIoZGF0YSwgbG9fdmFsKTsNCj4gIAlXUkVHMzIoYWRkcmVzcywgaGlfYWRkcik7DQo+ICAJV1JF
RzMyKGRhdGEsIGhpX3ZhbCk7DQo+ICAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+cGNp
ZV9pZHhfbG9jaywgZmxhZ3MpOw0KPiArDQo+ICsJc211X3NldF9kZl9jc3RhdGUoJmFkZXYtPnNt
dSwgMSk7DQo+ICB9DQo+IA0KPiAgLyogZ2V0IHRoZSBudW1iZXIgb2YgZGYgY291bnRlcnMgYXZh
aWxhYmxlICovDQo+IC0tDQo+IDIuMTcuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
