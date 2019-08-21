Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BA397B6E
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 15:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFDB6E3C9;
	Wed, 21 Aug 2019 13:55:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680052.outbound.protection.outlook.com [40.107.68.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD4E6E3C9
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 13:55:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MlsVzpF3JFiDD4CGQjw0vCBf+ajP5ndxkGyX7RmClIX2+MIeP28y0Eq8rv5k1cb4AjIffnt8xagdXSv7n2CiJpfOvmJcvSM1kGXHJw6IPt5dZpdXEz26tfaWtN4b8ChlxVvM4+kzn1AGrZxgQ9hRGqelcX7YSFBXdotxQzT/+bZvsf5wymcO4ADhicY/VCjDuExWtjh7/HdO67aNla7KCiFZj2g8iKJlpeFvbmBDalWpRlnGsMxo50MMM1pS2QKxKWdNY31eUGnoM1yCIPsyqXQtdg4dvD/tnyPCeL0hlyuZXeX2KeQFw9BAujyYl125POg6c2nDuF6uq3OWPQZ/fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ykCb+VsA1C6mO5xIKcHd92fLz6rHQ/GkMj5tlRIJwM=;
 b=aKIgWdmeHOx+/FS7ui4t+CLwS8Eey5EzhL3aD2/A6UE1qjhmO+Z/5ZPYBr6KVrzW80DDvZawDmfDlrmsi/+wuhZFLHbhdU1Yef92AjVJxNACHZBFTIaGUicGCFyxruKAuoVXiTlq3R87D9oIjC0E95VC8CZ3XfWLDsWIdBVHx5ATszqMINuDlTf+KDDZ09qpzEnhJ8ILWXydOj0CXx/hApQ36cbdX+x8iv78IE874rlzOTyDUqUF2zliu2DB1ip36se76H7t2YGmFA9lUb1nxmSu47Qo+A4wBONDqlu2TpT2nxABgkLYREEyr9aEdcvg6o1R/aTW9W42Hdi7EYhAAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB2932.namprd12.prod.outlook.com (20.178.223.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Wed, 21 Aug 2019 13:55:23 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2178.020; Wed, 21 Aug 2019
 13:55:23 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdgpu/sdma5: fix number of sdma5 trap irq types for
 navi1x
Thread-Topic: [PATCH] drm/amdgpu/sdma5: fix number of sdma5 trap irq types for
 navi1x
Thread-Index: AQHVWCOoLidr91jxG0O5rhrubHo1MacFmOOAgAAG/Vw=
Date: Wed, 21 Aug 2019 13:55:23 +0000
Message-ID: <880E9293-95FE-4609-A128-FEC8AB51964D@amd.com>
References: <20190821132312.917-1-xiaojie.yuan@amd.com>,
 <CADnq5_PgU-L3CmCC6m-R3Tb6EG7-YUB6yS5Miy2_oqW8OngyZA@mail.gmail.com>
In-Reply-To: <CADnq5_PgU-L3CmCC6m-R3Tb6EG7-YUB6yS5Miy2_oqW8OngyZA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [112.64.61.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 574ff52b-495e-4a50-18ba-08d7263f36c0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB2932; 
x-ms-traffictypediagnostic: BN8PR12MB2932:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB293257D370D925B01E52B31F89AA0@BN8PR12MB2932.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(199004)(189003)(14454004)(36756003)(4326008)(486006)(11346002)(446003)(25786009)(305945005)(7736002)(66556008)(1411001)(33656002)(476003)(2616005)(53936002)(6506007)(53546011)(54906003)(316002)(966005)(6436002)(2906002)(6246003)(26005)(3846002)(6116002)(102836004)(8676002)(478600001)(66946007)(66476007)(8936002)(186003)(81166006)(66446008)(64756008)(81156014)(76116006)(99286004)(91956017)(6486002)(6512007)(229853002)(86362001)(71200400001)(71190400001)(76176011)(66066001)(256004)(14444005)(6306002)(6916009)(5660300002)(32563001)(357404004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2932;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kdspFbj+992r2T96QoMdVi5+SE/6ichwMDdIggRPtR9aQsDK0h4y4xUXJl/zV2eSdKHsXG+9mhSPvYtmpeQfShgVT9WnJd2USoOzt/PLNzcloGTti+4zxZVmLQ7jnHHaIZj2lQAZj8dZAZ1ZRy6mamkFeVPa4/LmrjyCVuu7wH2EYc/ghL21NgKWMC1a5nnLrX85839u9RDaU7fLzzdsyLavjWHmZ7PugnqxxLqMAfg75lLws2VdxjI0Pyy40TmiL0ibNMj4/XtXRThQbARLglNHuMSG2iDXyRvRMUqxcvIoxNB3mKMs/lC9EAYFfgp4On8Ae0xH/4Jt3C58xnKANvIMf18pwwLMbnLG+AZwzRApgxQ7wDq2HmFvpS4oDzdwVixlv8EniuXbsH8BRoCBB3IvCQYVyU7GbkUff7rgewc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 574ff52b-495e-4a50-18ba-08d7263f36c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 13:55:23.8109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bWfB0N7Rf1HZNDgjQF5LpNGxkMDYcmKRk5rQSHOkWa+Gzi2xOkFihdugfuShyY1C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2932
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ykCb+VsA1C6mO5xIKcHd92fLz6rHQ/GkMj5tlRIJwM=;
 b=vcvQS6NlJQqbc1rwT3v1tO522ouq+0mBushoBLY+15nOY5kAstDOQn/V6P09yeSKDZdzhqgXtcV8YqcOmIH9tGSG78SBXs6Wm5KcVDd6eY+lDPwGYJHOWJsqFGtTSCXBUwYMxvjBv3R7Hxk1nCmjEpKvtZiQc3jbokCvT5GRx/E=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhbmtzIEFsZXguIEkndmUgc2VudCBvdXQgcGF0Y2ggdjIuCgpCUiwKWGlhb2ppZQoKPiBPbiBB
dWcgMjEsIDIwMTksIGF0IDk6MzAgUE0sIEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwu
Y29tPiB3cm90ZToKPiAKPj4gT24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgOToyMyBBTSBZdWFuLCBY
aWFvamllIDxYaWFvamllLll1YW5AYW1kLmNvbT4gd3JvdGU6Cj4+IAo+PiBuYXZpMXggaGFzIDIg
c2RtYSBlbmdpbmVzIGJ1dCBjb21taXQKPj4gImU3YjU4ZDAzYjY3OCBkcm0vYW1kZ3B1OiByZW9y
Z2FuaXplIHNkbWEgdjQgY29kZSB0byBzdXBwb3J0IG1vcmUgaW5zdGFuY2VzIgo+PiBjaGFuZ2Vz
IHRoZSBtYXggbnVtYmVyIG9mIHNkbWEgaXJxIHR5cGVzIChBTURHUFVfU0RNQV9JUlFfTEFTVCkg
ZnJvbSAyIHRvIDgKPj4gd2hpY2ggY2F1c2VzIGFtZGdwdV9pcnFfZ3B1X3Jlc2V0X3Jlc3VtZV9o
ZWxwZXIoKSB0byByZWNvdmVyIGlycSBvZiBzZG1hCj4+IGVuZ2luZXMgd2l0aCBmb2xsb3dpbmcg
bG9naWM6Cj4+IAo+PiAoZW5hYmxlIGlycSBmb3Igc2RtYTApICogMSB0aW1lCj4+IChlbmFibGUg
aXJxIGZvciBzZG1hMSkgKiAxIHRpbWUKPj4gKGRpc2FibGUgaXJxIGZvciBzZG1hMSkgKiA2IHRp
bWVzCj4+IAo+PiBhcyBhIHJlc3VsdCwgYWZ0ZXIgZ3B1IHJlc2V0LCBpbnRlcnJ1cHQgZm9yIHNk
bWExIGlzIGxvc3QuCj4+IAo+PiBmb3IgYXNpY3Mgd2l0aCBtb3JlIHNkbWE1IGVuZ2luZXMsIHdl
IG5lZWQgdG8gc2V0ICdudW1fdHlwZXMnIGRlcGVuZGluZwo+PiBvbiBhc2ljIHR5cGUganVzdCBs
aWtlIHdoYXQgc2RtYV92NF8wX3NldF9pcnFfZnVuY3MoKSBkb2VzLgo+PiAKPj4gU2lnbmVkLW9m
Zi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KPj4gLS0tCj4+IGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jIHwgMiArLQo+PiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NkbWFfdjVfMC5jCj4+IGluZGV4IDQxOTMyZDhiODhjMy4uMzJiY2UzZWI1ZmMyIDEw
MDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYwo+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYwo+PiBAQCAtMTYyNSw3
ICsxNjI1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfaXJxX3NyY19mdW5jcyBzZG1h
X3Y1XzBfaWxsZWdhbF9pbnN0X2lycV9mdW5jcyA9IHsKPj4gCj4+IHN0YXRpYyB2b2lkIHNkbWFf
djVfMF9zZXRfaXJxX2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+PiB7Cj4+IC0g
ICAgICAgYWRldi0+c2RtYS50cmFwX2lycS5udW1fdHlwZXMgPSBBTURHUFVfU0RNQV9JUlFfTEFT
VDsKPj4gKyAgICAgICBhZGV2LT5zZG1hLnRyYXBfaXJxLm51bV90eXBlcyA9IEFNREdQVV9TRE1B
X0lSUV9JTlNUQU5DRTI7Cj4gCj4gSXQgd291bGQgYmUgbW9yZSBmdXR1cmUgcHJvb2YgdG8gc2V0
IHRoZSBudW1fdHlwZXMgYmFzZWQgb24gdGhlIG51bSBpbnN0YW5jZXMuCj4gCj4gQWxleAo+IAo+
PiAgICAgICAgYWRldi0+c2RtYS50cmFwX2lycS5mdW5jcyA9ICZzZG1hX3Y1XzBfdHJhcF9pcnFf
ZnVuY3M7Cj4+ICAgICAgICBhZGV2LT5zZG1hLmlsbGVnYWxfaW5zdF9pcnEuZnVuY3MgPSAmc2Rt
YV92NV8wX2lsbGVnYWxfaW5zdF9pcnFfZnVuY3M7Cj4+IH0KPj4gLS0KPj4gMi4yMC4xCj4+IAo+
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBhbWQt
Z2Z4IG1haWxpbmcgbGlzdAo+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
