Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D026364A
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Jul 2019 14:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9272F89804;
	Tue,  9 Jul 2019 12:58:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690053.outbound.protection.outlook.com [40.107.69.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210A789804
 for <amd-gfx@lists.freedesktop.org>; Tue,  9 Jul 2019 12:58:20 +0000 (UTC)
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB3247.namprd12.prod.outlook.com (20.179.81.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Tue, 9 Jul 2019 12:58:19 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9158:a228:2506:85e4]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9158:a228:2506:85e4%6]) with mapi id 15.20.2052.020; Tue, 9 Jul 2019
 12:58:19 +0000
From: Chunming Zhou <zhoucm1@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: Intermittent errors when using amdgpu_job_submit_direct
Thread-Topic: Intermittent errors when using amdgpu_job_submit_direct
Thread-Index: AQHVNhJBsDnJQXPLAkeGgQebgEnuI6bCP7YA
Date: Tue, 9 Jul 2019 12:58:18 +0000
Message-ID: <affc1656-4696-846e-baca-48331aef3043@amd.com>
References: <885956af-be59-d218-f2e7-a0fc06042f21@amd.com>
In-Reply-To: <885956af-be59-d218-f2e7-a0fc06042f21@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0018.apcprd03.prod.outlook.com
 (2603:1096:203:2e::30) To MN2PR12MB2910.namprd12.prod.outlook.com
 (2603:10b6:208:af::27)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07dc1c33-4e5a-427a-b4dd-08d7046d1d00
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3247; 
x-ms-traffictypediagnostic: MN2PR12MB3247:
x-microsoft-antispam-prvs: <MN2PR12MB3247CB9803FD07ACBD407DFDB4F10@MN2PR12MB3247.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(199004)(189003)(386003)(66066001)(25786009)(26005)(76176011)(6506007)(11346002)(7736002)(68736007)(14454004)(5660300002)(476003)(186003)(102836004)(6512007)(2616005)(53936002)(229853002)(446003)(486006)(6116002)(4744005)(2501003)(3846002)(66556008)(66446008)(99286004)(81166006)(81156014)(305945005)(31696002)(64756008)(66476007)(73956011)(8936002)(2906002)(66946007)(71190400001)(478600001)(256004)(72206003)(6486002)(6246003)(71200400001)(110136005)(31686004)(316002)(6436002)(36756003)(52116002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3247;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qtGrBwm4NetUXLtysP6Z1g4iTGK1aHfVJYXXNAafQOjklVukw3ItEB/9Ior3Am9IakrJaq1dAVSDOzqUoVg9H3bcdACgI7DmXTq6ACGagjp73v1IBclybD5UGXAhL6gRbkCaU127qFXw0ILbIxbib560bo6GASg9yVLw/rhIu4XIsbSORBTFfUM7Lp+kT91he7PYdDKl8fTjGwU9hmSLT7o1JoOZpBb/7+mH6Uh28SYtj487nULw4fIydAJEGA+uCZKGOuec1NO9yCKb9UMAM1mCSK2qYYh+CO3JupG9u00/LG7b4PLzb8E5zuU4MMjBNOwgeKVyoLJGOzfhpW3dKEKXKizYqq3Y3SdRQaqs+o7A3NpVOZe8fjaZ0b+0ZNMqu1ffEaVT+G3b7xuPtZVNUoXcsdq9xhWQ4a8uUagiNYk=
Content-ID: <38C6C200793D76499A00021A80B3D92B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07dc1c33-4e5a-427a-b4dd-08d7046d1d00
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 12:58:18.8831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhoucm1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3247
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayV/t6Vs75EcmGJbli90wvw57oE6+StdfoLvw+FWxfo=;
 b=1W68LbbaVlT6Bb6J8pNBTI0W/L62VgBtjW5ZFkU06cY/sqyrr53rIMxvz7s7gfqTggsq2bhZqT+mNDSzudoDPKGZE/stVddpvl0AdWr4s0x/gkOYaZVRt0Q00n/Zj7Z9gG78R/DXj1vIpVE6UjUCQU61pQpox6LC3Y9LzmMeyTE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
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

SSd2ZSByYWlzZWQgaXQgdXAgd2hlbiBDaHJpc3RpYW4gbWFrZSBwYWdlIGZhdWx0LCBhdCB0aGF0
IHBhdGNoLCANCmFtZGdwdV9qb2Jfc3VibWl0X2RpcmVjdCB1c2VzIGV4Y2x1c2l2ZSBwYWdlIGZh
dWx0IHJpbmcgZm9yIHRoYXQuDQoNCkJ1dCBpZiB5b3UgdXNlIGFtZGdwdV9qb2Jfc3VibWl0X2Rp
cmVjdCBmb3IgZ2VybmVyYWwgcmluZ3Mgb2N1cHBpZWQgYnkgDQpzY2hlZHVsZXIsIEkgZ3Vlc3Mg
dmFyaWFzIGJ1Z3Mgd2lsbCBoYXBwZW4uDQoNCi1EYXZpZA0KDQrlnKggMjAxOS83LzkgMTI6NTMs
IEt1ZWhsaW5nLCBGZWxpeCDlhpnpgZM6DQo+IEknbSBzZWVpbmcgc29tZSB3ZWlyZCBpbnRlcm1p
dHRlbnQgYnVncyAodm0gZmF1bHRzLCBoYW5ncywgZXRjKSB3aGVuDQo+IHRyeWluZyB0byB1c2Ug
YW1kZ3B1X2pvYl9zdWJtaXRfZGlyZWN0LiBJJ20gd29uZGVyaW5nIGlmIHRoZXJlIGlzIGENCj4g
cG9zc2liaWxpdHkgb2YgYSByYWNlIGNvbmRpdGlvbiwgd2hlbiBhIHN1Ym1pdF9kaXJlY3QgYW5k
IGEgR1BVDQo+IHNjaGVkdWxlciB0aHJlYWQgdHJ5IHRvIHN1Ym1pdCB0byB0aGUgc2FtZSByaW5n
IGF0IHRoZSBzYW1lIHRpbWUuIEkNCj4gZGlkbid0IHNlZSBhbnkgbG9ja2luZyB0byBhbGxvdyBt
dWx0aXBsZSB0aHJlYWRzIHNhZmVseSBzdWJtaXR0aW5nIHRvDQo+IHRoZSBzYW1lIHJpbmcuDQo+
DQo+IEFtIEkgbWlzc2luZyBzb21ldGhpbmc/DQo+DQo+IFRoYW5rcywNCj4gICDCoCBGZWxpeA0K
Pg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
