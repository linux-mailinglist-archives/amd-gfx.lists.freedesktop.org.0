Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 186B463004
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Jul 2019 07:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF4D89DC1;
	Tue,  9 Jul 2019 05:32:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740050.outbound.protection.outlook.com [40.107.74.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A695E89D7D
 for <amd-gfx@lists.freedesktop.org>; Tue,  9 Jul 2019 05:32:54 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3116.namprd12.prod.outlook.com (20.178.31.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.17; Tue, 9 Jul 2019 05:32:52 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2052.020; Tue, 9 Jul 2019
 05:32:52 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amdgpu: Add flag for allocating memory for sensitive
 data
Thread-Topic: [PATCH 1/3] drm/amdgpu: Add flag for allocating memory for
 sensitive data
Thread-Index: AQHVNhfAtkAJMzNa0UazWeKukI/fzw==
Date: Tue, 9 Jul 2019 05:32:52 +0000
Message-ID: <20190709053222.22588-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::30) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9133f99-a662-40b4-3736-08d7042ee33d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3116; 
x-ms-traffictypediagnostic: DM6PR12MB3116:
x-microsoft-antispam-prvs: <DM6PR12MB31164A7002929128998F77A692F10@DM6PR12MB3116.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(199004)(189003)(478600001)(53936002)(316002)(26005)(8676002)(102836004)(2351001)(6916009)(1076003)(3846002)(66476007)(8936002)(5640700003)(6116002)(36756003)(81156014)(73956011)(81166006)(66556008)(64756008)(66446008)(6486002)(6436002)(186003)(5660300002)(86362001)(6512007)(66946007)(2906002)(486006)(14454004)(68736007)(71200400001)(2501003)(386003)(6506007)(4744005)(52116002)(99286004)(71190400001)(2616005)(4326008)(305945005)(72206003)(476003)(256004)(25786009)(50226002)(7736002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3116;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 94pstMrxIEX8RxpEU7uQw6qjRFFEn2GLoqUzpdPf+uq1ueX4HFqM9qQuOri/AFSsrK9jGAvPm+ChXdoXTIx69z1jLZoiogWQxq5D82k8YYogLvCul1/uhkOnomprdM9jbUbqf3rxVxAoCCq62z2ZtwQxvqUpVUxYmig3EifwJrSvORvBWfkSJlNw9fDeWhvlcdW7kiCbUHN6FPBM/Vq11SdEOtRBRZEXnNgSaSH8KZrI8ry2XDDdZL1tqt8SvBa5CxtxmdGJQ4Hfb0Kj0IswM/Sl0DHiePRuQXB80tAe36yv//DW5JUCkh4DFHW/XEqoqZ1nmlNzQgrpNbL72NL+Jau4s0pJtCWpGoLZlkMLhKrSWwgQUBBhjudyG9RoaRbP1Qwgh8D4KtZXcNBTqzSqGQjBlZoJq4M0Ff5TGH+Xnrw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9133f99-a662-40b4-3736-08d7042ee33d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 05:32:52.6119 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3116
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcRKGBpFYA20YcLhZ2yle0+D2/UkO+bHPk80XYlcCyI=;
 b=q00EhD0xXW8z94RhReFkcaRct/D4R1vy9vjOxCdOOR8nlxlfHaYxbcG364rlUOaCNSCvIBADtbIoeQVM0kXoXd7SbWumRYxzpL1Nfbfsfi1urVt2OWlLS4ozsZVNgTNe95WbPYiq3l0uRPYP2odoNDQYRfPNqO69PlShsb/geMc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBtZW1vcnkgYWxsb2NhdGlvbiBmbGFnIHdpbGwgYmUgdXNlZCB0byBpbmRpY2F0ZSBCT3Mg
Y29udGFpbmluZwpzZW5zaXRpdmUgZGF0YSB0aGF0IHNob3VsZCBub3QgYmUgbGVha2VkIHRvIG90
aGVyIHByb2Nlc3Nlcy4KClNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVo
bGluZ0BhbWQuY29tPgotLS0KIGluY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oIHwgNCArKysr
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91
YXBpL2RybS9hbWRncHVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaAppbmRl
eCA2MTg3MDQ3OGJjOWMuLjU4NjU5YzI4YzI2ZSAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2Ry
bS9hbWRncHVfZHJtLmgKKysrIGIvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmgKQEAgLTEz
MSw2ICsxMzEsMTAgQEAgZXh0ZXJuICJDIiB7CiAgKiBmb3IgdGhlIHNlY29uZCBwYWdlIG9ud2Fy
ZCBzaG91bGQgYmUgc2V0IHRvIE5DLgogICovCiAjZGVmaW5lIEFNREdQVV9HRU1fQ1JFQVRFX01R
RF9HRlg5CQkoMSA8PCA4KQorLyogRmxhZyB0aGF0IEJPIG1heSBjb250YWluIHNlbnNpdGl2ZSBk
YXRhIHRoYXQgbXVzdCBiZSBjbGVhcmVkIGJlZm9yZQorICogcmVsZWFzaW5nIHRoZSBtZW1vcnkK
KyAqLworI2RlZmluZSBBTURHUFVfR0VNX0NSRUFURV9WUkFNX1NFTlNJVElWRQkoMSA8PCA5KQog
CiBzdHJ1Y3QgZHJtX2FtZGdwdV9nZW1fY3JlYXRlX2luICB7CiAJLyoqIHRoZSByZXF1ZXN0ZWQg
bWVtb3J5IHNpemUgKi8KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
