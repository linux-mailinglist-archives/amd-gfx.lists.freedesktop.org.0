Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAAD899E3
	for <lists+amd-gfx@lfdr.de>; Mon, 12 Aug 2019 11:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F9D897D0;
	Mon, 12 Aug 2019 09:34:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780057.outbound.protection.outlook.com [40.107.78.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3142E897D0
 for <amd-gfx@lists.freedesktop.org>; Mon, 12 Aug 2019 09:34:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agRuJwFshTInN18t3Sw9TbUDHlyCRXxjQrqSjrIi9G1hPIubbByPTKJp4a4gW7bg10xNiC8EnOLIdvzOrrdORNRFMU046s36ee7woD047UYd9E2oq6mTdn/SXeNPzaFLLG2UARS1uPKkddNNpONiLdLjDBZtqVstIl+xpZ3bHxi33ggUFNrn3LtJTfX+kfx6JlnsEGsH332o1AxWQcGjyRgfTL58u3BSxZdiVl9iXjmvt2rDtTlngKuD6PshqHxybLH5ZJ+WaFYuD6rkHXGWqd+9OyNi+JzB3eW3V5L5CeMe67kG2H0TR0iGlQfs6VMPXP2FX0A2NY6XwebR2+VDtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1A0Nt1ROjbeh410ihoLYYcywhaVWhH9AD3Cv+JpkS3Y=;
 b=jv24H11E7otLxN9ckRQSYltzmwgKr6ZfJd3hGkPAIsZibYnEvcmBHPEc4+soLGYtYc2nnNvGx5ztgw+E2ALk69DAS/j/B7whoX4dFolcb0VRebe9nqQ+fJ2mQGaCvte2ghtlS8lZ2OMeQ6Em8IK288nweEY7pkNVJ9JQUo+Px1e9iefY8OoOKbpIAHgH5YIY15V6x7JJSS2nweBvZG105VLcvDx8JWc6Eu42OWLzJ8FE2zrK4Hhc616z5As6/Ja9xWz4LlPCrVMdUMOCO6SOtlsdO8ZX8UbRmhWikJiycogb2QuSxrgOtJpEzsiVeC2LedLor1xxBFHAdHIGWpr1bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3853.namprd12.prod.outlook.com (10.255.237.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Mon, 12 Aug 2019 09:34:43 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077%6]) with mapi id 15.20.2157.011; Mon, 12 Aug 2019
 09:34:43 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Gui, Jack" <Jack.Gui@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/amd/powerplay: remove redundancy debug log about
 smu unsupported features
Thread-Topic: [PATCH 1/2] drm/amd/powerplay: remove redundancy debug log about
 smu unsupported features
