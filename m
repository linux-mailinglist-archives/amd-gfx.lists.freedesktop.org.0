Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A50B66335
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 03:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBF96E221;
	Fri, 12 Jul 2019 01:02:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790048.outbound.protection.outlook.com [40.107.79.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F43D6E221
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 01:02:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXM0//Ba2RDF+oHqUsHfkMynmbUYKiFsmFJXD4x1W5Xw6IaQz2A0Vu+n0+ZUGMaojMsvWlmvxThvL4KhnH25xshiTC/wsjJi3Ik4/rJjZvpOiVokjKxhlYP2aa48sMhVyYm4z3MJKd/4124kJ2NqjoGGnWnR346ChsGWCw+2AFVZj3zaH+bCHK/8EwmFz511ycoQAq9JGrnSOkN5k4Yvu7EzFw51qr244yP96zFSqae1vfgYJzCnkr9xlLj5aVwjOJOG95xlZ2pndia4ojoZYERSDBrK+kwVmWGVYjPRCTSIQe0i5Q8Ns2QpB9qMUppI15Bq3fGVAa2usY32I9C6RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asgoSoVhZ6X7YtkvYZYoB/OY7a/hIyyr1hxcqUm7jbU=;
 b=a+E+P7+jPyHMR/21MIVGbqUw5sEYi0QAAj8h2XUmFpssOi9XqtB6HwYCbLM7gdUuRoL3No/shX/LEWZfX5DMgCUKn+XFwwMvT2NRbhXMcgBjlBkQZANGPP1feHBoe0J8F592WK4X1OuzmW4eYm1+VppWtInFBs6BVZ6wFONASvEdx+M2fbLNMjwQfTuaH7CfrD+3b29BC3z8ZD7oqe9WNgB4GCqJhAMcUUjDnRbxIzGs8mt9hWMg+v7tci6dj+0Pw1Pb0RJDfD8/dbHnzKTNddfHNOPJTenU0EiidCiO8QLrTnMs/EFlHHc6FPy4XeMrUTSiwD++h1mG8ApxULMN0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB4160.namprd12.prod.outlook.com (10.255.125.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.11; Fri, 12 Jul 2019 01:01:59 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1%3]) with mapi id 15.20.2073.008; Fri, 12 Jul 2019
 01:01:59 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: fix smu clock type change miss error
Thread-Topic: [PATCH] drm/amd/powerplay: fix smu clock type change miss error
Thread-Index: AQHVN+41XmBWZoXLgEWWJZTYyaQPfabGKr7A
Date: Fri, 12 Jul 2019 01:01:59 +0000
Message-ID: <MN2PR12MB33447DCDFB0EF9FA704FCE1EE4F20@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190711133937.10417-1-kevin1.wang@amd.com>
In-Reply-To: <20190711133937.10417-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c7740c6-b4ff-4f43-0963-08d706648aeb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4160; 
x-ms-traffictypediagnostic: MN2PR12MB4160:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB4160F1A6D587D40E19A28D3EE4F20@MN2PR12MB4160.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(376002)(366004)(396003)(199004)(13464003)(189003)(86362001)(54906003)(110136005)(186003)(6436002)(26005)(71200400001)(71190400001)(5660300002)(99286004)(76116006)(76176011)(52536014)(102836004)(66066001)(316002)(66446008)(66556008)(66476007)(64756008)(66946007)(7696005)(6506007)(53546011)(6246003)(2906002)(446003)(74316002)(2501003)(25786009)(486006)(11346002)(14454004)(7736002)(966005)(53936002)(8676002)(8936002)(81166006)(81156014)(3846002)(6116002)(55016002)(9686003)(6306002)(33656002)(305945005)(256004)(478600001)(229853002)(68736007)(4326008)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4160;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BUGH7HXezFjmfBUaMIVBfel4A6ITbORvLeYOuIsqjvyr2QLd1PgKxDVgxnfq9s8czUK+3gBCyTReTURsjzKl98Uy+vhQQijzdL/8xDgYf80l4xyCHJ1J3IKJEw05zj9qrHWe/w0z85G7X3Ggrl4QoEC+eQ47fRwESDFw0bCnl6Rq/mlHzGmQPlAlYCtnfl32TjwrBclwV682UBnVlHBgSU7u5YSXwMekgBJe22hm4dIB95onKlcp1Vep1nrRupOboZi0uFRXtTCefZKve/7v39p6g5u+zHJwUzfMHG+4lCuIrnC1Ih2Nk05W5vo+ohIyuPJJn9hdYhZ8gSEetatrI6dvaJ47TptUS7rVAZ6hK4+wAYomR6Dlb0T6JABbzAc0fqFktDkb3499c0TmxAfbqDugHP02BiH0Flyi1l/n7Bs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c7740c6-b4ff-4f43-0963-08d706648aeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 01:01:59.1131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4160
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asgoSoVhZ6X7YtkvYZYoB/OY7a/hIyyr1hxcqUm7jbU=;
 b=r4LMlnOdu525ER6H+PLZ/K0O1ESWQnS/svTqKCG+Rc2WjiWRTqNyKmCsBQIG+ABDkQTV2lgztEfns3dreDP3lcLozmLvE5KZIrIXIFb7weTWIGFcw+gNGxvuJM0KEgaR2XmLZm4oBWoCVAw6Ov4Ch7AnhpK6k8x4PHZbJ/NzXGg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IFdhbmcsIEtldmluKFlhbmcpDQo+IFNl
