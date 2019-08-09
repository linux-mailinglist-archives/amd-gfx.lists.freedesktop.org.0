Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5225487C12
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 15:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B1D6EE0A;
	Fri,  9 Aug 2019 13:50:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780057.outbound.protection.outlook.com [40.107.78.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D654F6EE0A
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 13:50:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AG62OTFPh9cKmLHZgBZDTUxdPcGj2+rP1i+r7rfALg34XTjXfB0+AN6z64KE/BIqPe1auW2rZ3fiHXiOdIZIFbaPQBSD85ODOUIAOvIXz1VWlwrTJSM7NRKezkftkiasg8fai5yPP8U5bx1nxGurdgODlYXvC3+DanxP9vbXlhj7WLbLjf45jNbKGpVlWgTrfGsKv3U5fwB7TRSNsANIrcEf75vB0Jew6ogmTfsXiedAaiTN1j8K3hkXHCj8r2Vq0J44Zz1UllfA9QMOoRNt2tWek+dpjmgWRYI2eMZ127muUuazaGGEjaRfGppCSYLQ49HkIJsAYTTKswdj5zov/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEMC4bXQePtd4IBsfXKizc/JHk2WDbMTl9m9p49VZ7Y=;
 b=F2+Vry8nC6mxm4BMkuEHGiEOsqAoiioPU9/PU+7+oaMbwohO6XOyDMCRdxrQoywqXuTodPQCAgcDpAJ1k5sX7zW0VwE0vkF8myF3Tk9LNjk+h3Vqsf1wlUURR6gR6aucYCp48mcoRM0DYXMOpSrA60HtHuRFAiiAk1wpdzieAde+rI9fjayS9RA5atK2iQOjGPqV9hYiOn30tekjjYxxM1ByJluCx+NQapR1EJFegXXCsf1EQhDBH1UnXKdSXCn+1IsXhSlHmOZri6TxLeC10GlqC7BtCODZtcFKCDr3p8KzxDgZXuW0UXC8NDfzlZCzu5geDRpetBM5eyQ3GIcVMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2499.namprd12.prod.outlook.com (52.132.30.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Fri, 9 Aug 2019 13:50:43 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543%7]) with mapi id 15.20.2157.015; Fri, 9 Aug 2019
 13:50:42 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/5] drm/amdgpu: Extends amdgpu vm definitions
Thread-Topic: [PATCH 1/5] drm/amdgpu: Extends amdgpu vm definitions
Thread-Index: AQHVTlhUHR9uJdXlpECqARkusLOo4qbyv02AgAAV1IA=
Date: Fri, 9 Aug 2019 13:50:42 +0000
Message-ID: <BL0PR12MB25803EE6EE5588CFE803EBC480D60@BL0PR12MB2580.namprd12.prod.outlook.com>
References: <1565316926-19516-1-git-send-email-Oak.Zeng@amd.com>
 <801142da-51cb-4efd-2cd6-860c65bfb311@amd.com>
