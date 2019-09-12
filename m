Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C654FB1320
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 19:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D3B6EDD4;
	Thu, 12 Sep 2019 17:01:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800088.outbound.protection.outlook.com [40.107.80.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68566EDD4
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 17:01:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHPIAy8y0+K7G75AGYNgfNaBxUSlMZ3iz6GR9TtCdF58IO/kHDUNboi4zYqIGjFH8i2rwAx6LNCfhROkbQjIrsxQrMLBk8i2MCJM/2WUuFTf0ibrKAgRRbNKksso/1PZNo1K8i9hVSWHkARX5KVaywDfvARvAQn4L/d+Ln1lUw28YnTbAeXD9e/WyL3x8zNm5c6gcKbi0zhNdxmjRswWZkKw6jLSQHMFVvlAi+V/eB+qHBEEAtfPHMB1gymkY11hk941SkVdvkLenpcZRzevTPNfsQWxRrn9PKmm1upCV34TU96T3yDsrcNVtOvukM/7mu7e/06ybn61waVF5RUK0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XekbcRSvKOxz8au57SQ79bTgm85HzsMyy7h044I5uwg=;
 b=QuxQ0PbwCmqaoYlryGg+MbFLYX/tUxf0bzglWe5PF3EMr/QgwN+R3t2v0eYcX79n5bY5wo3yPOPpfGCy/xp2uylCLv3o15nQkI8ytNo+T1uV5kBle2Iw1Fvrn1QmoBZnUvxd/B0FaHF50hYoyOSQVDe+TsQ7mGBoj/hIkRhHurxp/3rxlBg7Nunm8AfCPoDhHE9nATVrd33GsHN3qm7t3ViZO7gk+LuFdxQaul2iuLSuT8sqhsCePHBgtC+Ixq5LPadkBXw3KPHyct3luxVBwl0ioZ97ltILGAT0uEEwo5iNge7jZ12cktaG8eDpV0TGXNAsli3nag3be/oNg1Y9og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYASPR01MB0033.namprd12.prod.outlook.com (20.178.1.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Thu, 12 Sep 2019 17:01:53 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::3930:ebfd:da9:5636]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::3930:ebfd:da9:5636%3]) with mapi id 15.20.2241.021; Thu, 12 Sep 2019
 17:01:53 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: Create plane rotation property
Thread-Topic: [PATCH] drm/amd/display: Create plane rotation property
Thread-Index: AQHVaYqPDBtE9XCqm0aKgH3pvgq91KcoRHOA
Date: Thu, 12 Sep 2019 17:01:52 +0000
Message-ID: <b781b06d-a52f-0291-b0df-d90b81a66c84@amd.com>
References: <20190912164404.12725-1-pgriffais@valvesoftware.com>
In-Reply-To: <20190912164404.12725-1-pgriffais@valvesoftware.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::28) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82899bf7-6d44-48cb-f3d0-08d737a2e8d9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYASPR01MB0033; 
x-ms-traffictypediagnostic: BYASPR01MB0033:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYASPR01MB0033A4A8468D9FC53A4D618AECB00@BYASPR01MB0033.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(199004)(189003)(54906003)(316002)(229853002)(64756008)(36756003)(31686004)(25786009)(6116002)(2501003)(4326008)(3846002)(76176011)(71190400001)(71200400001)(99286004)(86362001)(478600001)(256004)(110136005)(52116002)(31696002)(66476007)(305945005)(8936002)(7736002)(66946007)(5660300002)(66446008)(14454004)(81166006)(2906002)(66556008)(81156014)(6246003)(6486002)(446003)(53936002)(8676002)(102836004)(6512007)(2616005)(486006)(11346002)(476003)(66066001)(386003)(186003)(6436002)(26005)(53546011)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYASPR01MB0033;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pEAIBdaHaUVDqFbsKtp/XF0h9kX9EG8QAPnLNFJibe5Mwy46Ah5AoAAky6Jljc4uX/Orf+q3cT1xkrRBoMXOA4szcC9EpOZutPtsJlsu4CfiMlf9m+xVfr8DJ8Xle4nnT22tXufEY2SLne/9BZ3w5zRKCAZNT+q/MrqbdjCUWNNhbCfGfenDMzS1sVhBlHpihzWEJpIpVzEMRbtF3Ig1wxB1ccYzhDrTAnDN3riWMFa4nkh0WUKmjG5KAizoyHsVn+xPEPibswZxJnK84epk0jSAQGp5TuJFH9fd3Wet1/Xg0r2iPRFXr1x1U5vNFqbij1v0/iyW+W+QY8YEZj/wJBv0o4aq/VNlBBBkApOgZ1h0j6g2PdbO/mOoudxDxUM6FM/8ntccR7A4Jj8iPg2TP+RwvA7KF2C16CM2E5rsQqM=
Content-ID: <C0CB257BEACA4D42AD3D458EBE500160@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82899bf7-6d44-48cb-f3d0-08d737a2e8d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 17:01:52.8651 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: imY6wcBUEKMEbuEiYN/a9bJiQluChLaDMtphTnhjS4m1Zm50OBCk1/QjGgdh+x2WACaAiTxxLVUk5JydVrpBcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYASPR01MB0033
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XekbcRSvKOxz8au57SQ79bTgm85HzsMyy7h044I5uwg=;
 b=F5XQZK+m6gpfbIdRAngFtww/32bZn1Hoczf7RABd6KfDZOLvKzUcsp2RXJqtkBfYMUxmOYPm2d/OY7G8T6Ej/f6WJjre9iJleRavsgnb3yynDIpIpz/6A1KaiSoNWpgDO0t2zD9bn0H/l9qZHKs3pFXdI/8jpQZrrEoZrYDpRSg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0xMiAxMjo0NCBwLm0uLCBQaWVycmUtTG91cCBBLiBHcmlmZmFpcyB3cm90ZToN
