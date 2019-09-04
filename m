Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 233A2A96BD
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 00:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699E589CB5;
	Wed,  4 Sep 2019 22:52:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770082.outbound.protection.outlook.com [40.107.77.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6193089CB3
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 22:52:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jo/R97gLRauqoZCI53N1qEoRObh6THPB55B1otdhXLQT1CX7dEUrbxDtbtfjxUgWcV2NWWVBOE9Z/QRjsKdpXvo0ZEHrenCEDeFJj6AHehqkD3Pw+WPSQ7NzysZCEXOz2w2ksosaRpaUTsyoaKkWbRfWtZ2BSBk12TPcRjZbvz5prMtJf/JgVDoVJT7LAe1+9yspsq3t94wFsS0jA72JeW7xdSWajocSpxeCukpkSrpaadKukanObJwNIRwXQVsYjZgPib9VeGec4hD8WEM0XllS/dbO7lPm2XTPbacrQxxc6eQIdDEV4ZXymN2I6v79RrINhAPb/dxs2RgI0T6bMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6zG7xa/V5PcD5GshRD4NxL6n+DCaYG1eum7lYp9gdQ=;
 b=k8UWysWG/6QJzzG4SKf6f0MmGfPrb5uvKZUy9lY9U83dIjE4ewp+kkDguWXtw7NvQxi6MaxmE+zWixXP9NKG0oqT+zjX5r9TxkcSKylu6r0L/WBIaLtrFJyFTRE3v53MkTS9Y3vFwTHc6vMe8+fCls+1/ObRXeosZyfFMGG44w6s2uQI0/SnkNA0sF6iMe+wysHJIMjMuGsUYiL0HEVlia0bJpK0QmOk+xI8Luem1gasc7e+OlaVEHJBGDjrsOsTRUeG9ZLIvnPEbXP74wR2IRbUBTLsi5duMd/KMdBV+aDX9R95kEBkXyPAIKTnEtWRhoOVywmLss94eAeMm3ceRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3951.namprd12.prod.outlook.com (10.255.238.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Wed, 4 Sep 2019 22:52:38 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77%3]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 22:52:38 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: Re: [PATCH 00/10] drm/amdkfd: introduce the kfd support for Renoir
Thread-Topic: [PATCH 00/10] drm/amdkfd: introduce the kfd support for Renoir
Thread-Index: AQHVYzgvm95Ta0FBh0GVkRJCX3TSrqcb62yAgAC4GAA=
Date: Wed, 4 Sep 2019 22:52:38 +0000
Message-ID: <MN2PR12MB330958D2810C0D2B0518D869ECB80@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20190904154803.5102-1-ray.huang@amd.com>
 <9808c5da-a5da-0fb1-fe1e-257baa5de8f9@amd.com>
In-Reply-To: <9808c5da-a5da-0fb1-fe1e-257baa5de8f9@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: MN2PR12MB3309.namprd12.prod.outlook.com
 (15.20.2220.007)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 931aa1da-2112-437f-43c1-08d7318a95d2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3951; 
x-ms-traffictypediagnostic: MN2PR12MB3951:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3951CB91EF80921BD92A5F8BECB80@MN2PR12MB3951.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(199004)(189003)(53754006)(26005)(53546011)(186003)(6506007)(6116002)(3846002)(7696005)(66476007)(76176011)(11346002)(6636002)(2906002)(86362001)(229853002)(76116006)(66946007)(102836004)(66556008)(64756008)(256004)(476003)(66066001)(53936002)(52536014)(486006)(6436002)(305945005)(25786009)(446003)(71190400001)(71200400001)(5660300002)(33656002)(14454004)(4326008)(478600001)(7736002)(74316002)(9686003)(81156014)(81166006)(6246003)(6862004)(54906003)(99286004)(66446008)(8676002)(8936002)(316002)(55016002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3951;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ugRpYHyMP8JfML/POkdTARqEJnvW0tlbZzYnaOhDNRaCUt3CHTHlCnpUuzjJA7QDnTe4SuIBp5xGkPlnW4Z9AfHJij26RAzH6qpv/ZLLdysE+PSFxbWBeoX5XK/O2xJPIUze75aY5zirtqfFA6iLAJENEOvKTCm+jSTy1BE9IpXCK2aCN9hUkmoxj7Z1O589mtl/jDOWbKFcEc4jbV3yLh+P75b3sgV0QYzAKspLYLJD5WOYtrpXq+060trElpT5gwpx0cOMEhbpgeOyFZhBTIJkJ1jzzsutFxL+0bbC8mc2oKYokycW6ccdRjK9QZnFkPxdqp4LCdLLPjBOO4mcjpXOdN+zlLbLU44bGBRartTsABRoQ+zgazAQ/BgzRP4OCpQCrC8lYKOgvFB5sVe2coFBdIjC42uZfd4Sby0hGRQ=
Content-ID: <7476D4A08D42644CA415459E893881C9@amdcloud.onmicrosoft.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 931aa1da-2112-437f-43c1-08d7318a95d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 22:52:38.2788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TUAtycIMdxkUVel9SizNZi1wUDpnfUn3F9YxhuwTrJ2Gi0GD7fnCpSQmONozx19qQWQRWNT/M4UVkGnwyFqgmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3951
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6zG7xa/V5PcD5GshRD4NxL6n+DCaYG1eum7lYp9gdQ=;
 b=WosI7p9psrsyhWrMfWblbNcOyHpCfyiDxHjshzT5eKJMvNT34WEjpo8jemLPaxaNX1SqogWd2qrsFOiura5LcOjwXd2WdsmT0OPTlcCkSrL3dRw9c80ZeXan4n71R/+a8HL/Ih0V6IO44TjkKqQuNDINnaPqjjt8P/EobHTjliE=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMDUsIDIwMTkgYXQgMDM6NDI6NTBBTSArMDgwMCwgS3VlaGxpbmcsIEZlbGl4
IHdyb3RlOgo+IFBhdGNoZXMgMi0xMCBhcmUKPiAKPiBSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxp
bmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4gCj4gU2VlIG15IGNvbW1lbnRzIG9uIHBhdGNo
ZXMgMSBhbmQgMiBpbiBzZXBhcmF0ZSBlbWFpbHMuIEluIHBhdGNoIDEgaXQgCj4gbG9va3MgbGlr
ZSB5b3UncmUgYmFzZWQgb24gYW4gb3V0ZGF0ZWQgdmVyc2lvbiBvZiB0aGUgYnJhbmNoIG9yIGEg
Cj4gZGlmZmVyZW50IGJyYW5jaCBhbHRvZ2V0aGVyLiBQbGVhc2UgY2hlY2sgdGhhdCB5b3VyIHNl
cmllcyBpcyBiYXNlZCBvbiAKPiB0aGUgbGF0ZXN0IGFtZC1zdGFnaW5nLWRybS1uZXh0Lgo+IAoK
SSB3aWxsIHJlYmFzZSB0aGVtIHRvIGRybS1uZXh0IGJlZm9yZSBzdWJtaXQuCgpUaGFua3MsClJh
eQoKPiBSZWdhcmRzLAo+ICDCoCBGZWxpeAo+IAo+IE9uIDIwMTktMDktMDQgMTE6NDggYS5tLiwg
SHVhbmcsIFJheSB3cm90ZToKPiA+IEhpIGFsbCwKPiA+Cj4gPiBUaGVzZSBwYXRjaCBzZXQgcHJv
dmlkZXMgdGhlIGtmZCBzdXBwb3J0IGZvciBST0NtIHN0YWNrIG9uIFJlbm9pciBBUFUuCj4gPgo+
ID4gVGhhbmtzLAo+ID4gUmF5Cj4gPgo+ID4gSHVhbmcgUnVpICgxMCk6Cj4gPiAgICBkcm0vYW1k
a2ZkOiBhZGQgcmVub2lyIGNhY2hlIGluZm8gZm9yIENSQVQKPiA+ICAgIGRybS9hbWRrZmQ6IGFk
ZCByZW5vaXIga2ZkIGRldmljZSBpbmZvCj4gPiAgICBkcm0vYW1ka2ZkOiBlbmFibGUga2ZkIGRl
dmljZSBxdWV1ZSBtYW5hZ2VyIHY5IGZvciByZW5vaXIKPiA+ICAgIGRybS9hbWRrZmQ6IGFkZCBy
ZW5vaXIgdHlwcyBmb3IgdGhlIHdvcmthcm91bmQgb2YgaW9tbXUgdjIKPiA+ICAgIGRybS9hbWRr
ZmQ6IGluaXQga2ZkIGFwZXJ0dXJlcyB2OSBmb3IgcmVub2lyCj4gPiAgICBkcm0vYW1ka2ZkOiBp
bml0IGtlcm5lbCBxdWV1ZSBmb3IgcmVub2lyCj4gPiAgICBkcm0vYW1ka2ZkOiBhZGQgcGFja2Fn
ZSBtYW5hZ2VyIGZvciByZW5vaXIKPiA+ICAgIGRybS9hbWRrZmQ6IGFkZCByZW5vaXIga2ZkIHRv
cG9sb2d5Cj4gPiAgICBkcm0vYW1kZ3B1OiBkaXNhYmxlIGdmeG9mZiB3aGlsZSB1c2Ugbm8gSC9X
IHNjaGVkdWxpbmcgcG9saWN5Cj4gPiAgICBkcm0vYW1ka2ZkOiBlbmFibGUgcmVub2lyIHdoaWxl
IGRldmljZSBwcm9iZXMKPiA+Cj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dS5oICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfYW1ka2ZkLmMgICAgICAgICAgICB8ICAxICsKPiA+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jICAgICAgICAgICAgfCAgMiArLQo+ID4gICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY3JhdC5jICAgICAgICAgICAgICAgICB8ICA0
ICsrKysKPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jICAgICAg
ICAgICAgICAgfCAxOSArKysrKysrKysrKysrKysrKysrCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jIHwgIDEgKwo+ID4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZXZlbnRzLmMgICAgICAgICAgICAgICB8ICAzICsrLQo+
ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZmxhdF9tZW1vcnkuYyAgICAgICAg
ICB8ICAxICsKPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2tlcm5lbF9xdWV1
ZS5jICAgICAgICAgfCAgMSArCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9w
YWNrZXRfbWFuYWdlci5jICAgICAgIHwgIDEgKwo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfdG9wb2xvZ3kuYyAgICAgICAgICAgICB8ICAxICsKPiA+ICAgMTEgZmlsZXMgY2hh
bmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
