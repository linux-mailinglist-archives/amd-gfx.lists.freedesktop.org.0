Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD61898BF
	for <lists+amd-gfx@lfdr.de>; Mon, 12 Aug 2019 10:35:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE83B89DC9;
	Mon, 12 Aug 2019 08:35:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178C989DC1
 for <amd-gfx@lists.freedesktop.org>; Mon, 12 Aug 2019 08:35:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ihL7xD2OyZclT0vLNCQ6aNncIpXlbUO6Xb6Ndww24jvtZiaemR4Z3EcXODvyNcAeALmjI56MH8dD6T5v/TbXhAF7SJFMpplvtqEeJ5mh4ofF1zr8oOIuLOjv+aNi1DjA3BaSLzHgDnFq58E3H6CukBf0Sd6pPkQ0VQttDcJX7pi/Cc5FVPwoVQ6pv7N7mXE7ImBcqlRzWydmnESgg1/BMZROQXuuxnm0YqPQJOJdKBNB9MIzSBR/Y41V3Jl+X9qUZYajcq9nA59OaDHjZm0DpwZF6pEFbHeJgDmBqu6hXyR1qTfwlhNvSrTWu3M601xrZ4cTpzOG02K+oga1SMBHEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xhzv1V0l+CaBAQBoNnqGCt84HMcnO585V7tdu7JhIhE=;
 b=LkxvbJyxAuL6kJXLfk0qdq6cG4WKu1C9izQ5C2ZdFlc73qqUhXPI3mu61ibB60WJBmKOKvd5BGtuZJ9R/fuj2Va8syTu0/gkmOFZkI2qwNCmciXiaeGWl+JeDuIYXphzqVwHb/03utQ+KalgymRbqXigVX/4QDb0FrYBOCZsHy1ed7frziOKHPUJZboaLN6E65QilkdkLHfOzGsE1O8DPmNANSPnFVGctuubwewZUMbr8ngmV9Hxd6iBldsl4qVKt0soL+586avpfQ/9SlGJrs2hYNYxixuv2b9QuCS1pZrFcY2k+CNa10AVmuQjADYvokP5kPTgxXTDxsFmVeuhpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3886.namprd12.prod.outlook.com (10.255.237.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.13; Mon, 12 Aug 2019 08:35:16 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2157.022; Mon, 12 Aug 2019
 08:35:16 +0000
From: Kevin Wang <kevwa@amd.com>
To: "Gui, Jack" <Jack.Gui@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amd/powerplay: remove redundancy debug log about
 smu unsupported features
Thread-Topic: [PATCH 1/2] drm/amd/powerplay: remove redundancy debug log about
 smu unsupported features
Thread-Index: AQHVUOccAJpE+Oq9Dk6wA9Q+7l86k6b3L+SA
Date: Mon, 12 Aug 2019 08:35:16 +0000
Message-ID: <f2363940-6542-0b15-592f-d97d74af17eb@amd.com>
References: <1565598138-13844-1-git-send-email-Jack.Gui@amd.com>
In-Reply-To: <1565598138-13844-1-git-send-email-Jack.Gui@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR04CA0049.apcprd04.prod.outlook.com
 (2603:1096:202:14::17) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01c5df1c-2358-435f-bdfd-08d71f000074
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3886; 
x-ms-traffictypediagnostic: MN2PR12MB3886:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3886A0587D762CCFCD69582EA2D30@MN2PR12MB3886.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:346;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(199004)(189003)(81166006)(478600001)(2501003)(7736002)(81156014)(26005)(99286004)(31696002)(305945005)(8936002)(229853002)(6246003)(102836004)(66946007)(71190400001)(386003)(6506007)(53546011)(2906002)(71200400001)(31686004)(25786009)(14454004)(11346002)(76176011)(4744005)(66476007)(446003)(8676002)(476003)(186003)(2616005)(316002)(6436002)(66446008)(66556008)(52116002)(64756008)(486006)(6116002)(3846002)(110136005)(5660300002)(53936002)(6512007)(66066001)(256004)(36756003)(14444005)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3886;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DxMVHDWieBKYYgYHb52yaVf6l8CPdCDze57/cfczBlBXalL+xJrPUc5kQKvoZyFlikW+8UWzWiLjGYOds3Xp+1yGn0sYXETx8JhcxuFMPIQ1FqX+6sa+6ifnDcdNtBY3+KDO4V9F+8ijs0vqcSJoTebBIWdHkEFLzgqaPXRc4sWL3bsEJ8/JUIddufVQzvJQrY80HDc0Tur9tW6Q4cmk/eUFFFgSh9Eszb1WhtbeJ5C0yA6ln8Q59evMoUaWPs1b8gmkqaTuAUoPLHuuggs1aPEStZ+fm56xefUKm4eQ4J6ImObivxJT+vpavLpIKZWlyok5/rgFiy7lNdN8BP4onK/+8elnfYCU0uwzmgGJgKiByNwDJLUDc7FzYalgS7MmPLDYdlcPq/VSUBHhNWF0xu4ja4Gkuk+1AbGJMNKf/c4=
Content-ID: <67BCB5530274134EA496F4CC15B313AB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c5df1c-2358-435f-bdfd-08d71f000074
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 08:35:16.6485 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fns3MHnqbJJdr89CB60Fq1wXoKwxGyQVom1zSAbpyTsF9jjqKH9XIPuBBNhdwiUs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3886
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xhzv1V0l+CaBAQBoNnqGCt84HMcnO585V7tdu7JhIhE=;
 b=t6zMKmiAlxOYlMn19e6Py6s5F+Jw8KXkXiipGUC8rdyaZ95r90Lz/C+BIXfVkHJ5EigpzUVcAggSecBqIHyq7c+ufPkO+in50YEsicuXtbU1Mx/0EcTeaXa9tkHtyP8Z9vcWmmD9VaVsdNIoxc4WASAF17q/460BZimCqaTXET4=
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
MTkgNDoyMiBQTSwgQ2hlbmdtaW5nIEd1aSB3cm90ZToNCj4gcmVtb3ZlIHJlZHVuZGFuY3kgZGVi
dWcgbG9nIGFib3V0IHNtdSB1bnN1cHBvcnRlZCBmZWF0dXJlcw0KPg0KPiBTaWduZWQtb2ZmLWJ5
OiBDaGVuZ21pbmcgR3VpIDxKYWNrLkd1aUBhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYyB8IDEgLQ0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2FyY3R1cnVzX3BwdC5jDQo+IGluZGV4IGU2ZmNiZGYuLjAzY2U4NzEgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jDQo+IEBAIC0yMTUsNyAr
MjE1LDYgQEAgc3RhdGljIGludCBhcmN0dXJ1c19nZXRfc211X2ZlYXR1cmVfaW5kZXgoc3RydWN0
IHNtdV9jb250ZXh0ICpzbWMsIHVpbnQzMl90IGluZGUNCj4gICANCj4gICAJbWFwcGluZyA9IGFy
Y3R1cnVzX2ZlYXR1cmVfbWFza19tYXBbaW5kZXhdOw0KPiAgIAlpZiAoIShtYXBwaW5nLnZhbGlk
X21hcHBpbmcpKSB7DQo+IC0JCXByX3dhcm4oIlVuc3VwcG9ydGVkIFNNVSBmZWF0dXJlOiAlZFxu
IiwgaW5kZXgpOw0KPiAgIAkJcmV0dXJuIC1FSU5WQUw7DQo+ICAgCX0NCj4gICANCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
