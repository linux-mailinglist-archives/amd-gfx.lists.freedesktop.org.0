Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D657E7B8BD
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 06:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4E56E66E;
	Wed, 31 Jul 2019 04:33:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740049.outbound.protection.outlook.com [40.107.74.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111556E66E
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 04:33:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lrkl8+MDTznN/tQK0Gqoh0tlUtbkNnrg3BHQgdC6pd8Xl5ytM6MzEj6dBSWBzF+/tppYpQTOqiCNflerP69zTPzHb/637v5BDKAh6ecbuJczkiPerqmUJBOsMdjiGULFoRMEhfZeLPgK/FlGkllPWrawpDKGy3uvD/2A6/js9MMEcj02o4QyKgOqxTEBWZ66q5+hCbJj4rRS1nDOz2Vsz5DDMggQ4FWhK0SPHKrSuhot2oRE9mZEOBBLnF4d7C9idm5qhxnOlOuGHRAxXqe0ElKMNeEKtlymQrERKdM7rYD6LI8t0dzS7ktyuFJTSFnWQl9wj4FjEQpasq95SABDsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AphRHx1eJZXphlokZjGRoup78K5jrrQteSvMtZTUkdk=;
 b=VqtQk6vn97uJNoaGx7rSpE67VdVty80VOkolHUIk6odPv5uvK/NzDDzjECE1n8pVU3XOc/K5WzId9a5ucEOQoFsRcS36Fw30enePRfP7ZaEzvFvzcDVayGfqFdTzOqZMBf6SibattwPPuW++LCnG43gbOAaFkf52jC58VkIH8MZbEROcTK6VCflDJdMToYTtnuc91UUpP0sjfh995B0Dz3efP/Ffc6EcsVF/Lbl4NgDnc0XymyRumkIvJHiXgDQ7Xzx2SP2XoDHbaQK76GG5pWP7zNCwNi1zXTQWrP3bDZ38J3xDJxmg6v1CnvGjuZwI9PVXAWI1MICmj9rEGtz3Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3138.namprd12.prod.outlook.com (20.178.210.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Wed, 31 Jul 2019 04:33:19 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2094.017; Wed, 31 Jul 2019
 04:33:19 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdkfd: enable KFD support for navi14
Thread-Topic: [PATCH 2/2] drm/amdkfd: enable KFD support for navi14
Thread-Index: AQHVQ+aiPpKNeVXMDkWxiMUa60DrA6bkKkQj
Date: Wed, 31 Jul 2019 04:33:19 +0000
Message-ID: <BN8PR12MB36028EED9EBC681BC042564689DF0@BN8PR12MB3602.namprd12.prod.outlook.com>
References: <20190726191615.20351-1-alexander.deucher@amd.com>,
 <20190726191615.20351-2-alexander.deucher@amd.com>
In-Reply-To: <20190726191615.20351-2-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4bbfbe1c-2cd6-4c19-c9e0-08d715703688
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3138; 
x-ms-traffictypediagnostic: BN8PR12MB3138:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR12MB3138F0CCE8AFCCE7B7E469E289DF0@BN8PR12MB3138.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:561;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(189003)(199004)(6246003)(102836004)(6506007)(25786009)(53546011)(76116006)(91956017)(6436002)(26005)(7696005)(8936002)(186003)(76176011)(71200400001)(66066001)(305945005)(2501003)(33656002)(86362001)(4326008)(2906002)(71190400001)(68736007)(110136005)(7736002)(74316002)(53936002)(6116002)(478600001)(3846002)(316002)(11346002)(966005)(486006)(446003)(476003)(256004)(66946007)(66476007)(14454004)(9686003)(66446008)(8676002)(66556008)(6306002)(64756008)(5660300002)(229853002)(99286004)(55016002)(52536014)(81166006)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3138;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ITD2UXvECR8QT01rMrrFOfqyzUSwPhnn4YFQchpdN2O3nlo/VtQNuqSkzDvaANBbXWXms5Mqngrhr5SnV5kMNAttjolgjVIyeD1PMLQUSKYyB+rXU4K4lgM3FC5dmL9hg30A716D0ch+aOfpIhgkt74BiEfgxGu7NdhKPRJlPRb6eQOHGQleV1mJFwE9EXg3PPwnqSJk69rGU5uvPIWNw0ISFXaET6Uwne40VboMA8R6/1E9GhuNstlIObdq2LWd1VpY1zJ74PlN37yYIa8n19zPHY9cQHdTk8bCkDYXB53uVG6hwj0uUBrl8b6stHq67b7M67QgethnIml2STb629StD9NO4e2OOYjwl50eHltuQDJw9wI35oVjsMrKEASZTx4T1a/lnURRaFeCjn4HpQVSqxn5nLdFU1APCcg2qtA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bbfbe1c-2cd6-4c19-c9e0-08d715703688
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 04:33:19.0979 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3138
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AphRHx1eJZXphlokZjGRoup78K5jrrQteSvMtZTUkdk=;
 b=SqMoY7jbg+rnabu3hB5GxsaUjIdTzav0fWF8bBaLH/1MYYN8+4KzZZ+8rsFbWjzIJZe+Jbx33f7b+en8PNppImBz5GWmlLmb1YiEUrYjwX5mCeEHrK3CViUvbAypTCi10lfuLca6BFTSgr/r7px8vkUZcvsi3CxOWCPVLfgwQKA=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+CgpCUiwKWGlh
b2ppZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcm9tOiBhbWQt
Z2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBvbiBiZWhhbGYgb2Yg
QWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+ClNlbnQ6IFNhdHVyZGF5LCBKdWx5
IDI3LCAyMDE5IDM6MTYgQU0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBE
ZXVjaGVyLCBBbGV4YW5kZXIKU3ViamVjdDogW1BBVENIIDIvMl0gZHJtL2FtZGtmZDogZW5hYmxl
IEtGRCBzdXBwb3J0IGZvciBuYXZpMTQKClNhbWUgYXMgbmF2aTEwLgoKU2lnbmVkLW9mZi1ieTog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2FtZGtmZC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5j
CmluZGV4IGYwNTJjNzBlNDY1OS4uOTdmN2M1MjM1Y2M5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5jCkBAIC05MSw2ICs5MSw3IEBAIHZvaWQgYW1kZ3B1X2Ft
ZGtmZF9kZXZpY2VfcHJvYmUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAgICAgICAgICAg
ICAgICBrZmQya2dkID0gYW1kZ3B1X2FtZGtmZF9hcmN0dXJ1c19nZXRfZnVuY3Rpb25zKCk7CiAg
ICAgICAgICAgICAgICBicmVhazsKICAgICAgICBjYXNlIENISVBfTkFWSTEwOgorICAgICAgIGNh
c2UgQ0hJUF9OQVZJMTQ6CiAgICAgICAgICAgICAgICBrZmQya2dkID0gYW1kZ3B1X2FtZGtmZF9n
ZnhfMTBfMF9nZXRfZnVuY3Rpb25zKCk7CiAgICAgICAgICAgICAgICBicmVhazsKICAgICAgICBk
ZWZhdWx0OgotLQoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
