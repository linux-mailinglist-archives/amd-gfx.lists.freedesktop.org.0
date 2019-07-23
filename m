Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B8B71541
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 11:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F0D89E3B;
	Tue, 23 Jul 2019 09:33:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7414589E3B
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 09:33:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9C7POxXt06x1LdN3CXcSjZkUtyCSZOkNRnSOr2YGxPCdbx69eUlkgdAVKYxP7+wpO4MNI6LLDMEhQh3sqaB5mL8L4AEBqth3pFchhZn2pc78P8PqlD8wiPhu6HfpaQqV4Bd6O1KuEg8K5rPWvlk/Nl5kqZsOtzZxaBJRA1VsJbUZT+WpSj8Z1iQ7MKo6Dz3bommylNKk4t3ZrQsD0LAR1LIIt7bkx5mjbkBhbv3yilM/tvV/Uzh/Bxmk2AUJAYFdAjnbSK/HbTiINE0RS/4t7CkYIZHwbxOm8TPBjz5U8XVAzb45hA2DJjcthgpJ+dPm3/w6Pj9yJoilpsDmgJ3VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzY6U6SmM17+Y+M/EqD3amL0IeLDHlAfKAjz/V8H2FU=;
 b=Tru2iPtq6Iykrl3my/tZiFqJQkf5xmbWjyKRXpsl/vVq5p23QFRMCBRw3lH2jYrtCHcuUqe+I2sx7cJP6J45SCusc4icjV+nq2WmrLE3fgYcDlK+qEMaclRuoXxnzxy90Qk58Ob/+OCbVqV55czWjJmswA79cFVgN8FWLMmh0Jty8aApmKUR9yRm3F3BuU/ga8jL0z0KWJntBQNpI/9KeRpdziGRnTIhy/x3O2LDc+VsztxT5oCquXtry2cU/w08yUckzUY8QOFn7iG23fQIXshVVbYk73EpJ7/IBgp7JPxABNzjGD4zFGnBOMhxoLHjhBIEr46cVvfiTN7SVGQbVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3229.namprd12.prod.outlook.com (20.179.82.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Tue, 23 Jul 2019 09:33:15 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2094.013; Tue, 23 Jul 2019
 09:33:15 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: =?gb2312?B?s7e72DogW1BBVENIIHYyXSBkcm0vYW1kL3Bvd2VycGxheTogYWRkIGhlbHBl?=
 =?gb2312?B?ciBvZiBzbXVfY2xrX2RwbV9pc19lbmFibGVkIGZvciBzbXU=?=
Thread-Topic: [PATCH v2] drm/amd/powerplay: add helper of
 smu_clk_dpm_is_enabled for smu
Thread-Index: AQHVQTmmtrtrO+Sc4Eef2SNONssMuQ==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 35
X-FaxNumberOfPages: 0
Date: Tue, 23 Jul 2019 09:33:15 +0000
Message-ID: <MN2PR12MB3296F7E8DC75208131AAB50EA2C70@MN2PR12MB3296.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c42c7d0-4078-48e5-f4a0-08d70f50c9d9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3229; 
x-ms-traffictypediagnostic: MN2PR12MB3229:
x-microsoft-antispam-prvs: <MN2PR12MB3229E78DF2B492611977E7A2A2C70@MN2PR12MB3229.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(199004)(189003)(2501003)(478600001)(5640700003)(2351001)(25786009)(9686003)(55016002)(14454004)(6436002)(6916009)(53936002)(76116006)(52536014)(66066001)(224303003)(26005)(66476007)(476003)(86362001)(66556008)(64756008)(66446008)(66946007)(5660300002)(102836004)(2906002)(7736002)(8936002)(33656002)(81156014)(81166006)(316002)(4326008)(71200400001)(71190400001)(305945005)(6116002)(256004)(3846002)(68736007)(6506007)(558084003)(54906003)(7696005)(74316002)(186003)(99286004)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3229;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 80aF5diO0iK0LiOMBKiEJ9AfyLCwUjllHNn7OkzpRylrPLvBs/H3zgKeZQbbV/RV1swPF5lmtIYn2ebd/t7jFHyPFxBJsyoDpO63X31gQVZAmOS1/DwgeX6nsn274uOYpuxBZZR6mo0cgvejirEm+qcXcnAYo7w71NhVnK4s80xpXajwxEuDloO66V/tVg/qfkgbqHciPabfk8ZEQOPr1nBP6ah8LZc96jwxyyjPUjqUnIBHVgmpm3qie16ZJGxBGybYh0kEqnGA5pLgneSfxB7dRMxMWk9LmGVGsToaWP1Lkwc2ICwrEF3oX7ENziei5Slh4gGXVhT6QX2J/wfcR3ork5ouzjo7Hxv+NM7iTuHGGaeo0rptH6rxI0aK/+ktYWJ/xnNzh7jBqN2H++ykWlRGm9Kgb/pA6a5VaZhJF3c=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c42c7d0-4078-48e5-f4a0-08d70f50c9d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 09:33:15.2780 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3229
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzY6U6SmM17+Y+M/EqD3amL0IeLDHlAfKAjz/V8H2FU=;
 b=Q5VIFwpu+YZd2CyMwwOMyMepPpZ018NId2sxTGfA5RytfQlD7DZ7SSP9BRhFhM7FFS5e3Mahkey5i8pG8RH/olah+gTobjKhnLCWbXm/SBIKAXLtjRpEZScyombr6NDz67TcrkKl4DqCWb5prTQq44sZAOmK6MvMMTK0GvseI48=
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2FuZywgS2V2aW4oWWFuZykg5bCG5pKk5Zue6YKu5Lu24oCcW1BBVENIIHYyXSBkcm0vYW1kL3Bv
d2VycGxheTogYWRkIGhlbHBlciBvZiBzbXVfY2xrX2RwbV9pc19lbmFibGVkIGZvciBzbXXigJ3j
gIIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
