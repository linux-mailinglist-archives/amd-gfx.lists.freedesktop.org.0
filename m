Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1691FA9270
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 21:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E68895E1;
	Wed,  4 Sep 2019 19:42:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700080.outbound.protection.outlook.com [40.107.70.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DAE0895E1
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 19:42:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+Q6e8PLdUxW5p21alNXp7oeqkUZ055VioxCPK88DWkjAMLQZ7pxUTD7HZLraSALhB69FomSLDem/Am3lDJsFzku4pWAFsW7dRWx5wSUpAHRr80itkAVH4cYS+umvBaCASHiZ+yzyriQLX3ZioEClJa+OOVoawHBgpu+KcXiVGO3kjZbOYbrrP89rfjVPuYdw9PdkY2M7eOUipC3Wlhu2lIpSMFoEYUmPG7LcGlgSt40WEQyPMVt+FyUh56amaGAwJMORHQtw7kCVUOOQUvbsA7yrvK9+v8vCu/nSh9FYHiM2p83VBZ2+k4mdlV53AwkkIkmjXZlrCgyrhr1JFWYSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYlVe5vVaIFqfY0aKcDQy92p6ctPtVRUcauMKIYUlvA=;
 b=nYzjIANthdHmEVTEPp+aTniLXkCI6c+fTZu5LpSevMKzecf5Cndl2R6fPQKSNORZ4HwP2O31Uc0BWgJappjxVhS6CxoOAbV5xKNfCLEGl8+Q3D2OnEfJZxOreZfS/oHTML81ogXqO3PARfCdMXO2yhTo3Caf0MAnAMUfQQFIA+GfvSPvcVq4BNsKs+pg8en7l89rpYAH7QA731QbMAkN40qjdPiFstghOlVWbRKlflnbYFFyATyyHGW+00/VeMOx0D3AQabvEoZsUTbcFH4s8kvKQ8TidcEPzVAHUqzA3brswzZ9szW5h09JoPwb1DvXdF83Kgsin6iA2fz1UJhjmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3420.namprd12.prod.outlook.com (20.178.198.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Wed, 4 Sep 2019 19:42:50 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 19:42:50 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Huang, Ray" <Ray.Huang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 00/10] drm/amdkfd: introduce the kfd support for Renoir
Thread-Topic: [PATCH 00/10] drm/amdkfd: introduce the kfd support for Renoir
Thread-Index: AQHVYzgvm95Ta0FBh0GVkRJCX3TSrqcb62yA
Date: Wed, 4 Sep 2019 19:42:50 +0000
Message-ID: <9808c5da-a5da-0fb1-fe1e-257baa5de8f9@amd.com>
References: <20190904154803.5102-1-ray.huang@amd.com>
In-Reply-To: <20190904154803.5102-1-ray.huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::37) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc62e5c0-f140-4680-dc2b-08d731701228
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3420; 
x-ms-traffictypediagnostic: DM6PR12MB3420:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB342030050B6F9157550EDB8892B80@DM6PR12MB3420.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(53754006)(199004)(189003)(11346002)(446003)(316002)(110136005)(2906002)(476003)(25786009)(486006)(256004)(86362001)(66946007)(99286004)(2616005)(52116002)(54906003)(66476007)(305945005)(71200400001)(36756003)(64756008)(66446008)(71190400001)(66556008)(8936002)(6486002)(65806001)(2501003)(58126008)(7736002)(66066001)(81156014)(81166006)(65956001)(53936002)(4326008)(6246003)(386003)(6506007)(53546011)(229853002)(31696002)(6512007)(14454004)(478600001)(6116002)(76176011)(6436002)(186003)(26005)(102836004)(31686004)(3846002)(5660300002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3420;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +Z5WfJvBbTxM9WYN8Vbm1+AJmzbLBhvIt7UoQsxsLfJY94IGF4lnLPyvG2kzTYo8xuANqvIf1UlSCPypaZAB/MAEPFxft4hi6WaumyZJOgYh9JmhEFUnuoCFT1tOxwAwcjB8pWbH0Ecun70JWKApm1FyjlCaaRTEVR4tW0wDlKGIbyaYENNH2/IZKAiYXQ/yHFj7r6q8b28w5Osj6kCKjhWHyc5W4gIuVgCe3TBRuwuYxfOrt7JfYOeqQkBhymJ4qlky9i2lfgi1id+FkweG+ncFldhEqx23aeYgLqXtY2MSu3RV1QV6XyjeEVEnDH/RlV1GWey9T3Lj9Tyg9dmkKQegFC+/Ulj74Heuj556IERd3xLB1Z313IfgoXWQaKu6MxrO6ZmF/Ry6qC4K3HcfvbEgcAgk6Wr8Ukt3uIDrXmc=
Content-ID: <29D9A15DF63515418B2C9532BF95C890@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc62e5c0-f140-4680-dc2b-08d731701228
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 19:42:50.7889 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q6elbi6EzVdkwrhv9gJbmG+vTCrQ6znAvU4EFkV6Y7ushr0dxFnQSjz8qX6FuZ9iauy3Lch16PtXQi3MI2eMsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3420
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYlVe5vVaIFqfY0aKcDQy92p6ctPtVRUcauMKIYUlvA=;
 b=PYNJo/z024DAibMuAeKVbBrF8+j+kqyWwukMDkzsnjysGnLTz8GRZAfmRLlSc1C5LP/ktRyeu318jzSbRR9sB1XrTK+6c6IYHEk13g+QshBps3+QyQqUTHVk/NxJvIXwGjq08TbJzxN35+h3bNAWWc61xOiU8QEdZQoSXUtO0Ww=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGF0Y2hlcyAyLTEwIGFyZQ0KDQpSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1
ZWhsaW5nQGFtZC5jb20+DQoNClNlZSBteSBjb21tZW50cyBvbiBwYXRjaGVzIDEgYW5kIDIgaW4g
c2VwYXJhdGUgZW1haWxzLiBJbiBwYXRjaCAxIGl0IA0KbG9va3MgbGlrZSB5b3UncmUgYmFzZWQg
b24gYW4gb3V0ZGF0ZWQgdmVyc2lvbiBvZiB0aGUgYnJhbmNoIG9yIGEgDQpkaWZmZXJlbnQgYnJh
bmNoIGFsdG9nZXRoZXIuIFBsZWFzZSBjaGVjayB0aGF0IHlvdXIgc2VyaWVzIGlzIGJhc2VkIG9u
IA0KdGhlIGxhdGVzdCBhbWQtc3RhZ2luZy1kcm0tbmV4dC4NCg0KUmVnYXJkcywNCiDCoCBGZWxp
eA0KDQpPbiAyMDE5LTA5LTA0IDExOjQ4IGEubS4sIEh1YW5nLCBSYXkgd3JvdGU6DQo+IEhpIGFs
bCwNCj4NCj4gVGhlc2UgcGF0Y2ggc2V0IHByb3ZpZGVzIHRoZSBrZmQgc3VwcG9ydCBmb3IgUk9D
bSBzdGFjayBvbiBSZW5vaXIgQVBVLg0KPg0KPiBUaGFua3MsDQo+IFJheQ0KPg0KPiBIdWFuZyBS
dWkgKDEwKToNCj4gICAgZHJtL2FtZGtmZDogYWRkIHJlbm9pciBjYWNoZSBpbmZvIGZvciBDUkFU
DQo+ICAgIGRybS9hbWRrZmQ6IGFkZCByZW5vaXIga2ZkIGRldmljZSBpbmZvDQo+ICAgIGRybS9h
bWRrZmQ6IGVuYWJsZSBrZmQgZGV2aWNlIHF1ZXVlIG1hbmFnZXIgdjkgZm9yIHJlbm9pcg0KPiAg
ICBkcm0vYW1ka2ZkOiBhZGQgcmVub2lyIHR5cHMgZm9yIHRoZSB3b3JrYXJvdW5kIG9mIGlvbW11
IHYyDQo+ICAgIGRybS9hbWRrZmQ6IGluaXQga2ZkIGFwZXJ0dXJlcyB2OSBmb3IgcmVub2lyDQo+
ICAgIGRybS9hbWRrZmQ6IGluaXQga2VybmVsIHF1ZXVlIGZvciByZW5vaXINCj4gICAgZHJtL2Ft
ZGtmZDogYWRkIHBhY2thZ2UgbWFuYWdlciBmb3IgcmVub2lyDQo+ICAgIGRybS9hbWRrZmQ6IGFk
ZCByZW5vaXIga2ZkIHRvcG9sb2d5DQo+ICAgIGRybS9hbWRncHU6IGRpc2FibGUgZ2Z4b2ZmIHdo
aWxlIHVzZSBubyBIL1cgc2NoZWR1bGluZyBwb2xpY3kNCj4gICAgZHJtL2FtZGtmZDogZW5hYmxl
IHJlbm9pciB3aGlsZSBkZXZpY2UgcHJvYmVzDQo+DQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1LmggICAgICAgICAgICAgICAgICAgfCAgMSArDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5jICAgICAgICAgICAgfCAgMSArDQo+ICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jICAgICAgICAgICAgfCAgMiAr
LQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMgICAgICAgICAgICAg
ICAgIHwgIDQgKysrKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2Uu
YyAgICAgICAgICAgICAgIHwgMTkgKysrKysrKysrKysrKysrKysrKw0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jIHwgIDEgKw0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9ldmVudHMuYyAgICAgICAgICAgICAgIHwgIDMg
KystDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2ZsYXRfbWVtb3J5LmMgICAg
ICAgICAgfCAgMSArDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2tlcm5lbF9x
dWV1ZS5jICAgICAgICAgfCAgMSArDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X3BhY2tldF9tYW5hZ2VyLmMgICAgICAgfCAgMSArDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX3RvcG9sb2d5LmMgICAgICAgICAgICAgfCAgMSArDQo+ICAgMTEgZmlsZXMgY2hh
bmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
