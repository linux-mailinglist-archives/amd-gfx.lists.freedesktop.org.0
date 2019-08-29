Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B9CA14E0
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 11:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BD96E073;
	Thu, 29 Aug 2019 09:26:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02on0610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe46::610])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2E86E077
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 09:26:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6K2jt3gsjStn2dkj0Y+eJF2v1Ikvrb+xQ1wlVfF7zw31ZkRyOcLVlU7E2gUnyA2K/EN7MuSxqJ5EwqmDl3sNbnPjs6seMt/YP52XCErgBoLYmvr7B0V62hN3A08OrSaCn8u4anz6A/VgwVwbQ0Mz3ttvt36ivji3JINZIUoO62MgpPTsyzwW9g9FTQ7U9+VN9/4UirZw2XM5Vr6SWl/diQIVDQ7VsEIpLjLdyx4HjcJSx8sjsPIVtj5+GGG4OR+B1PnEPuwPBZ8w0Llf6+WTGmrTDwQcMJCBgl2iDRjSQKbHBouw34/AveR7gSoKNEzRulFUnarLzrTpUVo/SoSwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkROb5XvjD2WnXRtRoXVsYlaXCUIEN8ZhjCSpOdmtxo=;
 b=nufm1ypainaVvTFIbVTUBY+/vdibtxdwjZ1HCmQNYkUckQYnUA2lx+muchsu1ftZa8LpzVHcI3BiDRwFSkBxuLsbEIJJ5AEv2Idhq0bqWxRHnngkXa461NQGD1a7rX9+9OM3LHVBvauuIboj+O6BXwLxWS/zqLzhrAha9S3TddVCGaZXT8BMdVNEnXDw63zOTiAOYkEnNuCB9NVZRxygnlJ03PE0vWD4Eh30UxOF7SwEcwbsa70N/5mfThvxMWfOkPnpiC5ugTyY+jsDlx2LPisuR87tun3U4F625UOp1gNTapXSgnjuRk4BIs4Jsor0StdOBLnbJVpPs/fhrm8Cwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3808.namprd12.prod.outlook.com (10.255.237.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Thu, 29 Aug 2019 09:26:25 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 09:26:25 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Li, Dennis" <Dennis.Li@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH libdrm 0/4] amdgpu: new approach for ras inject test
Thread-Topic: [PATCH libdrm 0/4] amdgpu: new approach for ras inject test
Thread-Index: AQHVXkgeCu/2I9MsiUqwV93iw6pfw6cR2bwA
Date: Thu, 29 Aug 2019 09:26:23 +0000
Message-ID: <MN2PR12MB3054C28779C45164475C7F45B0A20@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <20190829085917.20439-1-guchun.chen@amd.com>
In-Reply-To: <20190829085917.20439-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d897b891-c54d-4610-7aca-08d72c62f683
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3808; 
x-ms-traffictypediagnostic: MN2PR12MB3808:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3808BC53CF5C7123CF931D4CB0A20@MN2PR12MB3808.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(13464003)(199004)(189003)(6506007)(53546011)(6246003)(14454004)(5660300002)(486006)(11346002)(316002)(86362001)(476003)(8676002)(81156014)(81166006)(3846002)(305945005)(52536014)(7736002)(4326008)(7696005)(6636002)(6436002)(76176011)(66946007)(71200400001)(71190400001)(76116006)(186003)(53936002)(26005)(55016002)(66476007)(66556008)(64756008)(66446008)(9686003)(102836004)(229853002)(99286004)(25786009)(33656002)(478600001)(8936002)(256004)(446003)(14444005)(2906002)(74316002)(54906003)(66066001)(2501003)(110136005)(6116002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3808;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VTzGr3lvpjhjPyDfl+IW66p108EEYeXzTnJpikaZm8mkp0USa/uL8oYkuvkJ0IX4ifUDoP1IdP6rs2OPNdxsAYxbiTIuub2IRtkEG0ay6fDomF3QTWkOClHsJ7KsNIaM3X3BIranJc6lMspOfYrB5ek9jL+fB9wkt9U2Ply8bkwtBpaDwX8LSH84Wb7QK8sRt98KGPnE4xbcnKjit0VXWVPG9ifIfY+QH8qzqR8GuMyeg2adYUBnnihErvHgJiui/JxDViKbnx3nGRTVTWCTRc/Xkr9AoXergm03JxPVIz6WQCP5Fp9yHGxMqEu0730FdH0T4nM041YFBOQEQe5kFe05MEn5Bi2ZERcnzdcpQ5FE2Pb7pfIeAhJl630Xz2kPPxL0i0cuJgvf9xCj9E9ncRo/1wQnAAdT7vUOcG3bYzs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d897b891-c54d-4610-7aca-08d72c62f683
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 09:26:24.7495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: abIpxFwn/NVezkotP0Ehev3cNcZa77N8TbGsNG3CCU+J5qN0/lBxmqofGVRKzBmd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3808
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkROb5XvjD2WnXRtRoXVsYlaXCUIEN8ZhjCSpOdmtxo=;
 b=1c8boyj9yt8WrKHMyNbq+cLAomgR+BDO3LgICopu2Au9kk59X5fRic6P4G6/lX+QeiZg+6uyFj2hMDkKOODjDhEC3rWTHpf1kLruGJBvgL1PaDCqti/Rk/59qQsuCH6EvUyUSlbieicD8KnN0vKP26zCXiYvBRar8a0KdSWmkMk=
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
Cc: "Li, Candice" <Candice.Li@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIHNlcmllcyBpczoNCg0KUmV2aWV3ZWQtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNv
bT4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHdWNodW4gQ2hlbiA8
Z3VjaHVuLmNoZW5AYW1kLmNvbT4NCj4gU2VudDogMjAxOeW5tDjmnIgyOeaXpSAxNjo1OQ0KPiBU
bzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFpoYW5nLCBIYXdraW5nDQo+IDxIYXdr
aW5nLlpoYW5nQGFtZC5jb20+OyBMaSwgRGVubmlzIDxEZW5uaXMuTGlAYW1kLmNvbT47IEtvZW5p
ZywNCj4gQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBEZXVjaGVyLCBBbGV4
YW5kZXINCj4gPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBaaG91MSwgVGFvIDxUYW8uWmhv
dTFAYW1kLmNvbT4NCj4gQ2M6IExpLCBDYW5kaWNlIDxDYW5kaWNlLkxpQGFtZC5jb20+OyBDaGVu
LCBHdWNodW4NCj4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBsaWJk
cm0gMC80XSBhbWRncHU6IG5ldyBhcHByb2FjaCBmb3IgcmFzIGluamVjdCB0ZXN0DQo+IA0KPiBU
aGVzZSBwYXRjaGVzIGFyZSB0byByZW1vdmUgYWRkaXRpb25hbCBleHRlcm5hbCBsaWItanNvbmMg
ZGVwZW5kZW5jZSwgYW5kDQo+IHRvIHB1dCBhbGwgdGVzdCBjb25maWd1cmF0aW9ucyBpbnRvIEMg
Y29kZS4NCj4gDQo+IEd1Y2h1biBDaGVuICg0KToNCj4gICBhbWRncHU6IHJlbW92ZSBqc29uIHBh
Y2thZ2UgZGVwZW5kZW5jZQ0KPiAgIGFtZGdwdTogZGVsZXRlIHRlc3QgY29uZmlndXJhdGlvbiBm
aWxlDQo+ICAgYW1kZ3B1OiBhZGQgcmFzIGluamVjdCB1bml0IHRlc3QNCj4gICBhbWRncHU6IGFk
ZCByYXMgZmVhdHVyZSBjYXBhYmlsaXR5IGNoZWNrIGluIGluamVjdCB0ZXN0DQo+IA0KPiAgY29u
ZmlndXJlLmFjICAgICAgICAgICAgIHwgIDE4IC0tLQ0KPiAgZGF0YS9hbWRncHVfcmFzLmpzb24g
ICAgIHwgMjY3IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIG1lc29uLmJ1
aWxkICAgICAgICAgICAgICB8ICAgMSAtDQo+ICB0ZXN0cy9hbWRncHUvTWFrZWZpbGUuYW0gfCAg
IDUgKy0NCj4gIHRlc3RzL2FtZGdwdS9tZXNvbi5idWlsZCB8ICAxNiArLQ0KPiAgdGVzdHMvYW1k
Z3B1L3Jhc190ZXN0cy5jIHwgMzA1ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KPiAgNiBmaWxlcyBjaGFuZ2VkLCAxMTYgaW5zZXJ0aW9ucygrKSwgNDk2IGRlbGV0aW9u
cygtKSAgZGVsZXRlIG1vZGUgMTAwNjQ0DQo+IGRhdGEvYW1kZ3B1X3Jhcy5qc29uDQo+IA0KPiAt
LQ0KPiAyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
