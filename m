Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C5674496
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 06:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F5B6E420;
	Thu, 25 Jul 2019 04:57:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690076.outbound.protection.outlook.com [40.107.69.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909E56E420
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 04:57:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0i/SjPExyfvEtXlOokKnDAJm5quR3+QNpCRAJkvJWCS6bW1e4IhV6WD6yKmhaTcYc2h54bZO80zmCmyGlviwT3358LMjgoio6/EPQ+FKyUO2bYHDUZOeqL/6/IO0WyrYp7u5ytf6XIiDqa7LVONmqjqx0ETEtT8qr4UFih+Q0oVLlhAWWdGK/hRs4BVH996Sb8s/AqWNi/8OI0jYB7om9MGrhvjTWiZ+4CXmfyz4yj7Wma4KTPvuYLOJFAVtCd7maHC1oOBPSxjE79tgen5hdq67x17iLx0EF9f0Y6r27+VYrEivVyjLAAWQ5yb5/Z2DxcPWpp0Xtz5T0UIpWgqzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3O/8oK7rPclR3MU2VNmvZcnlVby54ExckvQ3i9Nr16U=;
 b=MbFiizhAGKiK42U37fj6V66yV48JoTqfIPiNx0HylLuRS3GmPHm8VvqMK42HQWS+kQ/J3gSkxCiRpCc9amPmo4khquSK7U9UZBKCFBrrGQc2DCyBcgu+ej/n3+gvr7dn3RnYzCxk15bxF7CUKTl61yF/U/cFrJojCYr0q3XbnQnUd098QXWK5LiGF9tj4R7CQNkapaaQ75fx8F+xE/PLdIoe4Xd+HNatx74+um8JKs5KO2Qr3aUXVOTpFgNrcMsjcnPLu61fVQxaZZGT06mUIFUWaAtI8ux1RXWmHbEqLkG+8OLVa6f+onzXlIsgPAgX5BXpnGERlZeXkDT2sC3evA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3696.namprd12.prod.outlook.com (10.255.86.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Thu, 25 Jul 2019 04:57:04 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2094.013; Thu, 25 Jul 2019
 04:57:04 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: =?gb2312?B?s7e72DogW1BBVENIIDIvNV0gZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCBzbXUg?=
 =?gb2312?Q?message_name_support?=
Thread-Topic: [PATCH 2/5] drm/amd/powerplay: add smu message name support
Thread-Index: AQHVQqVn8cgV4iLBe0Gq8SXpqNboTQ==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 35
X-FaxNumberOfPages: 0
Date: Thu, 25 Jul 2019 04:57:04 +0000
Message-ID: <MN2PR12MB3296EC57B64010A55D475B5AA2C10@MN2PR12MB3296.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34f26eea-6a59-449c-3568-08d710bc89ba
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3696; 
x-ms-traffictypediagnostic: MN2PR12MB3696:
x-microsoft-antispam-prvs: <MN2PR12MB3696D65D6B2C1D7165DFF080A2C10@MN2PR12MB3696.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(199004)(189003)(316002)(6116002)(81156014)(68736007)(15650500001)(71190400001)(4326008)(66946007)(66556008)(76116006)(86362001)(8936002)(53936002)(64756008)(2351001)(6506007)(71200400001)(66066001)(7696005)(2906002)(66476007)(478600001)(186003)(102836004)(5660300002)(6916009)(256004)(26005)(14454004)(3846002)(66446008)(2501003)(486006)(9686003)(476003)(99286004)(5640700003)(52536014)(81166006)(558084003)(7736002)(74316002)(55016002)(54906003)(6436002)(25786009)(33656002)(224303003)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3696;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xeiUJdEf5h18fGAtRpwPEkIbMKtoaRhDS5ExLk5sXZUDZtxh0fJnoibbPg3t1Jhp0Dw1DUinCzf9+QTumPA1E0HJsLolMiQdPHqkifJnxHt+zQIm3mQtiloQDu3UPwBhMOgoew8+Fx3hWrrl2/wEk569J6mqS48UZbjtua3lGfU4l4fr6+0ugjHfoKWaWyS/H26tOzAAn/fBQ2okIz2E2GdvfHp9NnOWl8obP+AlB9p/3VpwPxZcDKpWVZI1XvQL1Xzdnn6IePdL+kXhHW+IHp8CeXwbngTtSIiV6nh2swhCOoKxITUCV3XJFLUZYQfXijBta2Tu+ri5btSInQVE225C9jniA2HMLcvidQZrEgMmHq7/LvkaY7jaGZWkAWI/F6Br/sMUCr7HKN1wE1OGhzrJDM/7yxL7S1yR4H7G+6A=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f26eea-6a59-449c-3568-08d710bc89ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 04:57:04.6023 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3696
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3O/8oK7rPclR3MU2VNmvZcnlVby54ExckvQ3i9Nr16U=;
 b=MLz7rUqpiX6Kp8XqdSykhV+coYypjPduJHG8G0OGV08n5rCLl7IphM++EFtXBOMrGjEUB+No3yAnp31Y+fTjnVkHkXDp8M6IfvB1btrN8yWX34gdObPmgLtxLb1CtnjYm1ePtxjfdZsLH/jQIAKLPNL4j2pLcXvMuFZCyjZZFVs=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2FuZywgS2V2aW4oWWFuZykg5bCG5pKk5Zue6YKu5Lu24oCcW1BBVENIIDIvNV0gZHJtL2FtZC9w
b3dlcnBsYXk6IGFkZCBzbXUgbWVzc2FnZSBuYW1lIHN1cHBvcnTigJ3jgIIKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