In-Reply-To: <801142da-51cb-4efd-2cd6-860c65bfb311@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.228.209.96]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd429e01-8a2c-4cee-bdf3-08d71cd09246
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2499; 
x-ms-traffictypediagnostic: BL0PR12MB2499:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR12MB2499D9EA28D139F9ACB6EFDF80D60@BL0PR12MB2499.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(189003)(199004)(13464003)(256004)(66556008)(6506007)(66946007)(66446008)(6116002)(76176011)(7696005)(3846002)(71200400001)(71190400001)(55016002)(446003)(316002)(26005)(2501003)(6436002)(53546011)(9686003)(52536014)(305945005)(7736002)(66476007)(76116006)(102836004)(64756008)(8676002)(25786009)(74316002)(476003)(4326008)(8936002)(14454004)(86362001)(53936002)(99286004)(486006)(229853002)(478600001)(11346002)(66066001)(5660300002)(186003)(54906003)(6246003)(2906002)(110136005)(33656002)(81156014)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2499;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FnMfAPXXWHJLVhNGOA6nZG5ethFEJ2kMgNA1x4gp1VwqD+gzWImfQQjJkAUGHkgwT6Di9dlUIVZIY4ntfUUi+kGzPWlFANt1nveYug/PlNXl0A5kWsoLwwxh07dqqXsMElp+xPBFZIXydtn70j+O8A5jruDR+iG0CLRaxFrzA6kpJvw/KHqaMFAomodFlAx5rF3awp9QqX3oPUw2GGoIp/sFR1SkXI6Bc4Z3VL45m/tiLypHdDs6bdhrb258iatFKYGLnvLR+PGPbTEUptdLDJYi7ieg7HCeiw5JnClgXl/8hzECRBcv7hgeoew79bXeiXBP4e2JXKvzSYi9I3VOagYw0W/VoflBii62AY2IGNPQAnOk+XRsyzqGk0bgMFvLd9uTWgUE6WwENolFmz9N2ocZqqRxSTy1YSO2XRodNbw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd429e01-8a2c-4cee-bdf3-08d71cd09246
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 13:50:42.8080 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vuXf+ji3HeS1tQGShSwaV4xgSMnrG2OooGxWuWGQLX7xCm+cQ3kbcJycYulF81ho
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2499
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEMC4bXQePtd4IBsfXKizc/JHk2WDbMTl9m9p49VZ7Y=;
 b=Y3SrEPMGyTrTWN0QVfzgxw4RWRxdfX9rwzV3Hf3jDaKzGsllEEWwv2lAvi5Gu31zioFWcRx1grcu7GmdL+lIL++f9Rvm7RG5mJW8p/XRycXj/5x0WPSPYfmJfd7/4xHoJDQktHOrSm5Ys8D5kVOg56WmM1L5kVd5PRtkgbQ7zIQ=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Keely,
 Sean" <Sean.Keely@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNClJlZ2FyZHMsDQpPYWsNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtv
ZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+IA0KU2VudDogRnJpZGF5
LCBBdWd1c3QgOSwgMjAxOSA4OjI5IEFNDQpUbzogWmVuZywgT2FrIDxPYWsuWmVuZ0BhbWQuY29t
PjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBLdWVobGluZywgRmVsaXggPEZl
bGl4Lkt1ZWhsaW5nQGFtZC5jb20+OyBLZWVseSwgU2VhbiA8U2Vhbi5LZWVseUBhbWQuY29tPg0K
U3ViamVjdDogUmU6IFtQQVRDSCAxLzVdIGRybS9hbWRncHU6IEV4dGVuZHMgYW1kZ3B1IHZtIGRl
ZmluaXRpb25zDQoNCkFtIDA5LjA4LjE5IHVtIDA0OjE1IHNjaHJpZWIgWmVuZywgT2FrOg0KPiBB
ZGQgZGVmaW5pdGlvbiBvZiBhbGwgc3VwcG9ydGVkIG10eXBlcy4gVGhlIFJXIG10eXBlIGlzIHJl
Y2VudGx5IA0KPiBpbnRyb2R1Y2VkIGZvciBhcmN0dXJ1cy4gQWxzbyBhZGQgZGVmaW5pdGlvbiBv
ZiBhIGZsYWcgdG8gcHJvYmUgYW5kIA0KPiBwb3NzaWJseSBpbnZhbGlkYXRlIHJlbW90ZSBHUFUg
Y2FjaGUsIHdoaWNoIHdpbGwgYmUgdXNlZCBsYXRlciBpbiB0aGlzIA0KPiBzZXJpZXMuDQo+DQo+
IENoYW5nZS1JZDogSTk2ZmM5YmI0YjZiMWU2MmJkYzEwYjYwMGQ4YWFhNmE4MDIxMjhkNmQNCj4g
U2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oIHwgOSArKysrKysrLS0NCj4gICBp
bmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaCAgICAgICAgICB8IDQgKysrKw0KPiAgIDIgZmls
ZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oIA0KPiBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oDQo+IGluZGV4IDJlZGEzYTguLjdhNzc0
NzcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5o
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oDQo+IEBAIC04
MCw4ICs4MCwxMyBAQCBzdHJ1Y3QgYW1kZ3B1X2JvX2xpc3RfZW50cnk7DQo+ICAgI2RlZmluZSBB
TURHUFVfUFRFX01UWVBFX1ZHMTAoYSkJKCh1aW50NjRfdCkoYSkgPDwgNTcpDQo+ICAgI2RlZmlu
ZSBBTURHUFVfUFRFX01UWVBFX1ZHMTBfTUFTSwlBTURHUFVfUFRFX01UWVBFX1ZHMTAoM1VMTCkN
Cj4gICANCj4gLSNkZWZpbmUgQU1ER1BVX01UWVBFX05DIDANCj4gLSNkZWZpbmUgQU1ER1BVX01U
WVBFX0NDIDINCj4gK2VudW0gYW1kZ3B1X210eXBlIHsNCj4gKwlBTURHUFVfTVRZUEVfTkMgPSAw
LA0KPiArCUFNREdQVV9NVFlQRV9XQyA9IDEsDQo+ICsJQU1ER1BVX01UWVBFX0NDID0gMiwNCj4g
KwlBTURHUFVfTVRZUEVfVUMgPSAzLA0KPiArCUFNREdQVV9NVFlQRV9SVyA9IDQsDQo+ICt9Ow0K
DQpNaG0sIHdoeSBhbiBlbnVtPw0KDQpbT2FrXTogVG8gbWUsIGVudW0gYW5kIG1hY3JvIGRvbid0
IG1ha2UgYmlnIGRpZmZlcmVuY2UsIGV4Y2VwdCB5b3UgY2FuIHVzZSBlbnVtIGF0IHJ1biB0aW1l
IChmb3IgZXhhbXBsZSB1c2UgaXQgaW4gYSBkZWJ1Z2dlcikgd2hpbGUgbWFjcm8gd2lsbCBiZSBy
ZXBsYWNlZCBkdXJpbmcgcHJlLWNvbXBpbGUuIEFueSByZWFzb24gbm8gZW51bSBoIGVyZT8gSSBj
YW4gY2hhbmdlIGl0IHRvIG1hY3JvLCBub3QgYSBiaWcgZGVhbC4NCg0KQ2hyaXN0aWFuLg0KDQo+
ICAgDQo+ICAgI2RlZmluZSBBTURHUFVfUFRFX0RFRkFVTFRfQVRDICAoQU1ER1BVX1BURV9TWVNU
RU0gICAgICBcDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IEFNREdQVV9Q
VEVfU05PT1BFRCAgICBcDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9k
cm0uaCANCj4gYi9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaCBpbmRleCBjYTk3YjY4Li45
N2U4ZTUxIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaA0KPiAr
KysgYi9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaA0KPiBAQCAtNTAzLDYgKzUwMywxMCBA
QCBzdHJ1Y3QgZHJtX2FtZGdwdV9nZW1fb3Agew0KPiAgICNkZWZpbmUgQU1ER1BVX1ZNX01UWVBF
X0NDCQkoMyA8PCA1KQ0KPiAgIC8qIFVzZSBVQyBNVFlQRSBpbnN0ZWFkIG9mIGRlZmF1bHQgTVRZ
UEUgKi8NCj4gICAjZGVmaW5lIEFNREdQVV9WTV9NVFlQRV9VQwkJKDQgPDwgNSkNCj4gKy8qIFVz
ZSBSVyBNVFlQRSBpbnN0ZWFkIG9mIGRlZmF1bHQgTVRZUEUgKi8NCj4gKyNkZWZpbmUgQU1ER1BV
X1ZNX01UWVBFX1JXCQkoNSA8PCA1KQ0KPiArLyogQ2FjaGVhYmxlL3Nub29wYWJsZSAqLw0KPiAr
I2RlZmluZSBBTURHUFVfVk1fUEFHRV9JTlZBTElEQVRFX1BST0JFCSgxIDw8IDkpDQo+ICAgDQo+
ICAgc3RydWN0IGRybV9hbWRncHVfZ2VtX3ZhIHsNCj4gICAJLyoqIEdFTSBvYmplY3QgaGFuZGxl
ICovDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
