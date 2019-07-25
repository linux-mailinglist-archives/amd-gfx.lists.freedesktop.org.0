Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2604D7448D
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 06:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA146E3FE;
	Thu, 25 Jul 2019 04:56:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690068.outbound.protection.outlook.com [40.107.69.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142946E3FE
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 04:56:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0l0jiM3LZi/37urf4bKgjPr6dfRnzisaIhOWtRwvqFznkke5Sp5a1lvgOsmZ0XxZMU5WXYGMmiQTJLR/TxTA7OJhA1hB75Rj6c0xJktpucPNl1gcvITIMCPaABpm1w/fkMMLV/vPfip1IKK9TEt6LOl4v40tKs+saGxrehS0V53hyaRZjQ52QlbZeu7MWR/vYWglkYhAS9wR5Nz7rB3wsMW8DaDeAkhMFGwUEfKZMWcDTva+Z3T42oZS2rF59F9z9b8ff930LuQaQzL6YAy0a4L8fUJKFI/TJLaN+4KL6skt8Nkit9KRx3HlLefac/qV1EHG8ZYoBQAlpgBodMA/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGSVCB32wUnJoQY9T05J/S2Po6ZXitIH/5TdRArtxXs=;
 b=Vjtsaek5wXZ2WHBX0MFeJYKEDNH5cijtiN3RlJh8ubHv11t8V6FdJ+rG38oUYXzVj6esmwxTBWPnaWYJ9VuL1/cB1wIWIDi1FmQ22Pz9pfG6v+XJnKNdgUkYOdAHkS9V065w2+TthJ7HppGdoHYGgaC2DuubwMP0xtVLzemoslqe/gO4KRdYvpoYQNGJnkJyN9V1XhJyHppeKnydvGp2lAsJpEGLDdC/uoypvZszrK0v7NlQPicmQMMnvh202A+v69Yp8TUjR5nuRFpO1lql4HBdaZd3oimJNEJfIF6Ksh7jcmXGLsLbM9Np0+f40bpRBpsMC3hj+JfbN4jFryHjCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3696.namprd12.prod.outlook.com (10.255.86.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Thu, 25 Jul 2019 04:56:19 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2094.013; Thu, 25 Jul 2019
 04:56:19 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: =?gb2312?B?s7e72DogW1BBVENIIDUvNV0gZHJtL2FtZC9wb3dlcnBsYXk6IGltcGxtZW50?=
 =?gb2312?Q?_sysfs_feature_status_function_in_smu?=
Thread-Topic: [PATCH 5/5] drm/amd/powerplay: implment sysfs feature status
 function in smu
Thread-Index: AQHVQqVMviOWWBSnXU6rDFQ5kz2hPQ==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 33
X-FaxNumberOfPages: 0
Date: Thu, 25 Jul 2019 04:56:19 +0000
Message-ID: <MN2PR12MB32969277DEC1FB4660C6121AA2C10@MN2PR12MB3296.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3312d5ba-910c-4320-23e7-08d710bc6ef7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3696; 
x-ms-traffictypediagnostic: MN2PR12MB3696:
x-microsoft-antispam-prvs: <MN2PR12MB369612ECA875ECD0E9E7B11AA2C10@MN2PR12MB3696.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(199004)(189003)(316002)(6116002)(81156014)(68736007)(71190400001)(4326008)(66946007)(66556008)(76116006)(86362001)(8936002)(53936002)(64756008)(2351001)(6506007)(71200400001)(66066001)(7696005)(2906002)(66476007)(478600001)(186003)(102836004)(5660300002)(6916009)(256004)(26005)(14454004)(3846002)(66446008)(2501003)(486006)(9686003)(476003)(99286004)(5640700003)(52536014)(81166006)(558084003)(7736002)(74316002)(55016002)(54906003)(6436002)(25786009)(33656002)(224303003)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3696;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vohydXyJfkSJWKLBm7wMW1jl9YOaiHhQZi42Sb5vHt+pJm5HkVtYpJjbef039dTXP6JCvtUsYsKzO78vFUKtqtMVLVhiENKGaxmEZWe9gqFZrxR5tC4Ug4c1sCzV2kraaTUDU1iSrqQCmAKoDrnzaE0zqCDewLqXoRahh4TAddVlrwiuDA45w25bNlQrX+XEx2EUNvTtVx+1/4D6hI1xeY5wI9PrQ2ZIP1BWb3pbh3M7xBwf3vC+76eC4DI477HOcorlZopGOOy7j5FV3CCkl9GXMkTHRMwZ1kGnBBuc7VQcfSKx74QtxG+kY234gYldE3ifyLfZjrZ/I1ZFV4W2CcoAQfuq+nX1BbWL7HjQ0Yfg42DbAVTBA16TSdl9rxTLzR0TrqH+qvZXVgWSph9pn2WzZGLFZ/5AwOMEn07E41w=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3312d5ba-910c-4320-23e7-08d710bc6ef7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 04:56:19.7041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3696
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGSVCB32wUnJoQY9T05J/S2Po6ZXitIH/5TdRArtxXs=;
 b=NgSJbV/gSwyRCktLJXaf0qZLtTtAl3URtikHh7aVfmenRdwecdf+sf8PpcaHVx3Sq0laZwkveMfit6IYdq07Hl+EZTiq6ocDpISqvG4W+Li49nLozNxQQ3d6FjVnkYWV8L8bRu0JCqWYtcULbZFOufGAS5BmAlkLoQyYz7VARm8=
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

V2FuZywgS2V2aW4oWWFuZykg5bCG5pKk5Zue6YKu5Lu24oCcW1BBVENIIDUvNV0gZHJtL2FtZC9w
b3dlcnBsYXk6IGltcGxtZW50IHN5c2ZzIGZlYXR1cmUgc3RhdHVzIGZ1bmN0aW9uIGluIHNtdeKA
neOAggpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
