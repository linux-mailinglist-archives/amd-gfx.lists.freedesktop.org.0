Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B79C99C7
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2019 10:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BAA6E2DE;
	Thu,  3 Oct 2019 08:25:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770059.outbound.protection.outlook.com [40.107.77.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482A66E0C5
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 08:25:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kG0lXpZrs9aiRqKnTCgTBSNEwkhiSSI1H78TOzNJ1CVHl6nHVyWUBTFq9hCrbOdAhGks2U6CvvonsrptWsLpxxmmL5S8XgzNDVG3EA+Uv7UXvjII+7izdFfasVSrqclT0HDtKBut0J3h7RXEh2j8vq4okmJPmhv9cvnu9KQ5uQUjS1V7jr8oizrFFo3QhX0hIZeR0Vp6A4vpiPv4oZAQVtXamsJIQnz1V8d8xQ5FCyMk9hWgSiYZPA+IW4HGHzP+q/Est97B2TC5KnCZBKovmKhU0YzQ0Nvv6rhf+6FBDMLkBvC9uwV2VWCr2nPMpDryXSvNXi4NGt+Ai5ZSNTkVgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5267csH/uSMYC/6fsVpXpmpQ6DJWfLo4mCax+osY+Y=;
 b=LtHN2Nx6krvLnA7C/mIOTFNYsqFUXMkE4qWORVQdkG1Hh/twquiTs6mcjXo+ugLm++WU53jRMPuEcmM2MsVsMuSbAJwdTUOqjp/JKuX2LruqmwnBfgCcfkRR0DNFJIBNR49BGgALP8UaeHhyq3CsU6oyOJ51WO2FjM0wAqkv/ASPyognFO27yPMv6JvvlOzsI7V+o0AopqL66yoizBuencw8s0O/uK7hrC8nqb/r4n5aHvDRKxGAqBUMtlsNupJMPZEXH5ZlLwerlWzWdsmNk/Vex57+ytK+xwb//wg1rCDvXBp1iwjSDu+8VRt3zafz5NUqzxaamsPUOEevRjmU3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR1201MB0187.namprd12.prod.outlook.com (10.174.109.137) by
 DM5PR1201MB0218.namprd12.prod.outlook.com (10.174.246.142) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 3 Oct 2019 08:25:31 +0000
Received: from DM5PR1201MB0187.namprd12.prod.outlook.com
 ([fe80::6186:7adb:ceda:20d]) by DM5PR1201MB0187.namprd12.prod.outlook.com
 ([fe80::6186:7adb:ceda:20d%3]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 08:25:31 +0000
From: "Pelloux-prayer, Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: do not execute 0-sized IBs
Thread-Topic: [PATCH] drm/amdgpu: do not execute 0-sized IBs
Thread-Index: AQHVecESlri34d569kWl8OF1vO+U7KdIkEmAgAAEZAA=
Date: Thu, 3 Oct 2019 08:25:31 +0000
Message-ID: <a8d4871c-4b00-3a72-1cff-50878e1d8818@amd.com>
References: <20191003080306.3514-1-pierre-eric.pelloux-prayer@amd.com>
 <12e0b546-faaf-38c3-c0fc-1e713348b62e@gmail.com>
In-Reply-To: <12e0b546-faaf-38c3-c0fc-1e713348b62e@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR2P264CA0025.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::13) To DM5PR1201MB0187.namprd12.prod.outlook.com
 (2603:10b6:4:5b::9)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [109.190.135.109]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a44c0db-6e65-4a73-4e42-08d747db4123
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR1201MB0218:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1201MB021822B3D38A5EAAF5E03B668D9F0@DM5PR1201MB0218.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(199004)(189003)(66946007)(66556008)(64756008)(6486002)(966005)(71200400001)(316002)(71190400001)(66476007)(66446008)(14454004)(81166006)(81156014)(486006)(229853002)(25786009)(8936002)(11346002)(6436002)(31686004)(2616005)(66066001)(6246003)(2906002)(8676002)(476003)(31696002)(86362001)(305945005)(7736002)(36756003)(110136005)(256004)(186003)(2501003)(5660300002)(26005)(478600001)(102836004)(6512007)(386003)(6306002)(3846002)(55236004)(53546011)(6506007)(76176011)(6116002)(52116002)(99286004)(446003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0218;
 H:DM5PR1201MB0187.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1BWjqbq2mF2guzf/9HAx1RSml8OUJF2LTOf6e9RKlxc0KWeigmxESZbxS4XoFmZ0v1Fi4cavs2RhwcJucTJmgAj5otnx4LSqLfS136VZl0KdNFO1ZSHtn+hb8iKi4su5P73B+beX8w5repj5DNvjr6q4k2VTaofku91qqct1mBdusEbF2wK4qI9+KVY3aPBUeq6fILVPqJnj4+RLQDzl/wm1KDNvtxSk2RFqGTyIi5bnm2E8xS5b06d0GCFSGs446ywAeyHg2Of0P/Se8KpXyxb0ou/1kVdNZa4i4UamXyUx3Jk0SAGte70byrW/46m0+kfeRPyMUyhw9ITGu7Erxx3D5K52yO5WlcmkHMYwJdYQFB0CE3VqoUUrVYf8biJzN6ppo66tnwYUwOAMIm7MQqSEM/9z4S7KEvzgsPnF41xd/BkPNfdTwMWre20plmtO2Y3OkDOhV3mVfodMro1VYA==
Content-ID: <CA6C6DD28277D04D8C5199D32003EB02@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a44c0db-6e65-4a73-4e42-08d747db4123
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 08:25:31.3716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cbEf1r4smWnNrg3zbS5TnvE9E/4NK15+GNczeKCi2dqZnmCrcYTVgf/+lIpbcrkyJLbXCGLw/jBJyQykFGYkxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0218
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5267csH/uSMYC/6fsVpXpmpQ6DJWfLo4mCax+osY+Y=;
 b=d7DTZR6KYDjiE7V6jJGw8LofrOLu6ZF2m2FGB18C5Pc0WmjC6ChpvQQV5qTpks4u56a35T9cJFsjGFQzoyG+aW0BoUyaPbnCGzGj4TzHPYz7aiaYvVbuMv8E39YXEqbl62t3MT5OoWPP4e70V1kFzHA0mzkc48JxWASdYr8EEeo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Pierre-eric.Pelloux-prayer@amd.com; 
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

DQpPbiAwMy8xMC8yMDE5IDEwOjA5LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KPiBBbSAwMy4x
MC4xOSB1bSAxMDowMyBzY2hyaWViIFBlbGxvdXgtcHJheWVyLCBQaWVycmUtZXJpYzoNCj4+IFRo
aXMgY2FuIGJlIHNhZmVseSBza2lwcGVkIGVudGlyZWx5Lg0KPj4gVGhpcyBzZWVtcyB0byBoZWxw
IHdpdGggaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTExNDgx
Lg0KPiANCj4gTkFLLCBwbGVhc2UgaW5zdGVhZCBmaXggZ21jX3YxMF8wX2ZsdXNoX2dwdV90bGIg
dG8gaW5jbHVkZSBhdCBsZWFzdCBzb21lIE5PUCBpbiB0aGUgc3VibWl0dGVkIElCcy4NCg0KSXMg
dGhlcmUgYW55IGludGVyZXN0IGluIGV4ZWN1dGluZyBhbiBlbXB0eSAob3Igb25seSBmaWxsZWQg
d2l0aCBOT1BzKSBJQj8NCg0KQW55d2F5IEkgY2FuIG1vZGlmeSB0aGUgcGF0Y2ggdG8gZG8gdGhp
cy4NCg0KVGhhbmtzLA0KUGllcnJlLUVyaWMNCg0KPiANCj4gQ2hyaXN0aWFuLg0KPiANCj4+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmUtRXJpYyBQZWxsb3V4LVByYXllciA8cGllcnJlLWVyaWMu
cGVsbG91eC1wcmF5ZXJAYW1kLmNvbT4NCj4+IC0tLQ0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2liLmMgfCA1ICsrKysrDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9pYi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMN
Cj4+IGluZGV4IDYwNjU1ODM0ZDY0OS4uYWExNjNlNjc5ZjFmIDEwMDY0NA0KPj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jDQo+PiBAQCAtMjI3LDYgKzIyNywxMSBAQCBpbnQg
YW1kZ3B1X2liX3NjaGVkdWxlKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgdW5zaWduZWQgbnVt
X2licywNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICFhbWRncHVfc3Jpb3ZfdmYoYWRl
dikpIC8qIGZvciBTUklPViBwcmVlbXB0aW9uLCBQcmVhbWJsZSBDRSBpYiBtdXN0IGJlIGluc2Vy
dGVkIGFueXdheSAqLw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7DQo+
PiDCoCArwqDCoMKgwqDCoMKgwqAgaWYgKGliLT5sZW5ndGhfZHcgPT0gMCkgew0KPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLyogT24gTmF2aSBnbWNfdjEwXzBfZmx1c2hfZ3B1X3RsYiBlbWl0
cyAwIHNpemVkIElCICovDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsNCj4+
ICvCoMKgwqDCoMKgwqDCoCB9DQo+PiArDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYW1kZ3B1X3Jp
bmdfZW1pdF9pYihyaW5nLCBqb2IsIGliLCBzdGF0dXMpOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IHN0YXR1cyAmPSB+QU1ER1BVX0hBVkVfQ1RYX1NXSVRDSDsNCj4+IMKgwqDCoMKgwqAgfQ0KPiAN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
