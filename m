Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B13B71542
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 11:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BAD89EA3;
	Tue, 23 Jul 2019 09:34:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810054.outbound.protection.outlook.com [40.107.81.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AC189EA3
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 09:34:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vh4mVIVJM9IasNK+hpkgG764EJz7NH0/tUWFF66nGjT0jYoOA3yxmfu9emyiRy3m3tXLem8mCb6UqalImyYrXattK0IpSC6hJdEBUjrag4So7VR+SZPaDbB+3BOTB9YCkcbFJ79M4dPVSlk/yp8ODacp+G7HVAsW0qXuSC4n1eXj1ZmxHBczJsyhY+QA2C1KRTVogxIY1H9w+8sz67zGRxAH8Xi2/zHwXipocdTJk7DxgPM2pNIaNlHUGRYkwclbAQd3tuPZBzLam3ZNd/RHnUZZniN/UKuoHFnUeAKL0CHEWjvLcMdXL+LEWjQAs8+MQ9xPXa2FSbUWsNB/bhUOhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzY6U6SmM17+Y+M/EqD3amL0IeLDHlAfKAjz/V8H2FU=;
 b=QRyVFgIiyU1YrrH17iy4Y6XOg++6tvM7zhi0Sw5vOmiUhCAAzd4O7Gaq8zVyOH7niAGJclwtnn2ZPuhwnJkxjt9mNihhOfTTq9DgnUF1AfX0OFSjfIqdl0PH2bKDEhp/My2Ndj0DWywEziLc/Gqkw3MM6rSklKsdyN8+gM1E5yxyF8DgYivHP/+HzGxjClXPjnGRNmlH4itUu754Hku7JD93cEwuqHdxI4LRxXRs//6W0H1z5jt/UVapxv02zfFJpnNcgJqeMM0Q6yuhaPQKvqrrjvIr2J94idm1GD6/SV5immE1lHwf5d9FbDKM7e7/vRrmiKS3wu9u8vdBIAe8Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3518.namprd12.prod.outlook.com (20.179.82.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 09:34:05 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2094.013; Tue, 23 Jul 2019
 09:34:05 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: =?gb2312?B?s7e72DogW1BBVENIIHYyXSBkcm0vYW1kL3Bvd2VycGxheTogYWRkIGhlbHBl?=
 =?gb2312?B?ciBvZiBzbXVfY2xrX2RwbV9pc19lbmFibGVkIGZvciBzbXU=?=
Thread-Topic: [PATCH v2] drm/amd/powerplay: add helper of
 smu_clk_dpm_is_enabled for smu
Thread-Index: AQHVQTnEAeJOJL2ZFUad8zeqQijtdA==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 33
X-FaxNumberOfPages: 0
Date: Tue, 23 Jul 2019 09:34:05 +0000
Message-ID: <MN2PR12MB3296B9F244CC0E74759F8E82A2C70@MN2PR12MB3296.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a9a3af9-679d-4a9f-b2e9-08d70f50e77d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3518; 
x-ms-traffictypediagnostic: MN2PR12MB3518:
x-microsoft-antispam-prvs: <MN2PR12MB35183DF50FB52A31400CD0D2A2C70@MN2PR12MB3518.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(39860400002)(396003)(366004)(199004)(189003)(52536014)(14454004)(7736002)(486006)(74316002)(305945005)(8936002)(81156014)(558084003)(256004)(5660300002)(81166006)(224303003)(71190400001)(478600001)(71200400001)(66066001)(4326008)(6916009)(3846002)(68736007)(54906003)(86362001)(6116002)(316002)(99286004)(9686003)(76116006)(55016002)(2351001)(66946007)(26005)(33656002)(66476007)(53936002)(476003)(186003)(66556008)(64756008)(66446008)(5640700003)(6436002)(25786009)(6506007)(102836004)(2501003)(7696005)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3518;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ShUJA96FQxZdlbHtQyXVZij3wKomxI6djNt0d9AxScNduM6qwy6uNL9k6QX4e/C5Gv19OhLNS8rbP4XNN3ceR9VilJzEVpRVwsgbvo2iGugpUyds5AwdjjNuLofkIJ5aMunPtVDEfSzEDLmWZ9IoUiTHf3aNMt3EBl5Mud+KPOCKlCzr0gWLffzCZyoUxpW0B/iAESS3/ScMyrjYQ5qyCUqIS4q1lZ7du1ztqfAGUllYy0w/q/brxaw5B7Ss2GqBrIEA5vvtb3DNrm4u8HUGrDCTdJ/CFU+8YDq3t/xiFyfag5YFkkU8hzEqXrVxCuIw0YLQKqVYlt2uLw5vg8kEbog23uEGxEbCJdXkZZNkR3u5JQRaJu+ExAkCM+DZWbc3W3TU865di/fajTm0vRMPRDEI56fP/j17C+OG81QJKdA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9a3af9-679d-4a9f-b2e9-08d70f50e77d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 09:34:05.0340 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3518
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzY6U6SmM17+Y+M/EqD3amL0IeLDHlAfKAjz/V8H2FU=;
 b=1VaSkPwmTAoKc+V8zt/ioOnHMT58k2ZbGCNXCE6izo/XSW89Vd+DxxnHy5CGbfT/Lm+nabvcNRo/DHN07sE/gAef7X2boq0Azf/BcZarrH9T00Z6Z8r2BHfEEZztNwGpNgMQ0dXp1Peklj1DahUd2Nkk4kZ70CuHftr3kauLpCI=
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
