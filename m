Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7BB8F354
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2019 20:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D88B6EA2A;
	Thu, 15 Aug 2019 18:27:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710044.outbound.protection.outlook.com [40.107.71.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DE46EA2A
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2019 18:27:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7ILXk9ui08cKLEbYn/oyeLQMDX866iH60bWPI8INR28T6dPnk84/8qW7tIy1jsxqJGJFtuiXWUtto5l8seo5bOpxo19bv43MiBNMozo6Nv6dp/pfusALa1wzDWRumJFUTrIMhGXaSaBE+aQCwlzLbr5Fr/tCqo91EhpUQEVlkXLAcLj0aWUREWx+tqD2l0RkA8A3EezgawDLRgkrveMPvOk9tsmZOEAVRDae7PS82FLYFIbIQym+4A7ZAiYLKuHj/7Zv9MUdkIxbj1iTt5aiSGjdwMh9OB3znz3cd+lTFz4lj0iroBiMP4wYQTC4TZ1wip1LdKxy5iV2bezhnUdoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyaIF6NHoN+jdhgvBNz2b3kf7eSwfDCQTFO1XCyrcqQ=;
 b=EvwlL8GS5agwf+enapsUnBttp8jZO3YBz4VekzPqQTFJacbiOF4w3yo0H+OXX8Y3vnL83q8H+Ll7z+ebds1sxXbjqLapbQOMh8/udVCgPIb8ECcLpRJ5I0b8noclYyrhAy1/TLwwImI249dZvC/NM9inv13USKfpwXUKIwryu+Y5u4aHwMI9RIx+qhp9Kwgr+aGAl0kOYp7dvlPLZ2Y6WCN9ADZjQGWw2bAcKJh0BFx9cCmjKW2w8Gj0mE/Cw+rC//Z+5SxcsGiqOXgwLWnydnEHLRSfWeh2ZzFUEzL6pW7aofc52Tt4SAOYi3dWIuX+KaxjuhUA6enQtujFSugD9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2456.namprd12.prod.outlook.com (52.132.141.37) by
 DM5PR12MB2583.namprd12.prod.outlook.com (52.132.141.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 15 Aug 2019 18:27:19 +0000
Received: from DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::2882:d83f:bf0:8cb2]) by DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::2882:d83f:bf0:8cb2%5]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 18:27:19 +0000
From: "Liu, Leo" <Leo.Liu@amd.com>
To: "Thai, Thong" <Thong.Thai@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdgpu: enable VCN DPG for Renoir
Thread-Topic: [PATCH 2/2] drm/amdgpu: enable VCN DPG for Renoir
Thread-Index: AQHVU5YLvkFptzWbrECQe+i+IKQjKKb8hvaA
Date: Thu, 15 Aug 2019 18:27:18 +0000
Message-ID: <584b192b-1338-44df-35e5-06e9840bcb61@amd.com>
References: <20190815181940.4897-1-thong.thai@amd.com>
 <20190815181940.4897-2-thong.thai@amd.com>
In-Reply-To: <20190815181940.4897-2-thong.thai@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTBPR01CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::27) To DM5PR12MB2456.namprd12.prod.outlook.com
 (2603:10b6:4:b4::37)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9693a278-51d0-440a-62a3-08d721ae34a6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2583; 
x-ms-traffictypediagnostic: DM5PR12MB2583:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB258390FB95C29BB4C4706091E5AC0@DM5PR12MB2583.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(376002)(39860400002)(346002)(136003)(199004)(189003)(6246003)(86362001)(53936002)(14454004)(65826007)(478600001)(3846002)(64126003)(2906002)(81166006)(8676002)(36756003)(81156014)(8936002)(2501003)(7736002)(305945005)(31696002)(6116002)(65806001)(65956001)(66066001)(6486002)(316002)(66476007)(6436002)(229853002)(66556008)(58126008)(6512007)(64756008)(66446008)(52116002)(110136005)(66946007)(76176011)(386003)(14444005)(256004)(99286004)(186003)(26005)(71190400001)(71200400001)(102836004)(6506007)(53546011)(31686004)(476003)(2616005)(11346002)(25786009)(446003)(486006)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2583;
 H:DM5PR12MB2456.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SSbtS1Jegs08iamtQ5tuYPiiCPRSoZ4Vauc3lvG3KhZWoAddvPoXdT46Fnl6iIeySus3G73Cs0Rv7fNFBRvIuDcO/uv8wodqTu+ZEHe9BtYr8Zfpzh1IwCFuEvDoLYlAKElgEI0+fAmM9Bw657AI9dLaURxyYHI+vmDV/z3mo9bz1g9EK9cxM/AL05KorwRwlyhnCfXiaLqOjO4or17bVH1ACf2IL4S0D3lD/vBb1kaptu3yHq7vRWUhQkhc8nM1alXwmDFJouiKQsnJsrANg0dY3/vqPZPWY9FJZYkIdU+BQxK1wQM+WgJBUgY6TP9vz2awMJbOm5jGk9OrwFhNXRzEiLv2kPy3E1nwRdntiOTf2JKyvzErlvdnCQoW8jMRUGunG2ocbw8ttDSHj1MmJ/nWsE2Smjh4b717gju/G/8=
