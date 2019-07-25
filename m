Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE76F74495
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 06:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA726E417;
	Thu, 25 Jul 2019 04:56:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::602])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F506E417
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 04:56:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0Wchsm6X7OlTD6MpZb9deGEvXptuHL1PkT7skUxpd9C7Dkw/V2rNTe9jkK9+MqehuaE3hnnNgrrqEgOIratyqH4q8atdmv/+WLxUON1J5st17jY/N1zYGgSngW6mfcRghj/mOzvcm13ppyYJ71Ajs3Wz7XxdQJh7X0lwIr9z3xnD9Pn1WPpw941YR44zuzPexMIdpyddFnSljhzDtsGrkFRLr1/ck/df9tDIZEub5Vj0KowfUax8dP/xnavhKNLLdGkcOQ/w+l+CZoGz0N3J4hcRke+1OeZoLOPC3FCPsWD9I7SONrtl41XaGQnqWriKAX7XIB5QJHlen10v/g7YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSo7eooJdSAdnBf3/OXR0krd0fS10nn59fCOJjHgvn4=;
 b=lgdJtp5gSTCiIb9qCPHrPzKcn063acKoDDlYqe0A/kGKFrUdw5gI/s4em/7Po6s1R2BXN4q10WrruuKuxk2mZHmQKtLyvlzAAw+ySGasIP7dT92C8qJ0dKJ15levvQ+axRD2VD2XptaUo/EcvrMlTctUB05tLrs/Kj0thWL71aRcRHC0Ws10pVAbTeDGRZJMREWlQLcpW+gE8tmw0z+v9TBXFBIRBdXBCz12x8+1BPjymZFn2wOaO0AJFPW/HAKyy+KBdgGvaZ8VGdRKPuxrgq/Vj8ePnTsIUGuOseys9LQm6b5MHQgHFA5TwTi2qQ8pmFQgyy2liZCQBXrjqnMHNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3696.namprd12.prod.outlook.com (10.255.86.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Thu, 25 Jul 2019 04:56:53 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2094.013; Thu, 25 Jul 2019
 04:56:53 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: =?gb2312?B?s7e72DogW1BBVENIIDMvNV0gZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCBzbXUg?=
 =?gb2312?Q?feature_name_support?=
Thread-Topic: [PATCH 3/5] drm/amd/powerplay: add smu feature name support
Thread-Index: AQHVQqVgIGUZotQ/GU+RnoO0pplBMA==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 33
X-FaxNumberOfPages: 0
Date: Thu, 25 Jul 2019 04:56:53 +0000
Message-ID: <MN2PR12MB3296E86F67786CB6288030EBA2C10@MN2PR12MB3296.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 86c08204-6f21-48f1-8fb6-08d710bc82e1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3696; 
x-ms-traffictypediagnostic: MN2PR12MB3696:
x-microsoft-antispam-prvs: <MN2PR12MB3696877A52A603A6022612E1A2C10@MN2PR12MB3696.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(199004)(189003)(316002)(6116002)(81156014)(68736007)(71190400001)(4326008)(66946007)(66556008)(76116006)(86362001)(8936002)(53936002)(64756008)(2351001)(6506007)(71200400001)(66066001)(7696005)(2906002)(66476007)(478600001)(186003)(102836004)(5660300002)(6916009)(256004)(26005)(14454004)(3846002)(66446008)(2501003)(486006)(9686003)(476003)(99286004)(5640700003)(52536014)(81166006)(558084003)(7736002)(74316002)(55016002)(54906003)(6436002)(25786009)(33656002)(224303003)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3696;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: y/abVXBknUs49gtiJSD1vdWeg5/PBBT2cGDAxX1Rdi3B31yPej9pP3A36tjKHOV4DGYEeEL9mCdqrujjnrMKxjPbzjR+Oo0I3DOdQWODlYr7vPBp+R4ejUBNMS+SVmvm+wmKNKPl9DYtPhXTLtc38kEz4bjSWB4+x8/R5gu4+E1vUGMHlMsQTFLsCeZcIKDAqDsMkz6UxMkuHsoTOUgH6SwioXrf8kTsPvQi6YPciAGF+al7Cc/dvnRBrS5EKWkf7+FDxGmIpWv5VwrTWXsQzJyTII93TXM9iy+qupEpL8XBasFT1ZjWQ+wYon6kMcztwC8TnY7wBNu0+gxX7YOm8joIDzWmdGeXN6ERY6fklXahe73r9iIAD8Zwb7tqse2CBdP9UHigSSBmx3eYnlTufYJEMfEir+A8ytFoG9xlFgI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c08204-6f21-48f1-8fb6-08d710bc82e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 04:56:53.0801 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3696
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSo7eooJdSAdnBf3/OXR0krd0fS10nn59fCOJjHgvn4=;
 b=rSLT5PKJVDutzL2pJMMYO5u9eaE/J/WOBdTwm+Bl7tPqpILcEd6offazDGgqjwFR0qpGWGTZGKYr4pSJwOwCtLbSzJ1elcfA40b38pvvip09URMlKrJn4/KDK9s0Xo9BgqQqXiS+lAE8AJa7TCHwz7B9G1Te0TIxViw/fn3qdAs=
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

V2FuZywgS2V2aW4oWWFuZykg5bCG5pKk5Zue6YKu5Lu24oCcW1BBVENIIDMvNV0gZHJtL2FtZC9w
b3dlcnBsYXk6IGFkZCBzbXUgZmVhdHVyZSBuYW1lIHN1cHBvcnTigJ3jgIIKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
