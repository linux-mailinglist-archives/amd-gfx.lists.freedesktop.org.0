Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 381A1D0084
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Oct 2019 20:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8405D88EE9;
	Tue,  8 Oct 2019 18:12:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::615])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FE188EE9
 for <amd-gfx@lists.freedesktop.org>; Tue,  8 Oct 2019 18:12:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gw3mr2AyfPy4LsIsqDWJhUdeSEhFKzDJONdLSQDvjleJMUyIs2/xLlaNjNVI6JMczBEwS+u4I+hDFUD+0ktFIjeQ7vd73470u7JG6zVglR6uVs17QpoXSLtlSmo4t8xlfA6ZtGsVHj0zqc8VxeV0VyLQI5mvnP52vJL6PXpIa60rvqDPpMLtqTi89OyRPP7WbruB4VjuiVcJ4G54As00EahXEvXULblAxcjRzmbX9srnGIUn12/JEBBXhkguv/PXlv3q0a0vJyXgW74OXVUN/SxmZom7yqcsQe2Hdp89Ph+PThitvxriFdnz+qi4kQDdGDDZKturXSSEEqTatuQnbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvPAzg99qSjVTpmTwcl02rjds6jrQhh1XT6nxWa+5tU=;
 b=BYzkh/L5XPxu5ccUqvXNTmJwHRzjzGaUn7ovIf7wAPWyMAo0y/tCaLM6A8Rq9JhP2fgPEXlaMynsq6Q1jNvraNbk6BeGifGF/Hf0z2iaLxCWCEewnfn36Oe4cZ53oOUg0e2v+tncxw9i9NDNsjZMmaVJJdcJuhm4HS92lHaN7A7oslu6X8XPSeL3wjq8/PJUHtLhyEFG4OCXI1tnAMpSWDCycF4v/hf1ztBeGkxQocupcvfDyBI2DYwPKY9S2YhTr/2ybAvppurAz634r8PXrccd1oVEbPwYxHlVNLRRyTnReV/KMakZdCqYFP4a//y3MMmeS6tb8UBTLE/nEAzQjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1886.namprd12.prod.outlook.com (10.175.53.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Tue, 8 Oct 2019 18:12:07 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::4803:438a:eb1d:d6a6]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::4803:438a:eb1d:d6a6%10]) with mapi id 15.20.2327.026; Tue, 8 Oct 2019
 18:12:07 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/ras: document the reboot ras option
