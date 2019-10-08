Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C635FD008B
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Oct 2019 20:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD366E884;
	Tue,  8 Oct 2019 18:13:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800044.outbound.protection.outlook.com [40.107.80.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05116E884
 for <amd-gfx@lists.freedesktop.org>; Tue,  8 Oct 2019 18:13:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsNtfDLHa8OQPPhmFVxKwfjufnnuW2dg2PHpkJl1ScXlJcBQT2eM1qSsg6tBHdmyWmQXaGwk2UZ79FG7rLoGKxgnatJpZfvz0ACrt+aauzUkYmtDOk4hLoVKKVKbliYPW1XeWywJNCDtO3HhMIpUxApDxQFyh5SnpI0v3nXMa7CMZRRj5sREaFLHzghZDiY2ry9zappI/kSm64jjrhawm34kqFr8o4Jl5lHE1BQ9+lK7YwEtEBlBjEnGC8HwxJGKgMFs9BtYsnNoQIKjyeDBiavg/lTR4Oa224X6r74GRK8WEFw1EOntmECZenbSB2mbKnToM69DvGQRO+L1e7rFyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoU6P0qn8RECIy0SY9NGWGmo7vwAnsh0S4I0Izwpvmo=;
 b=Iqee7jTtsJ/sDp18xb/aiSjlBD0ETCpzg2tiz9nlNAomg+NiCNlPiCGhGNsCICRxfxs7o4SvEcCDqf/T9I6qBJVnF394iMxYm8XGRzYsWt9fLsUkDqW6Yoz1GMV6U1Ae/jZ3VhNNOJNEH3IjhuLshwZkBxfuFmGLFsifOtu0ZlrmCg8cZdW55kOSAJ8RHdQX+J6/Vfl/hDEtgTAat0Ub2Ik03BUi19GUQCC066e0miOIu0Co+glw+zdI4N4rrIV1j1aHiiktl/uiWf0u44vr1ia2D6AaKw+3pgR002V6Gn1p1xkpui1MFKUCkOAjldsIDzB6lheRyYA9HTFlWQ1yuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1886.namprd12.prod.outlook.com (10.175.53.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Tue, 8 Oct 2019 18:13:15 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::4803:438a:eb1d:d6a6]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::4803:438a:eb1d:d6a6%10]) with mapi id 15.20.2327.026; Tue, 8 Oct 2019
 18:13:15 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/ras: fix typos in documentation
