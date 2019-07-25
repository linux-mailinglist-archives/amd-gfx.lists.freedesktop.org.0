Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA0474497
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 06:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE716E426;
	Thu, 25 Jul 2019 04:57:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::61c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244036E426
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 04:57:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isc1JGPHcFSch1lFyU70puknqsTEa7of4p80VLAG+H7CYBFuokJUrwAlixf9nnnPX6Q9NO48X65Gd06fNtAcYTH4UmOp53lJakhKJXoeUz1ZSfk/RsjK4vN7RsmM6fiUuh07Ohm3L8zSJtwfTTFLsyXoZAhpEwHk6S7GdYxnZLQitNZlC2ZLtpJRv2gf+0Y87cDZ8Ahsx9cs7m2jN2rBu7Q42H+nTRzc0tfii8W6qj7JGMrjWD84rujjIGLyaiNuyiI3XvilrU4ie8nt/FEMneHKEKyerpiRn+m+s9uAoTZNQi8qYspuKYqx6We6m2TjN4ZHCObF47zo9z+A8DpN5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pT+QQvbEUJ3tWmOGpj4f/K4AxBaMqgYMret/E7kLI/U=;
 b=JMuaMBSn1gBPTQCRJLBUhXHWvvnpocupoGFFmSVwKCwL9GlsN5mnVoDN12QQDzHzHkCtZlrcI0iYy8BgnMhNQEdYH9GTwLVjOarkJzBSWtPnu88SnHmXELvF8Cvvjr2k0qbgtdoCyKisTd3K1UyUDefQbMoVjuzqRRI409EQHL0XGsVtnMp1m0rHUIxqS8q3wLU21AtdFrgoFE0urkK/ytEfLo4ZrTEIH+JVOg0lj6DBjabVcS15MnAmmTx0uYWxHROaFullxwNZsaOBB3JCcXk9E1MnqYwxrtmB9g8FSiuUjVgBOAaqphu8938gctYSqco6PzzSAinxK+IZ2bVHjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3696.namprd12.prod.outlook.com (10.255.86.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Thu, 25 Jul 2019 04:57:21 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2094.013; Thu, 25 Jul 2019
 04:57:21 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: =?gb2312?B?s7e72DogW1BBVENIIDEvNV0gZHJtL2FtZC9wb3dlcnBsYXk6IG1vdmUgc211?=
 =?gb2312?Q?_types_to_smu=5Ftypes.h?=
Thread-Topic: [PATCH 1/5] drm/amd/powerplay: move smu types to smu_types.h
Thread-Index: AQHVQqVwuXzT3nM3MEWqVpb18qfOaA==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 33
X-FaxNumberOfPages: 0
Date: Thu, 25 Jul 2019 04:57:20 +0000
Message-ID: <MN2PR12MB3296810DCEAE7672A4C90FA8A2C10@MN2PR12MB3296.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37c5eb67-4d05-4b54-e2af-08d710bc938c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3696; 
x-ms-traffictypediagnostic: MN2PR12MB3696:
x-microsoft-antispam-prvs: <MN2PR12MB3696E5C6198DC371A14714D5A2C10@MN2PR12MB3696.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(199004)(189003)(316002)(6116002)(81156014)(68736007)(71190400001)(4326008)(66946007)(66556008)(76116006)(86362001)(8936002)(53936002)(64756008)(2351001)(6506007)(71200400001)(66066001)(7696005)(2906002)(66476007)(478600001)(186003)(102836004)(5660300002)(6916009)(256004)(26005)(14454004)(3846002)(66446008)(2501003)(486006)(9686003)(476003)(99286004)(5640700003)(52536014)(81166006)(558084003)(7736002)(74316002)(55016002)(54906003)(6436002)(25786009)(33656002)(224303003)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3696;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5ETOV7FTkA/yBppk02h7oIDZSzl1y/TnF3IviNcjFrZXq58gjNJ1C+DmkU3zboz/JCjvZ6gztw6D25LeL7WMOV62zYlJUiJabNZDKNNmFj0RISW0Iq5ZxnJCqdUvnT1Tjs0nRmHok/zbuOQzNA2zbZ9kVModOv7H4J9ojeaY5i46MsyArE6gaaE22+zq4556NGk/xUrdGJdZebgeY+IoWgkifLiixGN9GiwPsLDzedBwy0Q9+/DI9eJ+tuv6ep+Iz0Bgs8jPkgr0txUMkNxJ30UUoEokgAga/nt3Btns/Aqww6NzTHtVMUPhVfJcq+dvcXd1veD8Y9LI3/1165SMxwkOO5azhESUqu9j3SIkePCH27iqRc7CO2K2jVDshWVJKG4cm0tJm1ij52bo/p+yGZUZZV+QGqsBuETMu5spQHc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c5eb67-4d05-4b54-e2af-08d710bc938c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 04:57:21.0165 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3696
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pT+QQvbEUJ3tWmOGpj4f/K4AxBaMqgYMret/E7kLI/U=;
 b=QTEqz2tGoyubBF92P/lALEFyXo8J/GLpL71AuLE/DF3x7nWI6QZexZruNLt90p7jTqRCspR6me6M26S85mEBCIpq1hMEPpRbeu1qq7cOw6rUmvcva21TjNjJ4ZLIdrBSJcAETSxSeypywBQj2jHP2Sc/JCWVs76OLHB+UwaI4YI=
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

V2FuZywgS2V2aW4oWWFuZykg5bCG5pKk5Zue6YKu5Lu24oCcW1BBVENIIDEvNV0gZHJtL2FtZC9w
b3dlcnBsYXk6IG1vdmUgc211IHR5cGVzIHRvIHNtdV90eXBlcy5o4oCd44CCCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