Cj4gSXQncyBvdGhlcndpc2UgcHJvcGVybHkgc3VwcG9ydGVkLCBqdXN0IG5lZWRzIGV4cG9zaW5n
IHRvIHVzZXJzcGFjZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBpZXJyZS1Mb3VwIEEuIEdyaWZm
YWlzIDxwZ3JpZmZhaXNAdmFsdmVzb2Z0d2FyZS5jb20+DQpJIGtub3cgSUdUIGhhcyBzb21lIHRl
c3RzIGZvciBwbGFuZSByb3RhdGlvbiwgZG8geW91IGhhcHBlbiB0byBrbm93IHdoYXQgDQp0ZXN0
cyBwYXNzIG9yIGZhaWwgd2hlbiBleHBvc2luZyB0aGlzPw0KDQpJIHRoaW5rIERDTjEgKFJhdmVu
KSBzaG91bGQgd29yayBhcyBleHBlY3RlZCBidXQgSSdkIGJlIGNvbmNlcm5lZCBhYm91dCANCkRD
RSBvciBEQ04yLiBJIHRoaW5rIHdlIGhhdmUgaGFkIHNvbWUgY3Vyc29yIGJ1Z3MgaW4gdGhlIHBh
c3Qgd2l0aCANCmN1cnNvciByb3RhdGlvbiBidXQgdGhleSBtaWdodCBvbmx5IGJlIGV4cG9zZWQg
d2hlbiB1c2VkIGluIGNvbmp1bmN0aW9uIA0Kd2l0aCBvdmVybGF5IHBsYW5lcy4NCg0KSSdkIGp1
c3QgbGlrZSB0byBtYWtlIHN1cmUgdGhlcmUncyBzdWl0YWJsZSB0ZXN0aW5nIGF0IGxlYXN0IGlm
IHdlJ3JlIA0KZ29pbmcgdG8gZXhwb3NlIHRoaXMgdG8gdXNlcnNwYWNlLg0KDQpOaWNob2xhcyBL
YXpsYXVza2FzDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYyB8IDggKysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmMNCj4gaW5kZXggNDViZTdhMjEzMmJiLi4zNzcyNzYzYzY0NDkgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYw0KPiBAQCAtNDY4MCw2ICs0NjgwLDcgQEAgc3RhdGljIGludCBhbWRncHVfZG1fcGxh
bmVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rpc3BsYXlfbWFuYWdlciAqZG0sDQo+ICAgCXVpbnQzMl90
IGZvcm1hdHNbMzJdOw0KPiAgIAlpbnQgbnVtX2Zvcm1hdHM7DQo+ICAgCWludCByZXMgPSAtRVBF
Uk07DQo+ICsJdW5zaWduZWQgaW50IHN1cHBvcnRlZF9yb3RhdGlvbnM7DQo+ICAgDQo+ICAgCW51
bV9mb3JtYXRzID0gZ2V0X3BsYW5lX2Zvcm1hdHMocGxhbmUsIHBsYW5lX2NhcCwgZm9ybWF0cywN
Cj4gICAJCQkJCUFSUkFZX1NJWkUoZm9ybWF0cykpOw0KPiBAQCAtNDcxMSw2ICs0NzEyLDEzIEBA
IHN0YXRpYyBpbnQgYW1kZ3B1X2RtX3BsYW5lX2luaXQoc3RydWN0IGFtZGdwdV9kaXNwbGF5X21h
bmFnZXIgKmRtLA0KPiAgIAkJCURSTV9DT0xPUl9ZQ0JDUl9CVDcwOSwgRFJNX0NPTE9SX1lDQkNS
X0xJTUlURURfUkFOR0UpOw0KPiAgIAl9DQo+ICAgDQo+ICsJc3VwcG9ydGVkX3JvdGF0aW9ucyA9
DQo+ICsJCURSTV9NT0RFX1JPVEFURV8wIHwgRFJNX01PREVfUk9UQVRFXzkwIHwNCj4gKwkJRFJN
X01PREVfUk9UQVRFXzE4MCB8IERSTV9NT0RFX1JPVEFURV8yNzA7DQo+ICsNCj4gKwlkcm1fcGxh
bmVfY3JlYXRlX3JvdGF0aW9uX3Byb3BlcnR5KHBsYW5lLCBEUk1fTU9ERV9ST1RBVEVfMCwNCj4g
KwkJCQkJICAgc3VwcG9ydGVkX3JvdGF0aW9ucyk7DQo+ICsNCj4gICAJZHJtX3BsYW5lX2hlbHBl
cl9hZGQocGxhbmUsICZkbV9wbGFuZV9oZWxwZXJfZnVuY3MpOw0KPiAgIA0KPiAgIAkvKiBDcmVh
dGUgKHJlc2V0KSB0aGUgcGxhbmUgc3RhdGUgKi8NCj4gDQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
