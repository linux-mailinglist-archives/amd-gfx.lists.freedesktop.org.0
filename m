Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3387D399
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 05:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0756E331;
	Thu,  1 Aug 2019 03:17:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740083.outbound.protection.outlook.com [40.107.74.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685946E331
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 03:17:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZB1YP1aruNdUAoIf9X1suM+xob0y0Rjqu6l+aWJdtIyKIGJkouRY5piF8Q//Wo6XkLDLUU5yvGJGMVC9MrL51GhlkhNvu4xc5i1spNDbNaGpbMPISoHMijziKsOFsfOEdPHyuQKKWfj/udWtejYC5cA/Sm2phG2X1O7sydkHKU+Tv2okE+zZwpENE3CbKh0Hb7qbJKh7JQWSOhF3sFMnh/9iUNhkWeAOGuzK9lSzx8rIoGxZrDBHDAV+KtQgJZ0BHqqrvoxoxdT1ewn7hp3lH4tFN5lCi7+6mmS62fOCnTGCGgyRQcDSn+edHPOwkOjAYq6gm3WgC/nB/5oueyRdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6fTh0UzDpqSkxH+w4t5lWBLdDwm7AoMlcl5pV2oVak=;
 b=O2QVfzkj/lOzUb55L3aVWpibf/8yGUKwcOnBNchH9XD3ZG3jl+qKsGlRZwvrP2Bfex7ruTkE/9UTgIZMjHRfnTnwBa81zaK5Jri5HGjvs4Anixj/2pocrjm/z4WrzWdkARec1O6dkwuaWWzfvktxh7IzQ5LrvR16SuCTM53G2JZeAWZKCfEIfK09XjPK/Nlo37V754uB0d8d2DRRgUufjjTPMnIoyuRPDGPchPyzI/DM6yIUsOY48f4ZwfRpN6rVXBzm9lWsnvEUowlXgq2RWRhyU1FneBIfXDKoSNzQpXoXY1eIH6pjLuhSBBenQ1jybKVNyXzZ4kOhr0sSzPPQsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB2911.namprd12.prod.outlook.com (20.179.80.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.12; Thu, 1 Aug 2019 03:17:25 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26%7]) with mapi id 15.20.2136.010; Thu, 1 Aug 2019
 03:17:25 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Matt Coffin <mcoffin13@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: Allow changing of fan_control in
 smu_v11_0
Thread-Topic: [PATCH] drm/amd/powerplay: Allow changing of fan_control in
 smu_v11_0
Thread-Index: AQHVR9yjFMBmAFgNkEOih9H/s6Tay6blnz/g
Date: Thu, 1 Aug 2019 03:17:25 +0000
Message-ID: <MN2PR12MB334472B24E84DC3C2D94EF37E4DE0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190731201435.10776-1-mcoffin13@gmail.com>
In-Reply-To: <20190731201435.10776-1-mcoffin13@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b58f15ed-3419-424e-86e6-08d7162ec6c7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2911; 
x-ms-traffictypediagnostic: MN2PR12MB2911:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB2911768894C7B85B80D25165E4DE0@MN2PR12MB2911.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(13464003)(199004)(189003)(76176011)(446003)(25786009)(6246003)(2906002)(68736007)(7696005)(2501003)(66476007)(76116006)(86362001)(476003)(26005)(53546011)(6506007)(66066001)(486006)(52536014)(99286004)(11346002)(66556008)(5660300002)(66446008)(64756008)(186003)(102836004)(66946007)(316002)(9686003)(110136005)(6306002)(14454004)(55016002)(53936002)(33656002)(966005)(8676002)(81156014)(6436002)(81166006)(229853002)(305945005)(74316002)(8936002)(6116002)(3846002)(478600001)(71190400001)(71200400001)(14444005)(7736002)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2911;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 56BpFRUd3foEBsnbQFjAcuAeWAxZUDPsxcdMhMHCU/Xbw7ottonTFpHHrtAKmcL0goIIlhKByQbh8uvUhOO1UWs3mCMfANQp5jLJ+WfTYAPra+Pz8B6pWsO1sKbYle3V1Z+EfB4Vb0Xj1mzdnRYtXeQHJVSJGFFn5it8C5y6EWz78tgVAJqRWMXsP35jW6zZ0LWNtqLdBMPxpdcYGwV904kzRY7zfr3fNINKdmdDnIOco33kONCeq1xnFGiK3BnUwtPPA81H7OqAfIp7GlzhJ8fa9ijgbs7erlCwpakCJCqPVqIjOpTf6pMiyc6M7aNtSVc/IIh08V/pIVrZZ/CJBf5nnCyLfGgfVigQjkPnmWsLgOhY4f23cshKvqmaBZ20SixeIbyGUVvNoHmkkGAUeIzmHNePm9w4CMVpDyY4sYo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b58f15ed-3419-424e-86e6-08d7162ec6c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 03:17:25.3067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2911
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6fTh0UzDpqSkxH+w4t5lWBLdDwm7AoMlcl5pV2oVak=;
 b=dW1aWoTrpl9fK2r6wrjqBvA3ZkU2C0I8n1fLwOxzcJdl8Iju65fQTU1ggb0A7MT48qUX2BYAZxevlkieMfPTx18K5w3V4TyuWu7ndXcfNriGH5taqygk23emTWRy4hoWzjl/WvPL3i5qzLd3MAg/gBtFxG3q2BffCqxsAHbriKo=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhbmtzIE1hdHQuIFRoZSBwYXRjaCBpcyByZXZpZXdlZC1ieTogRXZhbiBRdWFuIDxldmFuLnF1