Thread-Topic: [PATCH] drm/amdgpu/ras: document the reboot ras option
Thread-Index: AQHVfgOHq53IFkr+P0CV5TogxRGXWKdRC78A
Date: Tue, 8 Oct 2019 18:12:07 +0000
Message-ID: <3ee90293-e1d9-b083-206f-6f5c17b36b43@amd.com>
References: <20191008180915.31877-1-alexander.deucher@amd.com>
In-Reply-To: <20191008180915.31877-1-alexander.deucher@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0044.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::21) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0d791bb-4b3f-4eb3-af39-08d74c1b078e
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MWHPR12MB1886:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB18868C1B6151BB76192C45B0EA9A0@MWHPR12MB1886.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-forefront-prvs: 01842C458A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(199004)(189003)(76176011)(64756008)(66476007)(66556008)(110136005)(66446008)(305945005)(7736002)(4326008)(99286004)(229853002)(8936002)(2906002)(26005)(6246003)(186003)(66946007)(2501003)(81166006)(386003)(53546011)(6506007)(102836004)(8676002)(6486002)(6116002)(3846002)(81156014)(6436002)(52116002)(31686004)(316002)(6512007)(31696002)(86362001)(71190400001)(71200400001)(14444005)(478600001)(14454004)(476003)(25786009)(2616005)(11346002)(36756003)(256004)(446003)(5660300002)(486006)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1886;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4NA+NrIInalZfo294Kd5StzLyVoMzX8ZNTiYO3f/2jrLt31Ll56SGrC52lPPoT0ATtinQ04RQTmwjs6PqjAFmSt42c6AuBMru8PqBDlQumCLcCGOHC+PpDR48pm/TNc9rb2M0fWmLMKUOVpRWdBEWDdP2Y/KfHKwAc2AoLl/nmVgqrGLJ+TxeVboJkvgDkbM/2UqsYwpFTPBhcbAmelUt5t5SIp1iCMjlVwvXXKTxnu+CUm4tV8pPVoKdMg3xv0sGq8fKuyV1IGdwi8rYmVOpAQMc5Q5asKDsrFgC+WndYv/hXlD15zIvLJlSVCHk+IQGA+4hHeTntGhaXXbFvZW2ZUr0AAHkRHqtRtKF2l5qrCuITWvY/3lMQ7cHTUQzbmHcKJLsFng1jRVrIhDG4dtAV5MC8tK3YyhbXpSNCkXevA=
Content-ID: <E4D574091DEEDB4D82712104D4328F6C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d791bb-4b3f-4eb3-af39-08d74c1b078e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 18:12:07.4052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Zz5QGNbbMa6/n1HlUxDU21Cx+x1hcYBTDYOUawAtJc5OpHm4qAkaRlPTHQlH80NasSjFA2WGStRl9xZwnODWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1886
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvPAzg99qSjVTpmTwcl02rjds6jrQhh1XT6nxWa+5tU=;
 b=HJDu3HYdq5qCEChDrtnqWu9OXQ7NzpbvIITS9Ih8dtgrJoEJtLnfrv/d5zqu1WYAQWWB3Lc02SbZjMufEUGR4hWavCjbMEZrTiYkML3xkguyHp7F5fR0HGVA8OIpgTaKymjTmbNa6bmz2aUKBVyM85rS7ryF3Yz8Qc/HFY53WhY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29t
Pg0KDQpBbmRyZXkNCg0KT24gMTAvOC8xOSAyOjA5IFBNLCBBbGV4IERldWNoZXIgd3JvdGU6DQo+
IFdlIHJlY2VudGx5IGFkZGVkIGl0LCBidXQgbmV2ZXIgZG9jdW1lbnRlZCBpdC4NCj4NCj4gU2ln
bmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiAt
LS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgfCAzICsrLQ0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4NCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KPiBpbmRleCBjMGQzZWRmNzc5
MDEuLjg0ZDhjMzM0MmE4MSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Jhcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMuYw0KPiBAQCAtMjE1LDExICsyMTUsMTIgQEAgc3RhdGljIHN0cnVjdCByYXNfbWFuYWdl
ciAqYW1kZ3B1X3Jhc19maW5kX29iaihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gICAg
KiB2YWx1ZSB0byB0aGUgYWRkcmVzcy4NCj4gICAgKg0KPiAgICAqIFNlY29uZCBtZW1iZXI6IHN0
cnVjdCByYXNfZGVidWdfaWY6Om9wLg0KPiAtICogSXQgaGFzIHRocmVlIGtpbmRzIG9mIG9wZXJh
dGlvbnMuDQo+ICsgKiBJdCBoYXMgZm91ciBraW5kcyBvZiBvcGVyYXRpb25zLg0KPiAgICAqDQo+
ICAgICogLSAwOiBkaXNhYmxlIFJBUyBvbiB0aGUgYmxvY2suIFRha2UgOjpoZWFkIGFzIGl0cyBk
YXRhLg0KPiAgICAqIC0gMTogZW5hYmxlIFJBUyBvbiB0aGUgYmxvY2suIFRha2UgOjpoZWFkIGFz
IGl0cyBkYXRhLg0KPiAgICAqIC0gMjogaW5qZWN0IGVycm9ycyBvbiB0aGUgYmxvY2suIFRha2Ug
OjppbmplY3QgYXMgaXRzIGRhdGEuDQo+ICsgKiAtIDM6IHJlYm9vdCBvbiB1bnJlY292ZXJhYmxl
IGVycm9yDQo+ICAgICoNCj4gICAgKiBIb3cgdG8gdXNlIHRoZSBpbnRlcmZhY2U/DQo+ICAgICog
cHJvZ3JhbXM6DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