bnQ6IFRodXJzZGF5LCBKdWx5IDExLCAyMDE5IDk6NDEgUE0NCj4gVG86IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBXYW5nLCBLZXZpbihZYW5nKSA8S2V2aW4xLldhbmdAYW1k
LmNvbT47IEZlbmcsIEtlbm5ldGgNCj4gPEtlbm5ldGguRmVuZ0BhbWQuY29tPg0KPiBTdWJqZWN0
OiBbUEFUQ0hdIGRybS9hbWQvcG93ZXJwbGF5OiBmaXggc211IGNsb2NrIHR5cGUgY2hhbmdlIG1p
c3MgZXJyb3INCj4gDQo+IGluIHRoZSBzbXUgbW9kdWxlLCB1c2UgdGhlIHNtdV94eHhjbGsgdHlw
ZSB0byBpZGVudGlmeSB0aGUgQ0xLIHR5cGUgdXNlDQo+IFNNVV9TQ0xLLCBTTVVfTUNMSyB0byBy
ZXBsYWNlIFBQX1NDTEssIFBQX01DTEsuDQo+IA0KPiBDaGFuZ2UtSWQ6IElmYTg3MGFlYTM4ZjA0
M2UxOTgzZjZmMDU2MGVlZDJhYzA3MGI2OGI3DQo+IFNpZ25lZC1vZmYtYnk6IEtldmluIFdhbmcg
PGtldmluMS53YW5nQGFtZC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvYW1kZ3B1X3NtdS5jIHwgNCArKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2FtZGdwdV9zbXUuYw0KPiBpbmRleCAxYzE1ZjAyMTAxZmUuLmRlNmNjNWQ0ODljZCAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYw0KPiBA
QCAtMTM4Niw4ICsxMzg2LDggQEAgaW50IHNtdV9hZGp1c3RfcG93ZXJfc3RhdGVfZHluYW1pYyhz
dHJ1Y3QNCj4gc211X2NvbnRleHQgKnNtdSwNCj4gIAkJCQkJCQkgJnNvY19tYXNrKTsNCj4gIAkJ
CWlmIChyZXQpDQo+ICAJCQkJcmV0dXJuIHJldDsNCj4gLQkJCXNtdV9mb3JjZV9jbGtfbGV2ZWxz
KHNtdSwgUFBfU0NMSywgMSA8PA0KPiBzY2xrX21hc2spOw0KPiAtCQkJc211X2ZvcmNlX2Nsa19s
ZXZlbHMoc211LCBQUF9NQ0xLLCAxIDw8DQo+IG1jbGtfbWFzayk7DQo+ICsJCQlzbXVfZm9yY2Vf
Y2xrX2xldmVscyhzbXUsIFNNVV9TQ0xLLCAxIDw8DQo+IHNjbGtfbWFzayk7DQo+ICsJCQlzbXVf
Zm9yY2VfY2xrX2xldmVscyhzbXUsIFNNVV9NQ0xLLCAxIDw8DQo+IG1jbGtfbWFzayk7DQo+ICAJ
CQlicmVhazsNCj4gDQo+ICAJCWNhc2UgQU1EX0RQTV9GT1JDRURfTEVWRUxfTUFOVUFMOg0KPiAt
LQ0KPiAyLjIyLjANCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