Thread-Index: AQHVUOcd5KEO58laRUqO4kuN4Lkbqab3QHRQ
Date: Mon, 12 Aug 2019 09:34:43 +0000
Message-ID: <MN2PR12MB3344FC304CAD74F875915B82E4D30@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1565598138-13844-1-git-send-email-Jack.Gui@amd.com>
In-Reply-To: <1565598138-13844-1-git-send-email-Jack.Gui@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f046bcf3-2432-4d00-5596-08d71f084e9b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3853; 
x-ms-traffictypediagnostic: MN2PR12MB3853:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3853122DAEAFDB26E376DFBEE4D30@MN2PR12MB3853.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:346;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(189003)(199004)(13464003)(7696005)(99286004)(7736002)(66066001)(81166006)(26005)(76176011)(229853002)(53546011)(6506007)(8936002)(102836004)(81156014)(6436002)(2906002)(9686003)(6306002)(476003)(305945005)(486006)(446003)(11346002)(55016002)(71190400001)(71200400001)(4326008)(53936002)(14444005)(2501003)(25786009)(6246003)(86362001)(256004)(52536014)(76116006)(66446008)(64756008)(66556008)(66476007)(66946007)(966005)(14454004)(478600001)(33656002)(316002)(3846002)(74316002)(6116002)(8676002)(186003)(110136005)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3853;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nZYMV4f40vKFrIxcgtNnxCzdX9UddJpmFLiMMr7NGtOAM3xNZKa/t4FgPQMrEJaSkkXVGQBo6/7eo/Ej2HOCeqyF/3eX+OzIIClvDPslAfOuLG2wbmcvbCddrgctxEStT+njFY8jWnHOQFrBjtDFilvWfxW6Rx/RFKniOgNvhdiH/uRWYJmho5J4JJHZXAmTDkldYs6mM89R8IPAu0QGzEp7gBFjO7PIsgj4uvLO3Y3WjNIXm/KgNb7K9MPVInjkbtCDb3YVanTk0C0R0Vmt8uofBYreE8e/gGSxH9xmmrVPKfD+NgUMdmsaZnR4113tCfTXTf42/6hJUyexa87HepuRxSIItUx4x+G6LrpFbO9eNSEx/qmzpmuXDIahK6pJkE8sKQXxgimmw5I4apB4+Oo35TKZ85aMQ4+khkf1ptw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f046bcf3-2432-4d00-5596-08d71f084e9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 09:34:43.4317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KhajHyWFZNzotPhRrOYPILOqLXKEKwgoE/utvcGuyd/M4amftKN22ttFVrQyr6b2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3853
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1A0Nt1ROjbeh410ihoLYYcywhaVWhH9AD3Cv+JpkS3Y=;
 b=jAiIea37hsWMP+n1qsU9VZc1JnWgO6OQe8s3tAWoPgGPsR2MhgsaNCt5eklw6CJIC8oBti+98fvxWCoLl9LupQOxKLNHdNVFwBrzVwvEN28aF95AEU686kcbowu33do/cpjnz0o0O42yFmFn2Z5uTqA9m5xvhIdqbbWl283yh1g=
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
Cc: "Gui, Jack" <Jack.Gui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IENoZW5nbWluZyBHdWkNCj4gU2VudDog
TW9uZGF5LCBBdWd1c3QgMTIsIDIwMTkgNDoyMiBQTQ0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gQ2M6IEd1aSwgSmFjayA8SmFjay5HdWlAYW1kLmNvbT4NCj4gU3ViamVj
dDogW1BBVENIIDEvMl0gZHJtL2FtZC9wb3dlcnBsYXk6IHJlbW92ZSByZWR1bmRhbmN5IGRlYnVn
IGxvZw0KPiBhYm91dCBzbXUgdW5zdXBwb3J0ZWQgZmVhdHVyZXMNCj4gDQo+IHJlbW92ZSByZWR1
bmRhbmN5IGRlYnVnIGxvZyBhYm91dCBzbXUgdW5zdXBwb3J0ZWQgZmVhdHVyZXMNCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IENoZW5nbWluZyBHdWkgPEphY2suR3VpQGFtZC5jb20+DQo+IC0tLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMgfCAxIC0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYw0KPiBpbmRleCBlNmZjYmRmLi4wM2NlODcxIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYw0K
PiBAQCAtMjE1LDcgKzIxNSw2IEBAIHN0YXRpYyBpbnQgYXJjdHVydXNfZ2V0X3NtdV9mZWF0dXJl
X2luZGV4KHN0cnVjdA0KPiBzbXVfY29udGV4dCAqc21jLCB1aW50MzJfdCBpbmRlDQo+IA0KPiAg
CW1hcHBpbmcgPSBhcmN0dXJ1c19mZWF0dXJlX21hc2tfbWFwW2luZGV4XTsNCj4gIAlpZiAoISht
YXBwaW5nLnZhbGlkX21hcHBpbmcpKSB7DQo+IC0JCXByX3dhcm4oIlVuc3VwcG9ydGVkIFNNVSBm
ZWF0dXJlOiAlZFxuIiwgaW5kZXgpOw0KPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gIAl9DQo+IA0K
PiAtLQ0KPiAyLjcuNA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
