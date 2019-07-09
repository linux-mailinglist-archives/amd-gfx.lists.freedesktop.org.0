Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FCC63003
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Jul 2019 07:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468E189D7D;
	Tue,  9 Jul 2019 05:32:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740050.outbound.protection.outlook.com [40.107.74.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C55989D7D
 for <amd-gfx@lists.freedesktop.org>; Tue,  9 Jul 2019 05:32:55 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3116.namprd12.prod.outlook.com (20.178.31.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.17; Tue, 9 Jul 2019 05:32:53 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2052.020; Tue, 9 Jul 2019
 05:32:53 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/amdgpu: Mark KFD VRAM allocations as sensitive
Thread-Topic: [PATCH 2/3] drm/amdgpu: Mark KFD VRAM allocations as sensitive
Thread-Index: AQHVNhfBn/xpxDXob02ssNh779UUOg==
Date: Tue, 9 Jul 2019 05:32:53 +0000
Message-ID: <20190709053222.22588-2-Felix.Kuehling@amd.com>
References: <20190709053222.22588-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190709053222.22588-1-Felix.Kuehling@amd.com>
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
x-ms-office365-filtering-correlation-id: d8c4a452-08d6-4362-2db2-08d7042ee387
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3116; 
x-ms-traffictypediagnostic: DM6PR12MB3116:
x-microsoft-antispam-prvs: <DM6PR12MB31164455E03A20242A23DDE492F10@DM6PR12MB3116.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(199004)(189003)(478600001)(53936002)(316002)(26005)(8676002)(102836004)(2351001)(6916009)(1076003)(3846002)(66476007)(8936002)(5640700003)(6116002)(36756003)(81156014)(73956011)(81166006)(66556008)(64756008)(66446008)(6486002)(6436002)(186003)(5660300002)(86362001)(6512007)(66946007)(2906002)(486006)(14454004)(68736007)(71200400001)(2501003)(386003)(6506007)(52116002)(99286004)(76176011)(71190400001)(11346002)(2616005)(446003)(4326008)(305945005)(14444005)(72206003)(476003)(256004)(25786009)(50226002)(7736002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3116;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 882DrJQjerZjSYmNCu1e+55ZTD7NaoBhqV+ctcWY86iKekR/y1cra6LuVQ7f4Jg9q+i1DxitvqAEQYcL+xdFcAuf1J5MxGIp3rGvHJ41bN2nhM8yqxns1C3KRVnlMIVw7LhgaVZGs60PFXmipoS6v02dqC5JVrYzFNOxvkxzvkvLxsDXSR8Q3bAZLup0uH/g8zs38bazGeDwJFZl+p5l3PCspUOJzOJgvXNh+fvAUYSGFMBLSHgPI+V3Sg12wBNJepvQekluu4iNdICExUUHRbWlKtKQjmIy74FY+zSoajZ7kMmq5ssqmZyiL/eRmCZvPeZr/74srBvLRhacYjtpLfj5T5TukACCmmlX5LZgv1tZ6rHBbNQkkTGEZ3Q9auFlH0D3YErI/MAt6wzIQ+ny233rknFJvrDIHVPYTNadgRI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c4a452-08d6-4362-2db2-08d7042ee387
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 05:32:53.1496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3116
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFjodpylEG8zJmffzAeEHMpLiIxytbl9ZvHxorQu8qQ=;
 b=z939d9hjHw00Lzh1PBzTPEfwKAu8d1s4T3La2ft+Y27yhINyhguq5x/IMeMSr22asecllNU1wbtCNJOQX6F9mC8x1oT+YhSZgL6nNLhHlAQDBjbFMELhyaxu0d2PetHIbLgzRdSkp9QDlHenH+wqcXUFMFQvGWxljnUJBB8vh9U=
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

TWVtb3J5IHVzZWQgYnkgS0ZEIGFwcGxpY2F0aW9ucyBjYW4gY29udGFpbiBzZW5zaXRpdmUgaW5m
b3JtYXRpb24gdGhhdApzaG91bGQgbm90IGJlIGxlYWtlZCB0byBvdGhlciBwcm9jZXNzZXMuIFRo
ZSBjdXJyZW50IGFwcHJvYWNoIHRvIHByZXZlbnQKbGVha3MgaXMgdG8gY2xlYXIgVlJBTSBhdCBh
bGxvY2F0aW9uIHRpbWUuIFRoaXMgaXMgbm90IGVmZmVjdGl2ZSBiZWNhdXNlCm1lbW9yeSBjYW4g
YmUgcmV1c2VkIGluIG90aGVyIHdheXMgd2l0aG91dCBiZWluZyBjbGVhcmVkLiBTeW5jaHJvbm91
c2x5CmNsZWFyaW5nIG1lbW9yeSBvbiB0aGUgYWxsb2NhdGlvbiBwYXRoIGFsc28gY2FycmllcyBh
IHNpZ25pZmljYW50CnBlcmZvcm1hbmNlIHBlbmFsdHkuCgpTdG9wIGNsZWFyaW5nIG1lbW9yeSBh
dCBhbGxvY2F0aW9uIHRpbWUuIEluc3RlYWQgbWFyayB0aGUgbWVtb3J5IGFzCnNlbnNpdGl2ZSB0
byBpbmRpY2F0ZSB0aGF0IGl0IG5lZWRzIHRvIGJlIGNsZWFyZWQgYmVmb3JlIGl0IGlzIGZyZWVk
LgoKU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCmluZGV4
IGY1ZWNmMjhlYjM3Yy4uYWNhMTUxM2ViM2MzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCkBAIC0xMDg5LDcgKzEwODksNyBAQCBpbnQg
YW1kZ3B1X2FtZGtmZF9ncHV2bV9hbGxvY19tZW1vcnlfb2ZfZ3B1KAogCSAqLwogCWlmIChmbGFn
cyAmIEFMTE9DX01FTV9GTEFHU19WUkFNKSB7CiAJCWRvbWFpbiA9IGFsbG9jX2RvbWFpbiA9IEFN
REdQVV9HRU1fRE9NQUlOX1ZSQU07Ci0JCWFsbG9jX2ZsYWdzID0gQU1ER1BVX0dFTV9DUkVBVEVf
VlJBTV9DTEVBUkVEOworCQlhbGxvY19mbGFncyA9IEFNREdQVV9HRU1fQ1JFQVRFX1ZSQU1fU0VO
U0lUSVZFOwogCQlhbGxvY19mbGFncyB8PSAoZmxhZ3MgJiBBTExPQ19NRU1fRkxBR1NfUFVCTElD
KSA/CiAJCQlBTURHUFVfR0VNX0NSRUFURV9DUFVfQUNDRVNTX1JFUVVJUkVEIDoKIAkJCUFNREdQ
VV9HRU1fQ1JFQVRFX05PX0NQVV9BQ0NFU1M7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
