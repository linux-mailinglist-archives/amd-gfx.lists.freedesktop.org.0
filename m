Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D255AAD4E2
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 10:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69332899E9;
	Mon,  9 Sep 2019 08:31:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690063.outbound.protection.outlook.com [40.107.69.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82A1899E9
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Sep 2019 08:31:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fp+qTgEivwx85PZiK1F9quCh6Widdt5fvgVPoCi1J4f1ti70Ljng42Vp9b3Xdq6w6d+wIhIk+veQUKCtfQ7mNKUkU6z9gerNzn10FJluOvwIB6eYBR1w2/s7Fq3WeQWC3I5U7+JEg1+dEVT9w59yp/5DsT8MGmDPDfFaI2NyeUO9tBSkcQJXRWoimRB/s4fU19VHQznCAoNFMG4NN3oH6R/NhfNCt/BwhJRad2rKVdvwNl6NxrD6812Gq7jylRa5SiYMP0fbWsC+Q6f8crAYLyX+2Fs0LmH87te8HozeNDG1kfNIpFz4QXwTwCV3edtCuzzxg4lK3tZqlYVnWnn+7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1aRr/6ndUTlGO7qfHXIW1JuokZ718OzG1AAmWv9kh30=;
 b=gBS2389mP8j7ucfThGGNeYjRUCmrFEonDmPTTKUvLVMrehilhbBfpXXEXErxfNbL6unuLFIxlAWDZBbQS31Q6GKVcLo0I2C69C5J0CK2AGpg5Aj2z0L3CFwtzguvBIHJuZ6wxYWH7uz7/LX7JqUGgJRYcEv02GAn82eQNfMJtPipFdtSjvO4rQ6vMnD2cpims7niVvlz7aDZscYiPSwlngXOY/L5XQjA0mlxW1mc8VC163GSecaTJBM/awQJEVBn4bxrVymWNVfrq9b5OZOsrMb3YSPGw5FWfJbVmJLa3Lv4QXWgfw8gckAJ4rEnq3jgRoxY/YrvPW7um7PCdTnOqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3534.namprd12.prod.outlook.com (20.179.84.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Mon, 9 Sep 2019 08:31:04 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed%6]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 08:31:04 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: Add the interface for geting dpm
 current power state
Thread-Topic: [PATCH] drm/amd/powerplay: Add the interface for geting dpm
 current power state
Thread-Index: AQHVZs6L8d1I3BsIPU+IKGq7TQkV7acjBBbg
Date: Mon, 9 Sep 2019 08:31:04 +0000
Message-ID: <MN2PR12MB3344C78FF82CFB5166571091E4B70@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1568006521-7471-1-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1568006521-7471-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35ab8445-8833-43b4-f6a0-08d735000dc9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3534; 
x-ms-traffictypediagnostic: MN2PR12MB3534:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3534CD3FF55C3259C071AE2CE4B70@MN2PR12MB3534.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(199004)(189003)(13464003)(66446008)(66066001)(99286004)(11346002)(4326008)(25786009)(86362001)(6436002)(5660300002)(186003)(305945005)(7736002)(52536014)(446003)(14444005)(76116006)(74316002)(55016002)(229853002)(14454004)(8676002)(33656002)(7696005)(54906003)(26005)(76176011)(110136005)(8936002)(71190400001)(81156014)(81166006)(256004)(6246003)(2906002)(9686003)(53546011)(478600001)(316002)(102836004)(486006)(6506007)(71200400001)(476003)(64756008)(66556008)(66476007)(2501003)(3846002)(6116002)(66946007)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3534;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: u0b2QwYl3sBJdUztn1k7TB3AuVMVq3AC9kNOv3TsXG4FpbHDQd3vTEYoJgBQ4PPzJNjN7XLjDMhPQsi5OlHBFJmeuQjxPr+H8WAAVax58ns3kPFQgm5ZTkBpRO06m5S+WbLyiny4GgHCOwRFsPXbPVwEiXxxHyQgS+YZS4nxk5ezGFfGy0kkdmfO6PFhpys0Qhlaid3uvHZt1t9G/ZrsXwre3D2CbKtNsHng6mfYiyERWIW1R+0TWbfSAV9WQ1+smde7o6tNn6JuHzNKZ+AB4cEHw/wEft6ZfeSn7phdel4xB3TUYJpR3LsEfAlu8jaGAekAGLDKNRV/SrYKPbyT6YCZCu/mlOKQSBlcrM4UcB9pMdcHqWSp2SDIKx6UGboUkBliQ7jyrUgemQ/XWIf7ft4RCmswr0xGCJCD/PRUqqY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ab8445-8833-43b4-f6a0-08d735000dc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 08:31:04.3136 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bau8dLWMVfR+f0A83BvpG/MtS/6BH2NlDq30rv/hGM9XkjAAIo6cvIVWBmVuMbnP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3534
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1aRr/6ndUTlGO7qfHXIW1JuokZ718OzG1AAmWv9kh30=;
 b=Rl93c89/7p8zAEWivBfw3sn4jsZUcWxpvGul3ig6iQM88Ewsxm4oYVoELaMwp5ZPcV2vWVBPHTK3nqctk7KSfTVunAw7Mk70BD7dS28SfCJA3q1LinEr9F5WKz2IRLhGXTUjgxk/M7ytjWnTDkJUdlasnoEHZgtHzDNKn8uPc0k=
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Liu, Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGlhbmcsIFByaWtlIDxQcmlrZS5MaWFuZ0BhbWQu
Y29tPg0KPiBTZW50OiAyMDE55bm0OeaciDnml6UgMTM6MjINCj4gVG86IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBRdWFuLCBFdmFuIDxFdmFuLlF1YW5AYW1kLmNvbT47IEZl
bmcsIEtlbm5ldGgNCj4gPEtlbm5ldGguRmVuZ0BhbWQuY29tPjsgSHVhbmcsIFJheSA8UmF5Lkh1
YW5nQGFtZC5jb20+OyBMaXUsIEFhcm9uDQo+IDxBYXJvbi5MaXVAYW1kLmNvbT47IExpYW5nLCBQ
cmlrZSA8UHJpa2UuTGlhbmdAYW1kLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1kL3Bv
d2VycGxheTogQWRkIHRoZSBpbnRlcmZhY2UgZm9yIGdldGluZyBkcG0NCj4gY3VycmVudCBwb3dl
ciBzdGF0ZQ0KPiANCj4gaW1wbGVtZW50IHRoZSBzeXNmcyBwb3dlcl9kcG1fc3RhdGUNCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IFByaWtlIExpYW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPg0KPiAtLS0N
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYyB8IDM0DQo+ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDM0IGluc2Vy
dGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9yZW5vaXJfcHB0LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJf
cHB0LmMNCj4gaW5kZXggYTVjZjg0Ni4uMmMyMmJhNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYw0KPiBAQCAtMjQ2LDYgKzI0NiwzOCBAQCBzdGF0
aWMgaW50IHJlbm9pcl9wcmludF9jbGtfbGV2ZWxzKHN0cnVjdCBzbXVfY29udGV4dA0KPiAqc211
LA0KPiAgCXJldHVybiBzaXplOw0KPiAgfQ0KPiANCj4gK3N0YXRpYyBlbnVtIGFtZF9wbV9zdGF0
ZV90eXBlIHJlbm9pcl9nZXRfY3VycmVudF9wb3dlcl9zdGF0ZShzdHJ1Y3QNCj4gK3NtdV9jb250
ZXh0ICpzbXUpIHsNCj4gKwllbnVtIGFtZF9wbV9zdGF0ZV90eXBlIHBtX3R5cGU7DQo+ICsJc3Ry
dWN0IHNtdV9kcG1fY29udGV4dCAqc211X2RwbV9jdHggPSAmKHNtdS0+c211X2RwbSk7DQo+ICsN
Cj4gKwlpZiAoIXNtdV9kcG1fY3R4LT5kcG1fY29udGV4dCB8fA0KPiArCSAgICAhc211X2RwbV9j
dHgtPmRwbV9jdXJyZW50X3Bvd2VyX3N0YXRlKQ0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKw0K
PiArCW11dGV4X2xvY2soJihzbXUtPm11dGV4KSk7DQo+ICsJc3dpdGNoIChzbXVfZHBtX2N0eC0+
ZHBtX2N1cnJlbnRfcG93ZXJfc3RhdGUtDQo+ID5jbGFzc2lmaWNhdGlvbi51aV9sYWJlbCkgew0K
PiArCWNhc2UgU01VX1NUQVRFX1VJX0xBQkVMX0JBVFRFUlk6DQo+ICsJCXBtX3R5cGUgPSBQT1dF
Ul9TVEFURV9UWVBFX0JBVFRFUlk7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgU01VX1NUQVRFX1VJ
X0xBQkVMX0JBTExBTkNFRDoNCj4gKwkJcG1fdHlwZSA9IFBPV0VSX1NUQVRFX1RZUEVfQkFMQU5D
RUQ7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgU01VX1NUQVRFX1VJX0xBQkVMX1BFUkZPUk1BTkNF
Og0KPiArCQlwbV90eXBlID0gUE9XRVJfU1RBVEVfVFlQRV9QRVJGT1JNQU5DRTsNCj4gKwkJYnJl
YWs7DQo+ICsJZGVmYXVsdDoNCj4gKwkJaWYgKHNtdV9kcG1fY3R4LT5kcG1fY3VycmVudF9wb3dl
cl9zdGF0ZS0NCj4gPmNsYXNzaWZpY2F0aW9uLmZsYWdzICYgU01VX1NUQVRFX0NMQVNTSUZJQ0FU
SU9OX0ZMQUdfQk9PVCkNCj4gKwkJCXBtX3R5cGUgPSBQT1dFUl9TVEFURV9UWVBFX0lOVEVSTkFM
X0JPT1Q7DQo+ICsJCWVsc2UNCj4gKwkJCXBtX3R5cGUgPSBQT1dFUl9TVEFURV9UWVBFX0RFRkFV
TFQ7DQo+ICsJCWJyZWFrOw0KPiArCX0NCj4gKwltdXRleF91bmxvY2soJihzbXUtPm11dGV4KSk7
DQo+ICsNCj4gKwlyZXR1cm4gcG1fdHlwZTsNCj4gK30NCj4gKw0KPiAgc3RhdGljIGNvbnN0IHN0
cnVjdCBwcHRhYmxlX2Z1bmNzIHJlbm9pcl9wcHRfZnVuY3MgPSB7DQo+ICAJLmdldF9zbXVfbXNn
X2luZGV4ID0gcmVub2lyX2dldF9zbXVfbXNnX2luZGV4LA0KPiAgCS5nZXRfc211X3RhYmxlX2lu
ZGV4ID0gcmVub2lyX2dldF9zbXVfdGFibGVfaW5kZXgsIEBAIC0yNTMsNg0KPiArMjg1LDggQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIHJlbm9pcl9wcHRfZnVuY3MgPSB7DQo+
ICAJLnNldF9wb3dlcl9zdGF0ZSA9IE5VTEwsDQo+ICAJLmdldF9kcG1fdWNsa19saW1pdGVkID0g
cmVub2lyX2dldF9kcG1fdWNsa19saW1pdGVkLA0KPiAgCS5wcmludF9jbGtfbGV2ZWxzID0gcmVu
b2lyX3ByaW50X2Nsa19sZXZlbHMsDQo+ICsJLmdldF9jdXJyZW50X3Bvd2VyX3N0YXRlID0gcmVu
b2lyX2dldF9jdXJyZW50X3Bvd2VyX3N0YXRlLA0KPiArDQo+ICB9Ow0KPiANCj4gIHZvaWQgcmVu
b2lyX3NldF9wcHRfZnVuY3Moc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpDQo+IC0tDQo+IDIuNy40
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