Thread-Topic: [PATCH] drm/amdgpu/ras: fix typos in documentation
Thread-Index: AQHVfgL4+TcTsW+JE0+PFNxkDe26kqdRDBEA
Date: Tue, 8 Oct 2019 18:13:14 +0000
Message-ID: <af883b27-7902-0a60-bdf2-5f7fe58c7bbd@amd.com>
References: <20191008180517.31668-1-alexander.deucher@amd.com>
In-Reply-To: <20191008180517.31668-1-alexander.deucher@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17)
 To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f85ab5fd-5aa6-4e80-697f-08d74c1b2fdb
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MWHPR12MB1886:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1886C10500E29A238BF1D14DEA9A0@MWHPR12MB1886.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:499;
x-forefront-prvs: 01842C458A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(199004)(189003)(76176011)(64756008)(66476007)(66556008)(110136005)(66446008)(305945005)(7736002)(4326008)(99286004)(229853002)(8936002)(2906002)(26005)(6246003)(186003)(66946007)(2501003)(81166006)(386003)(53546011)(6506007)(102836004)(8676002)(6486002)(6116002)(3846002)(81156014)(6436002)(52116002)(31686004)(316002)(6512007)(31696002)(86362001)(71190400001)(71200400001)(478600001)(14454004)(476003)(25786009)(2616005)(11346002)(36756003)(256004)(446003)(5660300002)(486006)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1886;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n3jbf6cJzHlwUOii5wusfEvzRGei9I1uEHGWwb+TRQEMn+UN0drSh3nsn9u3YKiuC7wnYLVYbN8E14akSgZRp8FHhqCX/LBhX498kxf9iaOik9jlzDb1h446qmoh673upCWt3pXEM/4RRvFEHG3E5h8OQxRLxYX44MuJxtqR9IxcsU51GwxTNDTCTVPbG7XojoEpxjcPFwwrjSrTOtCGpMX9zcAKNTkRTjhEKVCdWypGg5vzGgQ56E7ZcsI2HG+0USQwaV+NaXXYo8GiN3iBHkd/igmURNNtgDXGRA/pDWgg3zwQGdSuZH1HiubfbfzZyTbeI6QvJ/xOx03tx9KkH6ghqYBk3B25NZ7opTH1IGZMNI7fEytcGsEFdCR3fQQR4ABTprG30TRqSB6dbvVnX6rhs7EnP+K2YWMMYEIr6jA=
Content-ID: <AD5DB001A343AE42A597A0F5DDD97C7A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f85ab5fd-5aa6-4e80-697f-08d74c1b2fdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 18:13:14.9150 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JOqNIf9qYOOIj4gn+H/M5BSqCENbCeVLlkZb+7WmO4EMKnQlkUkJhecM44QbQhIKDUoKoxocb3ygxOvNhztnPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1886
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoU6P0qn8RECIy0SY9NGWGmo7vwAnsh0S4I0Izwpvmo=;
 b=LvLUU8ozdDEdn4L7lXbYioTjTq5icKkNxzKQt3/Z+gJifUmDXq6R3sk6tRc8WEtnZ0eKdCtExm5ojM4ldwqTkz4Mo0LNhU1975xlDHN+1tHnqphhEdZttWBjcNzN7TAkfJrHw58ZtnNU+AiDKV3p59QnJ6BS58pxdATHvwf3lLA=
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
Pg0KDQpBbmRyZXkNCg0KT24gMTAvOC8xOSAyOjA1IFBNLCBBbGV4IERldWNoZXIgd3JvdGU6DQo+
IEZpeCBhIGNvdXBsZSBvZiBzcGVsbGluZyB0eXBvcy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgfCA0ICsrLS0NCj4gICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQo+IGluZGV4IDBlMmVlNTg2OWI1Zi4uYzBkM2VkZjc3
OTAxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQo+IEBA
IC0yMjgsMTMgKzIyOCwxMyBAQCBzdGF0aWMgc3RydWN0IHJhc19tYW5hZ2VyICphbWRncHVfcmFz
X2ZpbmRfb2JqKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgICAqDQo+ICAgICogLi4g
Y29kZS1ibG9jazo6IGJhc2gNCj4gICAgKg0KPiAtICoJZWNobyBvcCBibG9jayBbZXJyb3IgW3N1
Yl9ibGNvayBhZGRyZXNzIHZhbHVlXV0gPiAuLi4vcmFzL3Jhc19jdHJsDQo+ICsgKgllY2hvIG9w
IGJsb2NrIFtlcnJvciBbc3ViX2Jsb2NrIGFkZHJlc3MgdmFsdWVdXSA+IC4uLi9yYXMvcmFzX2N0
cmwNCj4gICAgKg0KPiAgICAqIG9wOiBkaXNhYmxlLCBlbmFibGUsIGluamVjdA0KPiAgICAqCWRp
c2FibGU6IG9ubHkgYmxvY2sgaXMgbmVlZGVkDQo+ICAgICoJZW5hYmxlOiBibG9jayBhbmQgZXJy
b3IgYXJlIG5lZWRlZA0KPiAgICAqCWluamVjdDogZXJyb3IsIGFkZHJlc3MsIHZhbHVlIGFyZSBu
ZWVkZWQNCj4gLSAqIGJsb2NrOiB1bWMsIHNtZGEsIGdmeCwgLi4uLi4uLi4uDQo+ICsgKiBibG9j
azogdW1jLCBzZG1hLCBnZngsIC4uLi4uLi4uLg0KPiAgICAqCXNlZSByYXNfYmxvY2tfc3RyaW5n
W10gZm9yIGRldGFpbHMNCj4gICAgKiBlcnJvcjogdWUsIGNlDQo+ICAgICoJdWU6IG11bHRpX3Vu
Y29ycmVjdGFibGUNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
