Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A35BE078
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 16:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C7689A32;
	Wed, 25 Sep 2019 14:46:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820055.outbound.protection.outlook.com [40.107.82.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F116B89A32
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 14:46:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlmV8A24NX2wW1q2CU0fkCP9h5bl9njQk1FserBCc04RJa7ogiw5BIwUWExSc51U7e6nEpi8SuCgJCwqbIre65oimtozZlobpdDZlXybHadK3mlM2PheAnEyxPH7SljX7kPWaRt46v7jc8tnezcBwJrqt5KvBGi0S9l/cAZNSRh7ujL+P2Xx/QgMHvtUJ90uaUrWvp17odnuSHO73OfhRIe6oAtaRQJfSb2bP83DP/IgaDduBsVNEG97gsc0WiCahyFGwtUy4x+Hvo+fP6Cq1wEY3oMAYDPR7/JGfUrZMGyDi3+fOyPDYSuXiRPE1hoP9vyZZTaCIeHYH8s9FZz/iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEtP7wtWFTmYaIuTU3D2Ems4IfGyd/sAEe1KycOi8Mw=;
 b=Q23OrEaOKtL4ExMBx1zOQzz5z+GJxFg71OIJ8yjsQ3hYK1JemJKfDU2ipQv94XCMjNNfnVUyOhz4bYstmyArpRAQ5rJITp7GR5M5psGXpqTUgixVft6jN2GlSqgsFTzMq72jmpGkOzyKjsemugtcSavGvh94hRBUcvr13cII2+czWzmzzT/eS3OqCL0KhweLADWDo19p02/Xsw9xupicUGWVDzMRVDrx1xgsyjkukblEEP24CwqvfLeZWq1WgAiAJ1QA+XRFjHQOVelAMYwMfoTZGNpj7xwSjeV5u9I6v/MA/ecnjeuzDFXw4o6NlwBj0HLf7FUiWhoYaj9L+eQgzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3488.namprd12.prod.outlook.com (20.178.242.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 14:46:44 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2305.016; Wed, 25 Sep 2019
 14:46:44 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: fix error handling in amdgpu_bo_list_create
Thread-Topic: [PATCH] drm/amdgpu: fix error handling in amdgpu_bo_list_create
Thread-Index: AQHVbkiNLLaviYMaaEi9i18THMuSSqc8g23g
Date: Wed, 25 Sep 2019 14:46:43 +0000
Message-ID: <MN2PR12MB33096875F5792EC691FF4CCDEC870@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20190918174308.107845-1-christian.koenig@amd.com>
In-Reply-To: <20190918174308.107845-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67fc696f-ca28-46df-3b40-08d741c72f1f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3488; 
x-ms-traffictypediagnostic: MN2PR12MB3488:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3488A395E40CB012DC0AA7FEEC870@MN2PR12MB3488.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:392;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(366004)(13464003)(189003)(199004)(66066001)(8936002)(81156014)(81166006)(66574012)(6436002)(5660300002)(52536014)(86362001)(26005)(6506007)(229853002)(7736002)(186003)(305945005)(2501003)(76176011)(99286004)(8676002)(7696005)(6306002)(55016002)(53546011)(9686003)(102836004)(71200400001)(14444005)(256004)(25786009)(66556008)(6246003)(2906002)(64756008)(66446008)(33656002)(14454004)(316002)(66946007)(76116006)(966005)(110136005)(66476007)(11346002)(6116002)(3846002)(476003)(446003)(74316002)(478600001)(486006)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3488;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GzhDQGUTjVi4jVfDXbbhoNL+ivJE0zwENFBWjvM91CeYWEy9yrYgwRma4CQgODa+RKIhloHn/uOtbsJ+QmK875gGV3ld5oJvVoo8TIOSK1tvz/hnGPqKPf2Ot1ExMOKYkQDYKUZ6oaKsGwkNtYH56nliwgmFiWX0RwTuPZOE9/GCL0Xxk71JGxcuRgegZD6fwMx5J9/y8zKV8hYKg5A7P/8tYZKem8O5plyocsPx8UWCauwAzv94vSpa0vxjuXlNsFvVYP0YwmZ7YvR7zT1bAG34/4kY/bFleBseAOz8fcrKRurzRc461TDXDfWbnGQp2ZxJSuwU8VZzSoykGFiyj/NVXDetpUye1KhAxzm/MGQKqJyQgLmOc3oJ1qFxN6LnOnaEizKjhCYRBlBQFdETXUBq5Zw+ZKJrxMWk+Pmg+qJVRek1LC/MZdDyoRm1QSrQlvXA06anpXcwVriqXUGA1w==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67fc696f-ca28-46df-3b40-08d741c72f1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 14:46:44.0078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KPjMZRAbZTTb2IvMhUV5daFlYlK/y1XVjeLQ3leAQywaPp2ABoGgrLnbEQAIVtCywvQBdv2rhBnf2Bil72Kifg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3488
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEtP7wtWFTmYaIuTU3D2Ems4IfGyd/sAEe1KycOi8Mw=;
 b=nv35LKMykiF1eN5lw7Ck/7kWwXBviMlWWEdvAMIyk0GlF5Tp7lPMNrH3Ek7wJ/rxqF0MY5eYDW+L1B2SQnE/kLtr6eCIZBysVRopJCotp7hmbR84QObuaPsDp15XKe598cd6u1+MIK1VXnf3/cUjGenOoomNZRQcoG6/LghgIlM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gQ2hyaXN0aWFuIEs/
bmlnDQo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMTksIDIwMTkgMTo0MyBBTQ0KPiBUbzog
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1k
Z3B1OiBmaXggZXJyb3IgaGFuZGxpbmcgaW4gYW1kZ3B1X2JvX2xpc3RfY3JlYXRlDQo+IA0KPiBX
ZSBuZWVkIHRvIGRyb3Agbm9ybWFsIGFuZCB1c2VycHRyIEJPcyBzZXBhcmF0ZWx5Lg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
Pg0KDQpBY2tlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4NCg0KPiAtLS0NCj4g
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9ib19saXN0LmMgfCA3ICsrKysrKy0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYm9fbGlzdC5j
DQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2JvX2xpc3QuYw0KPiBpbmRl
eCBkNDk3NDY3YjdmYzYuLjk0OTA4YmYyNjlhNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2JvX2xpc3QuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfYm9fbGlzdC5jDQo+IEBAIC0xMzksNyArMTM5LDEyIEBAIGludCBh
bWRncHVfYm9fbGlzdF9jcmVhdGUoc3RydWN0IGFtZGdwdV9kZXZpY2UNCj4gKmFkZXYsIHN0cnVj
dCBkcm1fZmlsZSAqZmlscCwNCj4gIAlyZXR1cm4gMDsNCj4gDQo+ICBlcnJvcl9mcmVlOg0KPiAt
CXdoaWxlIChpLS0pIHsNCj4gKwlmb3IgKGkgPSAwOyBpIDwgbGFzdF9lbnRyeTsgKytpKSB7DQo+
ICsJCXN0cnVjdCBhbWRncHVfYm8gKmJvID0gdHRtX3RvX2FtZGdwdV9ibyhhcnJheVtpXS50di5i
byk7DQo+ICsNCj4gKwkJYW1kZ3B1X2JvX3VucmVmKCZibyk7DQo+ICsJfQ0KPiArCWZvciAoaSA9
IGZpcnN0X3VzZXJwdHI7IGkgPCBudW1fZW50cmllczsgKytpKSB7DQo+ICAJCXN0cnVjdCBhbWRn
cHVfYm8gKmJvID0gdHRtX3RvX2FtZGdwdV9ibyhhcnJheVtpXS50di5ibyk7DQo+IA0KPiAgCQlh
bWRncHVfYm9fdW5yZWYoJmJvKTsNCj4gLS0NCj4gMi4xNy4xDQo+IA0KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlz
dA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