YW5AYW1kLmNvbT4NCg0KUmVnYXJkcywNCkV2YW4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zz4gT24gQmVoYWxmIE9mDQo+IE1hdHQgQ29mZmluDQo+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3Qg
MDEsIDIwMTkgNDoxNSBBTQ0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
Q2M6IE1hdHQgQ29mZmluIDxtY29mZmluMTNAZ21haWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0hd
IGRybS9hbWQvcG93ZXJwbGF5OiBBbGxvdyBjaGFuZ2luZyBvZiBmYW5fY29udHJvbCBpbg0KPiBz
bXVfdjExXzANCj4gDQo+IFtXaHldDQo+IEJlZm9yZSB0aGlzIGNoYW5nZSwgdGhlIGZhbiBjb250
cm9sIHN0YXRlIG9uIHNtdV92MTEgd2FzIG5vdCBhYmxlIHRvIGJlDQo+IGNoYW5nZWQgYmVjYXVz
ZSB0aGUgY2FwYWJpbGl0eSBjaGVjayBmb3IgY2hlY2tpbmcgaWYgdGhlIGZhbiBjb250cm9sIGNh
cGFiaWxpdHkNCj4gZXhpc3RlZCB3YXMgaW52ZXJ0ZWQuDQo+IA0KPiBbSG93XQ0KPiBUaGUgY2Fw
YWJpbGl0eSBjaGVjayBmb3IgZmFuIGNvbnRyb2wgaW4gc211X3YxMV8wX2F1dG9fZmFuX2NvbnRy
b2wgd2FzDQo+IGludmVydGVkLCB0byBjb3JyZWN0bHkgY2hlY2sgZm9yIHRoZSBhYnNlbmNlLCBp
bnN0ZWFkIG9mIHByZXNlbmNlIG9mIGZhbg0KPiBjb250cm9sIGNhcGFiaWxpdGllcy4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IE1hdHQgQ29mZmluIDxtY29mZmluMTNAZ21haWwuY29tPg0KPiAtLS0N
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIHwgMiArLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMNCj4gYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYw0KPiBpbmRleCAwNTg4ZGQ4
Y2QxYmEuLjQzZmNiZGJiYTYzMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvc211X3YxMV8wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvc211X3YxMV8wLmMNCj4gQEAgLTEzNjEsNyArMTM2MSw3IEBAIHNtdV92MTFfMF9hdXRvX2Zh
bl9jb250cm9sKHN0cnVjdCBzbXVfY29udGV4dA0KPiAqc211LCBib29sIGF1dG9fZmFuX2NvbnRy
b2wpICB7DQo+ICAJaW50IHJldCA9IDA7DQo+IA0KPiAtCWlmIChzbXVfZmVhdHVyZV9pc19zdXBw
b3J0ZWQoc211LA0KPiBTTVVfRkVBVFVSRV9GQU5fQ09OVFJPTF9CSVQpKQ0KPiArCWlmICghc211
X2ZlYXR1cmVfaXNfc3VwcG9ydGVkKHNtdSwNCj4gU01VX0ZFQVRVUkVfRkFOX0NPTlRST0xfQklU
KSkNCj4gIAkJcmV0dXJuIDA7DQo+IA0KPiAgCXJldCA9IHNtdV9mZWF0dXJlX3NldF9lbmFibGVk
KHNtdSwNCj4gU01VX0ZFQVRVUkVfRkFOX0NPTlRST0xfQklULCBhdXRvX2Zhbl9jb250cm9sKTsN
Cj4gLS0NCj4gMi4yMi4wDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
