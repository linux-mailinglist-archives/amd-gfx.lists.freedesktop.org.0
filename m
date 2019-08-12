Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6602A898CC
	for <lists+amd-gfx@lfdr.de>; Mon, 12 Aug 2019 10:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E288E89DC1;
	Mon, 12 Aug 2019 08:36:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810058.outbound.protection.outlook.com [40.107.81.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CB689DC1
 for <amd-gfx@lists.freedesktop.org>; Mon, 12 Aug 2019 08:36:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1g0IhJP3YYl5Y6TqMPKLd06QnBDzmP+MvVMTRB5nNTO7l4gl7xTLbyXKg1xj2hjrc5lazOCkDyBvLnGoh1QsfTmEiCR+/JBCkiiHXqMa8ul8mJIBwpibdmFTIKyxvOvoke7eJB0ceYX31cH813tuybyvEkNtO34AJOjTNAAk/oMpnl5vvm7VeqpK8MrwEBB641CZxepSRqVX+CQwN8/9bPQ7EQm5U3UYZcMfdjrPb6pqL9d33iFLF2HhMxtnV2EfOzw9oA1sy/vRt/5Djuum1h9szEdmgFAJayRdM9O/5sZwIFAHTLPtJIpT/ISnZ5dSNHXn1nt5R9SpHdfe7kMrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+u9WmX/zUmyMZCjM7aGBwUinuhSonbfb0lQaILr5IY=;
 b=OMhm0+pA5wblE/AZXpy4TfHNezDVIz0U3RhQwgHS1QcMUsXKwxXYVqOhdSUOc4SOonWRyEsGFqjr5sdg5v4Le0boQTxsQefxwlDY8KR2W06supcOcnN1IQTM8jsanbvh94heX6xuS/NKZwZ41Garb8NAwb3s1C5tFQemxvVLTmuJ4UWyQyNGPTyiRnYeeluGgAWeGVHGfceim+lIA4/rR5BLHAa1BQkyrSQO9QBpPl+qiDbP9MTXsER/ht5EpIUFCiZkut/VTAmUtjKbkjgQHzHL4OoYrJgj/I50uEXOmf63GtGdrMCwJpSkMR2mDtZCBKkiQa6U9palyr3YV7u81Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB4304.namprd12.prod.outlook.com (10.255.224.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Mon, 12 Aug 2019 08:36:09 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2157.022; Mon, 12 Aug 2019
 08:36:09 +0000
From: Kevin Wang <kevwa@amd.com>
To: "Gui, Jack" <Jack.Gui@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: add arcturus_is_dpm_running
 function for arcturus
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: add arcturus_is_dpm_running
 function for arcturus
Thread-Index: AQHVUOcfn4jDEWsNQ0ef3SVSz6eLbKb3MCQA
Date: Mon, 12 Aug 2019 08:36:09 +0000
Message-ID: <ab4d4eec-8830-198e-3ff9-de97eb18bf11@amd.com>
References: <1565598138-13844-1-git-send-email-Jack.Gui@amd.com>
 <1565598138-13844-2-git-send-email-Jack.Gui@amd.com>
In-Reply-To: <1565598138-13844-2-git-send-email-Jack.Gui@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR04CA0063.apcprd04.prod.outlook.com
 (2603:1096:202:14::31) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 120c3584-e48d-47b6-fe5a-08d71f001fe6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4304; 
x-ms-traffictypediagnostic: MN2PR12MB4304:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB430455CCF07DFCC791056F9BA2D30@MN2PR12MB4304.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(189003)(199004)(11346002)(53546011)(102836004)(229853002)(2616005)(2906002)(110136005)(486006)(305945005)(6506007)(386003)(186003)(26005)(53936002)(446003)(14454004)(99286004)(76176011)(478600001)(66946007)(6436002)(2501003)(52116002)(3846002)(6116002)(6512007)(316002)(6486002)(476003)(31696002)(14444005)(256004)(6246003)(5660300002)(36756003)(71200400001)(8936002)(25786009)(8676002)(31686004)(66066001)(7736002)(66446008)(64756008)(66476007)(81156014)(66556008)(71190400001)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4304;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JfgBL6e6IomHPXlFS7WzAhz3FfL2CgsWETf6XW4NvOpIED+bgFKESkm8cuFt5pTZo2Sua8t2HFyR/6KkgpR4jbhxoDBgxriuRGrVARx9XDdo31IqQJP805wxE6E7hMNpB4OUpdNqZq2aDjmgxBfSSjl/SJrX7spB5ejScaZ6MygrYLjQKZKJGADC2qKqxYhJscxb6KCbWLZJLjdndK8azxU01Qx6QENLjaKdcD1Qy39wfvQlD3PBiA0hrTD++4HpJoP0RL17tM+4z2XjowGetGkUbotyoOJMzUhtiZXYDb+BoasngLYxMhTDV0/lQ/e/ux/rgWpS5TPaotYuzGGgzGbk7Ksl4AJppA8F+CPrG7k5atOC+XpOU6BY/m+7C9T7+Di7TYZiiS/JA4sgq5RpLahvyq8IU7SyGocCImhn2FY=
Content-ID: <046258168C940541B54824FF20EBF7F4@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 120c3584-e48d-47b6-fe5a-08d71f001fe6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 08:36:09.3296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LEt4Ud0b9QaDThRvV49ietmGrPasP3Izfq/iKlvzlwJnmaObhsFwEe2cmrGGMqBJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4304
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+u9WmX/zUmyMZCjM7aGBwUinuhSonbfb0lQaILr5IY=;
 b=d6t8XI0TqR8PmcwypROrT32hFKYAHo8FLs3bR6auVHCdKGy2R0Xzotl404yRM0MS4Z94DNyj0GCQDkQt39i13cqbGptzY2PEF/UJOhBG9ZRVz7mS9xmmJz+U5u/X5dKjsrjM7eFgBUF91rK2ul6C2qT4NRA53kxnY6hAXelZ3hY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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

UmV2aWV3ZWQtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+DQoNCk9uIDgvMTIv
MTkgNDoyMiBQTSwgQ2hlbmdtaW5nIEd1aSB3cm90ZToNCj4gYWRkIGFyY3R1cnVzX2lzX2RwbV9y
dW5uaW5nIGZ1bmN0aW9uDQo+DQo+IFNpZ25lZC1vZmYtYnk6IENoZW5nbWluZyBHdWkgPEphY2su
R3VpQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2Fy
Y3R1cnVzX3BwdC5jIHwgMjEgKysrKysrKysrKysrKysrKysrKysrDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDIxIGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvYXJjdHVydXNfcHB0LmMNCj4gaW5kZXggMDNjZTg3MS4uOTEwN2JlYiAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMNCj4gQEAgLTUxLDYg
KzUxLDE1IEBADQo+ICAgI2RlZmluZSBTTVVfRkVBVFVSRVNfSElHSF9NQVNLICAgICAgIDB4RkZG
RkZGRkYwMDAwMDAwMA0KPiAgICNkZWZpbmUgU01VX0ZFQVRVUkVTX0hJR0hfU0hJRlQgICAgICAz
Mg0KPiAgIA0KPiArI2RlZmluZSBTTUNfRFBNX0ZFQVRVUkUgKCBcDQo+ICsJRkVBVFVSRV9EUE1f
UFJFRkVUQ0hFUl9NQVNLIHwgXA0KPiArCUZFQVRVUkVfRFBNX0dGWENMS19NQVNLIHwgXA0KPiAr
CUZFQVRVUkVfRFBNX1VDTEtfTUFTSyB8IFwNCj4gKwlGRUFUVVJFX0RQTV9TT0NDTEtfTUFTSyB8
IFwNCj4gKwlGRUFUVVJFX0RQTV9NUDBDTEtfTUFTSyB8IFwNCj4gKwlGRUFUVVJFX0RQTV9GQ0xL
X01BU0sgfCBcDQo+ICsJRkVBVFVSRV9EUE1fWEdNSV9NQVNLKQ0KPiArDQo+ICAgLyogcG9zc2li
bGUgZnJlcXVlbmN5IGRyaWZ0ICgxTWh6KSAqLw0KPiAgICNkZWZpbmUgRVBTSUxPTgkJCQkxDQo+
ICAgDQo+IEBAIC0xODczLDYgKzE4ODIsMTcgQEAgc3RhdGljIHZvaWQgYXJjdHVydXNfZHVtcF9w
cHRhYmxlKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQ0KPiAgIA0KPiAgIH0NCj4gICANCj4gK3N0
YXRpYyBib29sIGFyY3R1cnVzX2lzX2RwbV9ydW5uaW5nKHN0cnVjdCBzbXVfY29udGV4dCAqc211
KQ0KPiArew0KPiArCWludCByZXQgPSAwOw0KPiArCXVpbnQzMl90IGZlYXR1cmVfbWFza1syXTsN
Cj4gKwl1bnNpZ25lZCBsb25nIGZlYXR1cmVfZW5hYmxlZDsNCj4gKwlyZXQgPSBzbXVfZmVhdHVy
ZV9nZXRfZW5hYmxlZF9tYXNrKHNtdSwgZmVhdHVyZV9tYXNrLCAyKTsNCj4gKwlmZWF0dXJlX2Vu
YWJsZWQgPSAodW5zaWduZWQgbG9uZykoKHVpbnQ2NF90KWZlYXR1cmVfbWFza1swXSB8DQo+ICsJ
CQkgICAoKHVpbnQ2NF90KWZlYXR1cmVfbWFza1sxXSA8PCAzMikpOw0KPiArCXJldHVybiAhIShm
ZWF0dXJlX2VuYWJsZWQgJiBTTUNfRFBNX0ZFQVRVUkUpOw0KPiArfQ0KPiArDQo+ICAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIGFyY3R1cnVzX3BwdF9mdW5jcyA9IHsNCj4gICAJ
LyogdHJhbnNsYXRlIHNtdSBpbmRleCBpbnRvIGFyY3R1cnVzIHNwZWNpZmljIGluZGV4ICovDQo+
ICAgCS5nZXRfc211X21zZ19pbmRleCA9IGFyY3R1cnVzX2dldF9zbXVfbXNnX2luZGV4LA0KPiBA
QCAtMTkxMCw2ICsxOTMwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIGFy
Y3R1cnVzX3BwdF9mdW5jcyA9IHsNCj4gICAJLyogZGVidWcgKGludGVybmFsIHVzZWQpICovDQo+
ICAgCS5kdW1wX3BwdGFibGUgPSBhcmN0dXJ1c19kdW1wX3BwdGFibGUsDQo+ICAgCS5nZXRfcG93
ZXJfbGltaXQgPSBhcmN0dXJ1c19nZXRfcG93ZXJfbGltaXQsDQo+ICsJLmlzX2RwbV9ydW5uaW5n
ID0gYXJjdHVydXNfaXNfZHBtX3J1bm5pbmcsDQo+ICAgfTsNCj4gICANCj4gICB2b2lkIGFyY3R1
cnVzX3NldF9wcHRfZnVuY3Moc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