Content-ID: <2C973EFA9C780C4AA797069D8BBD7CCE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9693a278-51d0-440a-62a3-08d721ae34a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 18:27:18.9189 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aqq98Sua66ZyB5QoM1E6Q1pOmvUATmG+JX58qu91xsBjPcgJRt8hioe1ZehH+ric
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2583
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyaIF6NHoN+jdhgvBNz2b3kf7eSwfDCQTFO1XCyrcqQ=;
 b=ydBSh6yjmwm7ys78bVsDAparpYp26joLZdDcqsbmJ84pCCsqeLcLJjGHe9suIZAenHuwCTYuwgvQ5SDhKbGOodGo8kLQhL1C9L2tnEFsXn9/1M9ZnM97EH+a6u6DQfMAs2R/keja5Y6kk1Ag9ZtECt/CqlcJSsmCkOVVgZgSHVg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Leo.Liu@amd.com; 
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

DQpPbiAyMDE5LTA4LTE1IDI6MTkgcC5tLiwgVGhhaSwgVGhvbmcgd3JvdGU6DQo+IEVuYWJsZSBW
Q04gRHluYW1pYyBQb3dlcmdhdGluZyBvbiBSZW5vaXIgZGV2aWNlcy4NCj4NCj4gVGhpcyB3aWxs
IGFsc28gZW5hYmxlIGluZGlyZWN0IFNSQU0gbG9hZGluZyBvZiBWQ04gZmlybXdhcmUgb24gUmVu
b2lyLg0KDQpUaGlzIHdpbGwgZW5hYmxlIGluZGlyZWN0IFNSQU0gbG9hZGluZyBmb3IgVkNOIERQ
RyBtb2RlIGluaXRpYWxpemF0aW9uLiANCldpdGggdGhhdCBmaXhlZCwgdGhlIHBhdGNoIGlzOg0K
DQpSZXZpZXdlZC1ieTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPg0KDQoNCj4NCj4gU2lnbmVk
LW9mZi1ieTogVGhvbmcgVGhhaSA8dGhvbmcudGhhaUBhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIHwgNCArKystDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3NvYzE1LmMNCj4gaW5kZXggNDNhNDQxOGYwNTYwLi40ZDc0NjMyNWQ3ZTYgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYw0KPiBAQCAtMTAzOCw3ICsxMDM4LDkgQEAgc3Rh
dGljIGludCBzb2MxNV9jb21tb25fZWFybHlfaW5pdCh2b2lkICpoYW5kbGUpDQo+ICAgCQkJCSBB
TURfQ0dfU1VQUE9SVF9BVEhVQl9MUyB8DQo+ICAgCQkJCSBBTURfQ0dfU1VQUE9SVF9BVEhVQl9N
R0NHIHwNCj4gICAJCQkJIEFNRF9DR19TVVBQT1JUX0RGX01HQ0c7DQo+IC0JCWFkZXYtPnBnX2Zs
YWdzID0gQU1EX1BHX1NVUFBPUlRfU0RNQTsNCj4gKwkJYWRldi0+cGdfZmxhZ3MgPSBBTURfUEdf
U1VQUE9SVF9TRE1BIHwNCj4gKwkJCQkgQU1EX1BHX1NVUFBPUlRfVkNOIHwNCj4gKwkJCQkgQU1E
X1BHX1NVUFBPUlRfVkNOX0RQRzsNCj4gICAJCWFkZXYtPmV4dGVybmFsX3Jldl9pZCA9IGFkZXYt
PnJldl9pZCArIDB4OTE7DQo+ICAgDQo+ICAgCQlpZiAoYWRldi0+cG0ucHBfZmVhdHVyZSAmIFBQ
X0dGWE9GRl9NQVNLKQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
