Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69656B0027
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Sep 2019 17:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36FC6EB3F;
	Wed, 11 Sep 2019 15:34:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730079.outbound.protection.outlook.com [40.107.73.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F6F6EB3F
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Sep 2019 15:34:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jj4vkNXk/uu8ID02Z0KsxMLSynxtWxNmM75oWx7HCILa+rGl3E0renD8WvXUP0++QRfTn75LqrF78L1GHVFz1PSotmBWN3dsphAKh+iX5DqpXH6DuL1W7WrPYLP3oasrBCD0XG0URucaHduQWbhVaHcEPE8a/E3lGbsoctH0wUfe3TR3GHHWeiKHlIviyKM1PJaQWvxhgPI/UyG4yZY4QGF1ykLriWWt3ghiFaEGs+wNhKiBFQmRP+OvUw2S4ffcRY4b4WFTQuVznpegqLNf+Fpuspt2+qssk5Rmk1LRd1h7yYrbx3iFLKhBQianEgGz/KYtkAuZ9PxNUmHRgnN9Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZGmiotH4zJZqxVUF4WOFxLr5ONEWPR2TE1HNPQERZI=;
 b=HhA0o24ebcp2oHlSmRe1/n7CHcsMqD5kc/WbfRYXxR8vpyk+z7SBXoAJV0cnfAGqFonjX46FUljqJ7aiC+ayEakj1QlJQgnVaUAWyMrQzFTGRE194N3IimgHwDgGC/uycuQDPYFXERwGJBnl9F5+hVFNuRJhGP6gigvKxG3OpYDaAIRdd6sK50LoEDzo8x/HzOqw7JPfRNNnIlnrHiX+mb77bKyxkkZDBLt8jx8nTPZwbSikFFvZG388kzgqAhoNli8o++zqa6bursyn/LlM/12NXvcmZJ6c5Y8037/k+95QN0xXRIz4AgTInasU+llq3anbDFU0ZsYNq0hdSVSU5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN7PR12MB2593.namprd12.prod.outlook.com (20.176.27.87) by
 BN7PR12MB2691.namprd12.prod.outlook.com (20.176.27.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Wed, 11 Sep 2019 15:34:54 +0000
Received: from BN7PR12MB2593.namprd12.prod.outlook.com
 ([fe80::f45b:35ac:9b2a:4e87]) by BN7PR12MB2593.namprd12.prod.outlook.com
 ([fe80::f45b:35ac:9b2a:4e87%5]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 15:34:54 +0000
From: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 22/25] drm/amd/display: 3.4.51.1
Thread-Topic: [PATCH 22/25] drm/amd/display: 3.4.51.1
Thread-Index: AQHVZ99e+LrOWyj/UkGB1ZR0RyrcXacmnSqA
Date: Wed, 11 Sep 2019 15:34:54 +0000
Message-ID: <cb5f80a6-4665-c5bf-258f-129e5647b5bf@amd.com>
References: <20190910135445.18300-1-sunpeng.li@amd.com>
 <20190910135445.18300-23-sunpeng.li@amd.com>
In-Reply-To: <20190910135445.18300-23-sunpeng.li@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::20) To BN7PR12MB2593.namprd12.prod.outlook.com
 (2603:10b6:408:25::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 249da6e4-887e-4aff-2250-08d736cd97f9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN7PR12MB2691; 
x-ms-traffictypediagnostic: BN7PR12MB2691:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR12MB26919608034DCBF11341690882B10@BN7PR12MB2691.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(199004)(189003)(81156014)(305945005)(81166006)(8676002)(6916009)(71190400001)(71200400001)(31696002)(316002)(8936002)(7736002)(4326008)(53936002)(14444005)(478600001)(36756003)(386003)(6506007)(14454004)(26005)(53546011)(86362001)(76176011)(102836004)(31686004)(6116002)(99286004)(2351001)(2501003)(4744005)(229853002)(476003)(486006)(66446008)(2616005)(66946007)(3846002)(66476007)(66556008)(64756008)(6436002)(186003)(2906002)(6512007)(25786009)(66066001)(52116002)(446003)(11346002)(256004)(5640700003)(6486002)(6246003)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2691;
 H:BN7PR12MB2593.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: S6Ji+SycwdI6yMGb4L3cmYz8xzPbRzlT/3MXq+Vztb9jwESyg3GzoRjH7jXHadEDJ1NCoL9HHZusUag7A1q8VOdE49aOFu0R8X2lFQmRi9QBEbJWf+3ld8v1pGLcUFx7H/8kKP2GAJ037E1/HCB/h8g2dSt7S/vU4WtvL5eI7LzGs8OMm+CYHMK4ovvDFD9laWlZBsaQeDAKcJ74QpjxS2cqRIGHni3iZtoH2wyylzSRq9lZ8C1gMpkiYwWr9o3FSrxiq6GAj+hHRHVeXGa3XlgNTalzktoOSUvvguEkCMPh7qWU8NppEFHUZP6qd4hHDmH/CS/pApg4PxHrAcWfwPRaBJhPNXG0pjod0x45W4mQsFMsvJUgeSXJcBTwvS+yGnK6SnEXwcXmDplObqpQpXx85IVk39J8ByRMn1htNdw=
Content-ID: <B2982040D8891F4092E811916A42E8F8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 249da6e4-887e-4aff-2250-08d736cd97f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 15:34:54.3835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EVx9eMShmuNQAs6fI6iZtBRPh/hAfcXzfDWrDDOsZvvPvj+elvCT65vU/WLOficK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2691
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZGmiotH4zJZqxVUF4WOFxLr5ONEWPR2TE1HNPQERZI=;
 b=ojTjOym8E32yyXtf2yVlLKuJK/zaVgkoPeJJO8eovgtQLT05VHuw7mOkcdqM5A9w13eFqJYx0T09msqjkGtoxfS51hLU55f0ixvI5ZOfqj+gl+JNjVaXM0yGAp+cXpPVov1A/CmhFlXlO51wWexk81cOrPuy2vWu5051psAbUjk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Sunpeng.Li@amd.com; 
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
Cc: "Cyr, Aric" <Aric.Cyr@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TG9va3MgbGlrZSB0aGUgc3ViamVjdCBpcyB3cm9uZyBmb3IgdGhpcyBhbmQgcGF0Y2ggMjA6DQpz
LzMuNC8zLjIvDQoNCldpbGwgbW9kaWZ5IGJlZm9yZSBtZXJnZS4NCg0KTGVvDQoNCk9uIDIwMTkt
MDktMTAgOTo1NCBhLm0uLCBzdW5wZW5nLmxpQGFtZC5jb20gd3JvdGU6DQo+IEZyb206IEFyaWMg
Q3lyIDxhcmljLmN5ckBhbWQuY29tPg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQXJpYyBDeXIgPGFy
aWMuY3lyQGFtZC5jb20+DQo+IEFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4N
Cj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaCB8IDIgKy0NCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgNCj4gaW5kZXggN2MxOWFjNzFiNDI0Li4zZWNjNDI5
ODdiMDUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5o
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oDQo+IEBAIC0zOSw3
ICszOSw3IEBADQo+ICAjaW5jbHVkZSAiaW5jL2h3L2RtY3UuaCINCj4gICNpbmNsdWRlICJkbWwv
ZGlzcGxheV9tb2RlX2xpYi5oIg0KPiAgDQo+IC0jZGVmaW5lIERDX1ZFUiAiMy4yLjUxIg0KPiAr
I2RlZmluZSBEQ19WRVIgIjMuMi41MS4xIg0KPiAgDQo+ICAjZGVmaW5lIE1BWF9TVVJGQUNFUyAz
DQo+ICAjZGVmaW5lIE1BWF9QTEFORVMgNg0KPiANCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
